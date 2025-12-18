#include "semaforo.h"

// C
#include <inttypes.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>

// Altera
#include "sys/alt_irq.h"
#include "includes.h"

// Project
#include "seg7display.h"
#include "user_hw.h"

extern OS_EVENT *SemaphoreStatusMbox; // Mailbox for semaphore status interrupt notifications.

static semaphore_t semaphores[2] = {
    {
        .config = {
            {RED, 10},
            {YELLOW, 2},
            {GREEN, 5}
        },
        .current_state = RED,
        .remaining_time = 17,
        .running = 1,
        .idle_blink_on = 0
    },
    {
        .config = {
            {RED, 10},
            {YELLOW, 2},
            {GREEN, 5}
        },
        .current_state = GREEN,
        .remaining_time = 17,
        .running = 1,
        .idle_blink_on = 0
    }
}; // Two semaphores with initial configurations.

/**
 * @brief Calculate total cycle time for a semaphore (RED + GREEN + YELLOW)
 */
static uint16_t get_cycle_time(const uint8_t semaphore_index) {
    return semaphores[semaphore_index].config[0].duration +  // RED
           semaphores[semaphore_index].config[1].duration +  // YELLOW
           semaphores[semaphore_index].config[2].duration;   // GREEN
}

/**
 * @brief Calculate offset for the other semaphore to maintain proper sequencing
 * Returns the remaining time the other semaphore should have in its current state
 */
static uint16_t calculate_sync_offset(const uint8_t semaphore_index, 
                                      const semaphore_state_t initial_state,
                                      uint16_t remaining_time) {
    const uint8_t other = semaphore_index ^ 1;
    
    /* Calculate when this semaphore will reach GREEN/YELLOW (passing states) */
    uint16_t time_until_passing = 0;
    
    if (initial_state == RED) {
        /* Will pass after RED duration */
        time_until_passing = remaining_time;
    } else if (initial_state == YELLOW) {
        /* Already passing, will stop after YELLOW */
        return 0; /* Other must be RED for full duration */
    } else { /* GREEN */
        /* Already passing, will go to YELLOW then RED */
        time_until_passing = 0;
    }
    
    /* The other semaphore should be passing (GREEN/YELLOW) while this one is RED */
    /* Calculate how much time other should have been passing already */
    uint16_t other_cycle = get_cycle_time(other);
    uint16_t other_passing_duration = semaphores[other].config[2].duration + 
                                       semaphores[other].config[1].duration;
    
    if (initial_state == RED && time_until_passing < other_passing_duration) {
        /* Other should be in the middle of its passing phase */
        return other_passing_duration - time_until_passing;
    }
    
    return 0;
}

/**
 * @brief Semaphore task that controls the 7 segment displays.
 */
void semaphore_task(void) {
    printf("Semaphore task started...\n");
    uint8_t i = 0;  // Index for semaphore_state array.
    uint32_t hex_value = 0; // Value to display on 7-segment.
    while (1) {
        /* Handle running vs idle (yellow blinking) */
        if (semaphores[i].running) {
            /* Normal operation */
            switch (semaphores[i].current_state) {
                case RED:
                    hex_value += shift_hex_digits_left(RED, 7 - i);
                    break;
                case YELLOW:
                    hex_value += shift_hex_digits_left(YELLOW, 7 - i);
                    break;
                case GREEN:
                    hex_value += shift_hex_digits_left(GREEN, 7 - i);
                    break;
                default:
                    hex_value += shift_hex_digits_left(OFF, 7 - i);
                    break;
            }
            hex_value += shift_hex_digits_left(decimal_to_hex_representation(semaphores[i].remaining_time), 3 * (1 - i));
            printf("Semaphore %d: State=%c, Remaining Time=%d seconds, Hex Value=%08" PRIX32 "\n",
                i,
                semaphore_state_to_string(semaphores[i].current_state),
                semaphores[i].remaining_time,
                hex_value
            );
            semaphores[i].remaining_time--;
            if (semaphores[i].remaining_time == 0) {
                goto_next_semaphore_state(i);
            }
        } else {
            /* Idle mode: yellow blinking (toggle every second) */
            semaphore_state_t prev = semaphores[i].current_state;
            semaphores[i].idle_blink_on = !semaphores[i].idle_blink_on;
            semaphore_state_t new_state = semaphores[i].idle_blink_on ? YELLOW : OFF;

            /* Update display color segment */
            if (new_state == YELLOW) {
                hex_value += shift_hex_digits_left(YELLOW, 7 - i);
            } else {
                hex_value += shift_hex_digits_left(OFF, 7 - i);
            }
            /* Idle has no countdown */
            hex_value += shift_hex_digits_left(0, 3 * (1 - i));

            /* If visible state changed, update current_state, log, and notify */
            if (new_state != prev) {
                semaphores[i].current_state = new_state;
                printf("[SEMAPHORE] Sem %u IDLE blink -> %c\n", (unsigned)i, semaphore_state_to_string(new_state));
                if (SemaphoreStatusMbox) {
                    INT8U err = OSMboxPost(SemaphoreStatusMbox, (void*)1);
                    if (err != OS_NO_ERR) {
                        printf("[SEMAPHORE] Failed to post status notification (err=%u)\n", err);
                    }
                }
            }
        }
        i += 1;
        if (i >= 2) {
            seg7_write_hex(hex_value);
            i = 0;
            hex_value = 0;
            OSTimeDlyHMSM(0, 0, 1, 0);  // Delay for 1 second.
        }
    }
}

/**
 * @brief Switches the state of a specified semaphore.
 * @param semaphore_index Index of the semaphore to switch (0 or 1).
 * @param new_state The new state to set for the semaphore.
 */
void switch_semaphore_state(const uint8_t semaphore_index, const semaphore_state_t new_state) {
    if (semaphore_index >= 2) {
        return;
    }
    
    /* Change the state following natural sequence R->G->Y->R */
    semaphores[semaphore_index].current_state = new_state;
    switch (new_state) {
        case RED:
            semaphores[semaphore_index].remaining_time = semaphores[semaphore_index].config[0].duration;
            break;
        case GREEN:
            semaphores[semaphore_index].remaining_time = semaphores[semaphore_index].config[2].duration;
            break;
        case YELLOW:
            semaphores[semaphore_index].remaining_time = semaphores[semaphore_index].config[1].duration;
            break;
        default:
            semaphores[semaphore_index].remaining_time = 0;
            break;
    }

    /* Log every state change and trigger immediate client update via mailbox */
    printf("[SEMAPHORE] Sem %u -> %c for %us\n",
           (unsigned)semaphore_index,
           semaphore_state_to_string(semaphores[semaphore_index].current_state),
           (unsigned)semaphores[semaphore_index].remaining_time);

    if (SemaphoreStatusMbox) {
        INT8U err = OSMboxPost(SemaphoreStatusMbox, (void*)1);
        if (err != OS_NO_ERR) {
            printf("[SEMAPHORE] Failed to post status notification (err=%u)\n", err);
        }
    }
}

/**
 * @brief Switches to the next state of a specified semaphore.
 * @param semaphore_index Index of the semaphore to switch (0 or 1).
 */
void goto_next_semaphore_state(const uint8_t semaphore_index) {
    const uint8_t other = semaphore_index ^ 1;
    semaphore_state_t other_state = semaphores[other].current_state;
    
    switch (semaphores[semaphore_index].current_state) {
        case RED:
            /* Going RED -> GREEN, ensure other is RED */
            if (other_state != RED) {
                /* Other is GREEN or YELLOW, force to RED first */
                switch_semaphore_state(other, RED);
                printf("[SEMAPHORE] Sync: Sem %u forced to R before Sem %u goes GREEN\n", 
                       (unsigned)other, (unsigned)semaphore_index);
            }
            switch_semaphore_state(semaphore_index, GREEN);
            break;
            
        case YELLOW:
            switch_semaphore_state(semaphore_index, RED);
            /* If this goes to RED and other is also RED, force other to GREEN */
            if (semaphores[other].current_state == RED) {
                switch_semaphore_state(other, GREEN);
                printf("[SEMAPHORE] Sync: Sem %u forced to G to avoid dual RED\n", (unsigned)other);
            }
            break;
            
        default: /* GREEN */
            /* Going GREEN -> YELLOW, ensure other is still RED */
            if (other_state != RED) {
                /* Other is not RED, force it */
                switch_semaphore_state(other, RED);
                printf("[SEMAPHORE] Sync: Sem %u forced to R before Sem %u goes YELLOW\n",
                       (unsigned)other, (unsigned)semaphore_index);
            }
            switch_semaphore_state(semaphore_index, YELLOW);
            break;
    }
}

/**
 * @brief Sets the configuration for a specified semaphore.
 * @param semaphore_index Index of the semaphore to configure (0 or 1).
 * @param config The new configuration.
 */
void set_semaphore_config(const uint8_t semaphore_index, const semaphore_config_t config) {
    if (semaphore_index >= 2) {
        return;
    }
    semaphores[semaphore_index].config[0] = config;
}

/**
 * @brief Gets the current status of a specified semaphore.
 * @param semaphore_index Index of the semaphore to query (0 or 1).
 * @param state Pointer to store the current state.
 * @param remaining_time Pointer to store the remaining time in the current state.
 */
void get_semaphore_status(const uint8_t semaphore_index, semaphore_state_t* state, uint16_t* remaining_time) {
    if (semaphore_index >= 2 || state == NULL || remaining_time == NULL) {
        return;
    }
    *state = semaphores[semaphore_index].current_state;
    *remaining_time = semaphores[semaphore_index].remaining_time;
}

/**
 * @brief Converts semaphore state to string representation.
 * @param state Semaphore state.
 */
char semaphore_state_to_string(semaphore_state_t state) {
    switch (state) {
        case RED:
            return 'R';
        case YELLOW:
            return 'Y';
        case GREEN:
            return 'G';
        default:
            return 'O';
    }
}

/**
 * @brief Converts a string representation to semaphore state.
 * @param str String representation ("R", "Y", "G", or others for OFF).
 */
char string_to_semaphore_state(const char str) {
    switch (str) {
        case 'R':
            return RED;
        case 'Y':
            return YELLOW;
        case 'G':
            return GREEN;
        default:
            return OFF;
    }
}

/**
 * @brief Converts a decimal number to its hexadecimal representation for 7-segment display.
 * @param number Decimal number to convert.
 */
uint32_t decimal_to_hex_representation(uint32_t number) {
    uint32_t hex_value = 0;
    uint32_t shift = 0;
    while (number > 0) {
        uint32_t digit = number % 10;   // Takes last decimal digit.
        hex_value |= (digit << shift);  // Puts it in the correct nibble.
        number /= 10;
        shift += 4;                     // Next nibble.
    }
    return hex_value;
}

/**
 * @brief Shifts hexadecimal digits to the left by n positions.
 * @param value The original hexadecimal value.
 * @param n Number of positions to shift.
 * @return The shifted hexadecimal value.
 */
uint32_t shift_hex_digits_left(uint32_t value, unsigned int n) {
    return value * (1 << (4 * n)); // Multiplies by 16^n.
}

/**
 * @brief Sets all three time configurations for a specified semaphore.
 * Writes directly to hardware registers if hardware is present.
 * Rechecks sync to prevent conflicts after time update.
 */
void set_semaphore_times(const uint8_t semaphore_index, uint16_t red_time, uint16_t yellow_time, uint16_t green_time) {
    if (semaphore_index >= 2) {
        return;
    }
    
    const uint8_t other = semaphore_index ^ 1;
    
    /* Update software state */
    semaphores[semaphore_index].config[0].state = RED;
    semaphores[semaphore_index].config[0].duration = red_time;
    semaphores[semaphore_index].config[1].state = YELLOW;
    semaphores[semaphore_index].config[1].duration = yellow_time;
    semaphores[semaphore_index].config[2].state = GREEN;
    semaphores[semaphore_index].config[2].duration = green_time;
    
#ifdef USER_HW_ENABLED
    /* Write to hardware registers */
    user_hw_write_red_time(semaphore_index, red_time);
    user_hw_write_yellow_time(semaphore_index, yellow_time);
    user_hw_write_green_time(semaphore_index, green_time);
    printf("Semaphore %d times written to HW: R=%d, Y=%d, G=%d\n", 
           semaphore_index, red_time, yellow_time, green_time);
#else
    printf("Semaphore %d times (SW only): R=%d, Y=%d, G=%d\n", 
           semaphore_index, red_time, yellow_time, green_time);
#endif

    /* Recheck and resync if semaphores are running */
    if (semaphores[semaphore_index].running && semaphores[other].running) {
        semaphore_state_t s = semaphores[semaphore_index].current_state;
        semaphore_state_t s_other = semaphores[other].current_state;
        
        /* Check for conflicts after time update */
        if ((s == GREEN || s == YELLOW) && (s_other == GREEN || s_other == YELLOW)) {
            /* Both passing - force other to RED */
            semaphores[other].current_state = RED;
            semaphores[other].remaining_time = semaphores[other].config[0].duration;
            printf("[SEMAPHORE] Resync after time update: Sem %u forced to R\n", (unsigned)other);
        } else if (s == RED && s_other == RED) {
            /* Both stopped - force other to GREEN */
            semaphores[other].current_state = GREEN;
            semaphores[other].remaining_time = semaphores[other].config[2].duration;
            printf("[SEMAPHORE] Resync after time update: Sem %u forced to G\n", (unsigned)other);
        }
        
        /* Update remaining time if currently in a state that was reconfigured */
        if (s == RED && semaphores[semaphore_index].remaining_time > red_time) {
            semaphores[semaphore_index].remaining_time = red_time;
        } else if (s == YELLOW && semaphores[semaphore_index].remaining_time > yellow_time) {
            semaphores[semaphore_index].remaining_time = yellow_time;
        } else if (s == GREEN && semaphores[semaphore_index].remaining_time > green_time) {
            semaphores[semaphore_index].remaining_time = green_time;
        }
    }
}

/**
 * @brief Starts semaphore operation with specified initial state.
 */
void start_semaphore(const uint8_t semaphore_index, const semaphore_state_t initial_state) {
    if (semaphore_index >= 2) {
        return;
    }
    
    const uint8_t other = semaphore_index ^ 1;
    
    /* Set initial state for the specified semaphore */
    semaphores[semaphore_index].current_state = initial_state;
    switch (initial_state) {
        case RED:
            semaphores[semaphore_index].remaining_time = semaphores[semaphore_index].config[0].duration;
            break;
        case YELLOW:
            semaphores[semaphore_index].remaining_time = semaphores[semaphore_index].config[1].duration;
            break;
        case GREEN:
            semaphores[semaphore_index].remaining_time = semaphores[semaphore_index].config[2].duration;
            break;
        default:
            semaphores[semaphore_index].remaining_time = 0;
            break;
    }
    semaphores[semaphore_index].running = 1;
    semaphores[semaphore_index].idle_blink_on = 0;
    
    /* Calculate synchronized state and timing for other semaphore */
    /* Strategy: Adjust remaining times so cycles synchronize perfectly */
    
    uint16_t this_passing_time = 0;  /* Time this will spend in GREEN+YELLOW */
    uint16_t this_red_time = semaphores[semaphore_index].config[0].duration;
    uint16_t other_passing_time = semaphores[other].config[2].duration + 
                                   semaphores[other].config[1].duration;
    uint16_t other_red_time = semaphores[other].config[0].duration;
    
    if (initial_state == RED) {
        /* This starts RED, other should be passing (GREEN) */
        semaphores[other].current_state = GREEN;
        
        /* Calculate how much of GREEN time other should have to sync perfectly */
        /* When this finishes RED, other should be finishing YELLOW */
        /* So: other_remaining = this_red - other_yellow */
        uint16_t other_yellow = semaphores[other].config[1].duration;
        if (this_red_time > other_yellow) {
            /* Other should have enough GREEN time left */
            uint16_t ideal_green_remaining = this_red_time - other_yellow;
            if (ideal_green_remaining <= semaphores[other].config[2].duration) {
                semaphores[other].remaining_time = ideal_green_remaining;
            } else {
                semaphores[other].remaining_time = semaphores[other].config[2].duration;
            }
        } else {
            /* This RED is shorter than other's YELLOW, start other mid-YELLOW */
            semaphores[other].current_state = YELLOW;
            semaphores[other].remaining_time = this_red_time;
        }
        
        printf("Semaphore %u STARTED with state R (%us)\n", 
               (unsigned)semaphore_index, (unsigned)this_red_time);
        printf("Semaphore %u SYNCED to %c (%us) - will finish when Sem%u goes GREEN\n",
               (unsigned)other, semaphore_state_to_string(semaphores[other].current_state),
               (unsigned)semaphores[other].remaining_time, (unsigned)semaphore_index);
    } else if (initial_state == GREEN) {
        /* This starts GREEN, other should be RED */
        this_passing_time = semaphores[semaphore_index].config[2].duration +
                           semaphores[semaphore_index].config[1].duration;
        
        semaphores[other].current_state = RED;
        
        /* Other's RED time should cover this GREEN+YELLOW, then sync to cycle */
        /* Ideal: other_red should end when this ends YELLOW, so other can go GREEN */
        if (this_passing_time <= other_red_time) {
            /* Adjust other's remaining RED to match this passing time */
            semaphores[other].remaining_time = this_passing_time;
        } else {
            /* This passing is longer, other waits full RED then syncs naturally */
            semaphores[other].remaining_time = other_red_time;
        }
        
        printf("Semaphore %u STARTED with state G (%us + %us Y)\n", 
               (unsigned)semaphore_index, 
               (unsigned)semaphores[semaphore_index].config[2].duration,
               (unsigned)semaphores[semaphore_index].config[1].duration);
        printf("Semaphore %u SYNCED to R (%us) - will go GREEN when Sem%u goes RED\n",
               (unsigned)other, (unsigned)semaphores[other].remaining_time,
               (unsigned)semaphore_index);
    } else { /* YELLOW */
        /* This starts YELLOW, other must be RED for at least YELLOW duration */
        this_passing_time = semaphores[semaphore_index].config[1].duration;
        
        semaphores[other].current_state = RED;
        semaphores[other].remaining_time = (this_passing_time < other_red_time) ? 
                                           this_passing_time : other_red_time;
        
        printf("Semaphore %u STARTED with state Y (%us)\n", 
               (unsigned)semaphore_index, (unsigned)this_passing_time);
        printf("Semaphore %u SYNCED to R (%us) - will go GREEN when Sem%u goes RED\n",
               (unsigned)other, (unsigned)semaphores[other].remaining_time,
               (unsigned)semaphore_index);
    }
    
    semaphores[other].running = 1;
    semaphores[other].idle_blink_on = 0;
    
    printf("Semaphore %d STARTED with state %c (%us)\n", 
           semaphore_index, 
           semaphore_state_to_string(semaphores[semaphore_index].current_state),
           semaphores[semaphore_index].remaining_time);
    printf("Semaphore %d AUTO-STARTED with state %c (%us) for sync\n", 
           other, 
           semaphore_state_to_string(semaphores[other].current_state),
           semaphores[other].remaining_time);
    
#ifdef USER_HW_ENABLED
    /* Send START command to hardware */
    uint8_t hw_state = SEMAPHORE_INITIAL_STATE_IDLE;
    switch (initial_state) {
        case RED:    hw_state = SEMAPHORE_INITIAL_STATE_RED; break;
        case YELLOW: hw_state = SEMAPHORE_INITIAL_STATE_YELLOW; break;
        case GREEN:  hw_state = SEMAPHORE_INITIAL_STATE_GREEN; break;
        default:     hw_state = SEMAPHORE_INITIAL_STATE_IDLE; break;
    }
    user_hw_write_control(semaphore_index, 1, 0, hw_state);
    printf("Semaphore %d HW control updated\n", semaphore_index);
#endif
    
    /* Notify status update */
    if (SemaphoreStatusMbox) {
        OSMboxPost(SemaphoreStatusMbox, (void*)1);
    }
}

/**
 * @brief Stops semaphore operation.
 */
void stop_semaphore(const uint8_t semaphore_index) {
    if (semaphore_index >= 2) {
        return;
    }
    
#ifdef USER_HW_ENABLED
    /* Send STOP command to hardware */
    user_hw_write_control(semaphore_index, 0, 1, SEMAPHORE_INITIAL_STATE_IDLE);
    /* Keep software state consistent and enter idle blinking */
    semaphores[semaphore_index].running = 0;
    semaphores[semaphore_index].idle_blink_on = 0;  /* start with OFF, next tick goes YELLOW */
    semaphores[semaphore_index].current_state = OFF;
    semaphores[semaphore_index].remaining_time = 0;
    printf("Semaphore %d STOPPED -> IDLE (yellow blinking) [HW]\n", semaphore_index);
    /* Notify client to send immediate status */
    if (SemaphoreStatusMbox) {
        INT8U err = OSMboxPost(SemaphoreStatusMbox, (void*)1);
        if (err != OS_NO_ERR) {
            printf("[SEMAPHORE] Failed to post status notification (err=%u)\n", err);
        }
    }
#else
    /* Set to OFF state in software */
        semaphores[semaphore_index].running = 0;
        semaphores[semaphore_index].idle_blink_on = 0;  /* start with OFF, next tick goes YELLOW */
        semaphores[semaphore_index].current_state = OFF;
        semaphores[semaphore_index].remaining_time = 0;
    /* Ensure counterpart goes to RED to avoid overlap when restarting */
    const uint8_t other = semaphore_index ^ 1;
    semaphores[other].current_state = RED;
    semaphores[other].remaining_time = semaphores[other].config[0].duration;
    semaphores[other].running = 1;
    semaphores[other].idle_blink_on = 0;
        printf("Semaphore %d STOPPED -> IDLE (yellow blinking)\n", semaphore_index);
#endif
}

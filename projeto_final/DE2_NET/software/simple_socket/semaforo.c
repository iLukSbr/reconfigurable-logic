#include "semaforo.h"

// C
#include <inttypes.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>

// Altera
#include "sys/alt_irq.h"

// Project
#include "seg7display.h"

static semaphore_t semaphores[2] = {
    {
        .config = {
            {RED, 30},
            {YELLOW, 5},
            {GREEN, 20}
        },
        .current_state = RED,
        .remaining_time = 30
    },
    {
        .config = {
            {RED, 30},
            {YELLOW, 3},
            {GREEN, 22}
        },
        .current_state = GREEN,
        .remaining_time = 22
    }
}; // Two semaphores with initial configurations.

/**
 * @brief Semaphore task that controls the 7 segment displays.
 */
void semaphore_task(void) {
    printf("Semaphore task started...\n");
    uint8_t i = 0;  // Index for semaphore_state array.
    uint32_t hex_value = 0; // Value to display on 7-segment.
    while (1) {
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
    semaphores[semaphore_index].current_state = new_state;
    switch (semaphores[semaphore_index].current_state) {
        case RED:
            semaphores[semaphore_index].remaining_time = semaphores[semaphore_index].config[0].duration;
            break;
        case GREEN:
            semaphores[semaphore_index].remaining_time = semaphores[semaphore_index].config[2].duration;
            break;
        default:
            semaphores[semaphore_index].remaining_time = semaphores[semaphore_index].config[1].duration;
            break;
    }
}

/**
 * @brief Switches to the next state of a specified semaphore.
 * @param semaphore_index Index of the semaphore to switch (0 or 1).
 */
void goto_next_semaphore_state(const uint8_t semaphore_index) {
    switch (semaphores[semaphore_index].current_state) {
        case RED:
            switch_semaphore_state(semaphore_index, GREEN);
            break;
        case YELLOW:
            switch_semaphore_state(semaphore_index, RED);
            break;
        default:
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
        uint32_t digit = number % 10;   // Pega último dígito decimal.
        hex_value |= (digit << shift);  // Coloca no nibble correspondente.
        number /= 10;
        shift += 4;                     // Próximo nibble.
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

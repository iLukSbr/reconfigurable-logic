#pragma once

// C
#include <stddef.h>
#include <stdint.h>

typedef enum {
    OFF    = 0x0C, // Semaphore off
    RED    = 0x0D, // Semaphore red
    YELLOW = 0x0E, // Semaphore yellow
    GREEN  = 0x0F  // Semaphore green
} semaphore_state_t; // Enumeration for semaphore states.

typedef struct {
    semaphore_state_t state; // Semaphore state.
    uint16_t duration;       // Duration of the state in seconds.
} semaphore_config_t; // Semaphore configuration.

typedef struct {
    semaphore_config_t config[3];       // Semaphore configuration.
    semaphore_state_t current_state; // Current state of the semaphore.
    uint16_t remaining_time;         // Remaining seconds of the state.
} semaphore_t; // Semaphore.

/**
 * @brief Semaphore task that controls the 7 segment displays.
 */
void semaphore_task(void);

/**
 * @brief Switches the state of a specified semaphore.
 * @param semaphore_index Index of the semaphore to switch (0 or 1).
 * @param new_state The new state to set for the semaphore.
 */
void switch_semaphore_state(const uint8_t semaphore_index, const semaphore_state_t new_state);

/**
 * @brief Switches to the next state of a specified semaphore.
 * @param semaphore_index Index of the semaphore to switch (0 or 1).
 */
void goto_next_semaphore_state(const uint8_t semaphore_index);

/**
 * @brief Sets the configuration for a specified semaphore.
 * @param semaphore_index Index of the semaphore to configure (0 or 1).
 * @param config The new configuration.
 */
void set_semaphore_config(const uint8_t semaphore_index, const semaphore_config_t config);

/**
 * @brief Gets the current status of a specified semaphore.
 * @param semaphore_index Index of the semaphore to query (0 or 1).
 * @param state Pointer to store the current state.
 * @param remaining_time Pointer to store the remaining time in the current state.
 */
void get_semaphore_status(const uint8_t semaphore_index, semaphore_state_t* state, uint16_t* remaining_time);

/**
 * @brief Converts semaphore state to string representation.
 * @param state Semaphore state.
 */
char semaphore_state_to_string(semaphore_state_t state);

/**
 * @brief Converts a string representation to semaphore state.
 * @param str String representation ("R", "Y", "G", or others for OFF).
 */
char string_to_semaphore_state(const char str);

/**
 * @brief Converts a decimal number to its hexadecimal representation for 7-segment display.
 * @param number Decimal number to convert.
 */
uint32_t decimal_to_hex_representation(uint32_t number);

/**
 * @brief Shifts hexadecimal digits to the left by n positions.
 * @param value The original hexadecimal value.
 * @param n Number of positions to shift.
 * @return The shifted hexadecimal value.
 */
uint32_t shift_hex_digits_left(uint32_t value, unsigned int n);

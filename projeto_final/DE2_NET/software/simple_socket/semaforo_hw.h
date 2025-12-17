#pragma once

/**
 * @file semaforo_hw.h
 * @brief Hardware register interface for traffic light control
 * 
 * Memory map for semaphore hardware:
 * WRITE Registers:
 *   REG0 (offset 0x00): RED time in seconds (0-999)
 *   REG1 (offset 0x04): YELLOW time in seconds (0-999)
 *   REG2 (offset 0x08): GREEN time in seconds (0-999)
 *   REG3 (offset 0x0C): CONTROL register
 *       bit 0: START - Start semaphore operation
 *       bit 1: STOP - Stop semaphore operation
 *       bit [3:2]: INITIAL_STATE - Initial state (00=IDLE, 01=RED, 10=YELLOW, 11=GREEN)
 *       bit 4: SEMAPHORE_ID - Which semaphore (0 or 1)
 * 
 * READ Registers:
 *   REG0 (offset 0x00): STATUS - Current state
 *       bits [1:0]: STATE (00=IDLE/OFF, 01=RED, 10=YELLOW, 11=GREEN)
 *       bit 2: RUNNING - Semaphore is running
 *   REG1 (offset 0x04): REMAINING_TIME - Remaining seconds in current state (0-999)
 * 
 * INTERRUPT:
 *   Generated on state changes. Handler should read status registers and clear interrupt.
 */

#include <stdint.h>
#include "altera_avalon_pio_regs.h"
#include "system.h"
#include "sys/alt_irq.h"

#define SEMAPHORE_HW_ENABLED

#ifndef SEMAPHORE_0_BASE
    #define SEMAPHORE_0_BASE 0x1A82200
#endif

#ifndef SEMAPHORE_1_BASE
    #define SEMAPHORE_1_BASE 0x1A82240
#endif

/* Default IRQ definitions */
#ifndef SEMAPHORE_0_IRQ
    #define SEMAPHORE_0_IRQ 5
#endif
#ifndef SEMAPHORE_0_IRQ_INTERRUPT_CONTROLLER_ID
    #define SEMAPHORE_0_IRQ_INTERRUPT_CONTROLLER_ID 0
#endif
#ifndef SEMAPHORE_1_IRQ
    #define SEMAPHORE_1_IRQ 6
#endif
#ifndef SEMAPHORE_1_IRQ_INTERRUPT_CONTROLLER_ID
    #define SEMAPHORE_1_IRQ_INTERRUPT_CONTROLLER_ID 0
#endif

/* Register offsets */
#define SEMAPHORE_REG_TIME_RED_OFFSET       0x00
#define SEMAPHORE_REG_TIME_YELLOW_OFFSET    0x04
#define SEMAPHORE_REG_TIME_GREEN_OFFSET     0x08
#define SEMAPHORE_REG_CONTROL_OFFSET        0x0C
#define SEMAPHORE_REG_STATUS_OFFSET         0x00
#define SEMAPHORE_REG_REMAINING_TIME_OFFSET 0x04

/* IRQ register offsets */
#ifndef SEMAPHORE_IRQ_ENABLE_OFFSET
    #define SEMAPHORE_IRQ_ENABLE_OFFSET 0x10
#endif
#ifndef SEMAPHORE_IRQ_CLEAR_OFFSET
    #define SEMAPHORE_IRQ_CLEAR_OFFSET 0x14
#endif
#ifndef SEMAPHORE_IRQ_MASK
    #define SEMAPHORE_IRQ_MASK 0x0001
#endif

/* Control register bit masks */
#define SEMAPHORE_CTRL_START               (1 << 0)
#define SEMAPHORE_CTRL_STOP                (1 << 1)
#define SEMAPHORE_CTRL_INITIAL_STATE_MASK  0x0C
#define SEMAPHORE_CTRL_INITIAL_STATE_SHIFT 2
#define SEMAPHORE_CTRL_SEMAPHORE_ID        (1 << 4)

/* Initial state values */
#define SEMAPHORE_INITIAL_STATE_IDLE   0
#define SEMAPHORE_INITIAL_STATE_RED    1
#define SEMAPHORE_INITIAL_STATE_YELLOW 2
#define SEMAPHORE_INITIAL_STATE_GREEN  3

/* Status register bit masks */
#define SEMAPHORE_STATUS_STATE_MASK 0x03
#define SEMAPHORE_STATUS_RUNNING    (1 << 2)

/* State values in status register */
#define SEMAPHORE_STATE_IDLE   0
#define SEMAPHORE_STATE_RED    1
#define SEMAPHORE_STATE_YELLOW 2
#define SEMAPHORE_STATE_GREEN  3

/**
 * @brief Get base address for specified semaphore.
 * @param semaphore_id Semaphore index (0 or 1).
 * @return Base address of the semaphore registers.
 */
static inline uint32_t semaphore_hw_get_base(uint8_t semaphore_id) {
    return (semaphore_id == 0) ? SEMAPHORE_0_BASE : SEMAPHORE_1_BASE;
}

/**
 * @brief Enable IRQ for specified semaphore
 */
static inline void semaphore_hw_enable_irq(uint8_t semaphore_id) {
    uint32_t base = semaphore_hw_get_base(semaphore_id);
    IOWR_32DIRECT(base, SEMAPHORE_IRQ_ENABLE_OFFSET, SEMAPHORE_IRQ_MASK);
}

/**
 * @brief Clear IRQ for specified semaphore
 */
static inline void semaphore_hw_clear_irq(uint8_t semaphore_id) {
    uint32_t base = semaphore_hw_get_base(semaphore_id);
    IOWR_32DIRECT(base, SEMAPHORE_IRQ_CLEAR_OFFSET, SEMAPHORE_IRQ_MASK);
}

/**
 * @brief Write RED time to semaphore hardware.
 * @param semaphore_id Semaphore index (0 or 1).
 * @param seconds Time in seconds (0-999).
 */
static inline void semaphore_hw_write_red_time(uint8_t semaphore_id, uint32_t seconds) {
    uint32_t base = semaphore_hw_get_base(semaphore_id);
    IOWR_32DIRECT(base, SEMAPHORE_REG_TIME_RED_OFFSET, seconds);
}

/**
 * @brief Write YELLOW time to semaphore hardware.
 * @param semaphore_id Semaphore index (0 or 1).
 * @param seconds Time in seconds (0-999).
 */
static inline void semaphore_hw_write_yellow_time(uint8_t semaphore_id, uint32_t seconds) {
    uint32_t base = semaphore_hw_get_base(semaphore_id);
    IOWR_32DIRECT(base, SEMAPHORE_REG_TIME_YELLOW_OFFSET, seconds);
}

/**
 * @brief Write GREEN time to semaphore hardware.
 * @param semaphore_id Semaphore index (0 or 1).
 * @param seconds Time in seconds (0-999).
 */
static inline void semaphore_hw_write_green_time(uint8_t semaphore_id, uint32_t seconds) {
    uint32_t base = semaphore_hw_get_base(semaphore_id);
    IOWR_32DIRECT(base, SEMAPHORE_REG_TIME_GREEN_OFFSET, seconds);
}

/**
 * @brief Write control register.
 * @param semaphore_id Semaphore index (0 or 1).
 * @param start Set to 1 to start operation.
 * @param stop Set to 1 to stop operation.
 * @param initial_state Initial state (SEMAPHORE_INITIAL_STATE_RED/YELLOW/GREEN).
 */
static inline void semaphore_hw_write_control(uint8_t semaphore_id, uint32_t start, uint32_t stop, uint32_t initial_state) {
    uint32_t base = semaphore_hw_get_base(semaphore_id);
    uint32_t control = 0;
    
    if (start) control |= SEMAPHORE_CTRL_START;
    if (stop) control |= SEMAPHORE_CTRL_STOP;
    control |= ((initial_state & 0x03) << SEMAPHORE_CTRL_INITIAL_STATE_SHIFT);
    if (semaphore_id == 1) control |= SEMAPHORE_CTRL_SEMAPHORE_ID;
    
    IOWR_32DIRECT(base, SEMAPHORE_REG_CONTROL_OFFSET, control);
}

/**
 * @brief Read status register.
 * @param semaphore_id Semaphore index (0 or 1).
 * @return Status value with state and running flag.
 */
static inline uint32_t semaphore_hw_read_status(uint8_t semaphore_id) {
    uint32_t base = semaphore_hw_get_base(semaphore_id);
    return IORD_32DIRECT(base, SEMAPHORE_REG_STATUS_OFFSET);
}

/**
 * @brief Read remaining time register.
 * @param semaphore_id Semaphore index (0 or 1).
 * @return Remaining seconds in current state.
 */
static inline uint32_t semaphore_hw_read_remaining_time(uint8_t semaphore_id) {
    uint32_t base = semaphore_hw_get_base(semaphore_id);
    return IORD_32DIRECT(base, SEMAPHORE_REG_REMAINING_TIME_OFFSET);
}

/**
 * @brief Extract current state from status register.
 * @param status Status register value.
 * @return Current state (SEMAPHORE_STATE_IDLE/RED/YELLOW/GREEN).
 */
static inline uint32_t semaphore_hw_get_state(uint32_t status) {
    return status & SEMAPHORE_STATUS_STATE_MASK;
}

/**
 * @brief Check if semaphore is running.
 * @param status Status register value.
 * @return 1 if running, 0 otherwise.
 */
static inline uint32_t semaphore_hw_is_running(uint32_t status) {
    return (status & SEMAPHORE_STATUS_RUNNING) ? 1 : 0;
}

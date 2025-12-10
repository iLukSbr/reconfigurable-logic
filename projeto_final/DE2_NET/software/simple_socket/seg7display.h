#pragma once

#include "includes.h"
#include "altera_avalon_pio_regs.h"

/**
 * @brief Writes a hexadecimal number up to 8 digits long across the 7-segment displays.
 * @param number Hexadecimal number to display.
 */
void seg7_write_hex(INT32U number);

/**
 * @brief Clears all 8 7-segment displays.
 */
void seg7_clear(void);

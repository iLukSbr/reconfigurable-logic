#include "seg7display.h"

// C
#include <stdio.h>

// Altera
#include "system.h"
#include "altera_avalon_pio_regs.h"

/**
 * @brief Writes a hexadecimal number up to 8 digits long across the 7-segment displays.
 * @param number Hexadecimal number to display.
 */
void seg7_write_hex(INT32U number) {
    IOWR_ALTERA_AVALON_PIO_DATA(SEG7_DISPLAY_BASE, number);
}

/**
 * @brief Clears all 8 7-segment displays.
 */
void seg7_clear(void) {
    IOWR_ALTERA_AVALON_PIO_DATA(SEG7_DISPLAY_BASE, 0xCCCCCCCC);
}

#include "seg7display.h"
#include "sys/alt_irq.h"
#include "system.h"
#include "altera_avalon_pio_regs.h"
#include <stdio.h>

// This pattern table is only used for a reverse-lookup to support the legacy
// seg7_write_pattern function. The hardware has its own LUT that this code will now use.
static const INT8U seg7_patterns[] = {
    0x3F, /* 0 */ 0x06, /* 1 */ 0x5B, /* 2 */ 0x4F, /* 3 */
    0x66, /* 4 */ 0x6D, /* 5 */ 0x7D, /* 6 */ 0x07, /* 7 */
    0x7F, /* 8 */ 0x6F, /* 9 */ 0x77, /* A */ 0x7C, /* b */
    0x39, /* C */ 0x5E, /* d */ 0x79, /* E */ 0x71  /* F */
};

/**
 *  @brief Initializes the 7-segment displays.
 */
void seg7_init(void) {
    seg7_clear();
    printf("SEG7 displays initialized\n");
}

/**
 * @brief Clears all 7-segment displays.
 */
void seg7_clear(void) {
    // The hardware LUT will decode 0 to a '0' display. There is no universal "blank".
    // Writing a value like 0xFFFFFFFF might work if the LUT has a default case.
    // For now, writing 0 is the most predictable "clear".
    IOWR_ALTERA_AVALON_PIO_DATA(SEG7_DISPLAY_BASE, 0x00000000);
    printf("SEG7 displays cleared\n");
}

/**
 * @brief (Legacy) Kept for API compatibility, but misleading as LUT is in hardware.
 */
INT8U seg7_decode_digit(INT8U digit) {
    if (digit > 9) return 0x00;
    return seg7_patterns[digit];
}

/**
 * @brief (Legacy) Kept for API compatibility, but misleading as LUT is in hardware.
 */
INT8U seg7_decode_hex(INT8U hex_value) {
    if (hex_value > 15) return 0x00;
    return seg7_patterns[hex_value];
}

/**
 * @brief Writes a decimal number up to 8 digits long across the displays.
 * @param number The number to display.
 */
void seg7_write_number(INT32U number) {
    IOWR_ALTERA_AVALON_PIO_DATA(SEG7_DISPLAY_BASE, number);
}

/**
 * @brief Function to test the displays with a counter.
 * @note This is a blocking, infinite loop.
 */
void seg7_display_counter(void) {
    INT32U counter = 0;
    printf("Starting SEG7 counter test...\n");
    
    // This assumes a uC/OS-II environment if OSTimeDlyHMSM is to be used.
    while(1) {
        seg7_write_number(counter);
        counter++;
        if (counter > 99999999) {
            counter = 0;
        }
        // Example delay call, if you are using uC/OS-II
        // OSTimeDlyHMSM(0, 0, 0, 100);
    }
}

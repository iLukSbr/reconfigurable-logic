/* MicroC/OS-II definitions */
#include "includes.h"

/*
 * led_bit_toggle() sets or clears a bit in led_8_val, which corresponds
 * to 1 of 8 leds, and then writes led_8_val to a register on the Nios
 * Development Board which controls 8 LEDs, D0 - D7.
 * 
 */
 
void led_bit_toggle(OS_FLAGS bit);

/*
 *    LED7SegLightshowTask displays an LED Lightshow by writing random values 
 * to the 7 segment LEDs, U8 and U9.  The show is started and stopped in 
 * response to a command from the SSSSimpleSocketServerTask, via 
 * SSSLEDLightshowSem semaphore controlled in LEDManagementTask.
 * 
 */ 
 
void LED7SegLightshowTask();

/*
 * The LedManagementTask() is a simple MicroC/OS-II task that controls Nios
 * Development Board LEDs based on commands received by the 
 * SSSSimpleSocketServerTask in the SSSLEDCommandQ. 
 * 
 * The task will read the SSSLedCommandQ for an 
 * in-coming message command from the SSSSimpleSocketServerTask. 
 */
 
void LEDManagementTask();

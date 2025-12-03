/* 
 * seg7display.h - Header file for 7-segment display control
 * 
 * Funções para controle dos displays de 7 segmentos da placa DE2
 */

#ifndef SEG7DISPLAY_H_
#define SEG7DISPLAY_H_

#include "includes.h"
#include "altera_avalon_pio_regs.h"

/* Funções para controle dos displays de 7 segmentos */
void seg7_init(void);
void seg7_write_number(INT32U number);
void seg7_clear(void);

/* Funções para conversão de valores */
INT8U seg7_decode_digit(INT8U digit);
INT8U seg7_decode_hex(INT8U hex_value);

#endif /* SEG7DISPLAY_H_ */

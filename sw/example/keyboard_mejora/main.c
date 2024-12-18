// #################################################################################################
// # << NEORV32 - Blinking LED Demo Program >>                                                     #
// # ********************************************************************************************* #
// # BSD 3-Clause License                                                                          #
// #                                                                                               #
// # Copyright (c) 2021, Stephan Nolting. All rights reserved.                                     #
// #                                                                                               #
// # Redistribution and use in source and binary forms, with or without modification, are          #
// # permitted provided that the following conditions are met:                                     #
// #                                                                                               #
// # 1. Redistributions of source code must retain the above copyright notice, this list of        #
// #    conditions and the following disclaimer.                                                   #
// #                                                                                               #
// # 2. Redistributions in binary form must reproduce the above copyright notice, this list of     #
// #    conditions and the following disclaimer in the documentation and/or other materials        #
// #    provided with the distribution.                                                            #
// #                                                                                               #
// # 3. Neither the name of the copyright holder nor the names of its contributors may be used to  #
// #    endorse or promote products derived from this software without specific prior written      #
// #    permission.                                                                                #
// #                                                                                               #
// # THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS   #
// # OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF               #
// # MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE    #
// # COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,     #
// # EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE #
// # GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED    #
// # AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING     #
// # NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED  #
// # OF THE POSSIBILITY OF SUCH DAMAGE.                                                            #
// # ********************************************************************************************* #
// # The NEORV32 Processor - https://github.com/stnolting/neorv32              (c) Stephan Nolting #
// #################################################################################################


/**********************************************************************//**
 * @file blink_led/main.c
 * @author Stephan Nolting
 * @brief Simple blinking LED demo program using the lowest 8 bits of the GPIO.output port.
 **************************************************************************/

#include <neorv32.h>


/**********************************************************************//**
 * @name User configuration
 **************************************************************************/
/**@{*/
/** UART BAUD rate */
#define BAUD_RATE 19200
/** Use the custom ASM version for blinking the LEDs defined (= uncommented) */
//#define USE_ASM_VERSION
/**@}*/


/**********************************************************************//**
 * ASM function to blink LEDs
 **************************************************************************/
extern void blink_led_asm(uint32_t gpio_out_addr);

/**********************************************************************//**
 * C function to blink LEDs
 **************************************************************************/
void keyboard_c(void);
/**********************************************************************//**
 * Main function; shows an incrementing 8-bit counter on GPIO.output(7:0).
 *
 * @note This program requires the GPIO controller to be synthesized (the UART is optional).
 *
 * @return 0 if execution was successful
 **************************************************************************/
int main() {

  // init UART (primary UART = UART0; if no id number is specified the primary UART is used) at default baud rate, no parity bits, ho hw flow control
  neorv32_uart0_setup(BAUD_RATE, PARITY_NONE, FLOW_CONTROL_NONE);

  // check if GPIO unit is implemented at all
  if (neorv32_gpio_available() == 0) {
    neorv32_uart0_print("Error! No GPIO unit synthesized!\n");
    return 1; // nope, no GPIO unit synthesized
  }

  // capture all exceptions and give debug info via UART
  // this is not required, but keeps us safe
  neorv32_rte_setup();

  keyboard_c();
  return 0;
}


/**********************************************************************//**
 * C-version of blinky LED counter
 **************************************************************************/
void keyboard_c(void) {
  neorv32_gpio_port_set(0xFF); // Clear GPIO output

  int col = 0;
  int fil = 0;
  int tecla_pulsada[4][4] = {0}; // Matriz para almacenar el estado de las teclas (0: no pulsada, 1: pulsada)

  while (1) {
    for (col = 0; col < 4; col++) {
      neorv32_gpio_pin_clr(col); // Desactiva la columna actual

      for (fil = 4; fil < 8; fil++) {
        if (neorv32_gpio_pin_get(fil) == 0) { // Si la tecla está presionada

          // Verifica si la tecla aún no ha sido registrada como presionada
          if (tecla_pulsada[fil - 4][col] == 0) { 
            // Asignación de valor a la tecla según la combinación de fila y columna
            char key = 0;

            if (fil == 7) {
              if (col == 3) key = '1';
              else if (col == 2) key = '2';
              else if (col == 1) key = '3';
              else if (col == 0) key = 'A';
            } 
            else if (fil == 6) {
              if (col == 3) key = '4';
              else if (col == 2) key = '5';
              else if (col == 1) key = '6';
              else if (col == 0) key = 'B';
            } 
            else if (fil == 5) {
              if (col == 3) key = '7';
              else if (col == 2) key = '8';
              else if (col == 1) key = '9';
              else if (col == 0) key = 'C';
            } 
            else if (fil == 4) {
              if (col == 3) key = 'O';
              else if (col == 2) key = 'F';
              else if (col == 1) key = 'E';
              else if (col == 0) key = 'D';
            }

            // Imprimir la tecla correspondiente en pantalla
            neorv32_uart0_printf("Tecla presionada: %c (Fila %u, Columna %u)\n", key, 7 - fil, 3 - col);

            // Marcar la tecla como pulsada
            tecla_pulsada[fil - 4][col] = 1;
          }
        } else {
          // Si la tecla se ha soltado, restablece el estado para que se pueda leer nuevamente
          tecla_pulsada[fil - 4][col] = 0;
        }
      }

      neorv32_gpio_pin_set(col); // Vuelve a activar la columna actual
    }
  }
}

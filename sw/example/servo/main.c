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

#include <neorv32.h>
#include <stdio.h>

/** UART BAUD rate */
#define BAUD_RATE 19200

// Define the frequency parameters for a servo
#define PWM_FREQUENCY 50          // Servo PWM frequency in Hz
#define PWM_PERIOD_NS 20000000    // Period in nanoseconds (20 ms)
#define NEORV32_CLOCK_HZ 12000000 // PWM clock frequency (12Mhz)
#define SERVO_MIN_DUTY 5          // 5% duty cycle for 0° position
#define SERVO_MAX_DUTY 10         // 10% duty cycle for 360° position
#define SERVO_MED_DUTY 7.5        // 7.5% duty cycle for 180° position




void pwm_init()
{
    // check if PWM unit is implemented at all
    if (neorv32_pwm_available() == 0)
    {
        neorv32_uart0_printf("PWM no implementado\n");
        return;
    }

    // configure and enable PWM
    neorv32_pwm_setup(CLK_PRSC_64); // Ponemos el reloj del pwm a 50Hz CLK_PRSC_64/3750
    neorv32_pwm_enable();
}

void set_servo_angle(int angle)
{
    int duty_cycle = 5 + (angle * (10 - 5) / 180); // angle*255/360;


    // float duty_value = 0.01 * porciento_duty_cycle * Periodo_ticks_PWM;

    // Set the duty cycle for the channel
    neorv32_pwm_set(0, duty_cycle);
    neorv32_cpu_delay_ms(200);
    neorv32_pwm_set(0, 19);
}



int main()
{
    // Initialize UART (for debugging) and GPIO
    neorv32_uart0_setup(BAUD_RATE, PARITY_NONE, FLOW_CONTROL_NONE);

    // neorv32_uart0_printf("Keyboard test. Press keys...\n");

    // check if GPIO unit is implemented at all
    if (neorv32_gpio_available() == 0)
    {
        neorv32_uart0_print("Error! No GPIO unit synthesized!\n");
        return 1; // nope, no GPIO unit synthesized
    }

    // capture all exceptions and give debug info via UART
    // this is not required, but keeps us safe
    neorv32_rte_setup();

  
    // say hello
    neorv32_uart0_print("\n\nPWM demo program\n");

    // Initialize PWM
    pwm_init();

    // Test servo at various angles
    while (1)
    {
      if(neorv32_gpio_pin_get(2) == 1){
       

        int angle = 0;

        for (angle = 0; angle <= 360; angle += 30)
        {


            neorv32_pwm_set(0, 25); // 5% -> 0°
            int tiempo_ms = (30 * 1000) / 765;
            neorv32_cpu_delay_ms(tiempo_ms); // Delay 500 ms
            neorv32_pwm_set(0, 0);
            neorv32_cpu_delay_ms(1000); // Delay 500 ms
        }
      }

    //       else if(neorv32_gpio_pin_get(0) == 1){
       

    //     int angle = 0;

    //     for (angle = 0; angle <= 360; angle += 30)
    //     {


    //         neorv32_pwm_set(0, 25); // 5% -> 0°
    //         int tiempo_ms = (60 * 1000) / 765;
    //         neorv32_cpu_delay_ms(tiempo_ms); // Delay 500 ms
    //         neorv32_pwm_set(0, 0);
    //         neorv32_cpu_delay_ms(1000); // Delay 500 ms
    //     }
    //   }

    //       else if(neorv32_gpio_pin_get(2) == 1){
       

    //     int angle = 0;

    //     for (angle = 0; angle <= 360; angle += 30)
    //     {


    //         neorv32_pwm_set(0,25); // 5% -> 0°
    //         int tiempo_ms = (100 * 1000) / 765;
    //         neorv32_cpu_delay_ms(tiempo_ms); // Delay 500 ms
    //         neorv32_pwm_set(0, 0);
    //         neorv32_cpu_delay_ms(1000); // Delay 500 ms
    //     }
    //   }

    }
 
 }
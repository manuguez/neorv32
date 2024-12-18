-- #################################################################################################
-- # << NEORV32 - Example setup including the bootloader, for the iCESugar (c) Board >>            #
-- # ********************************************************************************************* #
-- # BSD 3-Clause License                                                                          #
-- #                                                                                               #
-- # Copyright (c) 2021, Stephan Nolting. All rights reserved.                                     #
-- #                                                                                               #
-- # Redistribution and use in source and binary forms, with or without modification, are          #
-- # permitted provided that the following conditions are met:                                     #
-- #                                                                                               #
-- # 1. Redistributions of source code must retain the above copyright notice, this list of        #
-- #    conditions and the following disclaimer.                                                   #
-- #                                                                                               #
-- # 2. Redistributions in binary form must reproduce the above copyright notice, this list of     #
-- #    conditions and the following disclaimer in the documentation and/or other materials        #
-- #    provided with the distribution.                                                            #
-- #                                                                                               #
-- # 3. Neither the name of the copyright holder nor the names of its contributors may be used to  #
-- #    endorse or promote products derived from this software without specific prior written      #
-- #    permission.                                                                                #
-- #                                                                                               #
-- # THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS   #
-- # OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF               #
-- # MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE    #
-- # COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,     #
-- # EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE #
-- # GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED    #
-- # AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING     #
-- # NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED  #
-- # OF THE POSSIBILITY OF SUCH DAMAGE.                                                            #
-- # ********************************************************************************************* #
-- # The NEORV32 Processor - https://github.com/stnolting/neorv32              (c) Stephan Nolting #
-- #################################################################################################

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library iCE40;
use iCE40.components.all; -- for device primitives and macros

entity neorv32_iCESugar_BoardTop_MinimalBoot is
  port (
    -- LED outputs
    iCESugarv15_LED_R : out std_logic;
    iCESugarv15_LED_G : out std_logic;
    iCESugarv15_LED_B : out std_logic;
    -- UART0
    iCESugarv15_RX : in  std_logic;
    iCESugarv15_TX : out std_logic;
    -- USB Pins (which should be statically driven if not being used)
    iCESugarv15_USB_DP    : out std_logic;
    iCESugarv15_USB_DN    : out std_logic;
    iCESugarv15_USB_DP_PU : out std_logic
  );
end entity;

architecture neorv32_iCESugar_BoardTop_MinimalBoot_rtl of neorv32_iCESugar_BoardTop_MinimalBoot is

  -- configuration --
  constant f_clock_c : natural := 18000000; -- PLL output clock frequency in Hz

  -- On-chip oscillator --
  signal hf_osc_clk : std_logic;

  -- Globals
  signal pll_rstn : std_logic;
  signal pll_clk  : std_logic;

  -- internal IO connection --
  signal con_gpio_o : std_ulogic_vector(3 downto 0);
  signal con_pwm  : std_logic_vector(2 downto 0);

begin

  -- Assign USB pins to "0" so as to disconnect iCESugar from
  -- the host system.  Otherwise it would try to talk to
  -- us over USB, which wouldn't work since we have no stack.
  iCESugarv15_USB_DP    <= '0';
  iCESugarv15_USB_DN    <= '0';
  iCESugarv15_USB_DP_PU <= '0';

  -- On-Chip HF Oscillator ------------------------------------------------------------------
  -- -------------------------------------------------------------------------------------------
  HSOSC_inst : SB_HFOSC
  generic map (
    CLKHF_DIV => "0b10" -- 12 MHz
  )
  port map (
    CLKHFPU => '1',
    CLKHFEN => '1',
    CLKHF   => hf_osc_clk
  );

  -- System PLL -----------------------------------------------------------------------------
  -- -------------------------------------------------------------------------------------------
  -- Settings generated by icepll -i 12 -o 18:
  -- F_PLLIN:      12.000 MHz (given)
  -- F_PLLOUT:     18.000 MHz (requested)
  -- F_PLLOUT:     18.000 MHz (achieved)
  -- FEEDBACK:     SIMPLE
  -- F_PFD:        12.000 MHz
  -- F_VCO:        576.000 MHz
  -- DIVR:         0 (4'b0000)
  -- DIVF:        47 (7'b0101111)
  -- DIVQ:         5 (3'b101)
  -- FILTER_RANGE: 1 (3'b001)
  Pll_inst : SB_PLL40_CORE
  generic map (
    FEEDBACK_PATH => "SIMPLE",
    DIVR          =>  x"0",
    DIVF          => 7x"2F",
    DIVQ          => 3x"5",
    FILTER_RANGE  => 3x"1"
  )
  port map (
    REFERENCECLK    => hf_osc_clk,
    PLLOUTCORE      => open,
    PLLOUTGLOBAL    => pll_clk,
    EXTFEEDBACK     => '0',
    DYNAMICDELAY    => x"00",
    LOCK            => pll_rstn,
    BYPASS          => '0',
    RESETB          => '1',
    LATCHINPUTVALUE => '0',
    SDO             => open,
    SDI             => '0',
    SCLK            => '0'
  );

  -- The core of the problem ----------------------------------------------------------------
  -- -------------------------------------------------------------------------------------------

  neorv32_inst: entity work.neorv32_ProcessorTop_MinimalBoot
  generic map (
    CLOCK_FREQUENCY => f_clock_c  -- clock frequency of clk_i in Hz
  )
  port map (
    -- Global control --
    clk_i      => std_ulogic(pll_clk),
    rstn_i     => std_ulogic(pll_rstn),

    -- GPIO --
    gpio_o     => con_gpio_o,

    -- primary UART --
    uart_txd_o => iCESugarv15_TX, -- UART0 send data
    uart_rxd_i => iCESugarv15_RX, -- UART0 receive data
    uart_rts_o => open, -- hw flow control: UART0.RX ready to receive ("RTR"), low-active, optional
    uart_cts_i => '0',  -- hw flow control: UART0.TX allowed to transmit, low-active, optional

    -- PWM (to on-board RGB LED) --
    pwm_o      => con_pwm
  );

  -- IO Connection --------------------------------------------------------------------------
  -- -------------------------------------------------------------------------------------------

  RGB_inst: SB_RGBA_DRV
  generic map (
    CURRENT_MODE => "0b1",
    RGB0_CURRENT => "0b000011",
    RGB1_CURRENT => "0b000011",
    RGB2_CURRENT => "0b000011"
  )
  port map (
    CURREN   => '1',  -- I
    RGBLEDEN => '1',  -- I
    RGB2PWM  => con_pwm(2),                   -- I - blue  - pwm channel 2
    RGB1PWM  => con_pwm(1) or con_gpio_o(0),  -- I - red   - pwm channel 1 || BOOT blink
    RGB0PWM  => con_pwm(0),                   -- I - green - pwm channel 0
    RGB2     => iCESugarv15_LED_B,  -- O - blue
    RGB1     => iCESugarv15_LED_R,  -- O - red
    RGB0     => iCESugarv15_LED_G   -- O - green
  );

end architecture;

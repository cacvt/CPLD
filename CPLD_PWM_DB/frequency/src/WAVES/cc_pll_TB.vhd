-------------------------------------------------------------------------------
--
-- Title       : 
-- Design      : frequency
-- Author      : MarekNowak
-- Company     : ALDEC
--
-------------------------------------------------------------------------------
--
-- File        : cc_pll_TB.vhd
-- Generated   : Thu Mar 10 22:48:01 2016
-- From        : C:\Users\yjhxfy\Google Drive\MMC\Hardware\Board\Code\CPLD_PWM_DB\frequency\src\WAVES\cc_pll_TB_settings.txt
-- By          : tb_generator.pl ver. ver 1.2s
--
-------------------------------------------------------------------------------
--
-- Description : main Test Bench entity
--
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
library machxo2;
use machxo2.components.all;

use IEEE.waves_interface.all;
use WORK.UUT_test_pins.all;
use WORK.waves_objects.all;
use WORK.DESIGN_DECLARATIONS.all;
use WORK.MONITOR_UTILITIES.all;
use WORK.WAVES_GENERATOR.all;

-- User can put library and packages declaration here

entity cc_pll_wb is
end cc_pll_wb;

architecture TB_ARCHITECTURE of cc_pll_wb is

	-- Component declaration of the tested unit
	component cc_pll

	port (
		CLKI : in STD_LOGIC;
		CLKOP : out STD_LOGIC;
		CLKOS2 : out STD_LOGIC);
	end component;

	-- Internal signals declarations:
	--   stimulus signals (STIM_)for the waveforms mapped into UUT inputs,
	--   observed signals (ACTUAL_) used in monitoring ACTUAL Values of UUT Outputs,
	--   bi-directional signals (BI_DIRECT_) mapped into UUT Inout ports,
	--    the BI_DIRECT_ signals are used as stimulus and also used for monitoring the UUT Inout ports
	signal STIM_CLKI : STD_LOGIC;
	signal ACTUAL_CLKOP : STD_LOGIC;
	signal ACTUAL_CLKOS2 : STD_LOGIC;


	-- WAVES signals OUTPUTing each slice of the waves port list
	signal WPL  : WAVES_PORT_LIST;
	signal TAG  : WAVES_TAG;
	signal ERR_STATUS: STD_LOGIC:='L';
	-- Signal END_SIM denotes end of test vectors file
	signal END_SIM : BOOLEAN:=FALSE;

begin

	-- Process that generates the WAVES waveform
	WAVES: WAVEFORM (WPL, TAG);


	-- Processes that convert the WPL values to 1164 Logic Values



	-- Unit Under Test port map
	UUT: cc_pll
	port map(
		 CLKI => STIM_CLKI,
		 CLKOP => ACTUAL_CLKOP,
		 CLKOS2 => ACTUAL_CLKOS2);


	-- Process denoting end of test vectors file
	NOTIFY_END_VECTORS: process (TAG)
	begin
		if TAG.len /= 0 then
			if ERR_STATUS='L' then
				report "All vectors passed.";
			elsif ERR_STATUS='1' then
				report "Errors were encountered on the output ports, differences are listed in cc_pll_report.log";
			end if;
			END_SIM <= TRUE;
			CLOSE_VECTOR;
			CLOSE_REPORT;
		end if;
	end process;

end TB_ARCHITECTURE;


configuration TESTBENCH_FOR_cc_pll of cc_pll_wb is
	for TB_ARCHITECTURE
		for UUT : cc_pll
			use entity work.cc_pll (structure);
		end for;
	end for;
end TESTBENCH_FOR_cc_pll;

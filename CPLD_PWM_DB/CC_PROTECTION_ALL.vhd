----------------------------------------------------------------------------------
-- Company:
-- Engineer: Zhiyu Shen CPES
--
-- Create Date:    21:45:11 06/30/2013
-- Design Name:
-- Module Name:    CC_CPLD_TOP
-- Project Name:
-- Target Devices: CC_CPLD_TOP
-- Tool versions:
-- Description:
-- protection and on/off reset control need commucation with DSP
-- Dependencies:
--
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity CC_PROTECTION_ALL is
    Port (
		-- Inputs --
		ERR_SET			: in	STD_LOGIC;		-- Set error state
		ERR_CLR			: in	STD_LOGIC;		-- Clear error state where there is no error
		ERR_IN			: in	STD_LOGIC;		-- Error signal input
		-- Outputs --
		ERR_FLG			: out	STD_LOGIC;		-- Latached error status
		ST_LATCH_TRIG	: out	STD_LOGIC		-- Signal to trigger latching of seperate error states when the first error happens
	);
end CC_PROTECTION_ALL;


architecture Behavioral of CC_PROTECTION_ALL is
	signal ERR_NEW			: STD_LOGIC;		-- Generate a rising edge only when a new error occurs
	signal ERR_CLR_PLS		: STD_LOGIC;		-- Generate a pulse when ERR_CLR goes high
	signal ERR_LATCH_TRIG	: STD_LOGIC;		-- Trigger signal to latch the error state
	signal ERR_LATCH		: STD_LOGIC;		-- Latched error state
begin
	ERR_NEW <= ERR_IN AND ( NOT ERR_LATCH );
	ERR_LATCH_TRIG <= ERR_NEW OR ERR_CLR_PLS;	
	ST_LATCH_TRIG <= ERR_LATCH_TRIG;
	ERR_FLG <= ERR_IN OR ERR_LATCH;

	process (ERR_SET, ERR_LATCH_TRIG) is
	begin
		if ( ERR_SET = '1') then
			ERR_LATCH <= '1';
		elsif ( rising_edge(ERR_LATCH_TRIG) ) then
			ERR_LATCH <= ERR_IN;
		end if;
	end process;
	
	process (ERR_CLR_PLS) is
	begin
		if ( ERR_CLR_PLS = '1') then
			ERR_CLR_PLS <= '0';
		elsif ( rising_edge(ERR_CLR) ) then
			ERR_CLR_PLS <= '1';
		end if;
	end process;	
end Behavioral;

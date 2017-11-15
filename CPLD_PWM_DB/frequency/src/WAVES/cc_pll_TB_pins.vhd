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
-- Description : declaration of TEST_PINS package
--
-------------------------------------------------------------------------------
--The TEST_PINS package contains declaration of enumerated type named TEST_PINS.
--This declaration contains one enumerated value for each port
-- find in test vector file:
--An order of declared values match the order of ports in test vector file.

package UUT_TEST_PINS is
type TEST_PINS is (
--The test vector file:  does not contains any test vectors for the port of the UUT: cc_pll,
--therefore the TEST_PINS type has no elements and causes compilation error.
);
end UUT_TEST_PINS;

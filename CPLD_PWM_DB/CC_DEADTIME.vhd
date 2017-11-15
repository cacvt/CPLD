----------------------------------------------------------------------------------
--            COPYRIGHT(c) 2014 Center of Power Electronics Systems
--
-- Filename:       CC_DEADTIME.vhd
-- Author:         RONGFENG YANG
-- Date:           11/06/2014
-- Module Name:    CC_PROTECTION
-- Target Devices: General
-- Description:
--   
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity CC_DEADTIME is
    Port (
		-- Inputs --
		--iHSCLK   : in STD_LOGIC;
    iCLK_4ns : in STD_LOGIC;
		iPWM			: in	STD_LOGIC;		-- 
		-- Outputs --
		oPWM_P			: out	STD_LOGIC;		-- 
		oPWM_N	: out	STD_LOGIC		-- 
	);
end CC_DEADTIME;


architecture Behavioral of CC_DEADTIME is
    signal BPWM             : STD_LOGIC;            -- Save the input PWM of previous clock
	signal BPWM_P			: STD_LOGIC;
	signal BPWM_N			: STD_LOGIC;
    signal TIME_SET_1 : INTEGER RANGE 0 TO 250:= 0; -- Deadtime upto 4*250=1000 ns
	signal TIME_SET_2 : INTEGER RANGE 0 TO 250:= 0;
begin
	BPWM <= iPWM;
	oPWM_P <= BPWM_P;
	oPWM_N <= BPWM_N;
	process (iCLK_4ns, BPWM, TIME_SET_1, TIME_SET_2) is
	begin
		if ( rising_edge(iCLK_4ns)) then	     
	     if(BPWM = '1') then
	       BPWM_N <='0';
		   TIME_SET_2 <= 0;
		   if (TIME_SET_1<100) then                --deadtime: 4ns*100=400ns
     	     TIME_SET_1 <= TIME_SET_1 + 1;
	         BPWM_P <= '0';	       
	       else
	         BPWM_P <= '1';
		   end if;
	     else
		   BPWM_P <='0';
		   TIME_SET_1 <= 0;
		   if (TIME_SET_2<100) then                --deadtime: 4ns*100=400ns
     	     TIME_SET_2 <= TIME_SET_2 + 1;
	         BPWM_N <= '0';	       
	       else
	         BPWM_N <= '1';
		   end if;
         end if;	     
	    end if;
	end process;
end Behavioral;


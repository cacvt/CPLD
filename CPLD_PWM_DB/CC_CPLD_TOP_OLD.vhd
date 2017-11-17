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
-- Modified by Jianghui
-- Modified by Chien-An, Nov 2017 for 10kW WEC project, comments DEADTIME and PLL modules
-- FO1 only, CMP 12-8 only
-- Complementary PWMs and dead-time are generated in CPLD
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;





entity CC_CPLD_TOP is

	 
	-- Signal names are defined as what appear on the schematic
    Port (
		--== DSP IOs ==--

		-- General purpose --
		IO14_D		: in	STD_LOGIC;			-- 122	PT21A
		IO15_D		: out	STD_LOGIC;			-- 120	PT23C		For SYS_AFE_SS to DSP
		--IO49_D		: inout	STD_LOGIC;			-- 113	PT25B		
		IO84_D		: out	STD_LOGIC;			-- 114	PT25A		For SYS_LLC_SS to DSP
		IO85_D		: out	STD_LOGIC;			-- 117	PT24A		For relay control to DSP
		IO86_D		: in	STD_LOGIC;			-- 115	PT24B
		IO87_D		: in	STD_LOGIC;			-- 128	PT18A
		--IO48_D		: in	STD_LOGIC;			-- 105	PR3A	| Added in MB v1.05
		-- Can be used for SPI --
		IO20_D		: inout	STD_LOGIC;			-- 71	PB30B/SI
		IO21_D		: inout	STD_LOGIC;			-- 45	PB9B/SO
		IO22_D		: in	STD_LOGIC;			-- 44	PB9A/CLK
		IO23_D		: in    STD_LOGIC;          -- 69   PB29B		-- Added in MB v1.05 replacing SPI_CS
--		SN			: in	STD_LOGIC;			-- 70	PB30A/SN -- Removed in MB v1.05 replaced by IO23_C
--		SPI_CS		: in	STD_LOGIC;			-- 69	PB29B    -- Removed in MB v1.05 replaced by IO23_D

		--== DSP PWM Interface ==--

		-- PWM signals --
		PWM1A_D		: in	STD_LOGIC;			-- 99	PR5B
		PWM1B_D		: in	STD_LOGIC;			-- 98	PR6A
		PWM2A_D		: in	STD_LOGIC;			-- 103	PR4C
		PWM2B_D		: in	STD_LOGIC;			-- 100	PR5A
		PWM3A_D		: in	STD_LOGIC;			-- 104	PR3B
		PWM3B_D		: in	STD_LOGIC;			-- 105	PR3A     --change to 106
		PWM4A_D		: in	STD_LOGIC;			-- 106	PR2B     --change to 107
		PWM4B_D		: in	STD_LOGIC;			-- 107	PR2A     --change to 109
		PWM5A_D		: in	STD_LOGIC;			-- 110	PT28C     --change to 111
		PWM5B_D		: in	STD_LOGIC;			-- 109	PT28D     --change to 110
		PWM6A_D		: in	STD_LOGIC;			-- 111	PT27B     --change to 112
		PWM6B_D		: in	STD_LOGIC;			-- 112	PT27A     --change to 113
		PWM7A_D		: in	STD_LOGIC;			-- 92	PR10A
		PWM7B_D		: in	STD_LOGIC;			-- 93	PR9B
		PWM8A_D		: in	STD_LOGIC;			-- 94	PR9A
		PWM8B_D		: in	STD_LOGIC;			-- 95	PR8B
		PWM9A_D		: in	STD_LOGIC;			-- 96	PR8A
		PWM9B_D		: in	STD_LOGIC;			-- 97	PR6B
		-- Trip zone signals --
		TZ1n		: inout	STD_LOGIC;			-- 119	PT23D
		TZ2n		: inout	STD_LOGIC;			-- 121	PT21B

		--== CPLD PWM interface ==--

		-- PWM enable --
		PWM_ENn		: out	STD_LOGIC;			-- 47	PB10A

		-- Group 1 --
		-- PWM outputs --
		PWM1A_C		: out	STD_LOGIC;			-- 15	PL10A
		PWM1B_C		: out	STD_LOGIC;			-- 17	PL10B
		PWM2A_C		: out	STD_LOGIC;			-- 19	PL10C
		PWM2B_C		: out	STD_LOGIC;			-- 20	PL10D
		PWM3A_C		: out	STD_LOGIC;			-- 21	PL13A
		PWM3B_C		: out	STD_LOGIC;			-- 22	PL13B
		-- Fault input --
		FO1			: in	STD_LOGIC;			-- 12	PL8B

		-- Group 2 --
		-- PWM outputs --
		PWM4A_C		: out	STD_LOGIC;			-- 28	PL17B
		PWM4B_C		: out	STD_LOGIC;			-- 31	PL18D
		PWM5A_C		: out	STD_LOGIC;			-- 32	PL19A
		PWM5B_C		: out	STD_LOGIC;			-- 33	PL19B
		PWM6A_C		: out	STD_LOGIC;			-- 34	PL20A
		PWM6B_C		: out	STD_LOGIC;			-- 35	PL20B
		-- Fault input --
		FO2			: in	STD_LOGIC;			-- 14	PL9B

		-- Group 3 --
		-- PWM outputs --
		PWM7A_C		: out	STD_LOGIC;			-- 63	PB24D
		PWM7B_C		: out	STD_LOGIC;			-- 65	PB27A
		PWM8A_C		: out	STD_LOGIC;			-- 67	PB27B
		PWM8B_C		: out	STD_LOGIC;			-- 68	PB29A
		PWM9A_C		: out	STD_LOGIC;			-- 73	PR19B
		PWM9B_C		: out	STD_LOGIC;			-- 74	PR19A
		-- Fault input --
		FO3			: in	STD_LOGIC;			-- 75	PR18B

		-- Group 4 --
		-- PWM outputs --
		PWM10A_C	: out	STD_LOGIC;			-- 4	PL4B
		PWM10B_C	: out	STD_LOGIC;			-- 5	PL6A
		PWM11A_C	: out	STD_LOGIC;			-- 6	PL6B
		PWM11B_C	: out	STD_LOGIC;			-- 9	PL7A
		PWM12A_C	: out	STD_LOGIC;			-- 10	PL7B
		PWM12B_C	: out	STD_LOGIC;			-- 11	PL8A
		-- Fault input --
		FO4			: in	STD_LOGIC;			-- 13	PL9A

		-- Group 5 --
		-- PWM outputs --
		PWM13A_C	: out	STD_LOGIC;			-- 38	PB3A
		PWM13B_C	: out	STD_LOGIC;			-- 39	PB3B
		PWM14A_C	: out	STD_LOGIC;			-- 40	PB4A
		PWM14B_C	: out	STD_LOGIC;			-- 41	PB4B
		PWM15A_C	: out	STD_LOGIC;			-- 42	PB7A
		PWM15B_C	: out	STD_LOGIC;			-- 43	PB7B
		-- Fault input --
		FO5			: in	STD_LOGIC;			-- 61	PB24A

		-- Group 6 --
		-- PWM outputs --
		PWM16A_C	: out	STD_LOGIC;			-- 48	PB10B
		PWM16B_C	: out	STD_LOGIC;			-- 49	PB13A
		PWM17A_C	: out	STD_LOGIC;			-- 50	PB13B
		PWM17B_C	: out	STD_LOGIC;			-- 52	PB15A
		PWM18A_C	: out	STD_LOGIC;			-- 54	PB15B
		PWM18B_C	: out	STD_LOGIC;			-- 55	PB20A
		-- Fault input --
		FO6			: in	STD_LOGIC;			-- 62	PB24B


		--== Protection Inputs ==--
		CMP_OUT1	: in	STD_LOGIC;			-- 81	PR15B
		CMP_OUT2	: in	STD_LOGIC;			-- 85	PR13B
		CMP_OUT3	: in	STD_LOGIC;			-- 91	PR10B
		CMP_OUT4	: in	STD_LOGIC;			-- 78	PR16A
		CMP_OUT5	: in	STD_LOGIC;			-- 84	PR14A
		CMP_OUT6	: in	STD_LOGIC;			-- 89	PR10C
		CMP_OUT7	: in	STD_LOGIC;			-- 77	PR16B
		CMP_OUT8	: in	STD_LOGIC;			-- 83	PR14B
		CMP_OUT9	: in	STD_LOGIC;			-- 87	PR10D
		CMP_OUT10	: in	STD_LOGIC;			-- 76	PR18A
		CMP_OUT11	: in	STD_LOGIC;			-- 82	PR15A
		CMP_OUT12	: in	STD_LOGIC;			-- 86	PR13A

		--== CPLD CLK input ==--
		CLK_C		: in	STD_LOGIC;			-- 3	PL4A
		
		--== CPLD IOs ==--

		-- Group 1 --
		IO0_C		: out	STD_LOGIC;			-- 27	PL17A
		IO1_C		: out	STD_LOGIC;			-- 26	PL16B
		IO2_C		: out	STD_LOGIC;			-- 25	PL16A
		IO3_C		: out	STD_LOGIC;			-- 24	PL14B
		IO4_C		: out	STD_LOGIC;			-- 23	PL14A
		IO5_C		: out	STD_LOGIC;			-- 2	PL3B
		-- Group 2 --
		IO6_C		: out	STD_LOGIC;			-- 1	PL3A
		IO7_C		: out	STD_LOGIC;			-- 143	PT9A
		IO8_C		: out	STD_LOGIC;			-- 141	PT10A
		IO9_C		: in 	STD_LOGIC;			-- 133	PT14A		For relay control
		IO10_C		: in	STD_LOGIC;			-- 132	PT14B		LLC EXT Switch Control
		IO11_C		: in	STD_LOGIC;			-- 138	PT11B		Vienna EXT Switch Control
		-- Group 3 --
		IO12_C		: inout	STD_LOGIC;			-- 127	PT18B
		IO13_C		: inout	STD_LOGIC;			-- 126	PT20C
		IO14_C		: inout	STD_LOGIC;			-- 125	PT20D
		IO15_C		: inout	STD_LOGIC;			-- 139	PT11A
		IO16_C		: inout	STD_LOGIC;			-- 140	PT10B
		IO17_C		: inout	STD_LOGIC;			-- 142	PT9B
		-- Group 4 --
		IO18_C		: inout	STD_LOGIC;			-- 56	PB20B
		IO19_C		: inout	STD_LOGIC;			-- 57	PB21A
		IO20_C		: inout	STD_LOGIC;			-- 58	PB21B
		IO21_C		: inout	STD_LOGIC;			-- 59	PB23A
		IO22_C		: inout	STD_LOGIC;			-- 60	PB23B
		IO23_C      : inout STD_LOGIC			-- 70   PB30A/SN	--Added in MB v1.05
	);
	
	-- Preseve all port signals from being removed, for Synplify Pro only
	attribute syn_force_pads: boolean;
	attribute syn_force_pads of CC_CPLD_TOP : entity is true;
	
end CC_CPLD_TOP;



architecture Behavioral of CC_CPLD_TOP is


   --component CC_PLL
--		Port (CLKI: in  std_logic;
 --   		CLKOP: out  std_logic
--			);
--	end component;
	
	component CC_PROTECTION is
	    Port (
			ERR_SET			: in	STD_LOGIC;
			ERR_CLR			: in	STD_LOGIC;
			ERR_IN			: in	STD_LOGIC;
			ERR_IN_V		: in	STD_LOGIC;
			ERR_FLG			: out	STD_LOGIC;
			ERR_FLG_V		: out	STD_LOGIC;
			ST_LATCH_TRIG	: out	STD_LOGIC
		);
	end component;
	

--	component CC_DEADTIME is
--		Port (
			-- Inputs --
			--iHSCLK   : in STD_LOGIC;
--		iCLK_4ns : in STD_LOGIC;
--			iPWM			: in	STD_LOGIC;		-- 
			-- Outputs --
--			oPWM_P			: out	STD_LOGIC;		-- 
--			oPWM_N	: out	STD_LOGIC		-- 
--		);
--	end component;
	
	-- Global clock signals from PLL
	--signal HSCLK	:	STD_LOGIC;
	--signal LSCLK	:	STD_LOGIC;
	signal Clk_250MHz: STD_LOGIC;
	
	--attribute syn_keep: boolean;
	--attribute syn_keep of IO15_D : variable is TRUE;
	
	-- PWM signals
	-- PWM input signals from DSP
	signal PWMA_D	: STD_LOGIC_VECTOR(9 downto 1);
	signal PWMB_D	: STD_LOGIC_VECTOR(9 downto 1);
	-- Internal generated PWM signals
	signal PWMA_C	: STD_LOGIC_VECTOR(18 downto 1);
	signal PWMB_C	: STD_LOGIC_VECTOR(18 downto 1);
	-- PWM output signal by CPLD to the pins
	signal PWMA_O	: STD_LOGIC_VECTOR(18 downto 1);
	signal PWMB_O	: STD_LOGIC_VECTOR(18 downto 1);
	signal PWM_EN_On	: STD_LOGIC;							-- PWM enable, active low
	signal SYS_RELAY_SS		: STD_LOGIC;	-- Start / Stop signal for relay, connect to a CPLD IO pin
	
	-- signlas for divided frequency : 1Khz and 1Mhz
	--signal Clk_20MHz   : STD_LOGIC;

	-- Control and indicator signals, connect to a CPLD IO group (first five pins are used)
	--signal SYS_AFE_SS		: STD_LOGIC;	-- Start / Stop signal for AFE part, connect to a CPLD IO pin
	--signal SYS_LLC_SS		: STD_LOGIC;	-- Start / Stop signal for LLC part, connect to a CPLD IO pin
	
	--signal SYS_ES			: STD_LOGIC;	-- Emergance stop or PWM enable/disable signal, connecto to a CPLD IO pin, active low
	--signal SYS_PWM_ES_UNLCK	: STD_LOGIC;	-- allow emergency stop switch to enable pwm
	--signal SYS_RST			: STD_LOGIC;	-- Manual error reset
	--signal SYS_STATUS		: STD_LOGIC;	-- System status indicator, 

	
	-- Error protection signals
	-- Input signal from other parts
	signal ERR_ANALOG		: STD_LOGIC_VECTOR(12 downto 1);	-- Error signals generated by the comparators
	signal ERR_FO			: STD_LOGIC_VECTOR(6 downto 1);		-- Error signals generated by the power modules
	signal ERR_FLG			: STD_LOGIC;
	signal ERR_FLG_V		: STD_LOGIC;
	signal ERR_SET			: STD_LOGIC;
	signal ERR_CLR			: STD_LOGIC;
	signal ERR_ALL			: STD_LOGIC;
	signal ERR_V			: STD_LOGIC;	
	signal ST_LATCH_TRIG	: STD_LOGIC;
	signal ST_LATCH_TRIG_V	: STD_LOGIC;
	signal ST_LATCH_CLR		: STD_LOGIC;

	--signal ERR_FLG			: STD_LOGIC;						-- Latched error status
	signal ERR_STATUS		: STD_LOGIC_VECTOR(19 downto 1);	-- Latched seperate error status when the first error is detected
	signal ERR_CODE			: STD_LOGIC_VECTOR(5 downto 1);
	
	-- Modified by XZ
	signal SOFT_SS			: STD_LOGIC;	--soft start/soft from DSP
	
begin    --PLL : CC_PLL port map (
	--	CLKI	=> CLK_C,
	--	CLKOP	=> Clk_250MHz
	--	);

--	 modified by QW
	--SYS_AFE_SS  <= IO11_C;	--DSPIO15 is for EXT SS Control input to DSP
	--SYS_LLC_SS	<= IO10_C;	--DSPIO10 is for EXT SS Contro of LLC to DSP
	--SYS_RELAY_SS <= IO9_C; -- DSPIO49 is for EXT CONtrol of input relay
	--SOFT_SS <= IO14_D;	--DSPIO14 is for SOFT SS Control output from DSP

--== Assign general purpose DSP IO pins ==--
	--IO15_D <= SYS_AFE_SS;	--DSPIO15 is for EXT SS Control from IO11_C to DSPIO15 EXternally connected to LED D5 SYS_AFE_SS=1:AFE system on
	--IO84_D <= SYS_LLC_SS;	--DSPIO84 is for EXT SS Control from IO10_C to DSPIO84 EXternally connected to LED D4 SYS_LLC_SS=1:LLC system on
	--IO85_D <= SYS_RELAY_SS;	--DSPIO49 is for EXT Control from IO9_C to DSPIO85 EXternally connected to LED D3 SYS_RELAY_SS=1:Relay closed
	--IO8_C <= SOFT_SS;	--DSPIO14 is for SOFT SS Control output from DSPIO14 to IO8_C LED D2 when SOFT_SS=1:system on
	ERR_SET <= '0';		--no set error for test
	ERR_CLR <= '1';		--force clear error
--	original by ZS
--== Assign general purpose CPLD IO pins ==--
--	SYS_AFE_SS  <= IO0_C;
--	SYS_ES  <= IO1_C;
--	SYS_RST <= IO2_C;
	--SYS_PWM_ES_UNLCK <= IO3_C;

	
--Original by ZS
	-- DSP outputs
--	ERR_SET <= IO84_D;
--	ERR_CLR <= IO85_D;
	-- DSP inputs
--	IO49_D <= SYS_AFE_SS;
--	PWM9A_D <= SYS_ES;
--	PWM9B_D <= SYS_RST;
--	IO5_C <= IO87_D;


--==== Error Logic ====--

	-- Assign error signals
	--   Change ploarity if necessary (internal signals are active high)
	--   Assign '1' to unused protection signals if necessary
	ERR_ANALOG(1)  <= NOT CMP_OUT1;
	ERR_ANALOG(2)  <= NOT CMP_OUT2;
	ERR_ANALOG(3)  <= NOT CMP_OUT3;
	ERR_ANALOG(4)  <= NOT CMP_OUT4;
	ERR_ANALOG(5)  <= NOT CMP_OUT5;
	ERR_ANALOG(6)  <= NOT CMP_OUT6;
	ERR_ANALOG(7)  <= NOT CMP_OUT7;
	ERR_ANALOG(8)  <= NOT CMP_OUT8;
	ERR_ANALOG(9)  <= NOT CMP_OUT9;
	ERR_ANALOG(10) <= NOT CMP_OUT10;
	ERR_ANALOG(11) <= NOT CMP_OUT11;
	ERR_ANALOG(12) <= NOT CMP_OUT12;
	ERR_FO(1)      <= FO1;
	ERR_FO(2)      <= FO2;
	ERR_FO(3)      <= FO3;
	ERR_FO(4)      <= FO4;
	ERR_FO(5)      <= FO5;
	ERR_FO(6)      <= FO6;


-- Modified by XZ
	-- Bypass Error singal for test
--	ERR_ALL	<= '0';


--	original by ZS	
	-- Combine all error signals
--	ERR_ALL <= 	ERR_ANALOG(1) OR ERR_ANALOG(2)  OR ERR_ANALOG(3)  OR ERR_ANALOG(4)  OR
--				ERR_ANALOG(5) OR ERR_ANALOG(6)  OR ERR_ANALOG(7)  OR ERR_ANALOG(8)  OR
--				ERR_ANALOG(9) OR ERR_ANALOG(10) OR ERR_ANALOG(11) OR ERR_ANALOG(12) OR
--				ERR_FO(1); 
				--    OR ERR_FO(2)      OR ERR_FO(3)      OR ERR_FO(4)      OR
				--    ERR_FO(5)     OR ERR_FO(6);
	ERR_ALL <= 	ERR_ANALOG(8)  OR ERR_ANALOG(9) OR ERR_ANALOG(10) OR ERR_ANALOG(11) OR 
				ERR_ANALOG(12) OR ERR_FO(1);
	ERR_V <= ERR_ANALOG(8)  OR ERR_ANALOG(9);

	PROTECTION : CC_PROTECTION port map (
		ERR_SET => ERR_SET,
		ERR_CLR => ERR_CLR,
		ERR_IN  => ERR_ALL,
		ERR_IN_V  => ERR_V,
		ERR_FLG => ERR_FLG,
		ERR_FLG_V => ERR_FLG_V,
		ST_LATCH_TRIG => ST_LATCH_TRIG
		);


	process ( ST_LATCH_TRIG, ERR_SET ) is
	begin
		if ( ERR_SET = '1') then
			ERR_STATUS( 19 downto 1 ) <= b"1000000000000000000";
		elsif ( rising_edge(ST_LATCH_TRIG) ) then
			ERR_STATUS(19) <= '0';
			ERR_STATUS( 18 downto 7 ) <= ERR_ANALOG ( 12 downto 1 );
			ERR_STATUS( 6 downto 1 )  <= ERR_FO ( 6 downto 1 );
		end if;
	end process;

	
--==== PWM signal delivery ====--

-- Buffer PWM inputs from DSP
	PWMA_C(1) <= PWM1A_D;
	PWMB_C(1) <= PWM1B_D;
	PWMA_C(2) <= PWM2A_D;
	PWMB_C(2) <= PWM2B_D;
	PWMA_C(3) <= PWM3A_D;
	PWMB_C(3) <= PWM3B_D;
	PWMA_C(4) <= PWM4A_D;
	PWMB_C(4) <= PWM4B_D;
	PWMA_C(5) <= PWM5A_D;
	PWMB_C(5) <= PWM5B_D;
	PWMA_C(6) <= PWM6A_D;
	PWMB_C(6) <= PWM6B_D;
	PWMA_C(7) <= PWM7A_D;
	PWMB_C(7) <= PWM7B_D;
	PWMA_C(8) <= PWM8A_D;
	PWMB_C(8) <= PWM8B_D;
	PWMA_C(9) <= PWM9A_D;
	PWMB_C(9) <= PWM9B_D;
	
-- Internal PWM logics --

-- Direct PWM signal assignment, dead time is generated by DSP --
	--PWMA_C(18 downto 10) <= b"000000000";
	--PWMB_C(18 downto 10) <= b"000000000";

--	Modified by WQ for UTAS Vienna (2013)
	--PWMA_C(1) <= PWMA_D(1);
	--PWMB_C(1) <= PWMB_D(1);
	--PWMA_C(2) <= PWMA_D(4);
	--PWMB_C(2) <= PWMB_D(4);	
	--PWMA_C(3) <= PWMA_D(8);
	--PWMB_C(3) <= PWMA_D(8);
	--PWMA_C(4) <= PWMA_D(2);
	--PWMB_C(4) <= PWMB_D(2);		
	--PWMA_C(5) <= PWMA_D(5);
	--PWMB_C(5) <= PWMB_D(5);
	--PWMA_C(6) <= PWMA_D(8);
	--PWMB_C(6) <= PWMA_D(8);	
	--PWMA_C(7) <= PWMA_D(3);
	--PWMB_C(7) <= PWMB_D(3);
	--PWMA_C(8) <= PWMA_D(6);
	--PWMB_C(8) <= PWMB_D(6);	
	--PWMA_C(9) <= PWMA_D(8);
	--PWMB_C(9) <= PWMA_D(8);

--	Modified by WQ for UTAS AFELLC2015 Sept. 11th 2015
	--PWMA_C(1) <= PWMA_D(1);
	--PWMB_C(1) <= PWMB_D(1);
	--PWMA_C(2) <= PWMA_D(2);
	--PWMB_C(2) <= PWMB_D(2);	
	--PWMA_C(3) <= PWMA_D(3);
	--PWMB_C(3) <= PWMB_D(3);
	--PWMA_C(4) <= PWMA_D(4);
	--PWMB_C(4) <= PWMB_D(4);		
	--PWMA_C(5) <= PWMA_D(5);
	--PWMB_C(5) <= PWMB_D(5);
	--PWMA_C(6) <= PWMA_D(6);
	--PWMB_C(6) <= PWMB_D(6);	
	--PWMA_C(7) <= PWMA_D(7);
	--PWMB_C(7) <= PWMB_D(7);
	--PWMA_C(8) <= PWMA_D(8);
	--PWMB_C(8) <= PWMB_D(8);	
	--PWMA_C(9) <= PWMA_D(9);
	--PWMB_C(9) <= PWMB_D(9);
	

-- Generate dead time in CPLD --

--    CPWMA1 : CC_DEADTIME port map (
--		iCLK_4ns 	=> Clk_250MHz, 
--		iPWM 	    => PWMA_D(1),
--		oPWM_P   	=> PWMA_C(1),
--		oPWM_N  	 => PWMB_C(1)
--		);
		
 --   CPWMB1 : CC_DEADTIME port map (
--		iCLK_4ns 	=> Clk_250MHz, 
--		iPWM 	    => PWMB_D(1),
--		oPWM_P   	=> PWMA_C(2),
--		oPWM_N  	 => PWMB_C(2)
--		);
	
--	CPWMA2 : CC_DEADTIME port map (
--		iCLK_4ns 	=> Clk_250MHz,  
--		iPWM 	    => PWMA_D(2),
--		oPWM_P   	=> PWMA_C(3),
--		oPWM_N  	 => PWMB_C(3)
--		);
	
--	CPWMB2 : CC_DEADTIME port map (
--		iCLK_4ns 	=> Clk_250MHz,  
--		iPWM 	    => PWMB_D(2),
--		oPWM_P   	=> PWMA_C(4),
--		oPWM_N  	 => PWMB_C(4)
--		);	
		
--	CPWMA3 : CC_DEADTIME port map (
--		iCLK_4ns 	=> Clk_250MHz, 
--		iPWM 	    => PWMA_D(3),
--		oPWM_P   	=> PWMA_C(5),
--		oPWM_N  	 => PWMB_C(5)
--		);
	
--	CPWMB3 : CC_DEADTIME port map (
--		iCLK_4ns 	=> Clk_250MHz, 
--		iPWM 	    => PWMB_D(3),
--		oPWM_P   	=> PWMA_C(6),
--		oPWM_N  	 => PWMB_C(6)
--		);		
		
--	CPWMA4 : CC_DEADTIME port map (
--		iCLK_4ns 	=> Clk_250MHz, 
--		iPWM 	    => PWMA_D(4),
--		oPWM_P   	=> PWMA_C(7),
--		oPWM_N  	 => PWMB_C(7)
--		);
	
--	CPWMB4 : CC_DEADTIME port map (
--		iCLK_4ns 	=> Clk_250MHz,  
--		iPWM 	    => PWMB_D(4),
--		oPWM_P   	=> PWMA_C(8),
--		oPWM_N  	 => PWMB_C(8)
--		);		

--	CPWMA5 : CC_DEADTIME port map (
--		iCLK_4ns 	=> Clk_250MHz, 
--		iPWM 	    => PWMA_D(5),
--		oPWM_P   	=> PWMA_C(9),
--		oPWM_N  	 => PWMB_C(9)
--		);
	
--	CPWMB5 : CC_DEADTIME port map (
--		iCLK_4ns 	=> Clk_250MHz, 
--		iPWM 	    => PWMB_D(5),
--		oPWM_P   	=> PWMA_C(10),
--		oPWM_N  	 => PWMB_C(10)
--		);		
		
--	CPWMA6 : CC_DEADTIME port map (
--		iCLK_4ns 	=> Clk_250MHz,  
--		iPWM 	    => PWMA_D(6),
--		oPWM_P   	=> PWMA_C(11),
--		oPWM_N  	 => PWMB_C(11)
--		);
	
--	CPWMB6 : CC_DEADTIME port map (
--		iCLK_4ns 	=> Clk_250MHz, 
--		iPWM 	    => PWMB_D(6),
--		oPWM_P   	=> PWMA_C(12),
--		oPWM_N  	 => PWMB_C(12)
--		);		
		
--	CPWMA7 : CC_DEADTIME port map (
--		iCLK_4ns 	=> Clk_250MHz,  
--		iPWM 	    => PWMA_D(7),
--		oPWM_P   	=> PWMA_C(13),
--		oPWM_N  	 => PWMB_C(13)
--		);
	
--	CPWMB7 : CC_DEADTIME port map (
--		iCLK_4ns 	=> Clk_250MHz,  
--		iPWM 	    => PWMB_D(7),
--		oPWM_P   	=> PWMA_C(14),
--		oPWM_N  	 => PWMB_C(14)
--		);		
		
--	CPWMA8 : CC_DEADTIME port map (
--		iCLK_4ns 	=> Clk_250MHz, 
--		iPWM 	    => PWMA_D(8),
--		oPWM_P   	=> PWMA_C(15),
--		oPWM_N  	 => PWMB_C(15)
--		);
	
--	CPWMB8 : CC_DEADTIME port map (
--		iCLK_4ns 	=> Clk_250MHz, 
--		iPWM 	    => PWMB_D(8),
--		oPWM_P   	=> PWMA_C(16),
--		oPWM_N  	 => PWMB_C(16)
--		);		
		
--	CPWMA9 : CC_DEADTIME port map (
--		iCLK_4ns 	=> Clk_250MHz,  
--		iPWM 	    => PWMA_D(9),
--		oPWM_P   	=> PWMA_C(17),
--		oPWM_N  	 => PWMB_C(17)
--		);
	
--	CPWMB9 : CC_DEADTIME port map (
--		iCLK_4ns 	=> Clk_250MHz, 
--		iPWM 	    => PWMB_D(9),
--		oPWM_P   	=> PWMA_C(18),
--		oPWM_N  	 => PWMB_C(18)
--		);

--=======Error handlling and PWM en
--	Modified by XZ

	--process (SYS_RELAY_SS,SYS_LLC_SS,SYS_AFE_SS, SOFT_SS, ERR_FLG, PWMA_C, PWMB_C) is
	--begin
	--if (SYS_RELAY_SS = '0')then
		--PWMA_O(18 downto 1) <= b"000000000000000000";
		--PWMB_O(18 downto 1) <= b"000000000000000000";
		--IO7_C <='0';
		--IO6_C <='0';
		--PWM_EN_On <= '1';
	--else
		--if (SYS_LLC_SS = '0')then		-- DIO10_C is high enable, when DIO10_C is low system stop; AFE cannot start if LLC is not started
			--PWMA_O(18 downto 1) <= b"000000000000000000";
			--PWMB_O(18 downto 1) <= b"000000000000000000";
			--PWMA_O(6) <= PWMA_C(6);		-- Allow Relay to be closed
			--IO7_C <='0';
			--IO6_C <='0';
			--PWM_EN_On <= '1';
		--else
			--if (SOFT_SS = '0') then
				--PWMA_O(18 downto 1) <= b"000000000000000000";
				--PWMB_O(18 downto 1) <= b"000000000000000000";
				--PWMA_O(4) <= PWMA_C(4);		-- Allow LLC switch signals to be outputed
				--PWMB_O(4) <= PWMB_C(4);		-- Allow LLC switch signals to be outputed
				--PWMA_O(5) <= PWMA_C(5);		-- Allow LLC switch signals to be outputed
				--PWMB_O(5) <= PWMB_C(5);		-- Allow LLC switch signals to be outputed
				--PWMA_O(6) <= PWMA_C(6);		-- Allow Relay to be closed
				--IO7_C <='0';
				--IO6_C <='0';
				--PWM_EN_On <= '1';
			--else
				--if (ERR_FLG = '1') then
					--PWMA_O(18 downto 1) <= b"000000000000000000";
					--PWMB_O(18 downto 1) <= b"000000000000000000";
					--PWM_EN_On <= '1';
					
				--else
					--if (SYS_AFE_SS = '0') then
						--PWMA_O(18 downto 1) <= b"000000000000000000";
						--PWMB_O(18 downto 1) <= b"000000000000000000";
						--PWMA_O(4) <= PWMA_C(4);		-- Allow LLC switch signals to be outputed
						--PWMB_O(4) <= PWMB_C(4);		-- Allow LLC switch signals to be outputed
						--PWMA_O(5) <= PWMA_C(5);		-- Allow LLC switch signals to be outputed
						--PWMB_O(5) <= PWMB_C(5);		-- Allow LLC switch signals to be outputed
						--PWMA_O(6) <= PWMA_C(6);		-- Allow Relay to be closed
						--IO6_C <=IO22_D;				--DSPIO22 for LLC LED indication.
						--IO7_C <=IO22_D;				--DSPIO22 for LLC LED indication.
						--PWM_EN_On <= '1';
					--else
						--PWMA_O(18 downto 1) <= PWMA_C(18 downto 1);
						--PWMB_O(18 downto 1) <= PWMB_C(18 downto 1);
						--IO7_C <=IO22_D;				--DSPIO22 for LLC LED indication.
						--IO6_C <=IO22_D;				--DSPIO22 for LLC LED indication.
						--PWM_EN_On <= '0';
					--end if;
				--end if;
			--end if;
		--end if;
	--end if;
	--end process;
		
	
--Original by ZS
-- Set output PWM signals according to error status
	process (ERR_FLG, ERR_FLG_V, PWMA_C, PWMB_C) is
	begin
		if ( ERR_FLG = '1') then
			PWMA_O(18 downto 1) <= b"000000000000000000";
			PWMB_O(18 downto 1) <= b"000000000000000000";
			PWM_EN_On <= '0';
		else
			PWMA_O(18 downto 1) <= PWMA_C(18 downto 1);
			PWMB_O(18 downto 1) <= PWMB_C(18 downto 1);
			PWM_EN_On <= '1';
		end if;
		if ( ERR_FLG_V = '1') then
			SYS_RELAY_SS <= '1';
		else 
			SYS_RELAY_SS <= '0';
		end if;
		
	end process;
			
	

--== Assign PWM related output signals to output pins == --

-- DSP trip zone signal	disabled for test only
	--TZ1n <= (not ERR_ALL) OR ERR_SET;

-- PWM enable signal	PWM_ENn=0: PWM is enabled
	--PWM_ENn <= PWM_EN_On;
	
	
-- PWM signals
	PWM1A_C  <= PWMA_O(1);
	PWM2A_C  <= PWMA_O(2);
	PWM3A_C  <= PWMA_O(3);
	PWM4A_C  <= PWMA_O(4);
	PWM5A_C  <= PWMA_O(5);
	PWM6A_C  <= PWMA_O(6);
	PWM7A_C  <= PWMA_O(7);
	PWM8A_C  <= PWMA_O(8);
	PWM9A_C  <= PWMA_O(9);
	PWM10A_C <= PWMA_O(10);
	PWM11A_C <= PWMA_O(11);
	PWM12A_C <= PWMA_O(12);
	PWM13A_C <= PWMA_O(13);
	PWM14A_C <= PWMA_O(14);
	PWM15A_C <= PWMA_O(15);
	PWM16A_C <= PWMA_O(16);
	PWM17A_C <= PWMA_O(17);
	PWM18A_C <= PWMA_O(18);
	PWM1B_C  <= PWMB_O(1);
	PWM2B_C  <= PWMB_O(2);
	PWM3B_C  <= PWMB_O(3);
	PWM4B_C  <= PWMB_O(4);
	PWM5B_C  <= PWMB_O(5);
	PWM6B_C  <= PWMB_O(6);
	PWM7B_C  <= PWMB_O(7);
	PWM8B_C  <= PWMB_O(8);
	PWM9B_C  <= PWMB_O(9);
	PWM10B_C <= PWMB_O(10);
	PWM11B_C <= PWMB_O(11);
	PWM12B_C <= PWMB_O(12);
	PWM13B_C <= PWMB_O(13);
	PWM14B_C <= PWMB_O(14);
	PWM15B_C <= PWMB_O(15);
	PWM16B_C <= PWMB_O(16);
	PWM17B_C <= PWMB_O(17);
	PWM18B_C <= PWMB_O(18);

-- Temp output of ERR_LATCH
	process (ERR_STATUS) is
	begin
		if ( ERR_STATUS(19) = '1') then
			ERR_CODE(5 downto 1) <= b"11111";
		elsif ( ERR_STATUS(18) = '1') then
			ERR_CODE(5 downto 1) <= b"10010";
		elsif ( ERR_STATUS(17) = '1') then
			ERR_CODE(5 downto 1) <= b"10001";
		elsif ( ERR_STATUS(16) = '1') then
			ERR_CODE(5 downto 1) <= b"10000";
		elsif ( ERR_STATUS(15) = '1') then
			ERR_CODE(5 downto 1) <= b"01111";
		elsif ( ERR_STATUS(14) = '1') then
			ERR_CODE(5 downto 1) <= b"01110";
		elsif ( ERR_STATUS(13) = '1') then
			ERR_CODE(5 downto 1) <= b"01101";
		elsif ( ERR_STATUS(12) = '1') then
			ERR_CODE(5 downto 1) <= b"01100";
		elsif ( ERR_STATUS(11) = '1') then
			ERR_CODE(5 downto 1) <= b"01011";
		elsif ( ERR_STATUS(10) = '1') then
			ERR_CODE(5 downto 1) <= b"01010";
		elsif ( ERR_STATUS(9) = '1') then
			ERR_CODE(5 downto 1) <= b"01001";
		elsif ( ERR_STATUS(8) = '1') then
			ERR_CODE(5 downto 1) <= b"01000";
		elsif ( ERR_STATUS(7) = '1') then
			ERR_CODE(5 downto 1) <= b"00111";
		elsif ( ERR_STATUS(6) = '1') then
			ERR_CODE(5 downto 1) <= b"00110";
		elsif ( ERR_STATUS(5) = '1') then
			ERR_CODE(5 downto 1) <= b"00101";
		elsif ( ERR_STATUS(4) = '1') then
			ERR_CODE(5 downto 1) <= b"00100";
		elsif ( ERR_STATUS(3) = '1') then
			ERR_CODE(5 downto 1) <= b"00011";
		elsif ( ERR_STATUS(2) = '1') then
			ERR_CODE(5 downto 1) <= b"00010";
		elsif ( ERR_STATUS(1) = '1') then
			ERR_CODE(5 downto 1) <= b"00001";
		else
			ERR_CODE(5 downto 1) <= b"00000";
		end if;
	end process;
	
	--IO11_C <= ERR_FLG;
	--IO10_C <= ERR_CODE(5);
	--IO9_C  <= ERR_CODE(4);
	--IO8_C  <= ERR_CODE(3);
	--IO7_C  <= ERR_CODE(2);
	--IO6_C  <= ERR_CODE(1);
	--IO6_C <= ERR_FLG;		--error indication
	--IO9_C <= PWM_EN_On;
	--IO6_C <=IO22_D;
	IO3_C <= PWM_EN_On;
	IO0_C <= SYS_RELAY_SS;
	--IO1_C <= Clk_20MHz;
	--IO1_C <= CLK_C;
	IO2_C <= IO22_D;
	IO4_C <= ERR_FLG_V;
	IO5_C <= ERR_FLG;
--	IO4_C <= PWMB_O(4);
end Behavioral;



-- VHDL netlist produced by program ldbanno, Version Diamond (64-bit) 3.6.0.83.4

-- ldbanno -n VHDL -o Common_Controller_Common_Controller_mapvho.vho -w -neg -gui -msgset C:/Users/yjhxfy/Google Drive/MMC/Hardware/Board/Code/CPLD_MB_105_Modified_Qiong/promote.xml Common_Controller_Common_Controller_map.ncd 
-- Netlist created on Sun Mar 27 13:35:12 2016
-- Netlist written on Sun Mar 27 13:35:19 2016
-- Design is for device LCMXO2-4000HC
-- Design is for package TQFP144
-- Design is for performance grade 4

-- entity lut4
  library IEEE, vital2000, MACHXO2;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use MACHXO2.COMPONENTS.ALL;

  entity lut4 is
    port (A: in Std_logic; B: in Std_logic; C: in Std_logic; D: in Std_logic; 
          Z: out Std_logic);

    ATTRIBUTE Vital_Level0 OF lut4 : ENTITY IS TRUE;

  end lut4;

  architecture Structure of lut4 is
  begin
    INST10: ROM16X1A
      generic map (initval => X"0000")
      port map (AD0=>A, AD1=>B, AD2=>C, AD3=>D, DO0=>Z);
  end Structure;

-- entity gndB
  library IEEE, vital2000, MACHXO2;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use MACHXO2.COMPONENTS.ALL;

  entity gndB is
    port (PWR0: out Std_logic);

    ATTRIBUTE Vital_Level0 OF gndB : ENTITY IS TRUE;

  end gndB;

  architecture Structure of gndB is
  begin
    INST1: VLO
      port map (Z=>PWR0);
  end Structure;

-- entity SLICE_0
  library IEEE, vital2000, MACHXO2;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use MACHXO2.COMPONENTS.ALL;

  entity SLICE_0 is
    -- miscellaneous vital GENERICs
    GENERIC (
      TimingChecksOn	: boolean := TRUE;
      XOn           	: boolean := FALSE;
      MsgOn         	: boolean := TRUE;
      InstancePath  	: string := "SLICE_0");

    port (F0: out Std_logic);

    ATTRIBUTE Vital_Level0 OF SLICE_0 : ENTITY IS TRUE;

  end SLICE_0;

  architecture Structure of SLICE_0 is
    ATTRIBUTE Vital_Level0 OF Structure : ARCHITECTURE IS TRUE;

    signal F0_out 	: std_logic := 'X';

    signal GNDI: Std_logic;
    component lut4
      port (A: in Std_logic; B: in Std_logic; C: in Std_logic; D: in Std_logic; 
            Z: out Std_logic);
    end component;
    component gndB
      port (PWR0: out Std_logic);
    end component;
  begin
    GND: lut4
      port map (A=>GNDI, B=>GNDI, C=>GNDI, D=>GNDI, Z=>F0_out);
    DRIVEGND: gndB
      port map (PWR0=>GNDI);

    --  INPUT PATH DELAYs
    WireDelay : BLOCK
    BEGIN
    END BLOCK;

    VitalBehavior : PROCESS (F0_out)


    BEGIN

    IF (TimingChecksOn) THEN

    END IF;

    F0 	<= F0_out;


    END PROCESS;

  end Structure;

-- entity xo2iobuf
  library IEEE, vital2000, MACHXO2;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use MACHXO2.COMPONENTS.ALL;

  entity xo2iobuf is
    port (I: in Std_logic; T: in Std_logic; Z: out Std_logic; 
          PAD: out Std_logic; PADI: in Std_logic);

    ATTRIBUTE Vital_Level0 OF xo2iobuf : ENTITY IS TRUE;

  end xo2iobuf;

  architecture Structure of xo2iobuf is
  begin
    INST1: IBPD
      port map (I=>PADI, O=>Z);
    INST2: OBZPD
      port map (I=>I, T=>T, O=>PAD);
  end Structure;

-- entity IO49_DB
  library IEEE, vital2000, MACHXO2;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use MACHXO2.COMPONENTS.ALL;

  entity IO49_DB is
    -- miscellaneous vital GENERICs
    GENERIC (
      TimingChecksOn	: boolean := TRUE;
      XOn           	: boolean := FALSE;
      MsgOn         	: boolean := TRUE;
      InstancePath  	: string := "IO49_DB";

      tipd_PADDO  	: VitalDelayType01 := (0 ns, 0 ns);
      tipd_IO49D  	: VitalDelayType01 := (0 ns, 0 ns);
      tpd_PADDO_IO49D	 : VitalDelayType01 := (0 ns, 0 ns);
      tperiod_IO49D 	: VitalDelayType := 0 ns;
      tpw_IO49D_posedge	: VitalDelayType := 0 ns;
      tpw_IO49D_negedge	: VitalDelayType := 0 ns);

    port (PADDO: in Std_logic; IO49D: inout Std_logic);

    ATTRIBUTE Vital_Level0 OF IO49_DB : ENTITY IS TRUE;

  end IO49_DB;

  architecture Structure of IO49_DB is
    ATTRIBUTE Vital_Level0 OF Structure : ARCHITECTURE IS TRUE;

    signal PADDO_ipd 	: std_logic := 'X';
    signal IO49D_ipd 	: std_logic := 'X';
    signal IO49D_out 	: std_logic := 'Z';

    signal GNDI: Std_logic;
    component gndB
      port (PWR0: out Std_logic);
    end component;
    component xo2iobuf
      port (I: in Std_logic; T: in Std_logic; Z: out Std_logic; 
            PAD: out Std_logic; PADI: in Std_logic);
    end component;
  begin
    IO49_D_pad: xo2iobuf
      port map (I=>PADDO_ipd, T=>GNDI, Z=>open, PAD=>IO49D_out, 
                PADI=>IO49D_ipd);
    DRIVEGND: gndB
      port map (PWR0=>GNDI);

    --  INPUT PATH DELAYs
    WireDelay : BLOCK
    BEGIN
      VitalWireDelay(PADDO_ipd, PADDO, tipd_PADDO);
      VitalWireDelay(IO49D_ipd, IO49D, tipd_IO49D);
    END BLOCK;

    VitalBehavior : PROCESS (PADDO_ipd, IO49D_ipd, IO49D_out)
    VARIABLE IO49D_zd         	: std_logic := 'X';
    VARIABLE IO49D_GlitchData 	: VitalGlitchDataType;

    VARIABLE tviol_IO49D_IO49D          	: x01 := '0';
    VARIABLE periodcheckinfo_IO49D	: VitalPeriodDataType;

    BEGIN

    IF (TimingChecksOn) THEN
      VitalPeriodPulseCheck (
        TestSignal => IO49D_ipd,
        TestSignalName => "IO49D",
        Period => tperiod_IO49D,
        PulseWidthHigh => tpw_IO49D_posedge,
        PulseWidthLow => tpw_IO49D_negedge,
        PeriodData => periodcheckinfo_IO49D,
        Violation => tviol_IO49D_IO49D,
        MsgOn => MsgOn, XOn => XOn,
        HeaderMsg => InstancePath,
        CheckEnabled => TRUE,
        MsgSeverity => warning);

    END IF;

    IO49D_zd 	:= IO49D_out;

    VitalPathDelay01 (
      OutSignal => IO49D, OutSignalName => "IO49D", OutTemp => IO49D_zd,
      Paths      => (0 => (InputChangeTime => PADDO_ipd'last_event,
                           PathDelay => tpd_PADDO_IO49D,
                           PathCondition => TRUE)),
      GlitchData => IO49D_GlitchData,
      Mode       => vitaltransport, XOn => XOn, MsgOn => MsgOn);

    END PROCESS;

  end Structure;

-- entity xo2iobuf0001
  library IEEE, vital2000, MACHXO2;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use MACHXO2.COMPONENTS.ALL;

  entity xo2iobuf0001 is
    port (I: in Std_logic; T: in Std_logic; PAD: out Std_logic);

    ATTRIBUTE Vital_Level0 OF xo2iobuf0001 : ENTITY IS TRUE;

  end xo2iobuf0001;

  architecture Structure of xo2iobuf0001 is
  begin
    INST5: OBZPD
      port map (I=>I, T=>T, O=>PAD);
  end Structure;

-- entity vcc
  library IEEE, vital2000, MACHXO2;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use MACHXO2.COMPONENTS.ALL;

  entity vcc is
    port (PWR1: out Std_logic);

    ATTRIBUTE Vital_Level0 OF vcc : ENTITY IS TRUE;

  end vcc;

  architecture Structure of vcc is
  begin
    INST1: VHI
      port map (Z=>PWR1);
  end Structure;

-- entity PWM10A_CB
  library IEEE, vital2000, MACHXO2;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use MACHXO2.COMPONENTS.ALL;

  entity PWM10A_CB is
    -- miscellaneous vital GENERICs
    GENERIC (
      TimingChecksOn	: boolean := TRUE;
      XOn           	: boolean := FALSE;
      MsgOn         	: boolean := TRUE;
      InstancePath  	: string := "PWM10A_CB";

      tipd_PADDO  	: VitalDelayType01 := (0 ns, 0 ns);
      tpd_PADDO_PWM10AC	 : VitalDelayType01 := (0 ns, 0 ns));

    port (PADDO: in Std_logic; PWM10AC: out Std_logic);

    ATTRIBUTE Vital_Level0 OF PWM10A_CB : ENTITY IS TRUE;

  end PWM10A_CB;

  architecture Structure of PWM10A_CB is
    ATTRIBUTE Vital_Level0 OF Structure : ARCHITECTURE IS TRUE;

    signal PADDO_ipd 	: std_logic := 'X';
    signal PWM10AC_out 	: std_logic := 'X';

    signal VCCI: Std_logic;
    component xo2iobuf0001
      port (I: in Std_logic; T: in Std_logic; PAD: out Std_logic);
    end component;
    component vcc
      port (PWR1: out Std_logic);
    end component;
  begin
    PWM10A_C_pad: xo2iobuf0001
      port map (I=>PADDO_ipd, T=>VCCI, PAD=>PWM10AC_out);
    DRIVEVCC: vcc
      port map (PWR1=>VCCI);

    --  INPUT PATH DELAYs
    WireDelay : BLOCK
    BEGIN
      VitalWireDelay(PADDO_ipd, PADDO, tipd_PADDO);
    END BLOCK;

    VitalBehavior : PROCESS (PADDO_ipd, PWM10AC_out)
    VARIABLE PWM10AC_zd         	: std_logic := 'X';
    VARIABLE PWM10AC_GlitchData 	: VitalGlitchDataType;


    BEGIN

    IF (TimingChecksOn) THEN

    END IF;

    PWM10AC_zd 	:= PWM10AC_out;

    VitalPathDelay01 (
      OutSignal => PWM10AC, OutSignalName => "PWM10AC", OutTemp => PWM10AC_zd,
      Paths      => (0 => (InputChangeTime => PADDO_ipd'last_event,
                           PathDelay => tpd_PADDO_PWM10AC,
                           PathCondition => TRUE)),
      GlitchData => PWM10AC_GlitchData,
      Mode       => vitaltransport, XOn => XOn, MsgOn => MsgOn);

    END PROCESS;

  end Structure;

-- entity xo2iobuf0002
  library IEEE, vital2000, MACHXO2;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use MACHXO2.COMPONENTS.ALL;

  entity xo2iobuf0002 is
    port (I: in Std_logic; T: in Std_logic; PAD: out Std_logic);

    ATTRIBUTE Vital_Level0 OF xo2iobuf0002 : ENTITY IS TRUE;

  end xo2iobuf0002;

  architecture Structure of xo2iobuf0002 is
  begin
    INST5: OBZPD
      port map (I=>I, T=>T, O=>PAD);
  end Structure;

-- entity IO15_DB
  library IEEE, vital2000, MACHXO2;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use MACHXO2.COMPONENTS.ALL;

  entity IO15_DB is
    -- miscellaneous vital GENERICs
    GENERIC (
      TimingChecksOn	: boolean := TRUE;
      XOn           	: boolean := FALSE;
      MsgOn         	: boolean := TRUE;
      InstancePath  	: string := "IO15_DB";

      tipd_PADDO  	: VitalDelayType01 := (0 ns, 0 ns);
      tpd_PADDO_IO15D	 : VitalDelayType01 := (0 ns, 0 ns));

    port (PADDO: in Std_logic; IO15D: out Std_logic);

    ATTRIBUTE Vital_Level0 OF IO15_DB : ENTITY IS TRUE;

  end IO15_DB;

  architecture Structure of IO15_DB is
    ATTRIBUTE Vital_Level0 OF Structure : ARCHITECTURE IS TRUE;

    signal PADDO_ipd 	: std_logic := 'X';
    signal IO15D_out 	: std_logic := 'X';

    signal GNDI: Std_logic;
    component gndB
      port (PWR0: out Std_logic);
    end component;
    component xo2iobuf0002
      port (I: in Std_logic; T: in Std_logic; PAD: out Std_logic);
    end component;
  begin
    IO15_D_pad: xo2iobuf0002
      port map (I=>PADDO_ipd, T=>GNDI, PAD=>IO15D_out);
    DRIVEGND: gndB
      port map (PWR0=>GNDI);

    --  INPUT PATH DELAYs
    WireDelay : BLOCK
    BEGIN
      VitalWireDelay(PADDO_ipd, PADDO, tipd_PADDO);
    END BLOCK;

    VitalBehavior : PROCESS (PADDO_ipd, IO15D_out)
    VARIABLE IO15D_zd         	: std_logic := 'X';
    VARIABLE IO15D_GlitchData 	: VitalGlitchDataType;


    BEGIN

    IF (TimingChecksOn) THEN

    END IF;

    IO15D_zd 	:= IO15D_out;

    VitalPathDelay01 (
      OutSignal => IO15D, OutSignalName => "IO15D", OutTemp => IO15D_zd,
      Paths      => (0 => (InputChangeTime => PADDO_ipd'last_event,
                           PathDelay => tpd_PADDO_IO15D,
                           PathCondition => TRUE)),
      GlitchData => IO15D_GlitchData,
      Mode       => vitaltransport, XOn => XOn, MsgOn => MsgOn);

    END PROCESS;

  end Structure;

-- entity xo2iobuf0003
  library IEEE, vital2000, MACHXO2;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use MACHXO2.COMPONENTS.ALL;

  entity xo2iobuf0003 is
    port (Z: out Std_logic; PAD: in Std_logic);

    ATTRIBUTE Vital_Level0 OF xo2iobuf0003 : ENTITY IS TRUE;

  end xo2iobuf0003;

  architecture Structure of xo2iobuf0003 is
  begin
    INST1: IBPD
      port map (I=>PAD, O=>Z);
  end Structure;

-- entity IO14_DB
  library IEEE, vital2000, MACHXO2;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use MACHXO2.COMPONENTS.ALL;

  entity IO14_DB is
    -- miscellaneous vital GENERICs
    GENERIC (
      TimingChecksOn	: boolean := TRUE;
      XOn           	: boolean := FALSE;
      MsgOn         	: boolean := TRUE;
      InstancePath  	: string := "IO14_DB";

      tipd_IO14D  	: VitalDelayType01 := (0 ns, 0 ns);
      tpd_IO14D_PADDI	 : VitalDelayType01 := (0 ns, 0 ns);
      tperiod_IO14D 	: VitalDelayType := 0 ns;
      tpw_IO14D_posedge	: VitalDelayType := 0 ns;
      tpw_IO14D_negedge	: VitalDelayType := 0 ns);

    port (PADDI: out Std_logic; IO14D: in Std_logic);

    ATTRIBUTE Vital_Level0 OF IO14_DB : ENTITY IS TRUE;

  end IO14_DB;

  architecture Structure of IO14_DB is
    ATTRIBUTE Vital_Level0 OF Structure : ARCHITECTURE IS TRUE;

    signal PADDI_out 	: std_logic := 'X';
    signal IO14D_ipd 	: std_logic := 'X';

    component xo2iobuf0003
      port (Z: out Std_logic; PAD: in Std_logic);
    end component;
  begin
    IO14_D_pad: xo2iobuf0003
      port map (Z=>PADDI_out, PAD=>IO14D_ipd);

    --  INPUT PATH DELAYs
    WireDelay : BLOCK
    BEGIN
      VitalWireDelay(IO14D_ipd, IO14D, tipd_IO14D);
    END BLOCK;

    VitalBehavior : PROCESS (PADDI_out, IO14D_ipd)
    VARIABLE PADDI_zd         	: std_logic := 'X';
    VARIABLE PADDI_GlitchData 	: VitalGlitchDataType;

    VARIABLE tviol_IO14D_IO14D          	: x01 := '0';
    VARIABLE periodcheckinfo_IO14D	: VitalPeriodDataType;

    BEGIN

    IF (TimingChecksOn) THEN
      VitalPeriodPulseCheck (
        TestSignal => IO14D_ipd,
        TestSignalName => "IO14D",
        Period => tperiod_IO14D,
        PulseWidthHigh => tpw_IO14D_posedge,
        PulseWidthLow => tpw_IO14D_negedge,
        PeriodData => periodcheckinfo_IO14D,
        Violation => tviol_IO14D_IO14D,
        MsgOn => MsgOn, XOn => XOn,
        HeaderMsg => InstancePath,
        CheckEnabled => TRUE,
        MsgSeverity => warning);

    END IF;

    PADDI_zd 	:= PADDI_out;

    VitalPathDelay01 (
      OutSignal => PADDI, OutSignalName => "PADDI", OutTemp => PADDI_zd,
      Paths      => (0 => (InputChangeTime => IO14D_ipd'last_event,
                           PathDelay => tpd_IO14D_PADDI,
                           PathCondition => TRUE)),
      GlitchData => PADDI_GlitchData,
      Mode       => vitaltransport, XOn => XOn, MsgOn => MsgOn);

    END PROCESS;

  end Structure;

-- entity IO23_CB
  library IEEE, vital2000, MACHXO2;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use MACHXO2.COMPONENTS.ALL;

  entity IO23_CB is
    -- miscellaneous vital GENERICs
    GENERIC (
      TimingChecksOn	: boolean := TRUE;
      XOn           	: boolean := FALSE;
      MsgOn         	: boolean := TRUE;
      InstancePath  	: string := "IO23_CB";

      tipd_PADDO  	: VitalDelayType01 := (0 ns, 0 ns);
      tipd_IO23C  	: VitalDelayType01 := (0 ns, 0 ns);
      tpd_PADDO_IO23C	 : VitalDelayType01 := (0 ns, 0 ns);
      tperiod_IO23C 	: VitalDelayType := 0 ns;
      tpw_IO23C_posedge	: VitalDelayType := 0 ns;
      tpw_IO23C_negedge	: VitalDelayType := 0 ns);

    port (PADDO: in Std_logic; IO23C: inout Std_logic);

    ATTRIBUTE Vital_Level0 OF IO23_CB : ENTITY IS TRUE;

  end IO23_CB;

  architecture Structure of IO23_CB is
    ATTRIBUTE Vital_Level0 OF Structure : ARCHITECTURE IS TRUE;

    signal PADDO_ipd 	: std_logic := 'X';
    signal IO23C_ipd 	: std_logic := 'X';
    signal IO23C_out 	: std_logic := 'Z';

    signal GNDI: Std_logic;
    component gndB
      port (PWR0: out Std_logic);
    end component;
    component xo2iobuf
      port (I: in Std_logic; T: in Std_logic; Z: out Std_logic; 
            PAD: out Std_logic; PADI: in Std_logic);
    end component;
  begin
    IO23_C_pad: xo2iobuf
      port map (I=>PADDO_ipd, T=>GNDI, Z=>open, PAD=>IO23C_out, 
                PADI=>IO23C_ipd);
    DRIVEGND: gndB
      port map (PWR0=>GNDI);

    --  INPUT PATH DELAYs
    WireDelay : BLOCK
    BEGIN
      VitalWireDelay(PADDO_ipd, PADDO, tipd_PADDO);
      VitalWireDelay(IO23C_ipd, IO23C, tipd_IO23C);
    END BLOCK;

    VitalBehavior : PROCESS (PADDO_ipd, IO23C_ipd, IO23C_out)
    VARIABLE IO23C_zd         	: std_logic := 'X';
    VARIABLE IO23C_GlitchData 	: VitalGlitchDataType;

    VARIABLE tviol_IO23C_IO23C          	: x01 := '0';
    VARIABLE periodcheckinfo_IO23C	: VitalPeriodDataType;

    BEGIN

    IF (TimingChecksOn) THEN
      VitalPeriodPulseCheck (
        TestSignal => IO23C_ipd,
        TestSignalName => "IO23C",
        Period => tperiod_IO23C,
        PulseWidthHigh => tpw_IO23C_posedge,
        PulseWidthLow => tpw_IO23C_negedge,
        PeriodData => periodcheckinfo_IO23C,
        Violation => tviol_IO23C_IO23C,
        MsgOn => MsgOn, XOn => XOn,
        HeaderMsg => InstancePath,
        CheckEnabled => TRUE,
        MsgSeverity => warning);

    END IF;

    IO23C_zd 	:= IO23C_out;

    VitalPathDelay01 (
      OutSignal => IO23C, OutSignalName => "IO23C", OutTemp => IO23C_zd,
      Paths      => (0 => (InputChangeTime => PADDO_ipd'last_event,
                           PathDelay => tpd_PADDO_IO23C,
                           PathCondition => TRUE)),
      GlitchData => IO23C_GlitchData,
      Mode       => vitaltransport, XOn => XOn, MsgOn => MsgOn);

    END PROCESS;

  end Structure;

-- entity IO22_CB
  library IEEE, vital2000, MACHXO2;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use MACHXO2.COMPONENTS.ALL;

  entity IO22_CB is
    -- miscellaneous vital GENERICs
    GENERIC (
      TimingChecksOn	: boolean := TRUE;
      XOn           	: boolean := FALSE;
      MsgOn         	: boolean := TRUE;
      InstancePath  	: string := "IO22_CB";

      tipd_PADDO  	: VitalDelayType01 := (0 ns, 0 ns);
      tipd_IO22C  	: VitalDelayType01 := (0 ns, 0 ns);
      tpd_PADDO_IO22C	 : VitalDelayType01 := (0 ns, 0 ns);
      tperiod_IO22C 	: VitalDelayType := 0 ns;
      tpw_IO22C_posedge	: VitalDelayType := 0 ns;
      tpw_IO22C_negedge	: VitalDelayType := 0 ns);

    port (PADDO: in Std_logic; IO22C: inout Std_logic);

    ATTRIBUTE Vital_Level0 OF IO22_CB : ENTITY IS TRUE;

  end IO22_CB;

  architecture Structure of IO22_CB is
    ATTRIBUTE Vital_Level0 OF Structure : ARCHITECTURE IS TRUE;

    signal PADDO_ipd 	: std_logic := 'X';
    signal IO22C_ipd 	: std_logic := 'X';
    signal IO22C_out 	: std_logic := 'Z';

    signal GNDI: Std_logic;
    component gndB
      port (PWR0: out Std_logic);
    end component;
    component xo2iobuf
      port (I: in Std_logic; T: in Std_logic; Z: out Std_logic; 
            PAD: out Std_logic; PADI: in Std_logic);
    end component;
  begin
    IO22_C_pad: xo2iobuf
      port map (I=>PADDO_ipd, T=>GNDI, Z=>open, PAD=>IO22C_out, 
                PADI=>IO22C_ipd);
    DRIVEGND: gndB
      port map (PWR0=>GNDI);

    --  INPUT PATH DELAYs
    WireDelay : BLOCK
    BEGIN
      VitalWireDelay(PADDO_ipd, PADDO, tipd_PADDO);
      VitalWireDelay(IO22C_ipd, IO22C, tipd_IO22C);
    END BLOCK;

    VitalBehavior : PROCESS (PADDO_ipd, IO22C_ipd, IO22C_out)
    VARIABLE IO22C_zd         	: std_logic := 'X';
    VARIABLE IO22C_GlitchData 	: VitalGlitchDataType;

    VARIABLE tviol_IO22C_IO22C          	: x01 := '0';
    VARIABLE periodcheckinfo_IO22C	: VitalPeriodDataType;

    BEGIN

    IF (TimingChecksOn) THEN
      VitalPeriodPulseCheck (
        TestSignal => IO22C_ipd,
        TestSignalName => "IO22C",
        Period => tperiod_IO22C,
        PulseWidthHigh => tpw_IO22C_posedge,
        PulseWidthLow => tpw_IO22C_negedge,
        PeriodData => periodcheckinfo_IO22C,
        Violation => tviol_IO22C_IO22C,
        MsgOn => MsgOn, XOn => XOn,
        HeaderMsg => InstancePath,
        CheckEnabled => TRUE,
        MsgSeverity => warning);

    END IF;

    IO22C_zd 	:= IO22C_out;

    VitalPathDelay01 (
      OutSignal => IO22C, OutSignalName => "IO22C", OutTemp => IO22C_zd,
      Paths      => (0 => (InputChangeTime => PADDO_ipd'last_event,
                           PathDelay => tpd_PADDO_IO22C,
                           PathCondition => TRUE)),
      GlitchData => IO22C_GlitchData,
      Mode       => vitaltransport, XOn => XOn, MsgOn => MsgOn);

    END PROCESS;

  end Structure;

-- entity IO21_CB
  library IEEE, vital2000, MACHXO2;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use MACHXO2.COMPONENTS.ALL;

  entity IO21_CB is
    -- miscellaneous vital GENERICs
    GENERIC (
      TimingChecksOn	: boolean := TRUE;
      XOn           	: boolean := FALSE;
      MsgOn         	: boolean := TRUE;
      InstancePath  	: string := "IO21_CB";

      tipd_PADDO  	: VitalDelayType01 := (0 ns, 0 ns);
      tipd_IO21C  	: VitalDelayType01 := (0 ns, 0 ns);
      tpd_PADDO_IO21C	 : VitalDelayType01 := (0 ns, 0 ns);
      tperiod_IO21C 	: VitalDelayType := 0 ns;
      tpw_IO21C_posedge	: VitalDelayType := 0 ns;
      tpw_IO21C_negedge	: VitalDelayType := 0 ns);

    port (PADDO: in Std_logic; IO21C: inout Std_logic);

    ATTRIBUTE Vital_Level0 OF IO21_CB : ENTITY IS TRUE;

  end IO21_CB;

  architecture Structure of IO21_CB is
    ATTRIBUTE Vital_Level0 OF Structure : ARCHITECTURE IS TRUE;

    signal PADDO_ipd 	: std_logic := 'X';
    signal IO21C_ipd 	: std_logic := 'X';
    signal IO21C_out 	: std_logic := 'Z';

    signal GNDI: Std_logic;
    component gndB
      port (PWR0: out Std_logic);
    end component;
    component xo2iobuf
      port (I: in Std_logic; T: in Std_logic; Z: out Std_logic; 
            PAD: out Std_logic; PADI: in Std_logic);
    end component;
  begin
    IO21_C_pad: xo2iobuf
      port map (I=>PADDO_ipd, T=>GNDI, Z=>open, PAD=>IO21C_out, 
                PADI=>IO21C_ipd);
    DRIVEGND: gndB
      port map (PWR0=>GNDI);

    --  INPUT PATH DELAYs
    WireDelay : BLOCK
    BEGIN
      VitalWireDelay(PADDO_ipd, PADDO, tipd_PADDO);
      VitalWireDelay(IO21C_ipd, IO21C, tipd_IO21C);
    END BLOCK;

    VitalBehavior : PROCESS (PADDO_ipd, IO21C_ipd, IO21C_out)
    VARIABLE IO21C_zd         	: std_logic := 'X';
    VARIABLE IO21C_GlitchData 	: VitalGlitchDataType;

    VARIABLE tviol_IO21C_IO21C          	: x01 := '0';
    VARIABLE periodcheckinfo_IO21C	: VitalPeriodDataType;

    BEGIN

    IF (TimingChecksOn) THEN
      VitalPeriodPulseCheck (
        TestSignal => IO21C_ipd,
        TestSignalName => "IO21C",
        Period => tperiod_IO21C,
        PulseWidthHigh => tpw_IO21C_posedge,
        PulseWidthLow => tpw_IO21C_negedge,
        PeriodData => periodcheckinfo_IO21C,
        Violation => tviol_IO21C_IO21C,
        MsgOn => MsgOn, XOn => XOn,
        HeaderMsg => InstancePath,
        CheckEnabled => TRUE,
        MsgSeverity => warning);

    END IF;

    IO21C_zd 	:= IO21C_out;

    VitalPathDelay01 (
      OutSignal => IO21C, OutSignalName => "IO21C", OutTemp => IO21C_zd,
      Paths      => (0 => (InputChangeTime => PADDO_ipd'last_event,
                           PathDelay => tpd_PADDO_IO21C,
                           PathCondition => TRUE)),
      GlitchData => IO21C_GlitchData,
      Mode       => vitaltransport, XOn => XOn, MsgOn => MsgOn);

    END PROCESS;

  end Structure;

-- entity IO20_CB
  library IEEE, vital2000, MACHXO2;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use MACHXO2.COMPONENTS.ALL;

  entity IO20_CB is
    -- miscellaneous vital GENERICs
    GENERIC (
      TimingChecksOn	: boolean := TRUE;
      XOn           	: boolean := FALSE;
      MsgOn         	: boolean := TRUE;
      InstancePath  	: string := "IO20_CB";

      tipd_PADDO  	: VitalDelayType01 := (0 ns, 0 ns);
      tipd_IO20C  	: VitalDelayType01 := (0 ns, 0 ns);
      tpd_PADDO_IO20C	 : VitalDelayType01 := (0 ns, 0 ns);
      tperiod_IO20C 	: VitalDelayType := 0 ns;
      tpw_IO20C_posedge	: VitalDelayType := 0 ns;
      tpw_IO20C_negedge	: VitalDelayType := 0 ns);

    port (PADDO: in Std_logic; IO20C: inout Std_logic);

    ATTRIBUTE Vital_Level0 OF IO20_CB : ENTITY IS TRUE;

  end IO20_CB;

  architecture Structure of IO20_CB is
    ATTRIBUTE Vital_Level0 OF Structure : ARCHITECTURE IS TRUE;

    signal PADDO_ipd 	: std_logic := 'X';
    signal IO20C_ipd 	: std_logic := 'X';
    signal IO20C_out 	: std_logic := 'Z';

    signal GNDI: Std_logic;
    component gndB
      port (PWR0: out Std_logic);
    end component;
    component xo2iobuf
      port (I: in Std_logic; T: in Std_logic; Z: out Std_logic; 
            PAD: out Std_logic; PADI: in Std_logic);
    end component;
  begin
    IO20_C_pad: xo2iobuf
      port map (I=>PADDO_ipd, T=>GNDI, Z=>open, PAD=>IO20C_out, 
                PADI=>IO20C_ipd);
    DRIVEGND: gndB
      port map (PWR0=>GNDI);

    --  INPUT PATH DELAYs
    WireDelay : BLOCK
    BEGIN
      VitalWireDelay(PADDO_ipd, PADDO, tipd_PADDO);
      VitalWireDelay(IO20C_ipd, IO20C, tipd_IO20C);
    END BLOCK;

    VitalBehavior : PROCESS (PADDO_ipd, IO20C_ipd, IO20C_out)
    VARIABLE IO20C_zd         	: std_logic := 'X';
    VARIABLE IO20C_GlitchData 	: VitalGlitchDataType;

    VARIABLE tviol_IO20C_IO20C          	: x01 := '0';
    VARIABLE periodcheckinfo_IO20C	: VitalPeriodDataType;

    BEGIN

    IF (TimingChecksOn) THEN
      VitalPeriodPulseCheck (
        TestSignal => IO20C_ipd,
        TestSignalName => "IO20C",
        Period => tperiod_IO20C,
        PulseWidthHigh => tpw_IO20C_posedge,
        PulseWidthLow => tpw_IO20C_negedge,
        PeriodData => periodcheckinfo_IO20C,
        Violation => tviol_IO20C_IO20C,
        MsgOn => MsgOn, XOn => XOn,
        HeaderMsg => InstancePath,
        CheckEnabled => TRUE,
        MsgSeverity => warning);

    END IF;

    IO20C_zd 	:= IO20C_out;

    VitalPathDelay01 (
      OutSignal => IO20C, OutSignalName => "IO20C", OutTemp => IO20C_zd,
      Paths      => (0 => (InputChangeTime => PADDO_ipd'last_event,
                           PathDelay => tpd_PADDO_IO20C,
                           PathCondition => TRUE)),
      GlitchData => IO20C_GlitchData,
      Mode       => vitaltransport, XOn => XOn, MsgOn => MsgOn);

    END PROCESS;

  end Structure;

-- entity IO19_CB
  library IEEE, vital2000, MACHXO2;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use MACHXO2.COMPONENTS.ALL;

  entity IO19_CB is
    -- miscellaneous vital GENERICs
    GENERIC (
      TimingChecksOn	: boolean := TRUE;
      XOn           	: boolean := FALSE;
      MsgOn         	: boolean := TRUE;
      InstancePath  	: string := "IO19_CB";

      tipd_PADDO  	: VitalDelayType01 := (0 ns, 0 ns);
      tipd_IO19C  	: VitalDelayType01 := (0 ns, 0 ns);
      tpd_PADDO_IO19C	 : VitalDelayType01 := (0 ns, 0 ns);
      tperiod_IO19C 	: VitalDelayType := 0 ns;
      tpw_IO19C_posedge	: VitalDelayType := 0 ns;
      tpw_IO19C_negedge	: VitalDelayType := 0 ns);

    port (PADDO: in Std_logic; IO19C: inout Std_logic);

    ATTRIBUTE Vital_Level0 OF IO19_CB : ENTITY IS TRUE;

  end IO19_CB;

  architecture Structure of IO19_CB is
    ATTRIBUTE Vital_Level0 OF Structure : ARCHITECTURE IS TRUE;

    signal PADDO_ipd 	: std_logic := 'X';
    signal IO19C_ipd 	: std_logic := 'X';
    signal IO19C_out 	: std_logic := 'Z';

    signal GNDI: Std_logic;
    component gndB
      port (PWR0: out Std_logic);
    end component;
    component xo2iobuf
      port (I: in Std_logic; T: in Std_logic; Z: out Std_logic; 
            PAD: out Std_logic; PADI: in Std_logic);
    end component;
  begin
    IO19_C_pad: xo2iobuf
      port map (I=>PADDO_ipd, T=>GNDI, Z=>open, PAD=>IO19C_out, 
                PADI=>IO19C_ipd);
    DRIVEGND: gndB
      port map (PWR0=>GNDI);

    --  INPUT PATH DELAYs
    WireDelay : BLOCK
    BEGIN
      VitalWireDelay(PADDO_ipd, PADDO, tipd_PADDO);
      VitalWireDelay(IO19C_ipd, IO19C, tipd_IO19C);
    END BLOCK;

    VitalBehavior : PROCESS (PADDO_ipd, IO19C_ipd, IO19C_out)
    VARIABLE IO19C_zd         	: std_logic := 'X';
    VARIABLE IO19C_GlitchData 	: VitalGlitchDataType;

    VARIABLE tviol_IO19C_IO19C          	: x01 := '0';
    VARIABLE periodcheckinfo_IO19C	: VitalPeriodDataType;

    BEGIN

    IF (TimingChecksOn) THEN
      VitalPeriodPulseCheck (
        TestSignal => IO19C_ipd,
        TestSignalName => "IO19C",
        Period => tperiod_IO19C,
        PulseWidthHigh => tpw_IO19C_posedge,
        PulseWidthLow => tpw_IO19C_negedge,
        PeriodData => periodcheckinfo_IO19C,
        Violation => tviol_IO19C_IO19C,
        MsgOn => MsgOn, XOn => XOn,
        HeaderMsg => InstancePath,
        CheckEnabled => TRUE,
        MsgSeverity => warning);

    END IF;

    IO19C_zd 	:= IO19C_out;

    VitalPathDelay01 (
      OutSignal => IO19C, OutSignalName => "IO19C", OutTemp => IO19C_zd,
      Paths      => (0 => (InputChangeTime => PADDO_ipd'last_event,
                           PathDelay => tpd_PADDO_IO19C,
                           PathCondition => TRUE)),
      GlitchData => IO19C_GlitchData,
      Mode       => vitaltransport, XOn => XOn, MsgOn => MsgOn);

    END PROCESS;

  end Structure;

-- entity IO18_CB
  library IEEE, vital2000, MACHXO2;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use MACHXO2.COMPONENTS.ALL;

  entity IO18_CB is
    -- miscellaneous vital GENERICs
    GENERIC (
      TimingChecksOn	: boolean := TRUE;
      XOn           	: boolean := FALSE;
      MsgOn         	: boolean := TRUE;
      InstancePath  	: string := "IO18_CB";

      tipd_PADDO  	: VitalDelayType01 := (0 ns, 0 ns);
      tipd_IO18C  	: VitalDelayType01 := (0 ns, 0 ns);
      tpd_PADDO_IO18C	 : VitalDelayType01 := (0 ns, 0 ns);
      tperiod_IO18C 	: VitalDelayType := 0 ns;
      tpw_IO18C_posedge	: VitalDelayType := 0 ns;
      tpw_IO18C_negedge	: VitalDelayType := 0 ns);

    port (PADDO: in Std_logic; IO18C: inout Std_logic);

    ATTRIBUTE Vital_Level0 OF IO18_CB : ENTITY IS TRUE;

  end IO18_CB;

  architecture Structure of IO18_CB is
    ATTRIBUTE Vital_Level0 OF Structure : ARCHITECTURE IS TRUE;

    signal PADDO_ipd 	: std_logic := 'X';
    signal IO18C_ipd 	: std_logic := 'X';
    signal IO18C_out 	: std_logic := 'Z';

    signal GNDI: Std_logic;
    component gndB
      port (PWR0: out Std_logic);
    end component;
    component xo2iobuf
      port (I: in Std_logic; T: in Std_logic; Z: out Std_logic; 
            PAD: out Std_logic; PADI: in Std_logic);
    end component;
  begin
    IO18_C_pad: xo2iobuf
      port map (I=>PADDO_ipd, T=>GNDI, Z=>open, PAD=>IO18C_out, 
                PADI=>IO18C_ipd);
    DRIVEGND: gndB
      port map (PWR0=>GNDI);

    --  INPUT PATH DELAYs
    WireDelay : BLOCK
    BEGIN
      VitalWireDelay(PADDO_ipd, PADDO, tipd_PADDO);
      VitalWireDelay(IO18C_ipd, IO18C, tipd_IO18C);
    END BLOCK;

    VitalBehavior : PROCESS (PADDO_ipd, IO18C_ipd, IO18C_out)
    VARIABLE IO18C_zd         	: std_logic := 'X';
    VARIABLE IO18C_GlitchData 	: VitalGlitchDataType;

    VARIABLE tviol_IO18C_IO18C          	: x01 := '0';
    VARIABLE periodcheckinfo_IO18C	: VitalPeriodDataType;

    BEGIN

    IF (TimingChecksOn) THEN
      VitalPeriodPulseCheck (
        TestSignal => IO18C_ipd,
        TestSignalName => "IO18C",
        Period => tperiod_IO18C,
        PulseWidthHigh => tpw_IO18C_posedge,
        PulseWidthLow => tpw_IO18C_negedge,
        PeriodData => periodcheckinfo_IO18C,
        Violation => tviol_IO18C_IO18C,
        MsgOn => MsgOn, XOn => XOn,
        HeaderMsg => InstancePath,
        CheckEnabled => TRUE,
        MsgSeverity => warning);

    END IF;

    IO18C_zd 	:= IO18C_out;

    VitalPathDelay01 (
      OutSignal => IO18C, OutSignalName => "IO18C", OutTemp => IO18C_zd,
      Paths      => (0 => (InputChangeTime => PADDO_ipd'last_event,
                           PathDelay => tpd_PADDO_IO18C,
                           PathCondition => TRUE)),
      GlitchData => IO18C_GlitchData,
      Mode       => vitaltransport, XOn => XOn, MsgOn => MsgOn);

    END PROCESS;

  end Structure;

-- entity IO17_CB
  library IEEE, vital2000, MACHXO2;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use MACHXO2.COMPONENTS.ALL;

  entity IO17_CB is
    -- miscellaneous vital GENERICs
    GENERIC (
      TimingChecksOn	: boolean := TRUE;
      XOn           	: boolean := FALSE;
      MsgOn         	: boolean := TRUE;
      InstancePath  	: string := "IO17_CB";

      tipd_PADDO  	: VitalDelayType01 := (0 ns, 0 ns);
      tipd_IO17C  	: VitalDelayType01 := (0 ns, 0 ns);
      tpd_PADDO_IO17C	 : VitalDelayType01 := (0 ns, 0 ns);
      tperiod_IO17C 	: VitalDelayType := 0 ns;
      tpw_IO17C_posedge	: VitalDelayType := 0 ns;
      tpw_IO17C_negedge	: VitalDelayType := 0 ns);

    port (PADDO: in Std_logic; IO17C: inout Std_logic);

    ATTRIBUTE Vital_Level0 OF IO17_CB : ENTITY IS TRUE;

  end IO17_CB;

  architecture Structure of IO17_CB is
    ATTRIBUTE Vital_Level0 OF Structure : ARCHITECTURE IS TRUE;

    signal PADDO_ipd 	: std_logic := 'X';
    signal IO17C_ipd 	: std_logic := 'X';
    signal IO17C_out 	: std_logic := 'Z';

    signal GNDI: Std_logic;
    component gndB
      port (PWR0: out Std_logic);
    end component;
    component xo2iobuf
      port (I: in Std_logic; T: in Std_logic; Z: out Std_logic; 
            PAD: out Std_logic; PADI: in Std_logic);
    end component;
  begin
    IO17_C_pad: xo2iobuf
      port map (I=>PADDO_ipd, T=>GNDI, Z=>open, PAD=>IO17C_out, 
                PADI=>IO17C_ipd);
    DRIVEGND: gndB
      port map (PWR0=>GNDI);

    --  INPUT PATH DELAYs
    WireDelay : BLOCK
    BEGIN
      VitalWireDelay(PADDO_ipd, PADDO, tipd_PADDO);
      VitalWireDelay(IO17C_ipd, IO17C, tipd_IO17C);
    END BLOCK;

    VitalBehavior : PROCESS (PADDO_ipd, IO17C_ipd, IO17C_out)
    VARIABLE IO17C_zd         	: std_logic := 'X';
    VARIABLE IO17C_GlitchData 	: VitalGlitchDataType;

    VARIABLE tviol_IO17C_IO17C          	: x01 := '0';
    VARIABLE periodcheckinfo_IO17C	: VitalPeriodDataType;

    BEGIN

    IF (TimingChecksOn) THEN
      VitalPeriodPulseCheck (
        TestSignal => IO17C_ipd,
        TestSignalName => "IO17C",
        Period => tperiod_IO17C,
        PulseWidthHigh => tpw_IO17C_posedge,
        PulseWidthLow => tpw_IO17C_negedge,
        PeriodData => periodcheckinfo_IO17C,
        Violation => tviol_IO17C_IO17C,
        MsgOn => MsgOn, XOn => XOn,
        HeaderMsg => InstancePath,
        CheckEnabled => TRUE,
        MsgSeverity => warning);

    END IF;

    IO17C_zd 	:= IO17C_out;

    VitalPathDelay01 (
      OutSignal => IO17C, OutSignalName => "IO17C", OutTemp => IO17C_zd,
      Paths      => (0 => (InputChangeTime => PADDO_ipd'last_event,
                           PathDelay => tpd_PADDO_IO17C,
                           PathCondition => TRUE)),
      GlitchData => IO17C_GlitchData,
      Mode       => vitaltransport, XOn => XOn, MsgOn => MsgOn);

    END PROCESS;

  end Structure;

-- entity IO16_CB
  library IEEE, vital2000, MACHXO2;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use MACHXO2.COMPONENTS.ALL;

  entity IO16_CB is
    -- miscellaneous vital GENERICs
    GENERIC (
      TimingChecksOn	: boolean := TRUE;
      XOn           	: boolean := FALSE;
      MsgOn         	: boolean := TRUE;
      InstancePath  	: string := "IO16_CB";

      tipd_PADDO  	: VitalDelayType01 := (0 ns, 0 ns);
      tipd_IO16C  	: VitalDelayType01 := (0 ns, 0 ns);
      tpd_PADDO_IO16C	 : VitalDelayType01 := (0 ns, 0 ns);
      tperiod_IO16C 	: VitalDelayType := 0 ns;
      tpw_IO16C_posedge	: VitalDelayType := 0 ns;
      tpw_IO16C_negedge	: VitalDelayType := 0 ns);

    port (PADDO: in Std_logic; IO16C: inout Std_logic);

    ATTRIBUTE Vital_Level0 OF IO16_CB : ENTITY IS TRUE;

  end IO16_CB;

  architecture Structure of IO16_CB is
    ATTRIBUTE Vital_Level0 OF Structure : ARCHITECTURE IS TRUE;

    signal PADDO_ipd 	: std_logic := 'X';
    signal IO16C_ipd 	: std_logic := 'X';
    signal IO16C_out 	: std_logic := 'Z';

    signal GNDI: Std_logic;
    component gndB
      port (PWR0: out Std_logic);
    end component;
    component xo2iobuf
      port (I: in Std_logic; T: in Std_logic; Z: out Std_logic; 
            PAD: out Std_logic; PADI: in Std_logic);
    end component;
  begin
    IO16_C_pad: xo2iobuf
      port map (I=>PADDO_ipd, T=>GNDI, Z=>open, PAD=>IO16C_out, 
                PADI=>IO16C_ipd);
    DRIVEGND: gndB
      port map (PWR0=>GNDI);

    --  INPUT PATH DELAYs
    WireDelay : BLOCK
    BEGIN
      VitalWireDelay(PADDO_ipd, PADDO, tipd_PADDO);
      VitalWireDelay(IO16C_ipd, IO16C, tipd_IO16C);
    END BLOCK;

    VitalBehavior : PROCESS (PADDO_ipd, IO16C_ipd, IO16C_out)
    VARIABLE IO16C_zd         	: std_logic := 'X';
    VARIABLE IO16C_GlitchData 	: VitalGlitchDataType;

    VARIABLE tviol_IO16C_IO16C          	: x01 := '0';
    VARIABLE periodcheckinfo_IO16C	: VitalPeriodDataType;

    BEGIN

    IF (TimingChecksOn) THEN
      VitalPeriodPulseCheck (
        TestSignal => IO16C_ipd,
        TestSignalName => "IO16C",
        Period => tperiod_IO16C,
        PulseWidthHigh => tpw_IO16C_posedge,
        PulseWidthLow => tpw_IO16C_negedge,
        PeriodData => periodcheckinfo_IO16C,
        Violation => tviol_IO16C_IO16C,
        MsgOn => MsgOn, XOn => XOn,
        HeaderMsg => InstancePath,
        CheckEnabled => TRUE,
        MsgSeverity => warning);

    END IF;

    IO16C_zd 	:= IO16C_out;

    VitalPathDelay01 (
      OutSignal => IO16C, OutSignalName => "IO16C", OutTemp => IO16C_zd,
      Paths      => (0 => (InputChangeTime => PADDO_ipd'last_event,
                           PathDelay => tpd_PADDO_IO16C,
                           PathCondition => TRUE)),
      GlitchData => IO16C_GlitchData,
      Mode       => vitaltransport, XOn => XOn, MsgOn => MsgOn);

    END PROCESS;

  end Structure;

-- entity IO15_CB
  library IEEE, vital2000, MACHXO2;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use MACHXO2.COMPONENTS.ALL;

  entity IO15_CB is
    -- miscellaneous vital GENERICs
    GENERIC (
      TimingChecksOn	: boolean := TRUE;
      XOn           	: boolean := FALSE;
      MsgOn         	: boolean := TRUE;
      InstancePath  	: string := "IO15_CB";

      tipd_PADDO  	: VitalDelayType01 := (0 ns, 0 ns);
      tipd_IO15C  	: VitalDelayType01 := (0 ns, 0 ns);
      tpd_PADDO_IO15C	 : VitalDelayType01 := (0 ns, 0 ns);
      tperiod_IO15C 	: VitalDelayType := 0 ns;
      tpw_IO15C_posedge	: VitalDelayType := 0 ns;
      tpw_IO15C_negedge	: VitalDelayType := 0 ns);

    port (PADDO: in Std_logic; IO15C: inout Std_logic);

    ATTRIBUTE Vital_Level0 OF IO15_CB : ENTITY IS TRUE;

  end IO15_CB;

  architecture Structure of IO15_CB is
    ATTRIBUTE Vital_Level0 OF Structure : ARCHITECTURE IS TRUE;

    signal PADDO_ipd 	: std_logic := 'X';
    signal IO15C_ipd 	: std_logic := 'X';
    signal IO15C_out 	: std_logic := 'Z';

    signal GNDI: Std_logic;
    component gndB
      port (PWR0: out Std_logic);
    end component;
    component xo2iobuf
      port (I: in Std_logic; T: in Std_logic; Z: out Std_logic; 
            PAD: out Std_logic; PADI: in Std_logic);
    end component;
  begin
    IO15_C_pad: xo2iobuf
      port map (I=>PADDO_ipd, T=>GNDI, Z=>open, PAD=>IO15C_out, 
                PADI=>IO15C_ipd);
    DRIVEGND: gndB
      port map (PWR0=>GNDI);

    --  INPUT PATH DELAYs
    WireDelay : BLOCK
    BEGIN
      VitalWireDelay(PADDO_ipd, PADDO, tipd_PADDO);
      VitalWireDelay(IO15C_ipd, IO15C, tipd_IO15C);
    END BLOCK;

    VitalBehavior : PROCESS (PADDO_ipd, IO15C_ipd, IO15C_out)
    VARIABLE IO15C_zd         	: std_logic := 'X';
    VARIABLE IO15C_GlitchData 	: VitalGlitchDataType;

    VARIABLE tviol_IO15C_IO15C          	: x01 := '0';
    VARIABLE periodcheckinfo_IO15C	: VitalPeriodDataType;

    BEGIN

    IF (TimingChecksOn) THEN
      VitalPeriodPulseCheck (
        TestSignal => IO15C_ipd,
        TestSignalName => "IO15C",
        Period => tperiod_IO15C,
        PulseWidthHigh => tpw_IO15C_posedge,
        PulseWidthLow => tpw_IO15C_negedge,
        PeriodData => periodcheckinfo_IO15C,
        Violation => tviol_IO15C_IO15C,
        MsgOn => MsgOn, XOn => XOn,
        HeaderMsg => InstancePath,
        CheckEnabled => TRUE,
        MsgSeverity => warning);

    END IF;

    IO15C_zd 	:= IO15C_out;

    VitalPathDelay01 (
      OutSignal => IO15C, OutSignalName => "IO15C", OutTemp => IO15C_zd,
      Paths      => (0 => (InputChangeTime => PADDO_ipd'last_event,
                           PathDelay => tpd_PADDO_IO15C,
                           PathCondition => TRUE)),
      GlitchData => IO15C_GlitchData,
      Mode       => vitaltransport, XOn => XOn, MsgOn => MsgOn);

    END PROCESS;

  end Structure;

-- entity IO14_CB
  library IEEE, vital2000, MACHXO2;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use MACHXO2.COMPONENTS.ALL;

  entity IO14_CB is
    -- miscellaneous vital GENERICs
    GENERIC (
      TimingChecksOn	: boolean := TRUE;
      XOn           	: boolean := FALSE;
      MsgOn         	: boolean := TRUE;
      InstancePath  	: string := "IO14_CB";

      tipd_PADDO  	: VitalDelayType01 := (0 ns, 0 ns);
      tipd_IO14C  	: VitalDelayType01 := (0 ns, 0 ns);
      tpd_PADDO_IO14C	 : VitalDelayType01 := (0 ns, 0 ns);
      tperiod_IO14C 	: VitalDelayType := 0 ns;
      tpw_IO14C_posedge	: VitalDelayType := 0 ns;
      tpw_IO14C_negedge	: VitalDelayType := 0 ns);

    port (PADDO: in Std_logic; IO14C: inout Std_logic);

    ATTRIBUTE Vital_Level0 OF IO14_CB : ENTITY IS TRUE;

  end IO14_CB;

  architecture Structure of IO14_CB is
    ATTRIBUTE Vital_Level0 OF Structure : ARCHITECTURE IS TRUE;

    signal PADDO_ipd 	: std_logic := 'X';
    signal IO14C_ipd 	: std_logic := 'X';
    signal IO14C_out 	: std_logic := 'Z';

    signal GNDI: Std_logic;
    component gndB
      port (PWR0: out Std_logic);
    end component;
    component xo2iobuf
      port (I: in Std_logic; T: in Std_logic; Z: out Std_logic; 
            PAD: out Std_logic; PADI: in Std_logic);
    end component;
  begin
    IO14_C_pad: xo2iobuf
      port map (I=>PADDO_ipd, T=>GNDI, Z=>open, PAD=>IO14C_out, 
                PADI=>IO14C_ipd);
    DRIVEGND: gndB
      port map (PWR0=>GNDI);

    --  INPUT PATH DELAYs
    WireDelay : BLOCK
    BEGIN
      VitalWireDelay(PADDO_ipd, PADDO, tipd_PADDO);
      VitalWireDelay(IO14C_ipd, IO14C, tipd_IO14C);
    END BLOCK;

    VitalBehavior : PROCESS (PADDO_ipd, IO14C_ipd, IO14C_out)
    VARIABLE IO14C_zd         	: std_logic := 'X';
    VARIABLE IO14C_GlitchData 	: VitalGlitchDataType;

    VARIABLE tviol_IO14C_IO14C          	: x01 := '0';
    VARIABLE periodcheckinfo_IO14C	: VitalPeriodDataType;

    BEGIN

    IF (TimingChecksOn) THEN
      VitalPeriodPulseCheck (
        TestSignal => IO14C_ipd,
        TestSignalName => "IO14C",
        Period => tperiod_IO14C,
        PulseWidthHigh => tpw_IO14C_posedge,
        PulseWidthLow => tpw_IO14C_negedge,
        PeriodData => periodcheckinfo_IO14C,
        Violation => tviol_IO14C_IO14C,
        MsgOn => MsgOn, XOn => XOn,
        HeaderMsg => InstancePath,
        CheckEnabled => TRUE,
        MsgSeverity => warning);

    END IF;

    IO14C_zd 	:= IO14C_out;

    VitalPathDelay01 (
      OutSignal => IO14C, OutSignalName => "IO14C", OutTemp => IO14C_zd,
      Paths      => (0 => (InputChangeTime => PADDO_ipd'last_event,
                           PathDelay => tpd_PADDO_IO14C,
                           PathCondition => TRUE)),
      GlitchData => IO14C_GlitchData,
      Mode       => vitaltransport, XOn => XOn, MsgOn => MsgOn);

    END PROCESS;

  end Structure;

-- entity IO13_CB
  library IEEE, vital2000, MACHXO2;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use MACHXO2.COMPONENTS.ALL;

  entity IO13_CB is
    -- miscellaneous vital GENERICs
    GENERIC (
      TimingChecksOn	: boolean := TRUE;
      XOn           	: boolean := FALSE;
      MsgOn         	: boolean := TRUE;
      InstancePath  	: string := "IO13_CB";

      tipd_PADDO  	: VitalDelayType01 := (0 ns, 0 ns);
      tipd_IO13C  	: VitalDelayType01 := (0 ns, 0 ns);
      tpd_PADDO_IO13C	 : VitalDelayType01 := (0 ns, 0 ns);
      tperiod_IO13C 	: VitalDelayType := 0 ns;
      tpw_IO13C_posedge	: VitalDelayType := 0 ns;
      tpw_IO13C_negedge	: VitalDelayType := 0 ns);

    port (PADDO: in Std_logic; IO13C: inout Std_logic);

    ATTRIBUTE Vital_Level0 OF IO13_CB : ENTITY IS TRUE;

  end IO13_CB;

  architecture Structure of IO13_CB is
    ATTRIBUTE Vital_Level0 OF Structure : ARCHITECTURE IS TRUE;

    signal PADDO_ipd 	: std_logic := 'X';
    signal IO13C_ipd 	: std_logic := 'X';
    signal IO13C_out 	: std_logic := 'Z';

    signal GNDI: Std_logic;
    component gndB
      port (PWR0: out Std_logic);
    end component;
    component xo2iobuf
      port (I: in Std_logic; T: in Std_logic; Z: out Std_logic; 
            PAD: out Std_logic; PADI: in Std_logic);
    end component;
  begin
    IO13_C_pad: xo2iobuf
      port map (I=>PADDO_ipd, T=>GNDI, Z=>open, PAD=>IO13C_out, 
                PADI=>IO13C_ipd);
    DRIVEGND: gndB
      port map (PWR0=>GNDI);

    --  INPUT PATH DELAYs
    WireDelay : BLOCK
    BEGIN
      VitalWireDelay(PADDO_ipd, PADDO, tipd_PADDO);
      VitalWireDelay(IO13C_ipd, IO13C, tipd_IO13C);
    END BLOCK;

    VitalBehavior : PROCESS (PADDO_ipd, IO13C_ipd, IO13C_out)
    VARIABLE IO13C_zd         	: std_logic := 'X';
    VARIABLE IO13C_GlitchData 	: VitalGlitchDataType;

    VARIABLE tviol_IO13C_IO13C          	: x01 := '0';
    VARIABLE periodcheckinfo_IO13C	: VitalPeriodDataType;

    BEGIN

    IF (TimingChecksOn) THEN
      VitalPeriodPulseCheck (
        TestSignal => IO13C_ipd,
        TestSignalName => "IO13C",
        Period => tperiod_IO13C,
        PulseWidthHigh => tpw_IO13C_posedge,
        PulseWidthLow => tpw_IO13C_negedge,
        PeriodData => periodcheckinfo_IO13C,
        Violation => tviol_IO13C_IO13C,
        MsgOn => MsgOn, XOn => XOn,
        HeaderMsg => InstancePath,
        CheckEnabled => TRUE,
        MsgSeverity => warning);

    END IF;

    IO13C_zd 	:= IO13C_out;

    VitalPathDelay01 (
      OutSignal => IO13C, OutSignalName => "IO13C", OutTemp => IO13C_zd,
      Paths      => (0 => (InputChangeTime => PADDO_ipd'last_event,
                           PathDelay => tpd_PADDO_IO13C,
                           PathCondition => TRUE)),
      GlitchData => IO13C_GlitchData,
      Mode       => vitaltransport, XOn => XOn, MsgOn => MsgOn);

    END PROCESS;

  end Structure;

-- entity IO12_CB
  library IEEE, vital2000, MACHXO2;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use MACHXO2.COMPONENTS.ALL;

  entity IO12_CB is
    -- miscellaneous vital GENERICs
    GENERIC (
      TimingChecksOn	: boolean := TRUE;
      XOn           	: boolean := FALSE;
      MsgOn         	: boolean := TRUE;
      InstancePath  	: string := "IO12_CB";

      tipd_PADDO  	: VitalDelayType01 := (0 ns, 0 ns);
      tipd_IO12C  	: VitalDelayType01 := (0 ns, 0 ns);
      tpd_PADDO_IO12C	 : VitalDelayType01 := (0 ns, 0 ns);
      tperiod_IO12C 	: VitalDelayType := 0 ns;
      tpw_IO12C_posedge	: VitalDelayType := 0 ns;
      tpw_IO12C_negedge	: VitalDelayType := 0 ns);

    port (PADDO: in Std_logic; IO12C: inout Std_logic);

    ATTRIBUTE Vital_Level0 OF IO12_CB : ENTITY IS TRUE;

  end IO12_CB;

  architecture Structure of IO12_CB is
    ATTRIBUTE Vital_Level0 OF Structure : ARCHITECTURE IS TRUE;

    signal PADDO_ipd 	: std_logic := 'X';
    signal IO12C_ipd 	: std_logic := 'X';
    signal IO12C_out 	: std_logic := 'Z';

    signal GNDI: Std_logic;
    component gndB
      port (PWR0: out Std_logic);
    end component;
    component xo2iobuf
      port (I: in Std_logic; T: in Std_logic; Z: out Std_logic; 
            PAD: out Std_logic; PADI: in Std_logic);
    end component;
  begin
    IO12_C_pad: xo2iobuf
      port map (I=>PADDO_ipd, T=>GNDI, Z=>open, PAD=>IO12C_out, 
                PADI=>IO12C_ipd);
    DRIVEGND: gndB
      port map (PWR0=>GNDI);

    --  INPUT PATH DELAYs
    WireDelay : BLOCK
    BEGIN
      VitalWireDelay(PADDO_ipd, PADDO, tipd_PADDO);
      VitalWireDelay(IO12C_ipd, IO12C, tipd_IO12C);
    END BLOCK;

    VitalBehavior : PROCESS (PADDO_ipd, IO12C_ipd, IO12C_out)
    VARIABLE IO12C_zd         	: std_logic := 'X';
    VARIABLE IO12C_GlitchData 	: VitalGlitchDataType;

    VARIABLE tviol_IO12C_IO12C          	: x01 := '0';
    VARIABLE periodcheckinfo_IO12C	: VitalPeriodDataType;

    BEGIN

    IF (TimingChecksOn) THEN
      VitalPeriodPulseCheck (
        TestSignal => IO12C_ipd,
        TestSignalName => "IO12C",
        Period => tperiod_IO12C,
        PulseWidthHigh => tpw_IO12C_posedge,
        PulseWidthLow => tpw_IO12C_negedge,
        PeriodData => periodcheckinfo_IO12C,
        Violation => tviol_IO12C_IO12C,
        MsgOn => MsgOn, XOn => XOn,
        HeaderMsg => InstancePath,
        CheckEnabled => TRUE,
        MsgSeverity => warning);

    END IF;

    IO12C_zd 	:= IO12C_out;

    VitalPathDelay01 (
      OutSignal => IO12C, OutSignalName => "IO12C", OutTemp => IO12C_zd,
      Paths      => (0 => (InputChangeTime => PADDO_ipd'last_event,
                           PathDelay => tpd_PADDO_IO12C,
                           PathCondition => TRUE)),
      GlitchData => IO12C_GlitchData,
      Mode       => vitaltransport, XOn => XOn, MsgOn => MsgOn);

    END PROCESS;

  end Structure;

-- entity IO11_CB
  library IEEE, vital2000, MACHXO2;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use MACHXO2.COMPONENTS.ALL;

  entity IO11_CB is
    -- miscellaneous vital GENERICs
    GENERIC (
      TimingChecksOn	: boolean := TRUE;
      XOn           	: boolean := FALSE;
      MsgOn         	: boolean := TRUE;
      InstancePath  	: string := "IO11_CB";

      tipd_IO11C  	: VitalDelayType01 := (0 ns, 0 ns);
      tpd_IO11C_PADDI	 : VitalDelayType01 := (0 ns, 0 ns);
      tperiod_IO11C 	: VitalDelayType := 0 ns;
      tpw_IO11C_posedge	: VitalDelayType := 0 ns;
      tpw_IO11C_negedge	: VitalDelayType := 0 ns);

    port (PADDI: out Std_logic; IO11C: in Std_logic);

    ATTRIBUTE Vital_Level0 OF IO11_CB : ENTITY IS TRUE;

  end IO11_CB;

  architecture Structure of IO11_CB is
    ATTRIBUTE Vital_Level0 OF Structure : ARCHITECTURE IS TRUE;

    signal PADDI_out 	: std_logic := 'X';
    signal IO11C_ipd 	: std_logic := 'X';

    component xo2iobuf0003
      port (Z: out Std_logic; PAD: in Std_logic);
    end component;
  begin
    IO11_C_pad: xo2iobuf0003
      port map (Z=>PADDI_out, PAD=>IO11C_ipd);

    --  INPUT PATH DELAYs
    WireDelay : BLOCK
    BEGIN
      VitalWireDelay(IO11C_ipd, IO11C, tipd_IO11C);
    END BLOCK;

    VitalBehavior : PROCESS (PADDI_out, IO11C_ipd)
    VARIABLE PADDI_zd         	: std_logic := 'X';
    VARIABLE PADDI_GlitchData 	: VitalGlitchDataType;

    VARIABLE tviol_IO11C_IO11C          	: x01 := '0';
    VARIABLE periodcheckinfo_IO11C	: VitalPeriodDataType;

    BEGIN

    IF (TimingChecksOn) THEN
      VitalPeriodPulseCheck (
        TestSignal => IO11C_ipd,
        TestSignalName => "IO11C",
        Period => tperiod_IO11C,
        PulseWidthHigh => tpw_IO11C_posedge,
        PulseWidthLow => tpw_IO11C_negedge,
        PeriodData => periodcheckinfo_IO11C,
        Violation => tviol_IO11C_IO11C,
        MsgOn => MsgOn, XOn => XOn,
        HeaderMsg => InstancePath,
        CheckEnabled => TRUE,
        MsgSeverity => warning);

    END IF;

    PADDI_zd 	:= PADDI_out;

    VitalPathDelay01 (
      OutSignal => PADDI, OutSignalName => "PADDI", OutTemp => PADDI_zd,
      Paths      => (0 => (InputChangeTime => IO11C_ipd'last_event,
                           PathDelay => tpd_IO11C_PADDI,
                           PathCondition => TRUE)),
      GlitchData => PADDI_GlitchData,
      Mode       => vitaltransport, XOn => XOn, MsgOn => MsgOn);

    END PROCESS;

  end Structure;

-- entity IO10_CB
  library IEEE, vital2000, MACHXO2;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use MACHXO2.COMPONENTS.ALL;

  entity IO10_CB is
    -- miscellaneous vital GENERICs
    GENERIC (
      TimingChecksOn	: boolean := TRUE;
      XOn           	: boolean := FALSE;
      MsgOn         	: boolean := TRUE;
      InstancePath  	: string := "IO10_CB";

      tipd_IO10C  	: VitalDelayType01 := (0 ns, 0 ns);
      tpd_IO10C_PADDI	 : VitalDelayType01 := (0 ns, 0 ns);
      tperiod_IO10C 	: VitalDelayType := 0 ns;
      tpw_IO10C_posedge	: VitalDelayType := 0 ns;
      tpw_IO10C_negedge	: VitalDelayType := 0 ns);

    port (PADDI: out Std_logic; IO10C: in Std_logic);

    ATTRIBUTE Vital_Level0 OF IO10_CB : ENTITY IS TRUE;

  end IO10_CB;

  architecture Structure of IO10_CB is
    ATTRIBUTE Vital_Level0 OF Structure : ARCHITECTURE IS TRUE;

    signal PADDI_out 	: std_logic := 'X';
    signal IO10C_ipd 	: std_logic := 'X';

    component xo2iobuf0003
      port (Z: out Std_logic; PAD: in Std_logic);
    end component;
  begin
    IO10_C_pad: xo2iobuf0003
      port map (Z=>PADDI_out, PAD=>IO10C_ipd);

    --  INPUT PATH DELAYs
    WireDelay : BLOCK
    BEGIN
      VitalWireDelay(IO10C_ipd, IO10C, tipd_IO10C);
    END BLOCK;

    VitalBehavior : PROCESS (PADDI_out, IO10C_ipd)
    VARIABLE PADDI_zd         	: std_logic := 'X';
    VARIABLE PADDI_GlitchData 	: VitalGlitchDataType;

    VARIABLE tviol_IO10C_IO10C          	: x01 := '0';
    VARIABLE periodcheckinfo_IO10C	: VitalPeriodDataType;

    BEGIN

    IF (TimingChecksOn) THEN
      VitalPeriodPulseCheck (
        TestSignal => IO10C_ipd,
        TestSignalName => "IO10C",
        Period => tperiod_IO10C,
        PulseWidthHigh => tpw_IO10C_posedge,
        PulseWidthLow => tpw_IO10C_negedge,
        PeriodData => periodcheckinfo_IO10C,
        Violation => tviol_IO10C_IO10C,
        MsgOn => MsgOn, XOn => XOn,
        HeaderMsg => InstancePath,
        CheckEnabled => TRUE,
        MsgSeverity => warning);

    END IF;

    PADDI_zd 	:= PADDI_out;

    VitalPathDelay01 (
      OutSignal => PADDI, OutSignalName => "PADDI", OutTemp => PADDI_zd,
      Paths      => (0 => (InputChangeTime => IO10C_ipd'last_event,
                           PathDelay => tpd_IO10C_PADDI,
                           PathCondition => TRUE)),
      GlitchData => PADDI_GlitchData,
      Mode       => vitaltransport, XOn => XOn, MsgOn => MsgOn);

    END PROCESS;

  end Structure;

-- entity IO9_CB
  library IEEE, vital2000, MACHXO2;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use MACHXO2.COMPONENTS.ALL;

  entity IO9_CB is
    -- miscellaneous vital GENERICs
    GENERIC (
      TimingChecksOn	: boolean := TRUE;
      XOn           	: boolean := FALSE;
      MsgOn         	: boolean := TRUE;
      InstancePath  	: string := "IO9_CB";

      tipd_IO9C  	: VitalDelayType01 := (0 ns, 0 ns);
      tpd_IO9C_PADDI	 : VitalDelayType01 := (0 ns, 0 ns);
      tperiod_IO9C 	: VitalDelayType := 0 ns;
      tpw_IO9C_posedge	: VitalDelayType := 0 ns;
      tpw_IO9C_negedge	: VitalDelayType := 0 ns);

    port (PADDI: out Std_logic; IO9C: in Std_logic);

    ATTRIBUTE Vital_Level0 OF IO9_CB : ENTITY IS TRUE;

  end IO9_CB;

  architecture Structure of IO9_CB is
    ATTRIBUTE Vital_Level0 OF Structure : ARCHITECTURE IS TRUE;

    signal PADDI_out 	: std_logic := 'X';
    signal IO9C_ipd 	: std_logic := 'X';

    component xo2iobuf0003
      port (Z: out Std_logic; PAD: in Std_logic);
    end component;
  begin
    IO9_C_pad: xo2iobuf0003
      port map (Z=>PADDI_out, PAD=>IO9C_ipd);

    --  INPUT PATH DELAYs
    WireDelay : BLOCK
    BEGIN
      VitalWireDelay(IO9C_ipd, IO9C, tipd_IO9C);
    END BLOCK;

    VitalBehavior : PROCESS (PADDI_out, IO9C_ipd)
    VARIABLE PADDI_zd         	: std_logic := 'X';
    VARIABLE PADDI_GlitchData 	: VitalGlitchDataType;

    VARIABLE tviol_IO9C_IO9C          	: x01 := '0';
    VARIABLE periodcheckinfo_IO9C	: VitalPeriodDataType;

    BEGIN

    IF (TimingChecksOn) THEN
      VitalPeriodPulseCheck (
        TestSignal => IO9C_ipd,
        TestSignalName => "IO9C",
        Period => tperiod_IO9C,
        PulseWidthHigh => tpw_IO9C_posedge,
        PulseWidthLow => tpw_IO9C_negedge,
        PeriodData => periodcheckinfo_IO9C,
        Violation => tviol_IO9C_IO9C,
        MsgOn => MsgOn, XOn => XOn,
        HeaderMsg => InstancePath,
        CheckEnabled => TRUE,
        MsgSeverity => warning);

    END IF;

    PADDI_zd 	:= PADDI_out;

    VitalPathDelay01 (
      OutSignal => PADDI, OutSignalName => "PADDI", OutTemp => PADDI_zd,
      Paths      => (0 => (InputChangeTime => IO9C_ipd'last_event,
                           PathDelay => tpd_IO9C_PADDI,
                           PathCondition => TRUE)),
      GlitchData => PADDI_GlitchData,
      Mode       => vitaltransport, XOn => XOn, MsgOn => MsgOn);

    END PROCESS;

  end Structure;

-- entity IO8_CB
  library IEEE, vital2000, MACHXO2;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use MACHXO2.COMPONENTS.ALL;

  entity IO8_CB is
    -- miscellaneous vital GENERICs
    GENERIC (
      TimingChecksOn	: boolean := TRUE;
      XOn           	: boolean := FALSE;
      MsgOn         	: boolean := TRUE;
      InstancePath  	: string := "IO8_CB";

      tipd_PADDO  	: VitalDelayType01 := (0 ns, 0 ns);
      tpd_PADDO_IO8C	 : VitalDelayType01 := (0 ns, 0 ns));

    port (PADDO: in Std_logic; IO8C: out Std_logic);

    ATTRIBUTE Vital_Level0 OF IO8_CB : ENTITY IS TRUE;

  end IO8_CB;

  architecture Structure of IO8_CB is
    ATTRIBUTE Vital_Level0 OF Structure : ARCHITECTURE IS TRUE;

    signal PADDO_ipd 	: std_logic := 'X';
    signal IO8C_out 	: std_logic := 'X';

    signal GNDI: Std_logic;
    component gndB
      port (PWR0: out Std_logic);
    end component;
    component xo2iobuf0002
      port (I: in Std_logic; T: in Std_logic; PAD: out Std_logic);
    end component;
  begin
    IO8_C_pad: xo2iobuf0002
      port map (I=>PADDO_ipd, T=>GNDI, PAD=>IO8C_out);
    DRIVEGND: gndB
      port map (PWR0=>GNDI);

    --  INPUT PATH DELAYs
    WireDelay : BLOCK
    BEGIN
      VitalWireDelay(PADDO_ipd, PADDO, tipd_PADDO);
    END BLOCK;

    VitalBehavior : PROCESS (PADDO_ipd, IO8C_out)
    VARIABLE IO8C_zd         	: std_logic := 'X';
    VARIABLE IO8C_GlitchData 	: VitalGlitchDataType;


    BEGIN

    IF (TimingChecksOn) THEN

    END IF;

    IO8C_zd 	:= IO8C_out;

    VitalPathDelay01 (
      OutSignal => IO8C, OutSignalName => "IO8C", OutTemp => IO8C_zd,
      Paths      => (0 => (InputChangeTime => PADDO_ipd'last_event,
                           PathDelay => tpd_PADDO_IO8C,
                           PathCondition => TRUE)),
      GlitchData => IO8C_GlitchData,
      Mode       => vitaltransport, XOn => XOn, MsgOn => MsgOn);

    END PROCESS;

  end Structure;

-- entity IO7_CB
  library IEEE, vital2000, MACHXO2;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use MACHXO2.COMPONENTS.ALL;

  entity IO7_CB is
    -- miscellaneous vital GENERICs
    GENERIC (
      TimingChecksOn	: boolean := TRUE;
      XOn           	: boolean := FALSE;
      MsgOn         	: boolean := TRUE;
      InstancePath  	: string := "IO7_CB";

      tipd_PADDO  	: VitalDelayType01 := (0 ns, 0 ns);
      tpd_PADDO_IO7C	 : VitalDelayType01 := (0 ns, 0 ns));

    port (PADDO: in Std_logic; IO7C: out Std_logic);

    ATTRIBUTE Vital_Level0 OF IO7_CB : ENTITY IS TRUE;

  end IO7_CB;

  architecture Structure of IO7_CB is
    ATTRIBUTE Vital_Level0 OF Structure : ARCHITECTURE IS TRUE;

    signal PADDO_ipd 	: std_logic := 'X';
    signal IO7C_out 	: std_logic := 'X';

    signal GNDI: Std_logic;
    component gndB
      port (PWR0: out Std_logic);
    end component;
    component xo2iobuf0002
      port (I: in Std_logic; T: in Std_logic; PAD: out Std_logic);
    end component;
  begin
    IO7_C_pad: xo2iobuf0002
      port map (I=>PADDO_ipd, T=>GNDI, PAD=>IO7C_out);
    DRIVEGND: gndB
      port map (PWR0=>GNDI);

    --  INPUT PATH DELAYs
    WireDelay : BLOCK
    BEGIN
      VitalWireDelay(PADDO_ipd, PADDO, tipd_PADDO);
    END BLOCK;

    VitalBehavior : PROCESS (PADDO_ipd, IO7C_out)
    VARIABLE IO7C_zd         	: std_logic := 'X';
    VARIABLE IO7C_GlitchData 	: VitalGlitchDataType;


    BEGIN

    IF (TimingChecksOn) THEN

    END IF;

    IO7C_zd 	:= IO7C_out;

    VitalPathDelay01 (
      OutSignal => IO7C, OutSignalName => "IO7C", OutTemp => IO7C_zd,
      Paths      => (0 => (InputChangeTime => PADDO_ipd'last_event,
                           PathDelay => tpd_PADDO_IO7C,
                           PathCondition => TRUE)),
      GlitchData => IO7C_GlitchData,
      Mode       => vitaltransport, XOn => XOn, MsgOn => MsgOn);

    END PROCESS;

  end Structure;

-- entity IO6_CB
  library IEEE, vital2000, MACHXO2;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use MACHXO2.COMPONENTS.ALL;

  entity IO6_CB is
    -- miscellaneous vital GENERICs
    GENERIC (
      TimingChecksOn	: boolean := TRUE;
      XOn           	: boolean := FALSE;
      MsgOn         	: boolean := TRUE;
      InstancePath  	: string := "IO6_CB";

      tipd_PADDO  	: VitalDelayType01 := (0 ns, 0 ns);
      tpd_PADDO_IO6C	 : VitalDelayType01 := (0 ns, 0 ns));

    port (PADDO: in Std_logic; IO6C: out Std_logic);

    ATTRIBUTE Vital_Level0 OF IO6_CB : ENTITY IS TRUE;

  end IO6_CB;

  architecture Structure of IO6_CB is
    ATTRIBUTE Vital_Level0 OF Structure : ARCHITECTURE IS TRUE;

    signal PADDO_ipd 	: std_logic := 'X';
    signal IO6C_out 	: std_logic := 'X';

    signal GNDI: Std_logic;
    component gndB
      port (PWR0: out Std_logic);
    end component;
    component xo2iobuf0002
      port (I: in Std_logic; T: in Std_logic; PAD: out Std_logic);
    end component;
  begin
    IO6_C_pad: xo2iobuf0002
      port map (I=>PADDO_ipd, T=>GNDI, PAD=>IO6C_out);
    DRIVEGND: gndB
      port map (PWR0=>GNDI);

    --  INPUT PATH DELAYs
    WireDelay : BLOCK
    BEGIN
      VitalWireDelay(PADDO_ipd, PADDO, tipd_PADDO);
    END BLOCK;

    VitalBehavior : PROCESS (PADDO_ipd, IO6C_out)
    VARIABLE IO6C_zd         	: std_logic := 'X';
    VARIABLE IO6C_GlitchData 	: VitalGlitchDataType;


    BEGIN

    IF (TimingChecksOn) THEN

    END IF;

    IO6C_zd 	:= IO6C_out;

    VitalPathDelay01 (
      OutSignal => IO6C, OutSignalName => "IO6C", OutTemp => IO6C_zd,
      Paths      => (0 => (InputChangeTime => PADDO_ipd'last_event,
                           PathDelay => tpd_PADDO_IO6C,
                           PathCondition => TRUE)),
      GlitchData => IO6C_GlitchData,
      Mode       => vitaltransport, XOn => XOn, MsgOn => MsgOn);

    END PROCESS;

  end Structure;

-- entity IO5_CB
  library IEEE, vital2000, MACHXO2;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use MACHXO2.COMPONENTS.ALL;

  entity IO5_CB is
    -- miscellaneous vital GENERICs
    GENERIC (
      TimingChecksOn	: boolean := TRUE;
      XOn           	: boolean := FALSE;
      MsgOn         	: boolean := TRUE;
      InstancePath  	: string := "IO5_CB";

      tipd_PADDO  	: VitalDelayType01 := (0 ns, 0 ns);
      tpd_PADDO_IO5C	 : VitalDelayType01 := (0 ns, 0 ns));

    port (PADDO: in Std_logic; IO5C: out Std_logic);

    ATTRIBUTE Vital_Level0 OF IO5_CB : ENTITY IS TRUE;

  end IO5_CB;

  architecture Structure of IO5_CB is
    ATTRIBUTE Vital_Level0 OF Structure : ARCHITECTURE IS TRUE;

    signal PADDO_ipd 	: std_logic := 'X';
    signal IO5C_out 	: std_logic := 'X';

    signal GNDI: Std_logic;
    component gndB
      port (PWR0: out Std_logic);
    end component;
    component xo2iobuf0002
      port (I: in Std_logic; T: in Std_logic; PAD: out Std_logic);
    end component;
  begin
    IO5_C_pad: xo2iobuf0002
      port map (I=>PADDO_ipd, T=>GNDI, PAD=>IO5C_out);
    DRIVEGND: gndB
      port map (PWR0=>GNDI);

    --  INPUT PATH DELAYs
    WireDelay : BLOCK
    BEGIN
      VitalWireDelay(PADDO_ipd, PADDO, tipd_PADDO);
    END BLOCK;

    VitalBehavior : PROCESS (PADDO_ipd, IO5C_out)
    VARIABLE IO5C_zd         	: std_logic := 'X';
    VARIABLE IO5C_GlitchData 	: VitalGlitchDataType;


    BEGIN

    IF (TimingChecksOn) THEN

    END IF;

    IO5C_zd 	:= IO5C_out;

    VitalPathDelay01 (
      OutSignal => IO5C, OutSignalName => "IO5C", OutTemp => IO5C_zd,
      Paths      => (0 => (InputChangeTime => PADDO_ipd'last_event,
                           PathDelay => tpd_PADDO_IO5C,
                           PathCondition => TRUE)),
      GlitchData => IO5C_GlitchData,
      Mode       => vitaltransport, XOn => XOn, MsgOn => MsgOn);

    END PROCESS;

  end Structure;

-- entity IO4_CB
  library IEEE, vital2000, MACHXO2;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use MACHXO2.COMPONENTS.ALL;

  entity IO4_CB is
    -- miscellaneous vital GENERICs
    GENERIC (
      TimingChecksOn	: boolean := TRUE;
      XOn           	: boolean := FALSE;
      MsgOn         	: boolean := TRUE;
      InstancePath  	: string := "IO4_CB";

      tipd_PADDO  	: VitalDelayType01 := (0 ns, 0 ns);
      tpd_PADDO_IO4C	 : VitalDelayType01 := (0 ns, 0 ns));

    port (PADDO: in Std_logic; IO4C: out Std_logic);

    ATTRIBUTE Vital_Level0 OF IO4_CB : ENTITY IS TRUE;

  end IO4_CB;

  architecture Structure of IO4_CB is
    ATTRIBUTE Vital_Level0 OF Structure : ARCHITECTURE IS TRUE;

    signal PADDO_ipd 	: std_logic := 'X';
    signal IO4C_out 	: std_logic := 'X';

    signal GNDI: Std_logic;
    component gndB
      port (PWR0: out Std_logic);
    end component;
    component xo2iobuf0002
      port (I: in Std_logic; T: in Std_logic; PAD: out Std_logic);
    end component;
  begin
    IO4_C_pad: xo2iobuf0002
      port map (I=>PADDO_ipd, T=>GNDI, PAD=>IO4C_out);
    DRIVEGND: gndB
      port map (PWR0=>GNDI);

    --  INPUT PATH DELAYs
    WireDelay : BLOCK
    BEGIN
      VitalWireDelay(PADDO_ipd, PADDO, tipd_PADDO);
    END BLOCK;

    VitalBehavior : PROCESS (PADDO_ipd, IO4C_out)
    VARIABLE IO4C_zd         	: std_logic := 'X';
    VARIABLE IO4C_GlitchData 	: VitalGlitchDataType;


    BEGIN

    IF (TimingChecksOn) THEN

    END IF;

    IO4C_zd 	:= IO4C_out;

    VitalPathDelay01 (
      OutSignal => IO4C, OutSignalName => "IO4C", OutTemp => IO4C_zd,
      Paths      => (0 => (InputChangeTime => PADDO_ipd'last_event,
                           PathDelay => tpd_PADDO_IO4C,
                           PathCondition => TRUE)),
      GlitchData => IO4C_GlitchData,
      Mode       => vitaltransport, XOn => XOn, MsgOn => MsgOn);

    END PROCESS;

  end Structure;

-- entity IO3_CB
  library IEEE, vital2000, MACHXO2;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use MACHXO2.COMPONENTS.ALL;

  entity IO3_CB is
    -- miscellaneous vital GENERICs
    GENERIC (
      TimingChecksOn	: boolean := TRUE;
      XOn           	: boolean := FALSE;
      MsgOn         	: boolean := TRUE;
      InstancePath  	: string := "IO3_CB";

      tipd_PADDO  	: VitalDelayType01 := (0 ns, 0 ns);
      tpd_PADDO_IO3C	 : VitalDelayType01 := (0 ns, 0 ns));

    port (PADDO: in Std_logic; IO3C: out Std_logic);

    ATTRIBUTE Vital_Level0 OF IO3_CB : ENTITY IS TRUE;

  end IO3_CB;

  architecture Structure of IO3_CB is
    ATTRIBUTE Vital_Level0 OF Structure : ARCHITECTURE IS TRUE;

    signal PADDO_ipd 	: std_logic := 'X';
    signal IO3C_out 	: std_logic := 'X';

    signal GNDI: Std_logic;
    component gndB
      port (PWR0: out Std_logic);
    end component;
    component xo2iobuf0002
      port (I: in Std_logic; T: in Std_logic; PAD: out Std_logic);
    end component;
  begin
    IO3_C_pad: xo2iobuf0002
      port map (I=>PADDO_ipd, T=>GNDI, PAD=>IO3C_out);
    DRIVEGND: gndB
      port map (PWR0=>GNDI);

    --  INPUT PATH DELAYs
    WireDelay : BLOCK
    BEGIN
      VitalWireDelay(PADDO_ipd, PADDO, tipd_PADDO);
    END BLOCK;

    VitalBehavior : PROCESS (PADDO_ipd, IO3C_out)
    VARIABLE IO3C_zd         	: std_logic := 'X';
    VARIABLE IO3C_GlitchData 	: VitalGlitchDataType;


    BEGIN

    IF (TimingChecksOn) THEN

    END IF;

    IO3C_zd 	:= IO3C_out;

    VitalPathDelay01 (
      OutSignal => IO3C, OutSignalName => "IO3C", OutTemp => IO3C_zd,
      Paths      => (0 => (InputChangeTime => PADDO_ipd'last_event,
                           PathDelay => tpd_PADDO_IO3C,
                           PathCondition => TRUE)),
      GlitchData => IO3C_GlitchData,
      Mode       => vitaltransport, XOn => XOn, MsgOn => MsgOn);

    END PROCESS;

  end Structure;

-- entity IO2_CB
  library IEEE, vital2000, MACHXO2;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use MACHXO2.COMPONENTS.ALL;

  entity IO2_CB is
    -- miscellaneous vital GENERICs
    GENERIC (
      TimingChecksOn	: boolean := TRUE;
      XOn           	: boolean := FALSE;
      MsgOn         	: boolean := TRUE;
      InstancePath  	: string := "IO2_CB";

      tipd_PADDO  	: VitalDelayType01 := (0 ns, 0 ns);
      tpd_PADDO_IO2C	 : VitalDelayType01 := (0 ns, 0 ns));

    port (PADDO: in Std_logic; IO2C: out Std_logic);

    ATTRIBUTE Vital_Level0 OF IO2_CB : ENTITY IS TRUE;

  end IO2_CB;

  architecture Structure of IO2_CB is
    ATTRIBUTE Vital_Level0 OF Structure : ARCHITECTURE IS TRUE;

    signal PADDO_ipd 	: std_logic := 'X';
    signal IO2C_out 	: std_logic := 'X';

    signal GNDI: Std_logic;
    component gndB
      port (PWR0: out Std_logic);
    end component;
    component xo2iobuf0002
      port (I: in Std_logic; T: in Std_logic; PAD: out Std_logic);
    end component;
  begin
    IO2_C_pad: xo2iobuf0002
      port map (I=>PADDO_ipd, T=>GNDI, PAD=>IO2C_out);
    DRIVEGND: gndB
      port map (PWR0=>GNDI);

    --  INPUT PATH DELAYs
    WireDelay : BLOCK
    BEGIN
      VitalWireDelay(PADDO_ipd, PADDO, tipd_PADDO);
    END BLOCK;

    VitalBehavior : PROCESS (PADDO_ipd, IO2C_out)
    VARIABLE IO2C_zd         	: std_logic := 'X';
    VARIABLE IO2C_GlitchData 	: VitalGlitchDataType;


    BEGIN

    IF (TimingChecksOn) THEN

    END IF;

    IO2C_zd 	:= IO2C_out;

    VitalPathDelay01 (
      OutSignal => IO2C, OutSignalName => "IO2C", OutTemp => IO2C_zd,
      Paths      => (0 => (InputChangeTime => PADDO_ipd'last_event,
                           PathDelay => tpd_PADDO_IO2C,
                           PathCondition => TRUE)),
      GlitchData => IO2C_GlitchData,
      Mode       => vitaltransport, XOn => XOn, MsgOn => MsgOn);

    END PROCESS;

  end Structure;

-- entity IO1_CB
  library IEEE, vital2000, MACHXO2;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use MACHXO2.COMPONENTS.ALL;

  entity IO1_CB is
    -- miscellaneous vital GENERICs
    GENERIC (
      TimingChecksOn	: boolean := TRUE;
      XOn           	: boolean := FALSE;
      MsgOn         	: boolean := TRUE;
      InstancePath  	: string := "IO1_CB";

      tipd_PADDO  	: VitalDelayType01 := (0 ns, 0 ns);
      tpd_PADDO_IO1C	 : VitalDelayType01 := (0 ns, 0 ns));

    port (PADDO: in Std_logic; IO1C: out Std_logic);

    ATTRIBUTE Vital_Level0 OF IO1_CB : ENTITY IS TRUE;

  end IO1_CB;

  architecture Structure of IO1_CB is
    ATTRIBUTE Vital_Level0 OF Structure : ARCHITECTURE IS TRUE;

    signal PADDO_ipd 	: std_logic := 'X';
    signal IO1C_out 	: std_logic := 'X';

    signal GNDI: Std_logic;
    component gndB
      port (PWR0: out Std_logic);
    end component;
    component xo2iobuf0002
      port (I: in Std_logic; T: in Std_logic; PAD: out Std_logic);
    end component;
  begin
    IO1_C_pad: xo2iobuf0002
      port map (I=>PADDO_ipd, T=>GNDI, PAD=>IO1C_out);
    DRIVEGND: gndB
      port map (PWR0=>GNDI);

    --  INPUT PATH DELAYs
    WireDelay : BLOCK
    BEGIN
      VitalWireDelay(PADDO_ipd, PADDO, tipd_PADDO);
    END BLOCK;

    VitalBehavior : PROCESS (PADDO_ipd, IO1C_out)
    VARIABLE IO1C_zd         	: std_logic := 'X';
    VARIABLE IO1C_GlitchData 	: VitalGlitchDataType;


    BEGIN

    IF (TimingChecksOn) THEN

    END IF;

    IO1C_zd 	:= IO1C_out;

    VitalPathDelay01 (
      OutSignal => IO1C, OutSignalName => "IO1C", OutTemp => IO1C_zd,
      Paths      => (0 => (InputChangeTime => PADDO_ipd'last_event,
                           PathDelay => tpd_PADDO_IO1C,
                           PathCondition => TRUE)),
      GlitchData => IO1C_GlitchData,
      Mode       => vitaltransport, XOn => XOn, MsgOn => MsgOn);

    END PROCESS;

  end Structure;

-- entity IO0_CB
  library IEEE, vital2000, MACHXO2;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use MACHXO2.COMPONENTS.ALL;

  entity IO0_CB is
    -- miscellaneous vital GENERICs
    GENERIC (
      TimingChecksOn	: boolean := TRUE;
      XOn           	: boolean := FALSE;
      MsgOn         	: boolean := TRUE;
      InstancePath  	: string := "IO0_CB";

      tipd_PADDO  	: VitalDelayType01 := (0 ns, 0 ns);
      tpd_PADDO_IO0C	 : VitalDelayType01 := (0 ns, 0 ns));

    port (PADDO: in Std_logic; IO0C: out Std_logic);

    ATTRIBUTE Vital_Level0 OF IO0_CB : ENTITY IS TRUE;

  end IO0_CB;

  architecture Structure of IO0_CB is
    ATTRIBUTE Vital_Level0 OF Structure : ARCHITECTURE IS TRUE;

    signal PADDO_ipd 	: std_logic := 'X';
    signal IO0C_out 	: std_logic := 'X';

    signal GNDI: Std_logic;
    component gndB
      port (PWR0: out Std_logic);
    end component;
    component xo2iobuf0002
      port (I: in Std_logic; T: in Std_logic; PAD: out Std_logic);
    end component;
  begin
    IO0_C_pad: xo2iobuf0002
      port map (I=>PADDO_ipd, T=>GNDI, PAD=>IO0C_out);
    DRIVEGND: gndB
      port map (PWR0=>GNDI);

    --  INPUT PATH DELAYs
    WireDelay : BLOCK
    BEGIN
      VitalWireDelay(PADDO_ipd, PADDO, tipd_PADDO);
    END BLOCK;

    VitalBehavior : PROCESS (PADDO_ipd, IO0C_out)
    VARIABLE IO0C_zd         	: std_logic := 'X';
    VARIABLE IO0C_GlitchData 	: VitalGlitchDataType;


    BEGIN

    IF (TimingChecksOn) THEN

    END IF;

    IO0C_zd 	:= IO0C_out;

    VitalPathDelay01 (
      OutSignal => IO0C, OutSignalName => "IO0C", OutTemp => IO0C_zd,
      Paths      => (0 => (InputChangeTime => PADDO_ipd'last_event,
                           PathDelay => tpd_PADDO_IO0C,
                           PathCondition => TRUE)),
      GlitchData => IO0C_GlitchData,
      Mode       => vitaltransport, XOn => XOn, MsgOn => MsgOn);

    END PROCESS;

  end Structure;

-- entity PWM18B_CB
  library IEEE, vital2000, MACHXO2;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use MACHXO2.COMPONENTS.ALL;

  entity PWM18B_CB is
    -- miscellaneous vital GENERICs
    GENERIC (
      TimingChecksOn	: boolean := TRUE;
      XOn           	: boolean := FALSE;
      MsgOn         	: boolean := TRUE;
      InstancePath  	: string := "PWM18B_CB";

      tipd_PADDO  	: VitalDelayType01 := (0 ns, 0 ns);
      tpd_PADDO_PWM18BC	 : VitalDelayType01 := (0 ns, 0 ns));

    port (PADDO: in Std_logic; PWM18BC: out Std_logic);

    ATTRIBUTE Vital_Level0 OF PWM18B_CB : ENTITY IS TRUE;

  end PWM18B_CB;

  architecture Structure of PWM18B_CB is
    ATTRIBUTE Vital_Level0 OF Structure : ARCHITECTURE IS TRUE;

    signal PADDO_ipd 	: std_logic := 'X';
    signal PWM18BC_out 	: std_logic := 'X';

    signal VCCI: Std_logic;
    component xo2iobuf0001
      port (I: in Std_logic; T: in Std_logic; PAD: out Std_logic);
    end component;
    component vcc
      port (PWR1: out Std_logic);
    end component;
  begin
    PWM18B_C_pad: xo2iobuf0001
      port map (I=>PADDO_ipd, T=>VCCI, PAD=>PWM18BC_out);
    DRIVEVCC: vcc
      port map (PWR1=>VCCI);

    --  INPUT PATH DELAYs
    WireDelay : BLOCK
    BEGIN
      VitalWireDelay(PADDO_ipd, PADDO, tipd_PADDO);
    END BLOCK;

    VitalBehavior : PROCESS (PADDO_ipd, PWM18BC_out)
    VARIABLE PWM18BC_zd         	: std_logic := 'X';
    VARIABLE PWM18BC_GlitchData 	: VitalGlitchDataType;


    BEGIN

    IF (TimingChecksOn) THEN

    END IF;

    PWM18BC_zd 	:= PWM18BC_out;

    VitalPathDelay01 (
      OutSignal => PWM18BC, OutSignalName => "PWM18BC", OutTemp => PWM18BC_zd,
      Paths      => (0 => (InputChangeTime => PADDO_ipd'last_event,
                           PathDelay => tpd_PADDO_PWM18BC,
                           PathCondition => TRUE)),
      GlitchData => PWM18BC_GlitchData,
      Mode       => vitaltransport, XOn => XOn, MsgOn => MsgOn);

    END PROCESS;

  end Structure;

-- entity PWM18A_CB
  library IEEE, vital2000, MACHXO2;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use MACHXO2.COMPONENTS.ALL;

  entity PWM18A_CB is
    -- miscellaneous vital GENERICs
    GENERIC (
      TimingChecksOn	: boolean := TRUE;
      XOn           	: boolean := FALSE;
      MsgOn         	: boolean := TRUE;
      InstancePath  	: string := "PWM18A_CB";

      tipd_PADDO  	: VitalDelayType01 := (0 ns, 0 ns);
      tpd_PADDO_PWM18AC	 : VitalDelayType01 := (0 ns, 0 ns));

    port (PADDO: in Std_logic; PWM18AC: out Std_logic);

    ATTRIBUTE Vital_Level0 OF PWM18A_CB : ENTITY IS TRUE;

  end PWM18A_CB;

  architecture Structure of PWM18A_CB is
    ATTRIBUTE Vital_Level0 OF Structure : ARCHITECTURE IS TRUE;

    signal PADDO_ipd 	: std_logic := 'X';
    signal PWM18AC_out 	: std_logic := 'X';

    signal VCCI: Std_logic;
    component xo2iobuf0001
      port (I: in Std_logic; T: in Std_logic; PAD: out Std_logic);
    end component;
    component vcc
      port (PWR1: out Std_logic);
    end component;
  begin
    PWM18A_C_pad: xo2iobuf0001
      port map (I=>PADDO_ipd, T=>VCCI, PAD=>PWM18AC_out);
    DRIVEVCC: vcc
      port map (PWR1=>VCCI);

    --  INPUT PATH DELAYs
    WireDelay : BLOCK
    BEGIN
      VitalWireDelay(PADDO_ipd, PADDO, tipd_PADDO);
    END BLOCK;

    VitalBehavior : PROCESS (PADDO_ipd, PWM18AC_out)
    VARIABLE PWM18AC_zd         	: std_logic := 'X';
    VARIABLE PWM18AC_GlitchData 	: VitalGlitchDataType;


    BEGIN

    IF (TimingChecksOn) THEN

    END IF;

    PWM18AC_zd 	:= PWM18AC_out;

    VitalPathDelay01 (
      OutSignal => PWM18AC, OutSignalName => "PWM18AC", OutTemp => PWM18AC_zd,
      Paths      => (0 => (InputChangeTime => PADDO_ipd'last_event,
                           PathDelay => tpd_PADDO_PWM18AC,
                           PathCondition => TRUE)),
      GlitchData => PWM18AC_GlitchData,
      Mode       => vitaltransport, XOn => XOn, MsgOn => MsgOn);

    END PROCESS;

  end Structure;

-- entity PWM17B_CB
  library IEEE, vital2000, MACHXO2;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use MACHXO2.COMPONENTS.ALL;

  entity PWM17B_CB is
    -- miscellaneous vital GENERICs
    GENERIC (
      TimingChecksOn	: boolean := TRUE;
      XOn           	: boolean := FALSE;
      MsgOn         	: boolean := TRUE;
      InstancePath  	: string := "PWM17B_CB";

      tipd_PADDO  	: VitalDelayType01 := (0 ns, 0 ns);
      tpd_PADDO_PWM17BC	 : VitalDelayType01 := (0 ns, 0 ns));

    port (PADDO: in Std_logic; PWM17BC: out Std_logic);

    ATTRIBUTE Vital_Level0 OF PWM17B_CB : ENTITY IS TRUE;

  end PWM17B_CB;

  architecture Structure of PWM17B_CB is
    ATTRIBUTE Vital_Level0 OF Structure : ARCHITECTURE IS TRUE;

    signal PADDO_ipd 	: std_logic := 'X';
    signal PWM17BC_out 	: std_logic := 'X';

    signal VCCI: Std_logic;
    component xo2iobuf0001
      port (I: in Std_logic; T: in Std_logic; PAD: out Std_logic);
    end component;
    component vcc
      port (PWR1: out Std_logic);
    end component;
  begin
    PWM17B_C_pad: xo2iobuf0001
      port map (I=>PADDO_ipd, T=>VCCI, PAD=>PWM17BC_out);
    DRIVEVCC: vcc
      port map (PWR1=>VCCI);

    --  INPUT PATH DELAYs
    WireDelay : BLOCK
    BEGIN
      VitalWireDelay(PADDO_ipd, PADDO, tipd_PADDO);
    END BLOCK;

    VitalBehavior : PROCESS (PADDO_ipd, PWM17BC_out)
    VARIABLE PWM17BC_zd         	: std_logic := 'X';
    VARIABLE PWM17BC_GlitchData 	: VitalGlitchDataType;


    BEGIN

    IF (TimingChecksOn) THEN

    END IF;

    PWM17BC_zd 	:= PWM17BC_out;

    VitalPathDelay01 (
      OutSignal => PWM17BC, OutSignalName => "PWM17BC", OutTemp => PWM17BC_zd,
      Paths      => (0 => (InputChangeTime => PADDO_ipd'last_event,
                           PathDelay => tpd_PADDO_PWM17BC,
                           PathCondition => TRUE)),
      GlitchData => PWM17BC_GlitchData,
      Mode       => vitaltransport, XOn => XOn, MsgOn => MsgOn);

    END PROCESS;

  end Structure;

-- entity PWM17A_CB
  library IEEE, vital2000, MACHXO2;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use MACHXO2.COMPONENTS.ALL;

  entity PWM17A_CB is
    -- miscellaneous vital GENERICs
    GENERIC (
      TimingChecksOn	: boolean := TRUE;
      XOn           	: boolean := FALSE;
      MsgOn         	: boolean := TRUE;
      InstancePath  	: string := "PWM17A_CB";

      tipd_PADDO  	: VitalDelayType01 := (0 ns, 0 ns);
      tpd_PADDO_PWM17AC	 : VitalDelayType01 := (0 ns, 0 ns));

    port (PADDO: in Std_logic; PWM17AC: out Std_logic);

    ATTRIBUTE Vital_Level0 OF PWM17A_CB : ENTITY IS TRUE;

  end PWM17A_CB;

  architecture Structure of PWM17A_CB is
    ATTRIBUTE Vital_Level0 OF Structure : ARCHITECTURE IS TRUE;

    signal PADDO_ipd 	: std_logic := 'X';
    signal PWM17AC_out 	: std_logic := 'X';

    signal VCCI: Std_logic;
    component xo2iobuf0001
      port (I: in Std_logic; T: in Std_logic; PAD: out Std_logic);
    end component;
    component vcc
      port (PWR1: out Std_logic);
    end component;
  begin
    PWM17A_C_pad: xo2iobuf0001
      port map (I=>PADDO_ipd, T=>VCCI, PAD=>PWM17AC_out);
    DRIVEVCC: vcc
      port map (PWR1=>VCCI);

    --  INPUT PATH DELAYs
    WireDelay : BLOCK
    BEGIN
      VitalWireDelay(PADDO_ipd, PADDO, tipd_PADDO);
    END BLOCK;

    VitalBehavior : PROCESS (PADDO_ipd, PWM17AC_out)
    VARIABLE PWM17AC_zd         	: std_logic := 'X';
    VARIABLE PWM17AC_GlitchData 	: VitalGlitchDataType;


    BEGIN

    IF (TimingChecksOn) THEN

    END IF;

    PWM17AC_zd 	:= PWM17AC_out;

    VitalPathDelay01 (
      OutSignal => PWM17AC, OutSignalName => "PWM17AC", OutTemp => PWM17AC_zd,
      Paths      => (0 => (InputChangeTime => PADDO_ipd'last_event,
                           PathDelay => tpd_PADDO_PWM17AC,
                           PathCondition => TRUE)),
      GlitchData => PWM17AC_GlitchData,
      Mode       => vitaltransport, XOn => XOn, MsgOn => MsgOn);

    END PROCESS;

  end Structure;

-- entity PWM16B_CB
  library IEEE, vital2000, MACHXO2;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use MACHXO2.COMPONENTS.ALL;

  entity PWM16B_CB is
    -- miscellaneous vital GENERICs
    GENERIC (
      TimingChecksOn	: boolean := TRUE;
      XOn           	: boolean := FALSE;
      MsgOn         	: boolean := TRUE;
      InstancePath  	: string := "PWM16B_CB";

      tipd_PADDO  	: VitalDelayType01 := (0 ns, 0 ns);
      tpd_PADDO_PWM16BC	 : VitalDelayType01 := (0 ns, 0 ns));

    port (PADDO: in Std_logic; PWM16BC: out Std_logic);

    ATTRIBUTE Vital_Level0 OF PWM16B_CB : ENTITY IS TRUE;

  end PWM16B_CB;

  architecture Structure of PWM16B_CB is
    ATTRIBUTE Vital_Level0 OF Structure : ARCHITECTURE IS TRUE;

    signal PADDO_ipd 	: std_logic := 'X';
    signal PWM16BC_out 	: std_logic := 'X';

    signal VCCI: Std_logic;
    component xo2iobuf0001
      port (I: in Std_logic; T: in Std_logic; PAD: out Std_logic);
    end component;
    component vcc
      port (PWR1: out Std_logic);
    end component;
  begin
    PWM16B_C_pad: xo2iobuf0001
      port map (I=>PADDO_ipd, T=>VCCI, PAD=>PWM16BC_out);
    DRIVEVCC: vcc
      port map (PWR1=>VCCI);

    --  INPUT PATH DELAYs
    WireDelay : BLOCK
    BEGIN
      VitalWireDelay(PADDO_ipd, PADDO, tipd_PADDO);
    END BLOCK;

    VitalBehavior : PROCESS (PADDO_ipd, PWM16BC_out)
    VARIABLE PWM16BC_zd         	: std_logic := 'X';
    VARIABLE PWM16BC_GlitchData 	: VitalGlitchDataType;


    BEGIN

    IF (TimingChecksOn) THEN

    END IF;

    PWM16BC_zd 	:= PWM16BC_out;

    VitalPathDelay01 (
      OutSignal => PWM16BC, OutSignalName => "PWM16BC", OutTemp => PWM16BC_zd,
      Paths      => (0 => (InputChangeTime => PADDO_ipd'last_event,
                           PathDelay => tpd_PADDO_PWM16BC,
                           PathCondition => TRUE)),
      GlitchData => PWM16BC_GlitchData,
      Mode       => vitaltransport, XOn => XOn, MsgOn => MsgOn);

    END PROCESS;

  end Structure;

-- entity PWM16A_CB
  library IEEE, vital2000, MACHXO2;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use MACHXO2.COMPONENTS.ALL;

  entity PWM16A_CB is
    -- miscellaneous vital GENERICs
    GENERIC (
      TimingChecksOn	: boolean := TRUE;
      XOn           	: boolean := FALSE;
      MsgOn         	: boolean := TRUE;
      InstancePath  	: string := "PWM16A_CB";

      tipd_PADDO  	: VitalDelayType01 := (0 ns, 0 ns);
      tpd_PADDO_PWM16AC	 : VitalDelayType01 := (0 ns, 0 ns));

    port (PADDO: in Std_logic; PWM16AC: out Std_logic);

    ATTRIBUTE Vital_Level0 OF PWM16A_CB : ENTITY IS TRUE;

  end PWM16A_CB;

  architecture Structure of PWM16A_CB is
    ATTRIBUTE Vital_Level0 OF Structure : ARCHITECTURE IS TRUE;

    signal PADDO_ipd 	: std_logic := 'X';
    signal PWM16AC_out 	: std_logic := 'X';

    signal VCCI: Std_logic;
    component xo2iobuf0001
      port (I: in Std_logic; T: in Std_logic; PAD: out Std_logic);
    end component;
    component vcc
      port (PWR1: out Std_logic);
    end component;
  begin
    PWM16A_C_pad: xo2iobuf0001
      port map (I=>PADDO_ipd, T=>VCCI, PAD=>PWM16AC_out);
    DRIVEVCC: vcc
      port map (PWR1=>VCCI);

    --  INPUT PATH DELAYs
    WireDelay : BLOCK
    BEGIN
      VitalWireDelay(PADDO_ipd, PADDO, tipd_PADDO);
    END BLOCK;

    VitalBehavior : PROCESS (PADDO_ipd, PWM16AC_out)
    VARIABLE PWM16AC_zd         	: std_logic := 'X';
    VARIABLE PWM16AC_GlitchData 	: VitalGlitchDataType;


    BEGIN

    IF (TimingChecksOn) THEN

    END IF;

    PWM16AC_zd 	:= PWM16AC_out;

    VitalPathDelay01 (
      OutSignal => PWM16AC, OutSignalName => "PWM16AC", OutTemp => PWM16AC_zd,
      Paths      => (0 => (InputChangeTime => PADDO_ipd'last_event,
                           PathDelay => tpd_PADDO_PWM16AC,
                           PathCondition => TRUE)),
      GlitchData => PWM16AC_GlitchData,
      Mode       => vitaltransport, XOn => XOn, MsgOn => MsgOn);

    END PROCESS;

  end Structure;

-- entity PWM15B_CB
  library IEEE, vital2000, MACHXO2;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use MACHXO2.COMPONENTS.ALL;

  entity PWM15B_CB is
    -- miscellaneous vital GENERICs
    GENERIC (
      TimingChecksOn	: boolean := TRUE;
      XOn           	: boolean := FALSE;
      MsgOn         	: boolean := TRUE;
      InstancePath  	: string := "PWM15B_CB";

      tipd_PADDO  	: VitalDelayType01 := (0 ns, 0 ns);
      tpd_PADDO_PWM15BC	 : VitalDelayType01 := (0 ns, 0 ns));

    port (PADDO: in Std_logic; PWM15BC: out Std_logic);

    ATTRIBUTE Vital_Level0 OF PWM15B_CB : ENTITY IS TRUE;

  end PWM15B_CB;

  architecture Structure of PWM15B_CB is
    ATTRIBUTE Vital_Level0 OF Structure : ARCHITECTURE IS TRUE;

    signal PADDO_ipd 	: std_logic := 'X';
    signal PWM15BC_out 	: std_logic := 'X';

    signal VCCI: Std_logic;
    component xo2iobuf0001
      port (I: in Std_logic; T: in Std_logic; PAD: out Std_logic);
    end component;
    component vcc
      port (PWR1: out Std_logic);
    end component;
  begin
    PWM15B_C_pad: xo2iobuf0001
      port map (I=>PADDO_ipd, T=>VCCI, PAD=>PWM15BC_out);
    DRIVEVCC: vcc
      port map (PWR1=>VCCI);

    --  INPUT PATH DELAYs
    WireDelay : BLOCK
    BEGIN
      VitalWireDelay(PADDO_ipd, PADDO, tipd_PADDO);
    END BLOCK;

    VitalBehavior : PROCESS (PADDO_ipd, PWM15BC_out)
    VARIABLE PWM15BC_zd         	: std_logic := 'X';
    VARIABLE PWM15BC_GlitchData 	: VitalGlitchDataType;


    BEGIN

    IF (TimingChecksOn) THEN

    END IF;

    PWM15BC_zd 	:= PWM15BC_out;

    VitalPathDelay01 (
      OutSignal => PWM15BC, OutSignalName => "PWM15BC", OutTemp => PWM15BC_zd,
      Paths      => (0 => (InputChangeTime => PADDO_ipd'last_event,
                           PathDelay => tpd_PADDO_PWM15BC,
                           PathCondition => TRUE)),
      GlitchData => PWM15BC_GlitchData,
      Mode       => vitaltransport, XOn => XOn, MsgOn => MsgOn);

    END PROCESS;

  end Structure;

-- entity PWM15A_CB
  library IEEE, vital2000, MACHXO2;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use MACHXO2.COMPONENTS.ALL;

  entity PWM15A_CB is
    -- miscellaneous vital GENERICs
    GENERIC (
      TimingChecksOn	: boolean := TRUE;
      XOn           	: boolean := FALSE;
      MsgOn         	: boolean := TRUE;
      InstancePath  	: string := "PWM15A_CB";

      tipd_PADDO  	: VitalDelayType01 := (0 ns, 0 ns);
      tpd_PADDO_PWM15AC	 : VitalDelayType01 := (0 ns, 0 ns));

    port (PADDO: in Std_logic; PWM15AC: out Std_logic);

    ATTRIBUTE Vital_Level0 OF PWM15A_CB : ENTITY IS TRUE;

  end PWM15A_CB;

  architecture Structure of PWM15A_CB is
    ATTRIBUTE Vital_Level0 OF Structure : ARCHITECTURE IS TRUE;

    signal PADDO_ipd 	: std_logic := 'X';
    signal PWM15AC_out 	: std_logic := 'X';

    signal VCCI: Std_logic;
    component xo2iobuf0001
      port (I: in Std_logic; T: in Std_logic; PAD: out Std_logic);
    end component;
    component vcc
      port (PWR1: out Std_logic);
    end component;
  begin
    PWM15A_C_pad: xo2iobuf0001
      port map (I=>PADDO_ipd, T=>VCCI, PAD=>PWM15AC_out);
    DRIVEVCC: vcc
      port map (PWR1=>VCCI);

    --  INPUT PATH DELAYs
    WireDelay : BLOCK
    BEGIN
      VitalWireDelay(PADDO_ipd, PADDO, tipd_PADDO);
    END BLOCK;

    VitalBehavior : PROCESS (PADDO_ipd, PWM15AC_out)
    VARIABLE PWM15AC_zd         	: std_logic := 'X';
    VARIABLE PWM15AC_GlitchData 	: VitalGlitchDataType;


    BEGIN

    IF (TimingChecksOn) THEN

    END IF;

    PWM15AC_zd 	:= PWM15AC_out;

    VitalPathDelay01 (
      OutSignal => PWM15AC, OutSignalName => "PWM15AC", OutTemp => PWM15AC_zd,
      Paths      => (0 => (InputChangeTime => PADDO_ipd'last_event,
                           PathDelay => tpd_PADDO_PWM15AC,
                           PathCondition => TRUE)),
      GlitchData => PWM15AC_GlitchData,
      Mode       => vitaltransport, XOn => XOn, MsgOn => MsgOn);

    END PROCESS;

  end Structure;

-- entity PWM14B_CB
  library IEEE, vital2000, MACHXO2;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use MACHXO2.COMPONENTS.ALL;

  entity PWM14B_CB is
    -- miscellaneous vital GENERICs
    GENERIC (
      TimingChecksOn	: boolean := TRUE;
      XOn           	: boolean := FALSE;
      MsgOn         	: boolean := TRUE;
      InstancePath  	: string := "PWM14B_CB";

      tipd_PADDO  	: VitalDelayType01 := (0 ns, 0 ns);
      tpd_PADDO_PWM14BC	 : VitalDelayType01 := (0 ns, 0 ns));

    port (PADDO: in Std_logic; PWM14BC: out Std_logic);

    ATTRIBUTE Vital_Level0 OF PWM14B_CB : ENTITY IS TRUE;

  end PWM14B_CB;

  architecture Structure of PWM14B_CB is
    ATTRIBUTE Vital_Level0 OF Structure : ARCHITECTURE IS TRUE;

    signal PADDO_ipd 	: std_logic := 'X';
    signal PWM14BC_out 	: std_logic := 'X';

    signal VCCI: Std_logic;
    component xo2iobuf0001
      port (I: in Std_logic; T: in Std_logic; PAD: out Std_logic);
    end component;
    component vcc
      port (PWR1: out Std_logic);
    end component;
  begin
    PWM14B_C_pad: xo2iobuf0001
      port map (I=>PADDO_ipd, T=>VCCI, PAD=>PWM14BC_out);
    DRIVEVCC: vcc
      port map (PWR1=>VCCI);

    --  INPUT PATH DELAYs
    WireDelay : BLOCK
    BEGIN
      VitalWireDelay(PADDO_ipd, PADDO, tipd_PADDO);
    END BLOCK;

    VitalBehavior : PROCESS (PADDO_ipd, PWM14BC_out)
    VARIABLE PWM14BC_zd         	: std_logic := 'X';
    VARIABLE PWM14BC_GlitchData 	: VitalGlitchDataType;


    BEGIN

    IF (TimingChecksOn) THEN

    END IF;

    PWM14BC_zd 	:= PWM14BC_out;

    VitalPathDelay01 (
      OutSignal => PWM14BC, OutSignalName => "PWM14BC", OutTemp => PWM14BC_zd,
      Paths      => (0 => (InputChangeTime => PADDO_ipd'last_event,
                           PathDelay => tpd_PADDO_PWM14BC,
                           PathCondition => TRUE)),
      GlitchData => PWM14BC_GlitchData,
      Mode       => vitaltransport, XOn => XOn, MsgOn => MsgOn);

    END PROCESS;

  end Structure;

-- entity PWM14A_CB
  library IEEE, vital2000, MACHXO2;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use MACHXO2.COMPONENTS.ALL;

  entity PWM14A_CB is
    -- miscellaneous vital GENERICs
    GENERIC (
      TimingChecksOn	: boolean := TRUE;
      XOn           	: boolean := FALSE;
      MsgOn         	: boolean := TRUE;
      InstancePath  	: string := "PWM14A_CB";

      tipd_PADDO  	: VitalDelayType01 := (0 ns, 0 ns);
      tpd_PADDO_PWM14AC	 : VitalDelayType01 := (0 ns, 0 ns));

    port (PADDO: in Std_logic; PWM14AC: out Std_logic);

    ATTRIBUTE Vital_Level0 OF PWM14A_CB : ENTITY IS TRUE;

  end PWM14A_CB;

  architecture Structure of PWM14A_CB is
    ATTRIBUTE Vital_Level0 OF Structure : ARCHITECTURE IS TRUE;

    signal PADDO_ipd 	: std_logic := 'X';
    signal PWM14AC_out 	: std_logic := 'X';

    signal VCCI: Std_logic;
    component xo2iobuf0001
      port (I: in Std_logic; T: in Std_logic; PAD: out Std_logic);
    end component;
    component vcc
      port (PWR1: out Std_logic);
    end component;
  begin
    PWM14A_C_pad: xo2iobuf0001
      port map (I=>PADDO_ipd, T=>VCCI, PAD=>PWM14AC_out);
    DRIVEVCC: vcc
      port map (PWR1=>VCCI);

    --  INPUT PATH DELAYs
    WireDelay : BLOCK
    BEGIN
      VitalWireDelay(PADDO_ipd, PADDO, tipd_PADDO);
    END BLOCK;

    VitalBehavior : PROCESS (PADDO_ipd, PWM14AC_out)
    VARIABLE PWM14AC_zd         	: std_logic := 'X';
    VARIABLE PWM14AC_GlitchData 	: VitalGlitchDataType;


    BEGIN

    IF (TimingChecksOn) THEN

    END IF;

    PWM14AC_zd 	:= PWM14AC_out;

    VitalPathDelay01 (
      OutSignal => PWM14AC, OutSignalName => "PWM14AC", OutTemp => PWM14AC_zd,
      Paths      => (0 => (InputChangeTime => PADDO_ipd'last_event,
                           PathDelay => tpd_PADDO_PWM14AC,
                           PathCondition => TRUE)),
      GlitchData => PWM14AC_GlitchData,
      Mode       => vitaltransport, XOn => XOn, MsgOn => MsgOn);

    END PROCESS;

  end Structure;

-- entity PWM13B_CB
  library IEEE, vital2000, MACHXO2;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use MACHXO2.COMPONENTS.ALL;

  entity PWM13B_CB is
    -- miscellaneous vital GENERICs
    GENERIC (
      TimingChecksOn	: boolean := TRUE;
      XOn           	: boolean := FALSE;
      MsgOn         	: boolean := TRUE;
      InstancePath  	: string := "PWM13B_CB";

      tipd_PADDO  	: VitalDelayType01 := (0 ns, 0 ns);
      tpd_PADDO_PWM13BC	 : VitalDelayType01 := (0 ns, 0 ns));

    port (PADDO: in Std_logic; PWM13BC: out Std_logic);

    ATTRIBUTE Vital_Level0 OF PWM13B_CB : ENTITY IS TRUE;

  end PWM13B_CB;

  architecture Structure of PWM13B_CB is
    ATTRIBUTE Vital_Level0 OF Structure : ARCHITECTURE IS TRUE;

    signal PADDO_ipd 	: std_logic := 'X';
    signal PWM13BC_out 	: std_logic := 'X';

    signal VCCI: Std_logic;
    component xo2iobuf0001
      port (I: in Std_logic; T: in Std_logic; PAD: out Std_logic);
    end component;
    component vcc
      port (PWR1: out Std_logic);
    end component;
  begin
    PWM13B_C_pad: xo2iobuf0001
      port map (I=>PADDO_ipd, T=>VCCI, PAD=>PWM13BC_out);
    DRIVEVCC: vcc
      port map (PWR1=>VCCI);

    --  INPUT PATH DELAYs
    WireDelay : BLOCK
    BEGIN
      VitalWireDelay(PADDO_ipd, PADDO, tipd_PADDO);
    END BLOCK;

    VitalBehavior : PROCESS (PADDO_ipd, PWM13BC_out)
    VARIABLE PWM13BC_zd         	: std_logic := 'X';
    VARIABLE PWM13BC_GlitchData 	: VitalGlitchDataType;


    BEGIN

    IF (TimingChecksOn) THEN

    END IF;

    PWM13BC_zd 	:= PWM13BC_out;

    VitalPathDelay01 (
      OutSignal => PWM13BC, OutSignalName => "PWM13BC", OutTemp => PWM13BC_zd,
      Paths      => (0 => (InputChangeTime => PADDO_ipd'last_event,
                           PathDelay => tpd_PADDO_PWM13BC,
                           PathCondition => TRUE)),
      GlitchData => PWM13BC_GlitchData,
      Mode       => vitaltransport, XOn => XOn, MsgOn => MsgOn);

    END PROCESS;

  end Structure;

-- entity PWM13A_CB
  library IEEE, vital2000, MACHXO2;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use MACHXO2.COMPONENTS.ALL;

  entity PWM13A_CB is
    -- miscellaneous vital GENERICs
    GENERIC (
      TimingChecksOn	: boolean := TRUE;
      XOn           	: boolean := FALSE;
      MsgOn         	: boolean := TRUE;
      InstancePath  	: string := "PWM13A_CB";

      tipd_PADDO  	: VitalDelayType01 := (0 ns, 0 ns);
      tpd_PADDO_PWM13AC	 : VitalDelayType01 := (0 ns, 0 ns));

    port (PADDO: in Std_logic; PWM13AC: out Std_logic);

    ATTRIBUTE Vital_Level0 OF PWM13A_CB : ENTITY IS TRUE;

  end PWM13A_CB;

  architecture Structure of PWM13A_CB is
    ATTRIBUTE Vital_Level0 OF Structure : ARCHITECTURE IS TRUE;

    signal PADDO_ipd 	: std_logic := 'X';
    signal PWM13AC_out 	: std_logic := 'X';

    signal VCCI: Std_logic;
    component xo2iobuf0001
      port (I: in Std_logic; T: in Std_logic; PAD: out Std_logic);
    end component;
    component vcc
      port (PWR1: out Std_logic);
    end component;
  begin
    PWM13A_C_pad: xo2iobuf0001
      port map (I=>PADDO_ipd, T=>VCCI, PAD=>PWM13AC_out);
    DRIVEVCC: vcc
      port map (PWR1=>VCCI);

    --  INPUT PATH DELAYs
    WireDelay : BLOCK
    BEGIN
      VitalWireDelay(PADDO_ipd, PADDO, tipd_PADDO);
    END BLOCK;

    VitalBehavior : PROCESS (PADDO_ipd, PWM13AC_out)
    VARIABLE PWM13AC_zd         	: std_logic := 'X';
    VARIABLE PWM13AC_GlitchData 	: VitalGlitchDataType;


    BEGIN

    IF (TimingChecksOn) THEN

    END IF;

    PWM13AC_zd 	:= PWM13AC_out;

    VitalPathDelay01 (
      OutSignal => PWM13AC, OutSignalName => "PWM13AC", OutTemp => PWM13AC_zd,
      Paths      => (0 => (InputChangeTime => PADDO_ipd'last_event,
                           PathDelay => tpd_PADDO_PWM13AC,
                           PathCondition => TRUE)),
      GlitchData => PWM13AC_GlitchData,
      Mode       => vitaltransport, XOn => XOn, MsgOn => MsgOn);

    END PROCESS;

  end Structure;

-- entity PWM12B_CB
  library IEEE, vital2000, MACHXO2;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use MACHXO2.COMPONENTS.ALL;

  entity PWM12B_CB is
    -- miscellaneous vital GENERICs
    GENERIC (
      TimingChecksOn	: boolean := TRUE;
      XOn           	: boolean := FALSE;
      MsgOn         	: boolean := TRUE;
      InstancePath  	: string := "PWM12B_CB";

      tipd_PADDO  	: VitalDelayType01 := (0 ns, 0 ns);
      tpd_PADDO_PWM12BC	 : VitalDelayType01 := (0 ns, 0 ns));

    port (PADDO: in Std_logic; PWM12BC: out Std_logic);

    ATTRIBUTE Vital_Level0 OF PWM12B_CB : ENTITY IS TRUE;

  end PWM12B_CB;

  architecture Structure of PWM12B_CB is
    ATTRIBUTE Vital_Level0 OF Structure : ARCHITECTURE IS TRUE;

    signal PADDO_ipd 	: std_logic := 'X';
    signal PWM12BC_out 	: std_logic := 'X';

    signal VCCI: Std_logic;
    component xo2iobuf0001
      port (I: in Std_logic; T: in Std_logic; PAD: out Std_logic);
    end component;
    component vcc
      port (PWR1: out Std_logic);
    end component;
  begin
    PWM12B_C_pad: xo2iobuf0001
      port map (I=>PADDO_ipd, T=>VCCI, PAD=>PWM12BC_out);
    DRIVEVCC: vcc
      port map (PWR1=>VCCI);

    --  INPUT PATH DELAYs
    WireDelay : BLOCK
    BEGIN
      VitalWireDelay(PADDO_ipd, PADDO, tipd_PADDO);
    END BLOCK;

    VitalBehavior : PROCESS (PADDO_ipd, PWM12BC_out)
    VARIABLE PWM12BC_zd         	: std_logic := 'X';
    VARIABLE PWM12BC_GlitchData 	: VitalGlitchDataType;


    BEGIN

    IF (TimingChecksOn) THEN

    END IF;

    PWM12BC_zd 	:= PWM12BC_out;

    VitalPathDelay01 (
      OutSignal => PWM12BC, OutSignalName => "PWM12BC", OutTemp => PWM12BC_zd,
      Paths      => (0 => (InputChangeTime => PADDO_ipd'last_event,
                           PathDelay => tpd_PADDO_PWM12BC,
                           PathCondition => TRUE)),
      GlitchData => PWM12BC_GlitchData,
      Mode       => vitaltransport, XOn => XOn, MsgOn => MsgOn);

    END PROCESS;

  end Structure;

-- entity PWM12A_CB
  library IEEE, vital2000, MACHXO2;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use MACHXO2.COMPONENTS.ALL;

  entity PWM12A_CB is
    -- miscellaneous vital GENERICs
    GENERIC (
      TimingChecksOn	: boolean := TRUE;
      XOn           	: boolean := FALSE;
      MsgOn         	: boolean := TRUE;
      InstancePath  	: string := "PWM12A_CB";

      tipd_PADDO  	: VitalDelayType01 := (0 ns, 0 ns);
      tpd_PADDO_PWM12AC	 : VitalDelayType01 := (0 ns, 0 ns));

    port (PADDO: in Std_logic; PWM12AC: out Std_logic);

    ATTRIBUTE Vital_Level0 OF PWM12A_CB : ENTITY IS TRUE;

  end PWM12A_CB;

  architecture Structure of PWM12A_CB is
    ATTRIBUTE Vital_Level0 OF Structure : ARCHITECTURE IS TRUE;

    signal PADDO_ipd 	: std_logic := 'X';
    signal PWM12AC_out 	: std_logic := 'X';

    signal VCCI: Std_logic;
    component xo2iobuf0001
      port (I: in Std_logic; T: in Std_logic; PAD: out Std_logic);
    end component;
    component vcc
      port (PWR1: out Std_logic);
    end component;
  begin
    PWM12A_C_pad: xo2iobuf0001
      port map (I=>PADDO_ipd, T=>VCCI, PAD=>PWM12AC_out);
    DRIVEVCC: vcc
      port map (PWR1=>VCCI);

    --  INPUT PATH DELAYs
    WireDelay : BLOCK
    BEGIN
      VitalWireDelay(PADDO_ipd, PADDO, tipd_PADDO);
    END BLOCK;

    VitalBehavior : PROCESS (PADDO_ipd, PWM12AC_out)
    VARIABLE PWM12AC_zd         	: std_logic := 'X';
    VARIABLE PWM12AC_GlitchData 	: VitalGlitchDataType;


    BEGIN

    IF (TimingChecksOn) THEN

    END IF;

    PWM12AC_zd 	:= PWM12AC_out;

    VitalPathDelay01 (
      OutSignal => PWM12AC, OutSignalName => "PWM12AC", OutTemp => PWM12AC_zd,
      Paths      => (0 => (InputChangeTime => PADDO_ipd'last_event,
                           PathDelay => tpd_PADDO_PWM12AC,
                           PathCondition => TRUE)),
      GlitchData => PWM12AC_GlitchData,
      Mode       => vitaltransport, XOn => XOn, MsgOn => MsgOn);

    END PROCESS;

  end Structure;

-- entity PWM11B_CB
  library IEEE, vital2000, MACHXO2;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use MACHXO2.COMPONENTS.ALL;

  entity PWM11B_CB is
    -- miscellaneous vital GENERICs
    GENERIC (
      TimingChecksOn	: boolean := TRUE;
      XOn           	: boolean := FALSE;
      MsgOn         	: boolean := TRUE;
      InstancePath  	: string := "PWM11B_CB";

      tipd_PADDO  	: VitalDelayType01 := (0 ns, 0 ns);
      tpd_PADDO_PWM11BC	 : VitalDelayType01 := (0 ns, 0 ns));

    port (PADDO: in Std_logic; PWM11BC: out Std_logic);

    ATTRIBUTE Vital_Level0 OF PWM11B_CB : ENTITY IS TRUE;

  end PWM11B_CB;

  architecture Structure of PWM11B_CB is
    ATTRIBUTE Vital_Level0 OF Structure : ARCHITECTURE IS TRUE;

    signal PADDO_ipd 	: std_logic := 'X';
    signal PWM11BC_out 	: std_logic := 'X';

    signal VCCI: Std_logic;
    component xo2iobuf0001
      port (I: in Std_logic; T: in Std_logic; PAD: out Std_logic);
    end component;
    component vcc
      port (PWR1: out Std_logic);
    end component;
  begin
    PWM11B_C_pad: xo2iobuf0001
      port map (I=>PADDO_ipd, T=>VCCI, PAD=>PWM11BC_out);
    DRIVEVCC: vcc
      port map (PWR1=>VCCI);

    --  INPUT PATH DELAYs
    WireDelay : BLOCK
    BEGIN
      VitalWireDelay(PADDO_ipd, PADDO, tipd_PADDO);
    END BLOCK;

    VitalBehavior : PROCESS (PADDO_ipd, PWM11BC_out)
    VARIABLE PWM11BC_zd         	: std_logic := 'X';
    VARIABLE PWM11BC_GlitchData 	: VitalGlitchDataType;


    BEGIN

    IF (TimingChecksOn) THEN

    END IF;

    PWM11BC_zd 	:= PWM11BC_out;

    VitalPathDelay01 (
      OutSignal => PWM11BC, OutSignalName => "PWM11BC", OutTemp => PWM11BC_zd,
      Paths      => (0 => (InputChangeTime => PADDO_ipd'last_event,
                           PathDelay => tpd_PADDO_PWM11BC,
                           PathCondition => TRUE)),
      GlitchData => PWM11BC_GlitchData,
      Mode       => vitaltransport, XOn => XOn, MsgOn => MsgOn);

    END PROCESS;

  end Structure;

-- entity PWM11A_CB
  library IEEE, vital2000, MACHXO2;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use MACHXO2.COMPONENTS.ALL;

  entity PWM11A_CB is
    -- miscellaneous vital GENERICs
    GENERIC (
      TimingChecksOn	: boolean := TRUE;
      XOn           	: boolean := FALSE;
      MsgOn         	: boolean := TRUE;
      InstancePath  	: string := "PWM11A_CB";

      tipd_PADDO  	: VitalDelayType01 := (0 ns, 0 ns);
      tpd_PADDO_PWM11AC	 : VitalDelayType01 := (0 ns, 0 ns));

    port (PADDO: in Std_logic; PWM11AC: out Std_logic);

    ATTRIBUTE Vital_Level0 OF PWM11A_CB : ENTITY IS TRUE;

  end PWM11A_CB;

  architecture Structure of PWM11A_CB is
    ATTRIBUTE Vital_Level0 OF Structure : ARCHITECTURE IS TRUE;

    signal PADDO_ipd 	: std_logic := 'X';
    signal PWM11AC_out 	: std_logic := 'X';

    signal VCCI: Std_logic;
    component xo2iobuf0001
      port (I: in Std_logic; T: in Std_logic; PAD: out Std_logic);
    end component;
    component vcc
      port (PWR1: out Std_logic);
    end component;
  begin
    PWM11A_C_pad: xo2iobuf0001
      port map (I=>PADDO_ipd, T=>VCCI, PAD=>PWM11AC_out);
    DRIVEVCC: vcc
      port map (PWR1=>VCCI);

    --  INPUT PATH DELAYs
    WireDelay : BLOCK
    BEGIN
      VitalWireDelay(PADDO_ipd, PADDO, tipd_PADDO);
    END BLOCK;

    VitalBehavior : PROCESS (PADDO_ipd, PWM11AC_out)
    VARIABLE PWM11AC_zd         	: std_logic := 'X';
    VARIABLE PWM11AC_GlitchData 	: VitalGlitchDataType;


    BEGIN

    IF (TimingChecksOn) THEN

    END IF;

    PWM11AC_zd 	:= PWM11AC_out;

    VitalPathDelay01 (
      OutSignal => PWM11AC, OutSignalName => "PWM11AC", OutTemp => PWM11AC_zd,
      Paths      => (0 => (InputChangeTime => PADDO_ipd'last_event,
                           PathDelay => tpd_PADDO_PWM11AC,
                           PathCondition => TRUE)),
      GlitchData => PWM11AC_GlitchData,
      Mode       => vitaltransport, XOn => XOn, MsgOn => MsgOn);

    END PROCESS;

  end Structure;

-- entity PWM10B_CB
  library IEEE, vital2000, MACHXO2;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use MACHXO2.COMPONENTS.ALL;

  entity PWM10B_CB is
    -- miscellaneous vital GENERICs
    GENERIC (
      TimingChecksOn	: boolean := TRUE;
      XOn           	: boolean := FALSE;
      MsgOn         	: boolean := TRUE;
      InstancePath  	: string := "PWM10B_CB";

      tipd_PADDO  	: VitalDelayType01 := (0 ns, 0 ns);
      tpd_PADDO_PWM10BC	 : VitalDelayType01 := (0 ns, 0 ns));

    port (PADDO: in Std_logic; PWM10BC: out Std_logic);

    ATTRIBUTE Vital_Level0 OF PWM10B_CB : ENTITY IS TRUE;

  end PWM10B_CB;

  architecture Structure of PWM10B_CB is
    ATTRIBUTE Vital_Level0 OF Structure : ARCHITECTURE IS TRUE;

    signal PADDO_ipd 	: std_logic := 'X';
    signal PWM10BC_out 	: std_logic := 'X';

    signal VCCI: Std_logic;
    component xo2iobuf0001
      port (I: in Std_logic; T: in Std_logic; PAD: out Std_logic);
    end component;
    component vcc
      port (PWR1: out Std_logic);
    end component;
  begin
    PWM10B_C_pad: xo2iobuf0001
      port map (I=>PADDO_ipd, T=>VCCI, PAD=>PWM10BC_out);
    DRIVEVCC: vcc
      port map (PWR1=>VCCI);

    --  INPUT PATH DELAYs
    WireDelay : BLOCK
    BEGIN
      VitalWireDelay(PADDO_ipd, PADDO, tipd_PADDO);
    END BLOCK;

    VitalBehavior : PROCESS (PADDO_ipd, PWM10BC_out)
    VARIABLE PWM10BC_zd         	: std_logic := 'X';
    VARIABLE PWM10BC_GlitchData 	: VitalGlitchDataType;


    BEGIN

    IF (TimingChecksOn) THEN

    END IF;

    PWM10BC_zd 	:= PWM10BC_out;

    VitalPathDelay01 (
      OutSignal => PWM10BC, OutSignalName => "PWM10BC", OutTemp => PWM10BC_zd,
      Paths      => (0 => (InputChangeTime => PADDO_ipd'last_event,
                           PathDelay => tpd_PADDO_PWM10BC,
                           PathCondition => TRUE)),
      GlitchData => PWM10BC_GlitchData,
      Mode       => vitaltransport, XOn => XOn, MsgOn => MsgOn);

    END PROCESS;

  end Structure;

-- entity PWM9B_CB
  library IEEE, vital2000, MACHXO2;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use MACHXO2.COMPONENTS.ALL;

  entity PWM9B_CB is
    -- miscellaneous vital GENERICs
    GENERIC (
      TimingChecksOn	: boolean := TRUE;
      XOn           	: boolean := FALSE;
      MsgOn         	: boolean := TRUE;
      InstancePath  	: string := "PWM9B_CB";

      tipd_PADDO  	: VitalDelayType01 := (0 ns, 0 ns);
      tpd_PADDO_PWM9BC	 : VitalDelayType01 := (0 ns, 0 ns));

    port (PADDO: in Std_logic; PWM9BC: out Std_logic);

    ATTRIBUTE Vital_Level0 OF PWM9B_CB : ENTITY IS TRUE;

  end PWM9B_CB;

  architecture Structure of PWM9B_CB is
    ATTRIBUTE Vital_Level0 OF Structure : ARCHITECTURE IS TRUE;

    signal PADDO_ipd 	: std_logic := 'X';
    signal PWM9BC_out 	: std_logic := 'X';

    signal GNDI: Std_logic;
    component gndB
      port (PWR0: out Std_logic);
    end component;
    component xo2iobuf0002
      port (I: in Std_logic; T: in Std_logic; PAD: out Std_logic);
    end component;
  begin
    PWM9B_C_pad: xo2iobuf0002
      port map (I=>PADDO_ipd, T=>GNDI, PAD=>PWM9BC_out);
    DRIVEGND: gndB
      port map (PWR0=>GNDI);

    --  INPUT PATH DELAYs
    WireDelay : BLOCK
    BEGIN
      VitalWireDelay(PADDO_ipd, PADDO, tipd_PADDO);
    END BLOCK;

    VitalBehavior : PROCESS (PADDO_ipd, PWM9BC_out)
    VARIABLE PWM9BC_zd         	: std_logic := 'X';
    VARIABLE PWM9BC_GlitchData 	: VitalGlitchDataType;


    BEGIN

    IF (TimingChecksOn) THEN

    END IF;

    PWM9BC_zd 	:= PWM9BC_out;

    VitalPathDelay01 (
      OutSignal => PWM9BC, OutSignalName => "PWM9BC", OutTemp => PWM9BC_zd,
      Paths      => (0 => (InputChangeTime => PADDO_ipd'last_event,
                           PathDelay => tpd_PADDO_PWM9BC,
                           PathCondition => TRUE)),
      GlitchData => PWM9BC_GlitchData,
      Mode       => vitaltransport, XOn => XOn, MsgOn => MsgOn);

    END PROCESS;

  end Structure;

-- entity PWM9A_CB
  library IEEE, vital2000, MACHXO2;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use MACHXO2.COMPONENTS.ALL;

  entity PWM9A_CB is
    -- miscellaneous vital GENERICs
    GENERIC (
      TimingChecksOn	: boolean := TRUE;
      XOn           	: boolean := FALSE;
      MsgOn         	: boolean := TRUE;
      InstancePath  	: string := "PWM9A_CB";

      tipd_PADDO  	: VitalDelayType01 := (0 ns, 0 ns);
      tpd_PADDO_PWM9AC	 : VitalDelayType01 := (0 ns, 0 ns));

    port (PADDO: in Std_logic; PWM9AC: out Std_logic);

    ATTRIBUTE Vital_Level0 OF PWM9A_CB : ENTITY IS TRUE;

  end PWM9A_CB;

  architecture Structure of PWM9A_CB is
    ATTRIBUTE Vital_Level0 OF Structure : ARCHITECTURE IS TRUE;

    signal PADDO_ipd 	: std_logic := 'X';
    signal PWM9AC_out 	: std_logic := 'X';

    signal GNDI: Std_logic;
    component gndB
      port (PWR0: out Std_logic);
    end component;
    component xo2iobuf0002
      port (I: in Std_logic; T: in Std_logic; PAD: out Std_logic);
    end component;
  begin
    PWM9A_C_pad: xo2iobuf0002
      port map (I=>PADDO_ipd, T=>GNDI, PAD=>PWM9AC_out);
    DRIVEGND: gndB
      port map (PWR0=>GNDI);

    --  INPUT PATH DELAYs
    WireDelay : BLOCK
    BEGIN
      VitalWireDelay(PADDO_ipd, PADDO, tipd_PADDO);
    END BLOCK;

    VitalBehavior : PROCESS (PADDO_ipd, PWM9AC_out)
    VARIABLE PWM9AC_zd         	: std_logic := 'X';
    VARIABLE PWM9AC_GlitchData 	: VitalGlitchDataType;


    BEGIN

    IF (TimingChecksOn) THEN

    END IF;

    PWM9AC_zd 	:= PWM9AC_out;

    VitalPathDelay01 (
      OutSignal => PWM9AC, OutSignalName => "PWM9AC", OutTemp => PWM9AC_zd,
      Paths      => (0 => (InputChangeTime => PADDO_ipd'last_event,
                           PathDelay => tpd_PADDO_PWM9AC,
                           PathCondition => TRUE)),
      GlitchData => PWM9AC_GlitchData,
      Mode       => vitaltransport, XOn => XOn, MsgOn => MsgOn);

    END PROCESS;

  end Structure;

-- entity PWM8B_CB
  library IEEE, vital2000, MACHXO2;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use MACHXO2.COMPONENTS.ALL;

  entity PWM8B_CB is
    -- miscellaneous vital GENERICs
    GENERIC (
      TimingChecksOn	: boolean := TRUE;
      XOn           	: boolean := FALSE;
      MsgOn         	: boolean := TRUE;
      InstancePath  	: string := "PWM8B_CB";

      tipd_PADDO  	: VitalDelayType01 := (0 ns, 0 ns);
      tpd_PADDO_PWM8BC	 : VitalDelayType01 := (0 ns, 0 ns));

    port (PADDO: in Std_logic; PWM8BC: out Std_logic);

    ATTRIBUTE Vital_Level0 OF PWM8B_CB : ENTITY IS TRUE;

  end PWM8B_CB;

  architecture Structure of PWM8B_CB is
    ATTRIBUTE Vital_Level0 OF Structure : ARCHITECTURE IS TRUE;

    signal PADDO_ipd 	: std_logic := 'X';
    signal PWM8BC_out 	: std_logic := 'X';

    signal GNDI: Std_logic;
    component gndB
      port (PWR0: out Std_logic);
    end component;
    component xo2iobuf0002
      port (I: in Std_logic; T: in Std_logic; PAD: out Std_logic);
    end component;
  begin
    PWM8B_C_pad: xo2iobuf0002
      port map (I=>PADDO_ipd, T=>GNDI, PAD=>PWM8BC_out);
    DRIVEGND: gndB
      port map (PWR0=>GNDI);

    --  INPUT PATH DELAYs
    WireDelay : BLOCK
    BEGIN
      VitalWireDelay(PADDO_ipd, PADDO, tipd_PADDO);
    END BLOCK;

    VitalBehavior : PROCESS (PADDO_ipd, PWM8BC_out)
    VARIABLE PWM8BC_zd         	: std_logic := 'X';
    VARIABLE PWM8BC_GlitchData 	: VitalGlitchDataType;


    BEGIN

    IF (TimingChecksOn) THEN

    END IF;

    PWM8BC_zd 	:= PWM8BC_out;

    VitalPathDelay01 (
      OutSignal => PWM8BC, OutSignalName => "PWM8BC", OutTemp => PWM8BC_zd,
      Paths      => (0 => (InputChangeTime => PADDO_ipd'last_event,
                           PathDelay => tpd_PADDO_PWM8BC,
                           PathCondition => TRUE)),
      GlitchData => PWM8BC_GlitchData,
      Mode       => vitaltransport, XOn => XOn, MsgOn => MsgOn);

    END PROCESS;

  end Structure;

-- entity PWM8A_CB
  library IEEE, vital2000, MACHXO2;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use MACHXO2.COMPONENTS.ALL;

  entity PWM8A_CB is
    -- miscellaneous vital GENERICs
    GENERIC (
      TimingChecksOn	: boolean := TRUE;
      XOn           	: boolean := FALSE;
      MsgOn         	: boolean := TRUE;
      InstancePath  	: string := "PWM8A_CB";

      tipd_PADDO  	: VitalDelayType01 := (0 ns, 0 ns);
      tpd_PADDO_PWM8AC	 : VitalDelayType01 := (0 ns, 0 ns));

    port (PADDO: in Std_logic; PWM8AC: out Std_logic);

    ATTRIBUTE Vital_Level0 OF PWM8A_CB : ENTITY IS TRUE;

  end PWM8A_CB;

  architecture Structure of PWM8A_CB is
    ATTRIBUTE Vital_Level0 OF Structure : ARCHITECTURE IS TRUE;

    signal PADDO_ipd 	: std_logic := 'X';
    signal PWM8AC_out 	: std_logic := 'X';

    signal GNDI: Std_logic;
    component gndB
      port (PWR0: out Std_logic);
    end component;
    component xo2iobuf0002
      port (I: in Std_logic; T: in Std_logic; PAD: out Std_logic);
    end component;
  begin
    PWM8A_C_pad: xo2iobuf0002
      port map (I=>PADDO_ipd, T=>GNDI, PAD=>PWM8AC_out);
    DRIVEGND: gndB
      port map (PWR0=>GNDI);

    --  INPUT PATH DELAYs
    WireDelay : BLOCK
    BEGIN
      VitalWireDelay(PADDO_ipd, PADDO, tipd_PADDO);
    END BLOCK;

    VitalBehavior : PROCESS (PADDO_ipd, PWM8AC_out)
    VARIABLE PWM8AC_zd         	: std_logic := 'X';
    VARIABLE PWM8AC_GlitchData 	: VitalGlitchDataType;


    BEGIN

    IF (TimingChecksOn) THEN

    END IF;

    PWM8AC_zd 	:= PWM8AC_out;

    VitalPathDelay01 (
      OutSignal => PWM8AC, OutSignalName => "PWM8AC", OutTemp => PWM8AC_zd,
      Paths      => (0 => (InputChangeTime => PADDO_ipd'last_event,
                           PathDelay => tpd_PADDO_PWM8AC,
                           PathCondition => TRUE)),
      GlitchData => PWM8AC_GlitchData,
      Mode       => vitaltransport, XOn => XOn, MsgOn => MsgOn);

    END PROCESS;

  end Structure;

-- entity PWM7B_CB
  library IEEE, vital2000, MACHXO2;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use MACHXO2.COMPONENTS.ALL;

  entity PWM7B_CB is
    -- miscellaneous vital GENERICs
    GENERIC (
      TimingChecksOn	: boolean := TRUE;
      XOn           	: boolean := FALSE;
      MsgOn         	: boolean := TRUE;
      InstancePath  	: string := "PWM7B_CB";

      tipd_PADDO  	: VitalDelayType01 := (0 ns, 0 ns);
      tpd_PADDO_PWM7BC	 : VitalDelayType01 := (0 ns, 0 ns));

    port (PADDO: in Std_logic; PWM7BC: out Std_logic);

    ATTRIBUTE Vital_Level0 OF PWM7B_CB : ENTITY IS TRUE;

  end PWM7B_CB;

  architecture Structure of PWM7B_CB is
    ATTRIBUTE Vital_Level0 OF Structure : ARCHITECTURE IS TRUE;

    signal PADDO_ipd 	: std_logic := 'X';
    signal PWM7BC_out 	: std_logic := 'X';

    signal GNDI: Std_logic;
    component gndB
      port (PWR0: out Std_logic);
    end component;
    component xo2iobuf0002
      port (I: in Std_logic; T: in Std_logic; PAD: out Std_logic);
    end component;
  begin
    PWM7B_C_pad: xo2iobuf0002
      port map (I=>PADDO_ipd, T=>GNDI, PAD=>PWM7BC_out);
    DRIVEGND: gndB
      port map (PWR0=>GNDI);

    --  INPUT PATH DELAYs
    WireDelay : BLOCK
    BEGIN
      VitalWireDelay(PADDO_ipd, PADDO, tipd_PADDO);
    END BLOCK;

    VitalBehavior : PROCESS (PADDO_ipd, PWM7BC_out)
    VARIABLE PWM7BC_zd         	: std_logic := 'X';
    VARIABLE PWM7BC_GlitchData 	: VitalGlitchDataType;


    BEGIN

    IF (TimingChecksOn) THEN

    END IF;

    PWM7BC_zd 	:= PWM7BC_out;

    VitalPathDelay01 (
      OutSignal => PWM7BC, OutSignalName => "PWM7BC", OutTemp => PWM7BC_zd,
      Paths      => (0 => (InputChangeTime => PADDO_ipd'last_event,
                           PathDelay => tpd_PADDO_PWM7BC,
                           PathCondition => TRUE)),
      GlitchData => PWM7BC_GlitchData,
      Mode       => vitaltransport, XOn => XOn, MsgOn => MsgOn);

    END PROCESS;

  end Structure;

-- entity PWM7A_CB
  library IEEE, vital2000, MACHXO2;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use MACHXO2.COMPONENTS.ALL;

  entity PWM7A_CB is
    -- miscellaneous vital GENERICs
    GENERIC (
      TimingChecksOn	: boolean := TRUE;
      XOn           	: boolean := FALSE;
      MsgOn         	: boolean := TRUE;
      InstancePath  	: string := "PWM7A_CB";

      tipd_PADDO  	: VitalDelayType01 := (0 ns, 0 ns);
      tpd_PADDO_PWM7AC	 : VitalDelayType01 := (0 ns, 0 ns));

    port (PADDO: in Std_logic; PWM7AC: out Std_logic);

    ATTRIBUTE Vital_Level0 OF PWM7A_CB : ENTITY IS TRUE;

  end PWM7A_CB;

  architecture Structure of PWM7A_CB is
    ATTRIBUTE Vital_Level0 OF Structure : ARCHITECTURE IS TRUE;

    signal PADDO_ipd 	: std_logic := 'X';
    signal PWM7AC_out 	: std_logic := 'X';

    signal GNDI: Std_logic;
    component gndB
      port (PWR0: out Std_logic);
    end component;
    component xo2iobuf0002
      port (I: in Std_logic; T: in Std_logic; PAD: out Std_logic);
    end component;
  begin
    PWM7A_C_pad: xo2iobuf0002
      port map (I=>PADDO_ipd, T=>GNDI, PAD=>PWM7AC_out);
    DRIVEGND: gndB
      port map (PWR0=>GNDI);

    --  INPUT PATH DELAYs
    WireDelay : BLOCK
    BEGIN
      VitalWireDelay(PADDO_ipd, PADDO, tipd_PADDO);
    END BLOCK;

    VitalBehavior : PROCESS (PADDO_ipd, PWM7AC_out)
    VARIABLE PWM7AC_zd         	: std_logic := 'X';
    VARIABLE PWM7AC_GlitchData 	: VitalGlitchDataType;


    BEGIN

    IF (TimingChecksOn) THEN

    END IF;

    PWM7AC_zd 	:= PWM7AC_out;

    VitalPathDelay01 (
      OutSignal => PWM7AC, OutSignalName => "PWM7AC", OutTemp => PWM7AC_zd,
      Paths      => (0 => (InputChangeTime => PADDO_ipd'last_event,
                           PathDelay => tpd_PADDO_PWM7AC,
                           PathCondition => TRUE)),
      GlitchData => PWM7AC_GlitchData,
      Mode       => vitaltransport, XOn => XOn, MsgOn => MsgOn);

    END PROCESS;

  end Structure;

-- entity PWM6B_CB
  library IEEE, vital2000, MACHXO2;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use MACHXO2.COMPONENTS.ALL;

  entity PWM6B_CB is
    -- miscellaneous vital GENERICs
    GENERIC (
      TimingChecksOn	: boolean := TRUE;
      XOn           	: boolean := FALSE;
      MsgOn         	: boolean := TRUE;
      InstancePath  	: string := "PWM6B_CB";

      tipd_PADDO  	: VitalDelayType01 := (0 ns, 0 ns);
      tpd_PADDO_PWM6BC	 : VitalDelayType01 := (0 ns, 0 ns));

    port (PADDO: in Std_logic; PWM6BC: out Std_logic);

    ATTRIBUTE Vital_Level0 OF PWM6B_CB : ENTITY IS TRUE;

  end PWM6B_CB;

  architecture Structure of PWM6B_CB is
    ATTRIBUTE Vital_Level0 OF Structure : ARCHITECTURE IS TRUE;

    signal PADDO_ipd 	: std_logic := 'X';
    signal PWM6BC_out 	: std_logic := 'X';

    signal GNDI: Std_logic;
    component gndB
      port (PWR0: out Std_logic);
    end component;
    component xo2iobuf0002
      port (I: in Std_logic; T: in Std_logic; PAD: out Std_logic);
    end component;
  begin
    PWM6B_C_pad: xo2iobuf0002
      port map (I=>PADDO_ipd, T=>GNDI, PAD=>PWM6BC_out);
    DRIVEGND: gndB
      port map (PWR0=>GNDI);

    --  INPUT PATH DELAYs
    WireDelay : BLOCK
    BEGIN
      VitalWireDelay(PADDO_ipd, PADDO, tipd_PADDO);
    END BLOCK;

    VitalBehavior : PROCESS (PADDO_ipd, PWM6BC_out)
    VARIABLE PWM6BC_zd         	: std_logic := 'X';
    VARIABLE PWM6BC_GlitchData 	: VitalGlitchDataType;


    BEGIN

    IF (TimingChecksOn) THEN

    END IF;

    PWM6BC_zd 	:= PWM6BC_out;

    VitalPathDelay01 (
      OutSignal => PWM6BC, OutSignalName => "PWM6BC", OutTemp => PWM6BC_zd,
      Paths      => (0 => (InputChangeTime => PADDO_ipd'last_event,
                           PathDelay => tpd_PADDO_PWM6BC,
                           PathCondition => TRUE)),
      GlitchData => PWM6BC_GlitchData,
      Mode       => vitaltransport, XOn => XOn, MsgOn => MsgOn);

    END PROCESS;

  end Structure;

-- entity PWM6A_CB
  library IEEE, vital2000, MACHXO2;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use MACHXO2.COMPONENTS.ALL;

  entity PWM6A_CB is
    -- miscellaneous vital GENERICs
    GENERIC (
      TimingChecksOn	: boolean := TRUE;
      XOn           	: boolean := FALSE;
      MsgOn         	: boolean := TRUE;
      InstancePath  	: string := "PWM6A_CB";

      tipd_PADDO  	: VitalDelayType01 := (0 ns, 0 ns);
      tpd_PADDO_PWM6AC	 : VitalDelayType01 := (0 ns, 0 ns));

    port (PADDO: in Std_logic; PWM6AC: out Std_logic);

    ATTRIBUTE Vital_Level0 OF PWM6A_CB : ENTITY IS TRUE;

  end PWM6A_CB;

  architecture Structure of PWM6A_CB is
    ATTRIBUTE Vital_Level0 OF Structure : ARCHITECTURE IS TRUE;

    signal PADDO_ipd 	: std_logic := 'X';
    signal PWM6AC_out 	: std_logic := 'X';

    signal GNDI: Std_logic;
    component gndB
      port (PWR0: out Std_logic);
    end component;
    component xo2iobuf0002
      port (I: in Std_logic; T: in Std_logic; PAD: out Std_logic);
    end component;
  begin
    PWM6A_C_pad: xo2iobuf0002
      port map (I=>PADDO_ipd, T=>GNDI, PAD=>PWM6AC_out);
    DRIVEGND: gndB
      port map (PWR0=>GNDI);

    --  INPUT PATH DELAYs
    WireDelay : BLOCK
    BEGIN
      VitalWireDelay(PADDO_ipd, PADDO, tipd_PADDO);
    END BLOCK;

    VitalBehavior : PROCESS (PADDO_ipd, PWM6AC_out)
    VARIABLE PWM6AC_zd         	: std_logic := 'X';
    VARIABLE PWM6AC_GlitchData 	: VitalGlitchDataType;


    BEGIN

    IF (TimingChecksOn) THEN

    END IF;

    PWM6AC_zd 	:= PWM6AC_out;

    VitalPathDelay01 (
      OutSignal => PWM6AC, OutSignalName => "PWM6AC", OutTemp => PWM6AC_zd,
      Paths      => (0 => (InputChangeTime => PADDO_ipd'last_event,
                           PathDelay => tpd_PADDO_PWM6AC,
                           PathCondition => TRUE)),
      GlitchData => PWM6AC_GlitchData,
      Mode       => vitaltransport, XOn => XOn, MsgOn => MsgOn);

    END PROCESS;

  end Structure;

-- entity PWM5B_CB
  library IEEE, vital2000, MACHXO2;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use MACHXO2.COMPONENTS.ALL;

  entity PWM5B_CB is
    -- miscellaneous vital GENERICs
    GENERIC (
      TimingChecksOn	: boolean := TRUE;
      XOn           	: boolean := FALSE;
      MsgOn         	: boolean := TRUE;
      InstancePath  	: string := "PWM5B_CB";

      tipd_PADDO  	: VitalDelayType01 := (0 ns, 0 ns);
      tpd_PADDO_PWM5BC	 : VitalDelayType01 := (0 ns, 0 ns));

    port (PADDO: in Std_logic; PWM5BC: out Std_logic);

    ATTRIBUTE Vital_Level0 OF PWM5B_CB : ENTITY IS TRUE;

  end PWM5B_CB;

  architecture Structure of PWM5B_CB is
    ATTRIBUTE Vital_Level0 OF Structure : ARCHITECTURE IS TRUE;

    signal PADDO_ipd 	: std_logic := 'X';
    signal PWM5BC_out 	: std_logic := 'X';

    signal GNDI: Std_logic;
    component gndB
      port (PWR0: out Std_logic);
    end component;
    component xo2iobuf0002
      port (I: in Std_logic; T: in Std_logic; PAD: out Std_logic);
    end component;
  begin
    PWM5B_C_pad: xo2iobuf0002
      port map (I=>PADDO_ipd, T=>GNDI, PAD=>PWM5BC_out);
    DRIVEGND: gndB
      port map (PWR0=>GNDI);

    --  INPUT PATH DELAYs
    WireDelay : BLOCK
    BEGIN
      VitalWireDelay(PADDO_ipd, PADDO, tipd_PADDO);
    END BLOCK;

    VitalBehavior : PROCESS (PADDO_ipd, PWM5BC_out)
    VARIABLE PWM5BC_zd         	: std_logic := 'X';
    VARIABLE PWM5BC_GlitchData 	: VitalGlitchDataType;


    BEGIN

    IF (TimingChecksOn) THEN

    END IF;

    PWM5BC_zd 	:= PWM5BC_out;

    VitalPathDelay01 (
      OutSignal => PWM5BC, OutSignalName => "PWM5BC", OutTemp => PWM5BC_zd,
      Paths      => (0 => (InputChangeTime => PADDO_ipd'last_event,
                           PathDelay => tpd_PADDO_PWM5BC,
                           PathCondition => TRUE)),
      GlitchData => PWM5BC_GlitchData,
      Mode       => vitaltransport, XOn => XOn, MsgOn => MsgOn);

    END PROCESS;

  end Structure;

-- entity PWM5A_CB
  library IEEE, vital2000, MACHXO2;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use MACHXO2.COMPONENTS.ALL;

  entity PWM5A_CB is
    -- miscellaneous vital GENERICs
    GENERIC (
      TimingChecksOn	: boolean := TRUE;
      XOn           	: boolean := FALSE;
      MsgOn         	: boolean := TRUE;
      InstancePath  	: string := "PWM5A_CB";

      tipd_PADDO  	: VitalDelayType01 := (0 ns, 0 ns);
      tpd_PADDO_PWM5AC	 : VitalDelayType01 := (0 ns, 0 ns));

    port (PADDO: in Std_logic; PWM5AC: out Std_logic);

    ATTRIBUTE Vital_Level0 OF PWM5A_CB : ENTITY IS TRUE;

  end PWM5A_CB;

  architecture Structure of PWM5A_CB is
    ATTRIBUTE Vital_Level0 OF Structure : ARCHITECTURE IS TRUE;

    signal PADDO_ipd 	: std_logic := 'X';
    signal PWM5AC_out 	: std_logic := 'X';

    signal GNDI: Std_logic;
    component gndB
      port (PWR0: out Std_logic);
    end component;
    component xo2iobuf0002
      port (I: in Std_logic; T: in Std_logic; PAD: out Std_logic);
    end component;
  begin
    PWM5A_C_pad: xo2iobuf0002
      port map (I=>PADDO_ipd, T=>GNDI, PAD=>PWM5AC_out);
    DRIVEGND: gndB
      port map (PWR0=>GNDI);

    --  INPUT PATH DELAYs
    WireDelay : BLOCK
    BEGIN
      VitalWireDelay(PADDO_ipd, PADDO, tipd_PADDO);
    END BLOCK;

    VitalBehavior : PROCESS (PADDO_ipd, PWM5AC_out)
    VARIABLE PWM5AC_zd         	: std_logic := 'X';
    VARIABLE PWM5AC_GlitchData 	: VitalGlitchDataType;


    BEGIN

    IF (TimingChecksOn) THEN

    END IF;

    PWM5AC_zd 	:= PWM5AC_out;

    VitalPathDelay01 (
      OutSignal => PWM5AC, OutSignalName => "PWM5AC", OutTemp => PWM5AC_zd,
      Paths      => (0 => (InputChangeTime => PADDO_ipd'last_event,
                           PathDelay => tpd_PADDO_PWM5AC,
                           PathCondition => TRUE)),
      GlitchData => PWM5AC_GlitchData,
      Mode       => vitaltransport, XOn => XOn, MsgOn => MsgOn);

    END PROCESS;

  end Structure;

-- entity PWM4B_CB
  library IEEE, vital2000, MACHXO2;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use MACHXO2.COMPONENTS.ALL;

  entity PWM4B_CB is
    -- miscellaneous vital GENERICs
    GENERIC (
      TimingChecksOn	: boolean := TRUE;
      XOn           	: boolean := FALSE;
      MsgOn         	: boolean := TRUE;
      InstancePath  	: string := "PWM4B_CB";

      tipd_PADDO  	: VitalDelayType01 := (0 ns, 0 ns);
      tpd_PADDO_PWM4BC	 : VitalDelayType01 := (0 ns, 0 ns));

    port (PADDO: in Std_logic; PWM4BC: out Std_logic);

    ATTRIBUTE Vital_Level0 OF PWM4B_CB : ENTITY IS TRUE;

  end PWM4B_CB;

  architecture Structure of PWM4B_CB is
    ATTRIBUTE Vital_Level0 OF Structure : ARCHITECTURE IS TRUE;

    signal PADDO_ipd 	: std_logic := 'X';
    signal PWM4BC_out 	: std_logic := 'X';

    signal GNDI: Std_logic;
    component gndB
      port (PWR0: out Std_logic);
    end component;
    component xo2iobuf0002
      port (I: in Std_logic; T: in Std_logic; PAD: out Std_logic);
    end component;
  begin
    PWM4B_C_pad: xo2iobuf0002
      port map (I=>PADDO_ipd, T=>GNDI, PAD=>PWM4BC_out);
    DRIVEGND: gndB
      port map (PWR0=>GNDI);

    --  INPUT PATH DELAYs
    WireDelay : BLOCK
    BEGIN
      VitalWireDelay(PADDO_ipd, PADDO, tipd_PADDO);
    END BLOCK;

    VitalBehavior : PROCESS (PADDO_ipd, PWM4BC_out)
    VARIABLE PWM4BC_zd         	: std_logic := 'X';
    VARIABLE PWM4BC_GlitchData 	: VitalGlitchDataType;


    BEGIN

    IF (TimingChecksOn) THEN

    END IF;

    PWM4BC_zd 	:= PWM4BC_out;

    VitalPathDelay01 (
      OutSignal => PWM4BC, OutSignalName => "PWM4BC", OutTemp => PWM4BC_zd,
      Paths      => (0 => (InputChangeTime => PADDO_ipd'last_event,
                           PathDelay => tpd_PADDO_PWM4BC,
                           PathCondition => TRUE)),
      GlitchData => PWM4BC_GlitchData,
      Mode       => vitaltransport, XOn => XOn, MsgOn => MsgOn);

    END PROCESS;

  end Structure;

-- entity PWM4A_CB
  library IEEE, vital2000, MACHXO2;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use MACHXO2.COMPONENTS.ALL;

  entity PWM4A_CB is
    -- miscellaneous vital GENERICs
    GENERIC (
      TimingChecksOn	: boolean := TRUE;
      XOn           	: boolean := FALSE;
      MsgOn         	: boolean := TRUE;
      InstancePath  	: string := "PWM4A_CB";

      tipd_PADDO  	: VitalDelayType01 := (0 ns, 0 ns);
      tpd_PADDO_PWM4AC	 : VitalDelayType01 := (0 ns, 0 ns));

    port (PADDO: in Std_logic; PWM4AC: out Std_logic);

    ATTRIBUTE Vital_Level0 OF PWM4A_CB : ENTITY IS TRUE;

  end PWM4A_CB;

  architecture Structure of PWM4A_CB is
    ATTRIBUTE Vital_Level0 OF Structure : ARCHITECTURE IS TRUE;

    signal PADDO_ipd 	: std_logic := 'X';
    signal PWM4AC_out 	: std_logic := 'X';

    signal GNDI: Std_logic;
    component gndB
      port (PWR0: out Std_logic);
    end component;
    component xo2iobuf0002
      port (I: in Std_logic; T: in Std_logic; PAD: out Std_logic);
    end component;
  begin
    PWM4A_C_pad: xo2iobuf0002
      port map (I=>PADDO_ipd, T=>GNDI, PAD=>PWM4AC_out);
    DRIVEGND: gndB
      port map (PWR0=>GNDI);

    --  INPUT PATH DELAYs
    WireDelay : BLOCK
    BEGIN
      VitalWireDelay(PADDO_ipd, PADDO, tipd_PADDO);
    END BLOCK;

    VitalBehavior : PROCESS (PADDO_ipd, PWM4AC_out)
    VARIABLE PWM4AC_zd         	: std_logic := 'X';
    VARIABLE PWM4AC_GlitchData 	: VitalGlitchDataType;


    BEGIN

    IF (TimingChecksOn) THEN

    END IF;

    PWM4AC_zd 	:= PWM4AC_out;

    VitalPathDelay01 (
      OutSignal => PWM4AC, OutSignalName => "PWM4AC", OutTemp => PWM4AC_zd,
      Paths      => (0 => (InputChangeTime => PADDO_ipd'last_event,
                           PathDelay => tpd_PADDO_PWM4AC,
                           PathCondition => TRUE)),
      GlitchData => PWM4AC_GlitchData,
      Mode       => vitaltransport, XOn => XOn, MsgOn => MsgOn);

    END PROCESS;

  end Structure;

-- entity PWM3B_CB
  library IEEE, vital2000, MACHXO2;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use MACHXO2.COMPONENTS.ALL;

  entity PWM3B_CB is
    -- miscellaneous vital GENERICs
    GENERIC (
      TimingChecksOn	: boolean := TRUE;
      XOn           	: boolean := FALSE;
      MsgOn         	: boolean := TRUE;
      InstancePath  	: string := "PWM3B_CB";

      tipd_PADDO  	: VitalDelayType01 := (0 ns, 0 ns);
      tpd_PADDO_PWM3BC	 : VitalDelayType01 := (0 ns, 0 ns));

    port (PADDO: in Std_logic; PWM3BC: out Std_logic);

    ATTRIBUTE Vital_Level0 OF PWM3B_CB : ENTITY IS TRUE;

  end PWM3B_CB;

  architecture Structure of PWM3B_CB is
    ATTRIBUTE Vital_Level0 OF Structure : ARCHITECTURE IS TRUE;

    signal PADDO_ipd 	: std_logic := 'X';
    signal PWM3BC_out 	: std_logic := 'X';

    signal GNDI: Std_logic;
    component gndB
      port (PWR0: out Std_logic);
    end component;
    component xo2iobuf0002
      port (I: in Std_logic; T: in Std_logic; PAD: out Std_logic);
    end component;
  begin
    PWM3B_C_pad: xo2iobuf0002
      port map (I=>PADDO_ipd, T=>GNDI, PAD=>PWM3BC_out);
    DRIVEGND: gndB
      port map (PWR0=>GNDI);

    --  INPUT PATH DELAYs
    WireDelay : BLOCK
    BEGIN
      VitalWireDelay(PADDO_ipd, PADDO, tipd_PADDO);
    END BLOCK;

    VitalBehavior : PROCESS (PADDO_ipd, PWM3BC_out)
    VARIABLE PWM3BC_zd         	: std_logic := 'X';
    VARIABLE PWM3BC_GlitchData 	: VitalGlitchDataType;


    BEGIN

    IF (TimingChecksOn) THEN

    END IF;

    PWM3BC_zd 	:= PWM3BC_out;

    VitalPathDelay01 (
      OutSignal => PWM3BC, OutSignalName => "PWM3BC", OutTemp => PWM3BC_zd,
      Paths      => (0 => (InputChangeTime => PADDO_ipd'last_event,
                           PathDelay => tpd_PADDO_PWM3BC,
                           PathCondition => TRUE)),
      GlitchData => PWM3BC_GlitchData,
      Mode       => vitaltransport, XOn => XOn, MsgOn => MsgOn);

    END PROCESS;

  end Structure;

-- entity PWM3A_CB
  library IEEE, vital2000, MACHXO2;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use MACHXO2.COMPONENTS.ALL;

  entity PWM3A_CB is
    -- miscellaneous vital GENERICs
    GENERIC (
      TimingChecksOn	: boolean := TRUE;
      XOn           	: boolean := FALSE;
      MsgOn         	: boolean := TRUE;
      InstancePath  	: string := "PWM3A_CB";

      tipd_PADDO  	: VitalDelayType01 := (0 ns, 0 ns);
      tpd_PADDO_PWM3AC	 : VitalDelayType01 := (0 ns, 0 ns));

    port (PADDO: in Std_logic; PWM3AC: out Std_logic);

    ATTRIBUTE Vital_Level0 OF PWM3A_CB : ENTITY IS TRUE;

  end PWM3A_CB;

  architecture Structure of PWM3A_CB is
    ATTRIBUTE Vital_Level0 OF Structure : ARCHITECTURE IS TRUE;

    signal PADDO_ipd 	: std_logic := 'X';
    signal PWM3AC_out 	: std_logic := 'X';

    signal GNDI: Std_logic;
    component gndB
      port (PWR0: out Std_logic);
    end component;
    component xo2iobuf0002
      port (I: in Std_logic; T: in Std_logic; PAD: out Std_logic);
    end component;
  begin
    PWM3A_C_pad: xo2iobuf0002
      port map (I=>PADDO_ipd, T=>GNDI, PAD=>PWM3AC_out);
    DRIVEGND: gndB
      port map (PWR0=>GNDI);

    --  INPUT PATH DELAYs
    WireDelay : BLOCK
    BEGIN
      VitalWireDelay(PADDO_ipd, PADDO, tipd_PADDO);
    END BLOCK;

    VitalBehavior : PROCESS (PADDO_ipd, PWM3AC_out)
    VARIABLE PWM3AC_zd         	: std_logic := 'X';
    VARIABLE PWM3AC_GlitchData 	: VitalGlitchDataType;


    BEGIN

    IF (TimingChecksOn) THEN

    END IF;

    PWM3AC_zd 	:= PWM3AC_out;

    VitalPathDelay01 (
      OutSignal => PWM3AC, OutSignalName => "PWM3AC", OutTemp => PWM3AC_zd,
      Paths      => (0 => (InputChangeTime => PADDO_ipd'last_event,
                           PathDelay => tpd_PADDO_PWM3AC,
                           PathCondition => TRUE)),
      GlitchData => PWM3AC_GlitchData,
      Mode       => vitaltransport, XOn => XOn, MsgOn => MsgOn);

    END PROCESS;

  end Structure;

-- entity PWM2B_CB
  library IEEE, vital2000, MACHXO2;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use MACHXO2.COMPONENTS.ALL;

  entity PWM2B_CB is
    -- miscellaneous vital GENERICs
    GENERIC (
      TimingChecksOn	: boolean := TRUE;
      XOn           	: boolean := FALSE;
      MsgOn         	: boolean := TRUE;
      InstancePath  	: string := "PWM2B_CB";

      tipd_PADDO  	: VitalDelayType01 := (0 ns, 0 ns);
      tpd_PADDO_PWM2BC	 : VitalDelayType01 := (0 ns, 0 ns));

    port (PADDO: in Std_logic; PWM2BC: out Std_logic);

    ATTRIBUTE Vital_Level0 OF PWM2B_CB : ENTITY IS TRUE;

  end PWM2B_CB;

  architecture Structure of PWM2B_CB is
    ATTRIBUTE Vital_Level0 OF Structure : ARCHITECTURE IS TRUE;

    signal PADDO_ipd 	: std_logic := 'X';
    signal PWM2BC_out 	: std_logic := 'X';

    signal GNDI: Std_logic;
    component gndB
      port (PWR0: out Std_logic);
    end component;
    component xo2iobuf0002
      port (I: in Std_logic; T: in Std_logic; PAD: out Std_logic);
    end component;
  begin
    PWM2B_C_pad: xo2iobuf0002
      port map (I=>PADDO_ipd, T=>GNDI, PAD=>PWM2BC_out);
    DRIVEGND: gndB
      port map (PWR0=>GNDI);

    --  INPUT PATH DELAYs
    WireDelay : BLOCK
    BEGIN
      VitalWireDelay(PADDO_ipd, PADDO, tipd_PADDO);
    END BLOCK;

    VitalBehavior : PROCESS (PADDO_ipd, PWM2BC_out)
    VARIABLE PWM2BC_zd         	: std_logic := 'X';
    VARIABLE PWM2BC_GlitchData 	: VitalGlitchDataType;


    BEGIN

    IF (TimingChecksOn) THEN

    END IF;

    PWM2BC_zd 	:= PWM2BC_out;

    VitalPathDelay01 (
      OutSignal => PWM2BC, OutSignalName => "PWM2BC", OutTemp => PWM2BC_zd,
      Paths      => (0 => (InputChangeTime => PADDO_ipd'last_event,
                           PathDelay => tpd_PADDO_PWM2BC,
                           PathCondition => TRUE)),
      GlitchData => PWM2BC_GlitchData,
      Mode       => vitaltransport, XOn => XOn, MsgOn => MsgOn);

    END PROCESS;

  end Structure;

-- entity PWM2A_CB
  library IEEE, vital2000, MACHXO2;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use MACHXO2.COMPONENTS.ALL;

  entity PWM2A_CB is
    -- miscellaneous vital GENERICs
    GENERIC (
      TimingChecksOn	: boolean := TRUE;
      XOn           	: boolean := FALSE;
      MsgOn         	: boolean := TRUE;
      InstancePath  	: string := "PWM2A_CB";

      tipd_PADDO  	: VitalDelayType01 := (0 ns, 0 ns);
      tpd_PADDO_PWM2AC	 : VitalDelayType01 := (0 ns, 0 ns));

    port (PADDO: in Std_logic; PWM2AC: out Std_logic);

    ATTRIBUTE Vital_Level0 OF PWM2A_CB : ENTITY IS TRUE;

  end PWM2A_CB;

  architecture Structure of PWM2A_CB is
    ATTRIBUTE Vital_Level0 OF Structure : ARCHITECTURE IS TRUE;

    signal PADDO_ipd 	: std_logic := 'X';
    signal PWM2AC_out 	: std_logic := 'X';

    signal GNDI: Std_logic;
    component gndB
      port (PWR0: out Std_logic);
    end component;
    component xo2iobuf0002
      port (I: in Std_logic; T: in Std_logic; PAD: out Std_logic);
    end component;
  begin
    PWM2A_C_pad: xo2iobuf0002
      port map (I=>PADDO_ipd, T=>GNDI, PAD=>PWM2AC_out);
    DRIVEGND: gndB
      port map (PWR0=>GNDI);

    --  INPUT PATH DELAYs
    WireDelay : BLOCK
    BEGIN
      VitalWireDelay(PADDO_ipd, PADDO, tipd_PADDO);
    END BLOCK;

    VitalBehavior : PROCESS (PADDO_ipd, PWM2AC_out)
    VARIABLE PWM2AC_zd         	: std_logic := 'X';
    VARIABLE PWM2AC_GlitchData 	: VitalGlitchDataType;


    BEGIN

    IF (TimingChecksOn) THEN

    END IF;

    PWM2AC_zd 	:= PWM2AC_out;

    VitalPathDelay01 (
      OutSignal => PWM2AC, OutSignalName => "PWM2AC", OutTemp => PWM2AC_zd,
      Paths      => (0 => (InputChangeTime => PADDO_ipd'last_event,
                           PathDelay => tpd_PADDO_PWM2AC,
                           PathCondition => TRUE)),
      GlitchData => PWM2AC_GlitchData,
      Mode       => vitaltransport, XOn => XOn, MsgOn => MsgOn);

    END PROCESS;

  end Structure;

-- entity PWM1B_CB
  library IEEE, vital2000, MACHXO2;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use MACHXO2.COMPONENTS.ALL;

  entity PWM1B_CB is
    -- miscellaneous vital GENERICs
    GENERIC (
      TimingChecksOn	: boolean := TRUE;
      XOn           	: boolean := FALSE;
      MsgOn         	: boolean := TRUE;
      InstancePath  	: string := "PWM1B_CB";

      tipd_PADDO  	: VitalDelayType01 := (0 ns, 0 ns);
      tpd_PADDO_PWM1BC	 : VitalDelayType01 := (0 ns, 0 ns));

    port (PADDO: in Std_logic; PWM1BC: out Std_logic);

    ATTRIBUTE Vital_Level0 OF PWM1B_CB : ENTITY IS TRUE;

  end PWM1B_CB;

  architecture Structure of PWM1B_CB is
    ATTRIBUTE Vital_Level0 OF Structure : ARCHITECTURE IS TRUE;

    signal PADDO_ipd 	: std_logic := 'X';
    signal PWM1BC_out 	: std_logic := 'X';

    signal GNDI: Std_logic;
    component gndB
      port (PWR0: out Std_logic);
    end component;
    component xo2iobuf0002
      port (I: in Std_logic; T: in Std_logic; PAD: out Std_logic);
    end component;
  begin
    PWM1B_C_pad: xo2iobuf0002
      port map (I=>PADDO_ipd, T=>GNDI, PAD=>PWM1BC_out);
    DRIVEGND: gndB
      port map (PWR0=>GNDI);

    --  INPUT PATH DELAYs
    WireDelay : BLOCK
    BEGIN
      VitalWireDelay(PADDO_ipd, PADDO, tipd_PADDO);
    END BLOCK;

    VitalBehavior : PROCESS (PADDO_ipd, PWM1BC_out)
    VARIABLE PWM1BC_zd         	: std_logic := 'X';
    VARIABLE PWM1BC_GlitchData 	: VitalGlitchDataType;


    BEGIN

    IF (TimingChecksOn) THEN

    END IF;

    PWM1BC_zd 	:= PWM1BC_out;

    VitalPathDelay01 (
      OutSignal => PWM1BC, OutSignalName => "PWM1BC", OutTemp => PWM1BC_zd,
      Paths      => (0 => (InputChangeTime => PADDO_ipd'last_event,
                           PathDelay => tpd_PADDO_PWM1BC,
                           PathCondition => TRUE)),
      GlitchData => PWM1BC_GlitchData,
      Mode       => vitaltransport, XOn => XOn, MsgOn => MsgOn);

    END PROCESS;

  end Structure;

-- entity PWM1A_CB
  library IEEE, vital2000, MACHXO2;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use MACHXO2.COMPONENTS.ALL;

  entity PWM1A_CB is
    -- miscellaneous vital GENERICs
    GENERIC (
      TimingChecksOn	: boolean := TRUE;
      XOn           	: boolean := FALSE;
      MsgOn         	: boolean := TRUE;
      InstancePath  	: string := "PWM1A_CB";

      tipd_PADDO  	: VitalDelayType01 := (0 ns, 0 ns);
      tpd_PADDO_PWM1AC	 : VitalDelayType01 := (0 ns, 0 ns));

    port (PADDO: in Std_logic; PWM1AC: out Std_logic);

    ATTRIBUTE Vital_Level0 OF PWM1A_CB : ENTITY IS TRUE;

  end PWM1A_CB;

  architecture Structure of PWM1A_CB is
    ATTRIBUTE Vital_Level0 OF Structure : ARCHITECTURE IS TRUE;

    signal PADDO_ipd 	: std_logic := 'X';
    signal PWM1AC_out 	: std_logic := 'X';

    signal GNDI: Std_logic;
    component gndB
      port (PWR0: out Std_logic);
    end component;
    component xo2iobuf0002
      port (I: in Std_logic; T: in Std_logic; PAD: out Std_logic);
    end component;
  begin
    PWM1A_C_pad: xo2iobuf0002
      port map (I=>PADDO_ipd, T=>GNDI, PAD=>PWM1AC_out);
    DRIVEGND: gndB
      port map (PWR0=>GNDI);

    --  INPUT PATH DELAYs
    WireDelay : BLOCK
    BEGIN
      VitalWireDelay(PADDO_ipd, PADDO, tipd_PADDO);
    END BLOCK;

    VitalBehavior : PROCESS (PADDO_ipd, PWM1AC_out)
    VARIABLE PWM1AC_zd         	: std_logic := 'X';
    VARIABLE PWM1AC_GlitchData 	: VitalGlitchDataType;


    BEGIN

    IF (TimingChecksOn) THEN

    END IF;

    PWM1AC_zd 	:= PWM1AC_out;

    VitalPathDelay01 (
      OutSignal => PWM1AC, OutSignalName => "PWM1AC", OutTemp => PWM1AC_zd,
      Paths      => (0 => (InputChangeTime => PADDO_ipd'last_event,
                           PathDelay => tpd_PADDO_PWM1AC,
                           PathCondition => TRUE)),
      GlitchData => PWM1AC_GlitchData,
      Mode       => vitaltransport, XOn => XOn, MsgOn => MsgOn);

    END PROCESS;

  end Structure;

-- entity PWM_ENnB
  library IEEE, vital2000, MACHXO2;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use MACHXO2.COMPONENTS.ALL;

  entity PWM_ENnB is
    -- miscellaneous vital GENERICs
    GENERIC (
      TimingChecksOn	: boolean := TRUE;
      XOn           	: boolean := FALSE;
      MsgOn         	: boolean := TRUE;
      InstancePath  	: string := "PWM_ENnB";

      tipd_PADDO  	: VitalDelayType01 := (0 ns, 0 ns);
      tpd_PADDO_PWMENn	 : VitalDelayType01 := (0 ns, 0 ns));

    port (PADDO: in Std_logic; PWMENn: out Std_logic);

    ATTRIBUTE Vital_Level0 OF PWM_ENnB : ENTITY IS TRUE;

  end PWM_ENnB;

  architecture Structure of PWM_ENnB is
    ATTRIBUTE Vital_Level0 OF Structure : ARCHITECTURE IS TRUE;

    signal PADDO_ipd 	: std_logic := 'X';
    signal PWMENn_out 	: std_logic := 'X';

    signal GNDI: Std_logic;
    component gndB
      port (PWR0: out Std_logic);
    end component;
    component xo2iobuf0002
      port (I: in Std_logic; T: in Std_logic; PAD: out Std_logic);
    end component;
  begin
    PWM_ENn_pad: xo2iobuf0002
      port map (I=>PADDO_ipd, T=>GNDI, PAD=>PWMENn_out);
    DRIVEGND: gndB
      port map (PWR0=>GNDI);

    --  INPUT PATH DELAYs
    WireDelay : BLOCK
    BEGIN
      VitalWireDelay(PADDO_ipd, PADDO, tipd_PADDO);
    END BLOCK;

    VitalBehavior : PROCESS (PADDO_ipd, PWMENn_out)
    VARIABLE PWMENn_zd         	: std_logic := 'X';
    VARIABLE PWMENn_GlitchData 	: VitalGlitchDataType;


    BEGIN

    IF (TimingChecksOn) THEN

    END IF;

    PWMENn_zd 	:= PWMENn_out;

    VitalPathDelay01 (
      OutSignal => PWMENn, OutSignalName => "PWMENn", OutTemp => PWMENn_zd,
      Paths      => (0 => (InputChangeTime => PADDO_ipd'last_event,
                           PathDelay => tpd_PADDO_PWMENn,
                           PathCondition => TRUE)),
      GlitchData => PWMENn_GlitchData,
      Mode       => vitaltransport, XOn => XOn, MsgOn => MsgOn);

    END PROCESS;

  end Structure;

-- entity TZ2nB
  library IEEE, vital2000, MACHXO2;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use MACHXO2.COMPONENTS.ALL;

  entity TZ2nB is
    -- miscellaneous vital GENERICs
    GENERIC (
      TimingChecksOn	: boolean := TRUE;
      XOn           	: boolean := FALSE;
      MsgOn         	: boolean := TRUE;
      InstancePath  	: string := "TZ2nB";

      tipd_PADDO  	: VitalDelayType01 := (0 ns, 0 ns);
      tipd_TZ2nS  	: VitalDelayType01 := (0 ns, 0 ns);
      tpd_PADDO_TZ2nS	 : VitalDelayType01 := (0 ns, 0 ns);
      tperiod_TZ2nS 	: VitalDelayType := 0 ns;
      tpw_TZ2nS_posedge	: VitalDelayType := 0 ns;
      tpw_TZ2nS_negedge	: VitalDelayType := 0 ns);

    port (PADDO: in Std_logic; TZ2nS: inout Std_logic);

    ATTRIBUTE Vital_Level0 OF TZ2nB : ENTITY IS TRUE;

  end TZ2nB;

  architecture Structure of TZ2nB is
    ATTRIBUTE Vital_Level0 OF Structure : ARCHITECTURE IS TRUE;

    signal PADDO_ipd 	: std_logic := 'X';
    signal TZ2nS_ipd 	: std_logic := 'X';
    signal TZ2nS_out 	: std_logic := 'Z';

    signal GNDI: Std_logic;
    component gndB
      port (PWR0: out Std_logic);
    end component;
    component xo2iobuf
      port (I: in Std_logic; T: in Std_logic; Z: out Std_logic; 
            PAD: out Std_logic; PADI: in Std_logic);
    end component;
  begin
    TZ2n_pad: xo2iobuf
      port map (I=>PADDO_ipd, T=>GNDI, Z=>open, PAD=>TZ2nS_out, 
                PADI=>TZ2nS_ipd);
    DRIVEGND: gndB
      port map (PWR0=>GNDI);

    --  INPUT PATH DELAYs
    WireDelay : BLOCK
    BEGIN
      VitalWireDelay(PADDO_ipd, PADDO, tipd_PADDO);
      VitalWireDelay(TZ2nS_ipd, TZ2nS, tipd_TZ2nS);
    END BLOCK;

    VitalBehavior : PROCESS (PADDO_ipd, TZ2nS_ipd, TZ2nS_out)
    VARIABLE TZ2nS_zd         	: std_logic := 'X';
    VARIABLE TZ2nS_GlitchData 	: VitalGlitchDataType;

    VARIABLE tviol_TZ2nS_TZ2nS          	: x01 := '0';
    VARIABLE periodcheckinfo_TZ2nS	: VitalPeriodDataType;

    BEGIN

    IF (TimingChecksOn) THEN
      VitalPeriodPulseCheck (
        TestSignal => TZ2nS_ipd,
        TestSignalName => "TZ2nS",
        Period => tperiod_TZ2nS,
        PulseWidthHigh => tpw_TZ2nS_posedge,
        PulseWidthLow => tpw_TZ2nS_negedge,
        PeriodData => periodcheckinfo_TZ2nS,
        Violation => tviol_TZ2nS_TZ2nS,
        MsgOn => MsgOn, XOn => XOn,
        HeaderMsg => InstancePath,
        CheckEnabled => TRUE,
        MsgSeverity => warning);

    END IF;

    TZ2nS_zd 	:= TZ2nS_out;

    VitalPathDelay01 (
      OutSignal => TZ2nS, OutSignalName => "TZ2nS", OutTemp => TZ2nS_zd,
      Paths      => (0 => (InputChangeTime => PADDO_ipd'last_event,
                           PathDelay => tpd_PADDO_TZ2nS,
                           PathCondition => TRUE)),
      GlitchData => TZ2nS_GlitchData,
      Mode       => vitaltransport, XOn => XOn, MsgOn => MsgOn);

    END PROCESS;

  end Structure;

-- entity TZ1nB
  library IEEE, vital2000, MACHXO2;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use MACHXO2.COMPONENTS.ALL;

  entity TZ1nB is
    -- miscellaneous vital GENERICs
    GENERIC (
      TimingChecksOn	: boolean := TRUE;
      XOn           	: boolean := FALSE;
      MsgOn         	: boolean := TRUE;
      InstancePath  	: string := "TZ1nB";

      tipd_PADDO  	: VitalDelayType01 := (0 ns, 0 ns);
      tipd_TZ1nS  	: VitalDelayType01 := (0 ns, 0 ns);
      tpd_PADDO_TZ1nS	 : VitalDelayType01 := (0 ns, 0 ns);
      tperiod_TZ1nS 	: VitalDelayType := 0 ns;
      tpw_TZ1nS_posedge	: VitalDelayType := 0 ns;
      tpw_TZ1nS_negedge	: VitalDelayType := 0 ns);

    port (PADDO: in Std_logic; TZ1nS: inout Std_logic);

    ATTRIBUTE Vital_Level0 OF TZ1nB : ENTITY IS TRUE;

  end TZ1nB;

  architecture Structure of TZ1nB is
    ATTRIBUTE Vital_Level0 OF Structure : ARCHITECTURE IS TRUE;

    signal PADDO_ipd 	: std_logic := 'X';
    signal TZ1nS_ipd 	: std_logic := 'X';
    signal TZ1nS_out 	: std_logic := 'Z';

    signal GNDI: Std_logic;
    component gndB
      port (PWR0: out Std_logic);
    end component;
    component xo2iobuf
      port (I: in Std_logic; T: in Std_logic; Z: out Std_logic; 
            PAD: out Std_logic; PADI: in Std_logic);
    end component;
  begin
    TZ1n_pad: xo2iobuf
      port map (I=>PADDO_ipd, T=>GNDI, Z=>open, PAD=>TZ1nS_out, 
                PADI=>TZ1nS_ipd);
    DRIVEGND: gndB
      port map (PWR0=>GNDI);

    --  INPUT PATH DELAYs
    WireDelay : BLOCK
    BEGIN
      VitalWireDelay(PADDO_ipd, PADDO, tipd_PADDO);
      VitalWireDelay(TZ1nS_ipd, TZ1nS, tipd_TZ1nS);
    END BLOCK;

    VitalBehavior : PROCESS (PADDO_ipd, TZ1nS_ipd, TZ1nS_out)
    VARIABLE TZ1nS_zd         	: std_logic := 'X';
    VARIABLE TZ1nS_GlitchData 	: VitalGlitchDataType;

    VARIABLE tviol_TZ1nS_TZ1nS          	: x01 := '0';
    VARIABLE periodcheckinfo_TZ1nS	: VitalPeriodDataType;

    BEGIN

    IF (TimingChecksOn) THEN
      VitalPeriodPulseCheck (
        TestSignal => TZ1nS_ipd,
        TestSignalName => "TZ1nS",
        Period => tperiod_TZ1nS,
        PulseWidthHigh => tpw_TZ1nS_posedge,
        PulseWidthLow => tpw_TZ1nS_negedge,
        PeriodData => periodcheckinfo_TZ1nS,
        Violation => tviol_TZ1nS_TZ1nS,
        MsgOn => MsgOn, XOn => XOn,
        HeaderMsg => InstancePath,
        CheckEnabled => TRUE,
        MsgSeverity => warning);

    END IF;

    TZ1nS_zd 	:= TZ1nS_out;

    VitalPathDelay01 (
      OutSignal => TZ1nS, OutSignalName => "TZ1nS", OutTemp => TZ1nS_zd,
      Paths      => (0 => (InputChangeTime => PADDO_ipd'last_event,
                           PathDelay => tpd_PADDO_TZ1nS,
                           PathCondition => TRUE)),
      GlitchData => TZ1nS_GlitchData,
      Mode       => vitaltransport, XOn => XOn, MsgOn => MsgOn);

    END PROCESS;

  end Structure;

-- entity PWM9B_DB
  library IEEE, vital2000, MACHXO2;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use MACHXO2.COMPONENTS.ALL;

  entity PWM9B_DB is
    -- miscellaneous vital GENERICs
    GENERIC (
      TimingChecksOn	: boolean := TRUE;
      XOn           	: boolean := FALSE;
      MsgOn         	: boolean := TRUE;
      InstancePath  	: string := "PWM9B_DB";

      tipd_PWM9BD  	: VitalDelayType01 := (0 ns, 0 ns);
      tpd_PWM9BD_PADDI	 : VitalDelayType01 := (0 ns, 0 ns);
      tperiod_PWM9BD 	: VitalDelayType := 0 ns;
      tpw_PWM9BD_posedge	: VitalDelayType := 0 ns;
      tpw_PWM9BD_negedge	: VitalDelayType := 0 ns);

    port (PADDI: out Std_logic; PWM9BD: in Std_logic);

    ATTRIBUTE Vital_Level0 OF PWM9B_DB : ENTITY IS TRUE;

  end PWM9B_DB;

  architecture Structure of PWM9B_DB is
    ATTRIBUTE Vital_Level0 OF Structure : ARCHITECTURE IS TRUE;

    signal PADDI_out 	: std_logic := 'X';
    signal PWM9BD_ipd 	: std_logic := 'X';

    component xo2iobuf0003
      port (Z: out Std_logic; PAD: in Std_logic);
    end component;
  begin
    PWM9B_D_pad: xo2iobuf0003
      port map (Z=>PADDI_out, PAD=>PWM9BD_ipd);

    --  INPUT PATH DELAYs
    WireDelay : BLOCK
    BEGIN
      VitalWireDelay(PWM9BD_ipd, PWM9BD, tipd_PWM9BD);
    END BLOCK;

    VitalBehavior : PROCESS (PADDI_out, PWM9BD_ipd)
    VARIABLE PADDI_zd         	: std_logic := 'X';
    VARIABLE PADDI_GlitchData 	: VitalGlitchDataType;

    VARIABLE tviol_PWM9BD_PWM9BD          	: x01 := '0';
    VARIABLE periodcheckinfo_PWM9BD	: VitalPeriodDataType;

    BEGIN

    IF (TimingChecksOn) THEN
      VitalPeriodPulseCheck (
        TestSignal => PWM9BD_ipd,
        TestSignalName => "PWM9BD",
        Period => tperiod_PWM9BD,
        PulseWidthHigh => tpw_PWM9BD_posedge,
        PulseWidthLow => tpw_PWM9BD_negedge,
        PeriodData => periodcheckinfo_PWM9BD,
        Violation => tviol_PWM9BD_PWM9BD,
        MsgOn => MsgOn, XOn => XOn,
        HeaderMsg => InstancePath,
        CheckEnabled => TRUE,
        MsgSeverity => warning);

    END IF;

    PADDI_zd 	:= PADDI_out;

    VitalPathDelay01 (
      OutSignal => PADDI, OutSignalName => "PADDI", OutTemp => PADDI_zd,
      Paths      => (0 => (InputChangeTime => PWM9BD_ipd'last_event,
                           PathDelay => tpd_PWM9BD_PADDI,
                           PathCondition => TRUE)),
      GlitchData => PADDI_GlitchData,
      Mode       => vitaltransport, XOn => XOn, MsgOn => MsgOn);

    END PROCESS;

  end Structure;

-- entity PWM9A_DB
  library IEEE, vital2000, MACHXO2;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use MACHXO2.COMPONENTS.ALL;

  entity PWM9A_DB is
    -- miscellaneous vital GENERICs
    GENERIC (
      TimingChecksOn	: boolean := TRUE;
      XOn           	: boolean := FALSE;
      MsgOn         	: boolean := TRUE;
      InstancePath  	: string := "PWM9A_DB";

      tipd_PWM9AD  	: VitalDelayType01 := (0 ns, 0 ns);
      tpd_PWM9AD_PADDI	 : VitalDelayType01 := (0 ns, 0 ns);
      tperiod_PWM9AD 	: VitalDelayType := 0 ns;
      tpw_PWM9AD_posedge	: VitalDelayType := 0 ns;
      tpw_PWM9AD_negedge	: VitalDelayType := 0 ns);

    port (PADDI: out Std_logic; PWM9AD: in Std_logic);

    ATTRIBUTE Vital_Level0 OF PWM9A_DB : ENTITY IS TRUE;

  end PWM9A_DB;

  architecture Structure of PWM9A_DB is
    ATTRIBUTE Vital_Level0 OF Structure : ARCHITECTURE IS TRUE;

    signal PADDI_out 	: std_logic := 'X';
    signal PWM9AD_ipd 	: std_logic := 'X';

    component xo2iobuf0003
      port (Z: out Std_logic; PAD: in Std_logic);
    end component;
  begin
    PWM9A_D_pad: xo2iobuf0003
      port map (Z=>PADDI_out, PAD=>PWM9AD_ipd);

    --  INPUT PATH DELAYs
    WireDelay : BLOCK
    BEGIN
      VitalWireDelay(PWM9AD_ipd, PWM9AD, tipd_PWM9AD);
    END BLOCK;

    VitalBehavior : PROCESS (PADDI_out, PWM9AD_ipd)
    VARIABLE PADDI_zd         	: std_logic := 'X';
    VARIABLE PADDI_GlitchData 	: VitalGlitchDataType;

    VARIABLE tviol_PWM9AD_PWM9AD          	: x01 := '0';
    VARIABLE periodcheckinfo_PWM9AD	: VitalPeriodDataType;

    BEGIN

    IF (TimingChecksOn) THEN
      VitalPeriodPulseCheck (
        TestSignal => PWM9AD_ipd,
        TestSignalName => "PWM9AD",
        Period => tperiod_PWM9AD,
        PulseWidthHigh => tpw_PWM9AD_posedge,
        PulseWidthLow => tpw_PWM9AD_negedge,
        PeriodData => periodcheckinfo_PWM9AD,
        Violation => tviol_PWM9AD_PWM9AD,
        MsgOn => MsgOn, XOn => XOn,
        HeaderMsg => InstancePath,
        CheckEnabled => TRUE,
        MsgSeverity => warning);

    END IF;

    PADDI_zd 	:= PADDI_out;

    VitalPathDelay01 (
      OutSignal => PADDI, OutSignalName => "PADDI", OutTemp => PADDI_zd,
      Paths      => (0 => (InputChangeTime => PWM9AD_ipd'last_event,
                           PathDelay => tpd_PWM9AD_PADDI,
                           PathCondition => TRUE)),
      GlitchData => PADDI_GlitchData,
      Mode       => vitaltransport, XOn => XOn, MsgOn => MsgOn);

    END PROCESS;

  end Structure;

-- entity PWM8B_DB
  library IEEE, vital2000, MACHXO2;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use MACHXO2.COMPONENTS.ALL;

  entity PWM8B_DB is
    -- miscellaneous vital GENERICs
    GENERIC (
      TimingChecksOn	: boolean := TRUE;
      XOn           	: boolean := FALSE;
      MsgOn         	: boolean := TRUE;
      InstancePath  	: string := "PWM8B_DB";

      tipd_PWM8BD  	: VitalDelayType01 := (0 ns, 0 ns);
      tpd_PWM8BD_PADDI	 : VitalDelayType01 := (0 ns, 0 ns);
      tperiod_PWM8BD 	: VitalDelayType := 0 ns;
      tpw_PWM8BD_posedge	: VitalDelayType := 0 ns;
      tpw_PWM8BD_negedge	: VitalDelayType := 0 ns);

    port (PADDI: out Std_logic; PWM8BD: in Std_logic);

    ATTRIBUTE Vital_Level0 OF PWM8B_DB : ENTITY IS TRUE;

  end PWM8B_DB;

  architecture Structure of PWM8B_DB is
    ATTRIBUTE Vital_Level0 OF Structure : ARCHITECTURE IS TRUE;

    signal PADDI_out 	: std_logic := 'X';
    signal PWM8BD_ipd 	: std_logic := 'X';

    component xo2iobuf0003
      port (Z: out Std_logic; PAD: in Std_logic);
    end component;
  begin
    PWM8B_D_pad: xo2iobuf0003
      port map (Z=>PADDI_out, PAD=>PWM8BD_ipd);

    --  INPUT PATH DELAYs
    WireDelay : BLOCK
    BEGIN
      VitalWireDelay(PWM8BD_ipd, PWM8BD, tipd_PWM8BD);
    END BLOCK;

    VitalBehavior : PROCESS (PADDI_out, PWM8BD_ipd)
    VARIABLE PADDI_zd         	: std_logic := 'X';
    VARIABLE PADDI_GlitchData 	: VitalGlitchDataType;

    VARIABLE tviol_PWM8BD_PWM8BD          	: x01 := '0';
    VARIABLE periodcheckinfo_PWM8BD	: VitalPeriodDataType;

    BEGIN

    IF (TimingChecksOn) THEN
      VitalPeriodPulseCheck (
        TestSignal => PWM8BD_ipd,
        TestSignalName => "PWM8BD",
        Period => tperiod_PWM8BD,
        PulseWidthHigh => tpw_PWM8BD_posedge,
        PulseWidthLow => tpw_PWM8BD_negedge,
        PeriodData => periodcheckinfo_PWM8BD,
        Violation => tviol_PWM8BD_PWM8BD,
        MsgOn => MsgOn, XOn => XOn,
        HeaderMsg => InstancePath,
        CheckEnabled => TRUE,
        MsgSeverity => warning);

    END IF;

    PADDI_zd 	:= PADDI_out;

    VitalPathDelay01 (
      OutSignal => PADDI, OutSignalName => "PADDI", OutTemp => PADDI_zd,
      Paths      => (0 => (InputChangeTime => PWM8BD_ipd'last_event,
                           PathDelay => tpd_PWM8BD_PADDI,
                           PathCondition => TRUE)),
      GlitchData => PADDI_GlitchData,
      Mode       => vitaltransport, XOn => XOn, MsgOn => MsgOn);

    END PROCESS;

  end Structure;

-- entity PWM8A_DB
  library IEEE, vital2000, MACHXO2;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use MACHXO2.COMPONENTS.ALL;

  entity PWM8A_DB is
    -- miscellaneous vital GENERICs
    GENERIC (
      TimingChecksOn	: boolean := TRUE;
      XOn           	: boolean := FALSE;
      MsgOn         	: boolean := TRUE;
      InstancePath  	: string := "PWM8A_DB";

      tipd_PWM8AD  	: VitalDelayType01 := (0 ns, 0 ns);
      tpd_PWM8AD_PADDI	 : VitalDelayType01 := (0 ns, 0 ns);
      tperiod_PWM8AD 	: VitalDelayType := 0 ns;
      tpw_PWM8AD_posedge	: VitalDelayType := 0 ns;
      tpw_PWM8AD_negedge	: VitalDelayType := 0 ns);

    port (PADDI: out Std_logic; PWM8AD: in Std_logic);

    ATTRIBUTE Vital_Level0 OF PWM8A_DB : ENTITY IS TRUE;

  end PWM8A_DB;

  architecture Structure of PWM8A_DB is
    ATTRIBUTE Vital_Level0 OF Structure : ARCHITECTURE IS TRUE;

    signal PADDI_out 	: std_logic := 'X';
    signal PWM8AD_ipd 	: std_logic := 'X';

    component xo2iobuf0003
      port (Z: out Std_logic; PAD: in Std_logic);
    end component;
  begin
    PWM8A_D_pad: xo2iobuf0003
      port map (Z=>PADDI_out, PAD=>PWM8AD_ipd);

    --  INPUT PATH DELAYs
    WireDelay : BLOCK
    BEGIN
      VitalWireDelay(PWM8AD_ipd, PWM8AD, tipd_PWM8AD);
    END BLOCK;

    VitalBehavior : PROCESS (PADDI_out, PWM8AD_ipd)
    VARIABLE PADDI_zd         	: std_logic := 'X';
    VARIABLE PADDI_GlitchData 	: VitalGlitchDataType;

    VARIABLE tviol_PWM8AD_PWM8AD          	: x01 := '0';
    VARIABLE periodcheckinfo_PWM8AD	: VitalPeriodDataType;

    BEGIN

    IF (TimingChecksOn) THEN
      VitalPeriodPulseCheck (
        TestSignal => PWM8AD_ipd,
        TestSignalName => "PWM8AD",
        Period => tperiod_PWM8AD,
        PulseWidthHigh => tpw_PWM8AD_posedge,
        PulseWidthLow => tpw_PWM8AD_negedge,
        PeriodData => periodcheckinfo_PWM8AD,
        Violation => tviol_PWM8AD_PWM8AD,
        MsgOn => MsgOn, XOn => XOn,
        HeaderMsg => InstancePath,
        CheckEnabled => TRUE,
        MsgSeverity => warning);

    END IF;

    PADDI_zd 	:= PADDI_out;

    VitalPathDelay01 (
      OutSignal => PADDI, OutSignalName => "PADDI", OutTemp => PADDI_zd,
      Paths      => (0 => (InputChangeTime => PWM8AD_ipd'last_event,
                           PathDelay => tpd_PWM8AD_PADDI,
                           PathCondition => TRUE)),
      GlitchData => PADDI_GlitchData,
      Mode       => vitaltransport, XOn => XOn, MsgOn => MsgOn);

    END PROCESS;

  end Structure;

-- entity PWM7B_DB
  library IEEE, vital2000, MACHXO2;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use MACHXO2.COMPONENTS.ALL;

  entity PWM7B_DB is
    -- miscellaneous vital GENERICs
    GENERIC (
      TimingChecksOn	: boolean := TRUE;
      XOn           	: boolean := FALSE;
      MsgOn         	: boolean := TRUE;
      InstancePath  	: string := "PWM7B_DB";

      tipd_PWM7BD  	: VitalDelayType01 := (0 ns, 0 ns);
      tpd_PWM7BD_PADDI	 : VitalDelayType01 := (0 ns, 0 ns);
      tperiod_PWM7BD 	: VitalDelayType := 0 ns;
      tpw_PWM7BD_posedge	: VitalDelayType := 0 ns;
      tpw_PWM7BD_negedge	: VitalDelayType := 0 ns);

    port (PADDI: out Std_logic; PWM7BD: in Std_logic);

    ATTRIBUTE Vital_Level0 OF PWM7B_DB : ENTITY IS TRUE;

  end PWM7B_DB;

  architecture Structure of PWM7B_DB is
    ATTRIBUTE Vital_Level0 OF Structure : ARCHITECTURE IS TRUE;

    signal PADDI_out 	: std_logic := 'X';
    signal PWM7BD_ipd 	: std_logic := 'X';

    component xo2iobuf0003
      port (Z: out Std_logic; PAD: in Std_logic);
    end component;
  begin
    PWM7B_D_pad: xo2iobuf0003
      port map (Z=>PADDI_out, PAD=>PWM7BD_ipd);

    --  INPUT PATH DELAYs
    WireDelay : BLOCK
    BEGIN
      VitalWireDelay(PWM7BD_ipd, PWM7BD, tipd_PWM7BD);
    END BLOCK;

    VitalBehavior : PROCESS (PADDI_out, PWM7BD_ipd)
    VARIABLE PADDI_zd         	: std_logic := 'X';
    VARIABLE PADDI_GlitchData 	: VitalGlitchDataType;

    VARIABLE tviol_PWM7BD_PWM7BD          	: x01 := '0';
    VARIABLE periodcheckinfo_PWM7BD	: VitalPeriodDataType;

    BEGIN

    IF (TimingChecksOn) THEN
      VitalPeriodPulseCheck (
        TestSignal => PWM7BD_ipd,
        TestSignalName => "PWM7BD",
        Period => tperiod_PWM7BD,
        PulseWidthHigh => tpw_PWM7BD_posedge,
        PulseWidthLow => tpw_PWM7BD_negedge,
        PeriodData => periodcheckinfo_PWM7BD,
        Violation => tviol_PWM7BD_PWM7BD,
        MsgOn => MsgOn, XOn => XOn,
        HeaderMsg => InstancePath,
        CheckEnabled => TRUE,
        MsgSeverity => warning);

    END IF;

    PADDI_zd 	:= PADDI_out;

    VitalPathDelay01 (
      OutSignal => PADDI, OutSignalName => "PADDI", OutTemp => PADDI_zd,
      Paths      => (0 => (InputChangeTime => PWM7BD_ipd'last_event,
                           PathDelay => tpd_PWM7BD_PADDI,
                           PathCondition => TRUE)),
      GlitchData => PADDI_GlitchData,
      Mode       => vitaltransport, XOn => XOn, MsgOn => MsgOn);

    END PROCESS;

  end Structure;

-- entity PWM7A_DB
  library IEEE, vital2000, MACHXO2;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use MACHXO2.COMPONENTS.ALL;

  entity PWM7A_DB is
    -- miscellaneous vital GENERICs
    GENERIC (
      TimingChecksOn	: boolean := TRUE;
      XOn           	: boolean := FALSE;
      MsgOn         	: boolean := TRUE;
      InstancePath  	: string := "PWM7A_DB";

      tipd_PWM7AD  	: VitalDelayType01 := (0 ns, 0 ns);
      tpd_PWM7AD_PADDI	 : VitalDelayType01 := (0 ns, 0 ns);
      tperiod_PWM7AD 	: VitalDelayType := 0 ns;
      tpw_PWM7AD_posedge	: VitalDelayType := 0 ns;
      tpw_PWM7AD_negedge	: VitalDelayType := 0 ns);

    port (PADDI: out Std_logic; PWM7AD: in Std_logic);

    ATTRIBUTE Vital_Level0 OF PWM7A_DB : ENTITY IS TRUE;

  end PWM7A_DB;

  architecture Structure of PWM7A_DB is
    ATTRIBUTE Vital_Level0 OF Structure : ARCHITECTURE IS TRUE;

    signal PADDI_out 	: std_logic := 'X';
    signal PWM7AD_ipd 	: std_logic := 'X';

    component xo2iobuf0003
      port (Z: out Std_logic; PAD: in Std_logic);
    end component;
  begin
    PWM7A_D_pad: xo2iobuf0003
      port map (Z=>PADDI_out, PAD=>PWM7AD_ipd);

    --  INPUT PATH DELAYs
    WireDelay : BLOCK
    BEGIN
      VitalWireDelay(PWM7AD_ipd, PWM7AD, tipd_PWM7AD);
    END BLOCK;

    VitalBehavior : PROCESS (PADDI_out, PWM7AD_ipd)
    VARIABLE PADDI_zd         	: std_logic := 'X';
    VARIABLE PADDI_GlitchData 	: VitalGlitchDataType;

    VARIABLE tviol_PWM7AD_PWM7AD          	: x01 := '0';
    VARIABLE periodcheckinfo_PWM7AD	: VitalPeriodDataType;

    BEGIN

    IF (TimingChecksOn) THEN
      VitalPeriodPulseCheck (
        TestSignal => PWM7AD_ipd,
        TestSignalName => "PWM7AD",
        Period => tperiod_PWM7AD,
        PulseWidthHigh => tpw_PWM7AD_posedge,
        PulseWidthLow => tpw_PWM7AD_negedge,
        PeriodData => periodcheckinfo_PWM7AD,
        Violation => tviol_PWM7AD_PWM7AD,
        MsgOn => MsgOn, XOn => XOn,
        HeaderMsg => InstancePath,
        CheckEnabled => TRUE,
        MsgSeverity => warning);

    END IF;

    PADDI_zd 	:= PADDI_out;

    VitalPathDelay01 (
      OutSignal => PADDI, OutSignalName => "PADDI", OutTemp => PADDI_zd,
      Paths      => (0 => (InputChangeTime => PWM7AD_ipd'last_event,
                           PathDelay => tpd_PWM7AD_PADDI,
                           PathCondition => TRUE)),
      GlitchData => PADDI_GlitchData,
      Mode       => vitaltransport, XOn => XOn, MsgOn => MsgOn);

    END PROCESS;

  end Structure;

-- entity PWM6B_DB
  library IEEE, vital2000, MACHXO2;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use MACHXO2.COMPONENTS.ALL;

  entity PWM6B_DB is
    -- miscellaneous vital GENERICs
    GENERIC (
      TimingChecksOn	: boolean := TRUE;
      XOn           	: boolean := FALSE;
      MsgOn         	: boolean := TRUE;
      InstancePath  	: string := "PWM6B_DB";

      tipd_PWM6BD  	: VitalDelayType01 := (0 ns, 0 ns);
      tpd_PWM6BD_PADDI	 : VitalDelayType01 := (0 ns, 0 ns);
      tperiod_PWM6BD 	: VitalDelayType := 0 ns;
      tpw_PWM6BD_posedge	: VitalDelayType := 0 ns;
      tpw_PWM6BD_negedge	: VitalDelayType := 0 ns);

    port (PADDI: out Std_logic; PWM6BD: in Std_logic);

    ATTRIBUTE Vital_Level0 OF PWM6B_DB : ENTITY IS TRUE;

  end PWM6B_DB;

  architecture Structure of PWM6B_DB is
    ATTRIBUTE Vital_Level0 OF Structure : ARCHITECTURE IS TRUE;

    signal PADDI_out 	: std_logic := 'X';
    signal PWM6BD_ipd 	: std_logic := 'X';

    component xo2iobuf0003
      port (Z: out Std_logic; PAD: in Std_logic);
    end component;
  begin
    PWM6B_D_pad: xo2iobuf0003
      port map (Z=>PADDI_out, PAD=>PWM6BD_ipd);

    --  INPUT PATH DELAYs
    WireDelay : BLOCK
    BEGIN
      VitalWireDelay(PWM6BD_ipd, PWM6BD, tipd_PWM6BD);
    END BLOCK;

    VitalBehavior : PROCESS (PADDI_out, PWM6BD_ipd)
    VARIABLE PADDI_zd         	: std_logic := 'X';
    VARIABLE PADDI_GlitchData 	: VitalGlitchDataType;

    VARIABLE tviol_PWM6BD_PWM6BD          	: x01 := '0';
    VARIABLE periodcheckinfo_PWM6BD	: VitalPeriodDataType;

    BEGIN

    IF (TimingChecksOn) THEN
      VitalPeriodPulseCheck (
        TestSignal => PWM6BD_ipd,
        TestSignalName => "PWM6BD",
        Period => tperiod_PWM6BD,
        PulseWidthHigh => tpw_PWM6BD_posedge,
        PulseWidthLow => tpw_PWM6BD_negedge,
        PeriodData => periodcheckinfo_PWM6BD,
        Violation => tviol_PWM6BD_PWM6BD,
        MsgOn => MsgOn, XOn => XOn,
        HeaderMsg => InstancePath,
        CheckEnabled => TRUE,
        MsgSeverity => warning);

    END IF;

    PADDI_zd 	:= PADDI_out;

    VitalPathDelay01 (
      OutSignal => PADDI, OutSignalName => "PADDI", OutTemp => PADDI_zd,
      Paths      => (0 => (InputChangeTime => PWM6BD_ipd'last_event,
                           PathDelay => tpd_PWM6BD_PADDI,
                           PathCondition => TRUE)),
      GlitchData => PADDI_GlitchData,
      Mode       => vitaltransport, XOn => XOn, MsgOn => MsgOn);

    END PROCESS;

  end Structure;

-- entity PWM6A_DB
  library IEEE, vital2000, MACHXO2;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use MACHXO2.COMPONENTS.ALL;

  entity PWM6A_DB is
    -- miscellaneous vital GENERICs
    GENERIC (
      TimingChecksOn	: boolean := TRUE;
      XOn           	: boolean := FALSE;
      MsgOn         	: boolean := TRUE;
      InstancePath  	: string := "PWM6A_DB";

      tipd_PWM6AD  	: VitalDelayType01 := (0 ns, 0 ns);
      tpd_PWM6AD_PADDI	 : VitalDelayType01 := (0 ns, 0 ns);
      tperiod_PWM6AD 	: VitalDelayType := 0 ns;
      tpw_PWM6AD_posedge	: VitalDelayType := 0 ns;
      tpw_PWM6AD_negedge	: VitalDelayType := 0 ns);

    port (PADDI: out Std_logic; PWM6AD: in Std_logic);

    ATTRIBUTE Vital_Level0 OF PWM6A_DB : ENTITY IS TRUE;

  end PWM6A_DB;

  architecture Structure of PWM6A_DB is
    ATTRIBUTE Vital_Level0 OF Structure : ARCHITECTURE IS TRUE;

    signal PADDI_out 	: std_logic := 'X';
    signal PWM6AD_ipd 	: std_logic := 'X';

    component xo2iobuf0003
      port (Z: out Std_logic; PAD: in Std_logic);
    end component;
  begin
    PWM6A_D_pad: xo2iobuf0003
      port map (Z=>PADDI_out, PAD=>PWM6AD_ipd);

    --  INPUT PATH DELAYs
    WireDelay : BLOCK
    BEGIN
      VitalWireDelay(PWM6AD_ipd, PWM6AD, tipd_PWM6AD);
    END BLOCK;

    VitalBehavior : PROCESS (PADDI_out, PWM6AD_ipd)
    VARIABLE PADDI_zd         	: std_logic := 'X';
    VARIABLE PADDI_GlitchData 	: VitalGlitchDataType;

    VARIABLE tviol_PWM6AD_PWM6AD          	: x01 := '0';
    VARIABLE periodcheckinfo_PWM6AD	: VitalPeriodDataType;

    BEGIN

    IF (TimingChecksOn) THEN
      VitalPeriodPulseCheck (
        TestSignal => PWM6AD_ipd,
        TestSignalName => "PWM6AD",
        Period => tperiod_PWM6AD,
        PulseWidthHigh => tpw_PWM6AD_posedge,
        PulseWidthLow => tpw_PWM6AD_negedge,
        PeriodData => periodcheckinfo_PWM6AD,
        Violation => tviol_PWM6AD_PWM6AD,
        MsgOn => MsgOn, XOn => XOn,
        HeaderMsg => InstancePath,
        CheckEnabled => TRUE,
        MsgSeverity => warning);

    END IF;

    PADDI_zd 	:= PADDI_out;

    VitalPathDelay01 (
      OutSignal => PADDI, OutSignalName => "PADDI", OutTemp => PADDI_zd,
      Paths      => (0 => (InputChangeTime => PWM6AD_ipd'last_event,
                           PathDelay => tpd_PWM6AD_PADDI,
                           PathCondition => TRUE)),
      GlitchData => PADDI_GlitchData,
      Mode       => vitaltransport, XOn => XOn, MsgOn => MsgOn);

    END PROCESS;

  end Structure;

-- entity PWM5B_DB
  library IEEE, vital2000, MACHXO2;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use MACHXO2.COMPONENTS.ALL;

  entity PWM5B_DB is
    -- miscellaneous vital GENERICs
    GENERIC (
      TimingChecksOn	: boolean := TRUE;
      XOn           	: boolean := FALSE;
      MsgOn         	: boolean := TRUE;
      InstancePath  	: string := "PWM5B_DB";

      tipd_PWM5BD  	: VitalDelayType01 := (0 ns, 0 ns);
      tpd_PWM5BD_PADDI	 : VitalDelayType01 := (0 ns, 0 ns);
      tperiod_PWM5BD 	: VitalDelayType := 0 ns;
      tpw_PWM5BD_posedge	: VitalDelayType := 0 ns;
      tpw_PWM5BD_negedge	: VitalDelayType := 0 ns);

    port (PADDI: out Std_logic; PWM5BD: in Std_logic);

    ATTRIBUTE Vital_Level0 OF PWM5B_DB : ENTITY IS TRUE;

  end PWM5B_DB;

  architecture Structure of PWM5B_DB is
    ATTRIBUTE Vital_Level0 OF Structure : ARCHITECTURE IS TRUE;

    signal PADDI_out 	: std_logic := 'X';
    signal PWM5BD_ipd 	: std_logic := 'X';

    component xo2iobuf0003
      port (Z: out Std_logic; PAD: in Std_logic);
    end component;
  begin
    PWM5B_D_pad: xo2iobuf0003
      port map (Z=>PADDI_out, PAD=>PWM5BD_ipd);

    --  INPUT PATH DELAYs
    WireDelay : BLOCK
    BEGIN
      VitalWireDelay(PWM5BD_ipd, PWM5BD, tipd_PWM5BD);
    END BLOCK;

    VitalBehavior : PROCESS (PADDI_out, PWM5BD_ipd)
    VARIABLE PADDI_zd         	: std_logic := 'X';
    VARIABLE PADDI_GlitchData 	: VitalGlitchDataType;

    VARIABLE tviol_PWM5BD_PWM5BD          	: x01 := '0';
    VARIABLE periodcheckinfo_PWM5BD	: VitalPeriodDataType;

    BEGIN

    IF (TimingChecksOn) THEN
      VitalPeriodPulseCheck (
        TestSignal => PWM5BD_ipd,
        TestSignalName => "PWM5BD",
        Period => tperiod_PWM5BD,
        PulseWidthHigh => tpw_PWM5BD_posedge,
        PulseWidthLow => tpw_PWM5BD_negedge,
        PeriodData => periodcheckinfo_PWM5BD,
        Violation => tviol_PWM5BD_PWM5BD,
        MsgOn => MsgOn, XOn => XOn,
        HeaderMsg => InstancePath,
        CheckEnabled => TRUE,
        MsgSeverity => warning);

    END IF;

    PADDI_zd 	:= PADDI_out;

    VitalPathDelay01 (
      OutSignal => PADDI, OutSignalName => "PADDI", OutTemp => PADDI_zd,
      Paths      => (0 => (InputChangeTime => PWM5BD_ipd'last_event,
                           PathDelay => tpd_PWM5BD_PADDI,
                           PathCondition => TRUE)),
      GlitchData => PADDI_GlitchData,
      Mode       => vitaltransport, XOn => XOn, MsgOn => MsgOn);

    END PROCESS;

  end Structure;

-- entity PWM5A_DB
  library IEEE, vital2000, MACHXO2;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use MACHXO2.COMPONENTS.ALL;

  entity PWM5A_DB is
    -- miscellaneous vital GENERICs
    GENERIC (
      TimingChecksOn	: boolean := TRUE;
      XOn           	: boolean := FALSE;
      MsgOn         	: boolean := TRUE;
      InstancePath  	: string := "PWM5A_DB";

      tipd_PWM5AD  	: VitalDelayType01 := (0 ns, 0 ns);
      tpd_PWM5AD_PADDI	 : VitalDelayType01 := (0 ns, 0 ns);
      tperiod_PWM5AD 	: VitalDelayType := 0 ns;
      tpw_PWM5AD_posedge	: VitalDelayType := 0 ns;
      tpw_PWM5AD_negedge	: VitalDelayType := 0 ns);

    port (PADDI: out Std_logic; PWM5AD: in Std_logic);

    ATTRIBUTE Vital_Level0 OF PWM5A_DB : ENTITY IS TRUE;

  end PWM5A_DB;

  architecture Structure of PWM5A_DB is
    ATTRIBUTE Vital_Level0 OF Structure : ARCHITECTURE IS TRUE;

    signal PADDI_out 	: std_logic := 'X';
    signal PWM5AD_ipd 	: std_logic := 'X';

    component xo2iobuf0003
      port (Z: out Std_logic; PAD: in Std_logic);
    end component;
  begin
    PWM5A_D_pad: xo2iobuf0003
      port map (Z=>PADDI_out, PAD=>PWM5AD_ipd);

    --  INPUT PATH DELAYs
    WireDelay : BLOCK
    BEGIN
      VitalWireDelay(PWM5AD_ipd, PWM5AD, tipd_PWM5AD);
    END BLOCK;

    VitalBehavior : PROCESS (PADDI_out, PWM5AD_ipd)
    VARIABLE PADDI_zd         	: std_logic := 'X';
    VARIABLE PADDI_GlitchData 	: VitalGlitchDataType;

    VARIABLE tviol_PWM5AD_PWM5AD          	: x01 := '0';
    VARIABLE periodcheckinfo_PWM5AD	: VitalPeriodDataType;

    BEGIN

    IF (TimingChecksOn) THEN
      VitalPeriodPulseCheck (
        TestSignal => PWM5AD_ipd,
        TestSignalName => "PWM5AD",
        Period => tperiod_PWM5AD,
        PulseWidthHigh => tpw_PWM5AD_posedge,
        PulseWidthLow => tpw_PWM5AD_negedge,
        PeriodData => periodcheckinfo_PWM5AD,
        Violation => tviol_PWM5AD_PWM5AD,
        MsgOn => MsgOn, XOn => XOn,
        HeaderMsg => InstancePath,
        CheckEnabled => TRUE,
        MsgSeverity => warning);

    END IF;

    PADDI_zd 	:= PADDI_out;

    VitalPathDelay01 (
      OutSignal => PADDI, OutSignalName => "PADDI", OutTemp => PADDI_zd,
      Paths      => (0 => (InputChangeTime => PWM5AD_ipd'last_event,
                           PathDelay => tpd_PWM5AD_PADDI,
                           PathCondition => TRUE)),
      GlitchData => PADDI_GlitchData,
      Mode       => vitaltransport, XOn => XOn, MsgOn => MsgOn);

    END PROCESS;

  end Structure;

-- entity PWM4B_DB
  library IEEE, vital2000, MACHXO2;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use MACHXO2.COMPONENTS.ALL;

  entity PWM4B_DB is
    -- miscellaneous vital GENERICs
    GENERIC (
      TimingChecksOn	: boolean := TRUE;
      XOn           	: boolean := FALSE;
      MsgOn         	: boolean := TRUE;
      InstancePath  	: string := "PWM4B_DB";

      tipd_PWM4BD  	: VitalDelayType01 := (0 ns, 0 ns);
      tpd_PWM4BD_PADDI	 : VitalDelayType01 := (0 ns, 0 ns);
      tperiod_PWM4BD 	: VitalDelayType := 0 ns;
      tpw_PWM4BD_posedge	: VitalDelayType := 0 ns;
      tpw_PWM4BD_negedge	: VitalDelayType := 0 ns);

    port (PADDI: out Std_logic; PWM4BD: in Std_logic);

    ATTRIBUTE Vital_Level0 OF PWM4B_DB : ENTITY IS TRUE;

  end PWM4B_DB;

  architecture Structure of PWM4B_DB is
    ATTRIBUTE Vital_Level0 OF Structure : ARCHITECTURE IS TRUE;

    signal PADDI_out 	: std_logic := 'X';
    signal PWM4BD_ipd 	: std_logic := 'X';

    component xo2iobuf0003
      port (Z: out Std_logic; PAD: in Std_logic);
    end component;
  begin
    PWM4B_D_pad: xo2iobuf0003
      port map (Z=>PADDI_out, PAD=>PWM4BD_ipd);

    --  INPUT PATH DELAYs
    WireDelay : BLOCK
    BEGIN
      VitalWireDelay(PWM4BD_ipd, PWM4BD, tipd_PWM4BD);
    END BLOCK;

    VitalBehavior : PROCESS (PADDI_out, PWM4BD_ipd)
    VARIABLE PADDI_zd         	: std_logic := 'X';
    VARIABLE PADDI_GlitchData 	: VitalGlitchDataType;

    VARIABLE tviol_PWM4BD_PWM4BD          	: x01 := '0';
    VARIABLE periodcheckinfo_PWM4BD	: VitalPeriodDataType;

    BEGIN

    IF (TimingChecksOn) THEN
      VitalPeriodPulseCheck (
        TestSignal => PWM4BD_ipd,
        TestSignalName => "PWM4BD",
        Period => tperiod_PWM4BD,
        PulseWidthHigh => tpw_PWM4BD_posedge,
        PulseWidthLow => tpw_PWM4BD_negedge,
        PeriodData => periodcheckinfo_PWM4BD,
        Violation => tviol_PWM4BD_PWM4BD,
        MsgOn => MsgOn, XOn => XOn,
        HeaderMsg => InstancePath,
        CheckEnabled => TRUE,
        MsgSeverity => warning);

    END IF;

    PADDI_zd 	:= PADDI_out;

    VitalPathDelay01 (
      OutSignal => PADDI, OutSignalName => "PADDI", OutTemp => PADDI_zd,
      Paths      => (0 => (InputChangeTime => PWM4BD_ipd'last_event,
                           PathDelay => tpd_PWM4BD_PADDI,
                           PathCondition => TRUE)),
      GlitchData => PADDI_GlitchData,
      Mode       => vitaltransport, XOn => XOn, MsgOn => MsgOn);

    END PROCESS;

  end Structure;

-- entity PWM4A_DB
  library IEEE, vital2000, MACHXO2;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use MACHXO2.COMPONENTS.ALL;

  entity PWM4A_DB is
    -- miscellaneous vital GENERICs
    GENERIC (
      TimingChecksOn	: boolean := TRUE;
      XOn           	: boolean := FALSE;
      MsgOn         	: boolean := TRUE;
      InstancePath  	: string := "PWM4A_DB";

      tipd_PWM4AD  	: VitalDelayType01 := (0 ns, 0 ns);
      tpd_PWM4AD_PADDI	 : VitalDelayType01 := (0 ns, 0 ns);
      tperiod_PWM4AD 	: VitalDelayType := 0 ns;
      tpw_PWM4AD_posedge	: VitalDelayType := 0 ns;
      tpw_PWM4AD_negedge	: VitalDelayType := 0 ns);

    port (PADDI: out Std_logic; PWM4AD: in Std_logic);

    ATTRIBUTE Vital_Level0 OF PWM4A_DB : ENTITY IS TRUE;

  end PWM4A_DB;

  architecture Structure of PWM4A_DB is
    ATTRIBUTE Vital_Level0 OF Structure : ARCHITECTURE IS TRUE;

    signal PADDI_out 	: std_logic := 'X';
    signal PWM4AD_ipd 	: std_logic := 'X';

    component xo2iobuf0003
      port (Z: out Std_logic; PAD: in Std_logic);
    end component;
  begin
    PWM4A_D_pad: xo2iobuf0003
      port map (Z=>PADDI_out, PAD=>PWM4AD_ipd);

    --  INPUT PATH DELAYs
    WireDelay : BLOCK
    BEGIN
      VitalWireDelay(PWM4AD_ipd, PWM4AD, tipd_PWM4AD);
    END BLOCK;

    VitalBehavior : PROCESS (PADDI_out, PWM4AD_ipd)
    VARIABLE PADDI_zd         	: std_logic := 'X';
    VARIABLE PADDI_GlitchData 	: VitalGlitchDataType;

    VARIABLE tviol_PWM4AD_PWM4AD          	: x01 := '0';
    VARIABLE periodcheckinfo_PWM4AD	: VitalPeriodDataType;

    BEGIN

    IF (TimingChecksOn) THEN
      VitalPeriodPulseCheck (
        TestSignal => PWM4AD_ipd,
        TestSignalName => "PWM4AD",
        Period => tperiod_PWM4AD,
        PulseWidthHigh => tpw_PWM4AD_posedge,
        PulseWidthLow => tpw_PWM4AD_negedge,
        PeriodData => periodcheckinfo_PWM4AD,
        Violation => tviol_PWM4AD_PWM4AD,
        MsgOn => MsgOn, XOn => XOn,
        HeaderMsg => InstancePath,
        CheckEnabled => TRUE,
        MsgSeverity => warning);

    END IF;

    PADDI_zd 	:= PADDI_out;

    VitalPathDelay01 (
      OutSignal => PADDI, OutSignalName => "PADDI", OutTemp => PADDI_zd,
      Paths      => (0 => (InputChangeTime => PWM4AD_ipd'last_event,
                           PathDelay => tpd_PWM4AD_PADDI,
                           PathCondition => TRUE)),
      GlitchData => PADDI_GlitchData,
      Mode       => vitaltransport, XOn => XOn, MsgOn => MsgOn);

    END PROCESS;

  end Structure;

-- entity PWM3B_DB
  library IEEE, vital2000, MACHXO2;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use MACHXO2.COMPONENTS.ALL;

  entity PWM3B_DB is
    -- miscellaneous vital GENERICs
    GENERIC (
      TimingChecksOn	: boolean := TRUE;
      XOn           	: boolean := FALSE;
      MsgOn         	: boolean := TRUE;
      InstancePath  	: string := "PWM3B_DB";

      tipd_PWM3BD  	: VitalDelayType01 := (0 ns, 0 ns);
      tpd_PWM3BD_PADDI	 : VitalDelayType01 := (0 ns, 0 ns);
      tperiod_PWM3BD 	: VitalDelayType := 0 ns;
      tpw_PWM3BD_posedge	: VitalDelayType := 0 ns;
      tpw_PWM3BD_negedge	: VitalDelayType := 0 ns);

    port (PADDI: out Std_logic; PWM3BD: in Std_logic);

    ATTRIBUTE Vital_Level0 OF PWM3B_DB : ENTITY IS TRUE;

  end PWM3B_DB;

  architecture Structure of PWM3B_DB is
    ATTRIBUTE Vital_Level0 OF Structure : ARCHITECTURE IS TRUE;

    signal PADDI_out 	: std_logic := 'X';
    signal PWM3BD_ipd 	: std_logic := 'X';

    component xo2iobuf0003
      port (Z: out Std_logic; PAD: in Std_logic);
    end component;
  begin
    PWM3B_D_pad: xo2iobuf0003
      port map (Z=>PADDI_out, PAD=>PWM3BD_ipd);

    --  INPUT PATH DELAYs
    WireDelay : BLOCK
    BEGIN
      VitalWireDelay(PWM3BD_ipd, PWM3BD, tipd_PWM3BD);
    END BLOCK;

    VitalBehavior : PROCESS (PADDI_out, PWM3BD_ipd)
    VARIABLE PADDI_zd         	: std_logic := 'X';
    VARIABLE PADDI_GlitchData 	: VitalGlitchDataType;

    VARIABLE tviol_PWM3BD_PWM3BD          	: x01 := '0';
    VARIABLE periodcheckinfo_PWM3BD	: VitalPeriodDataType;

    BEGIN

    IF (TimingChecksOn) THEN
      VitalPeriodPulseCheck (
        TestSignal => PWM3BD_ipd,
        TestSignalName => "PWM3BD",
        Period => tperiod_PWM3BD,
        PulseWidthHigh => tpw_PWM3BD_posedge,
        PulseWidthLow => tpw_PWM3BD_negedge,
        PeriodData => periodcheckinfo_PWM3BD,
        Violation => tviol_PWM3BD_PWM3BD,
        MsgOn => MsgOn, XOn => XOn,
        HeaderMsg => InstancePath,
        CheckEnabled => TRUE,
        MsgSeverity => warning);

    END IF;

    PADDI_zd 	:= PADDI_out;

    VitalPathDelay01 (
      OutSignal => PADDI, OutSignalName => "PADDI", OutTemp => PADDI_zd,
      Paths      => (0 => (InputChangeTime => PWM3BD_ipd'last_event,
                           PathDelay => tpd_PWM3BD_PADDI,
                           PathCondition => TRUE)),
      GlitchData => PADDI_GlitchData,
      Mode       => vitaltransport, XOn => XOn, MsgOn => MsgOn);

    END PROCESS;

  end Structure;

-- entity PWM3A_DB
  library IEEE, vital2000, MACHXO2;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use MACHXO2.COMPONENTS.ALL;

  entity PWM3A_DB is
    -- miscellaneous vital GENERICs
    GENERIC (
      TimingChecksOn	: boolean := TRUE;
      XOn           	: boolean := FALSE;
      MsgOn         	: boolean := TRUE;
      InstancePath  	: string := "PWM3A_DB";

      tipd_PWM3AD  	: VitalDelayType01 := (0 ns, 0 ns);
      tpd_PWM3AD_PADDI	 : VitalDelayType01 := (0 ns, 0 ns);
      tperiod_PWM3AD 	: VitalDelayType := 0 ns;
      tpw_PWM3AD_posedge	: VitalDelayType := 0 ns;
      tpw_PWM3AD_negedge	: VitalDelayType := 0 ns);

    port (PADDI: out Std_logic; PWM3AD: in Std_logic);

    ATTRIBUTE Vital_Level0 OF PWM3A_DB : ENTITY IS TRUE;

  end PWM3A_DB;

  architecture Structure of PWM3A_DB is
    ATTRIBUTE Vital_Level0 OF Structure : ARCHITECTURE IS TRUE;

    signal PADDI_out 	: std_logic := 'X';
    signal PWM3AD_ipd 	: std_logic := 'X';

    component xo2iobuf0003
      port (Z: out Std_logic; PAD: in Std_logic);
    end component;
  begin
    PWM3A_D_pad: xo2iobuf0003
      port map (Z=>PADDI_out, PAD=>PWM3AD_ipd);

    --  INPUT PATH DELAYs
    WireDelay : BLOCK
    BEGIN
      VitalWireDelay(PWM3AD_ipd, PWM3AD, tipd_PWM3AD);
    END BLOCK;

    VitalBehavior : PROCESS (PADDI_out, PWM3AD_ipd)
    VARIABLE PADDI_zd         	: std_logic := 'X';
    VARIABLE PADDI_GlitchData 	: VitalGlitchDataType;

    VARIABLE tviol_PWM3AD_PWM3AD          	: x01 := '0';
    VARIABLE periodcheckinfo_PWM3AD	: VitalPeriodDataType;

    BEGIN

    IF (TimingChecksOn) THEN
      VitalPeriodPulseCheck (
        TestSignal => PWM3AD_ipd,
        TestSignalName => "PWM3AD",
        Period => tperiod_PWM3AD,
        PulseWidthHigh => tpw_PWM3AD_posedge,
        PulseWidthLow => tpw_PWM3AD_negedge,
        PeriodData => periodcheckinfo_PWM3AD,
        Violation => tviol_PWM3AD_PWM3AD,
        MsgOn => MsgOn, XOn => XOn,
        HeaderMsg => InstancePath,
        CheckEnabled => TRUE,
        MsgSeverity => warning);

    END IF;

    PADDI_zd 	:= PADDI_out;

    VitalPathDelay01 (
      OutSignal => PADDI, OutSignalName => "PADDI", OutTemp => PADDI_zd,
      Paths      => (0 => (InputChangeTime => PWM3AD_ipd'last_event,
                           PathDelay => tpd_PWM3AD_PADDI,
                           PathCondition => TRUE)),
      GlitchData => PADDI_GlitchData,
      Mode       => vitaltransport, XOn => XOn, MsgOn => MsgOn);

    END PROCESS;

  end Structure;

-- entity PWM2B_DB
  library IEEE, vital2000, MACHXO2;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use MACHXO2.COMPONENTS.ALL;

  entity PWM2B_DB is
    -- miscellaneous vital GENERICs
    GENERIC (
      TimingChecksOn	: boolean := TRUE;
      XOn           	: boolean := FALSE;
      MsgOn         	: boolean := TRUE;
      InstancePath  	: string := "PWM2B_DB";

      tipd_PWM2BD  	: VitalDelayType01 := (0 ns, 0 ns);
      tpd_PWM2BD_PADDI	 : VitalDelayType01 := (0 ns, 0 ns);
      tperiod_PWM2BD 	: VitalDelayType := 0 ns;
      tpw_PWM2BD_posedge	: VitalDelayType := 0 ns;
      tpw_PWM2BD_negedge	: VitalDelayType := 0 ns);

    port (PADDI: out Std_logic; PWM2BD: in Std_logic);

    ATTRIBUTE Vital_Level0 OF PWM2B_DB : ENTITY IS TRUE;

  end PWM2B_DB;

  architecture Structure of PWM2B_DB is
    ATTRIBUTE Vital_Level0 OF Structure : ARCHITECTURE IS TRUE;

    signal PADDI_out 	: std_logic := 'X';
    signal PWM2BD_ipd 	: std_logic := 'X';

    component xo2iobuf0003
      port (Z: out Std_logic; PAD: in Std_logic);
    end component;
  begin
    PWM2B_D_pad: xo2iobuf0003
      port map (Z=>PADDI_out, PAD=>PWM2BD_ipd);

    --  INPUT PATH DELAYs
    WireDelay : BLOCK
    BEGIN
      VitalWireDelay(PWM2BD_ipd, PWM2BD, tipd_PWM2BD);
    END BLOCK;

    VitalBehavior : PROCESS (PADDI_out, PWM2BD_ipd)
    VARIABLE PADDI_zd         	: std_logic := 'X';
    VARIABLE PADDI_GlitchData 	: VitalGlitchDataType;

    VARIABLE tviol_PWM2BD_PWM2BD          	: x01 := '0';
    VARIABLE periodcheckinfo_PWM2BD	: VitalPeriodDataType;

    BEGIN

    IF (TimingChecksOn) THEN
      VitalPeriodPulseCheck (
        TestSignal => PWM2BD_ipd,
        TestSignalName => "PWM2BD",
        Period => tperiod_PWM2BD,
        PulseWidthHigh => tpw_PWM2BD_posedge,
        PulseWidthLow => tpw_PWM2BD_negedge,
        PeriodData => periodcheckinfo_PWM2BD,
        Violation => tviol_PWM2BD_PWM2BD,
        MsgOn => MsgOn, XOn => XOn,
        HeaderMsg => InstancePath,
        CheckEnabled => TRUE,
        MsgSeverity => warning);

    END IF;

    PADDI_zd 	:= PADDI_out;

    VitalPathDelay01 (
      OutSignal => PADDI, OutSignalName => "PADDI", OutTemp => PADDI_zd,
      Paths      => (0 => (InputChangeTime => PWM2BD_ipd'last_event,
                           PathDelay => tpd_PWM2BD_PADDI,
                           PathCondition => TRUE)),
      GlitchData => PADDI_GlitchData,
      Mode       => vitaltransport, XOn => XOn, MsgOn => MsgOn);

    END PROCESS;

  end Structure;

-- entity PWM2A_DB
  library IEEE, vital2000, MACHXO2;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use MACHXO2.COMPONENTS.ALL;

  entity PWM2A_DB is
    -- miscellaneous vital GENERICs
    GENERIC (
      TimingChecksOn	: boolean := TRUE;
      XOn           	: boolean := FALSE;
      MsgOn         	: boolean := TRUE;
      InstancePath  	: string := "PWM2A_DB";

      tipd_PWM2AD  	: VitalDelayType01 := (0 ns, 0 ns);
      tpd_PWM2AD_PADDI	 : VitalDelayType01 := (0 ns, 0 ns);
      tperiod_PWM2AD 	: VitalDelayType := 0 ns;
      tpw_PWM2AD_posedge	: VitalDelayType := 0 ns;
      tpw_PWM2AD_negedge	: VitalDelayType := 0 ns);

    port (PADDI: out Std_logic; PWM2AD: in Std_logic);

    ATTRIBUTE Vital_Level0 OF PWM2A_DB : ENTITY IS TRUE;

  end PWM2A_DB;

  architecture Structure of PWM2A_DB is
    ATTRIBUTE Vital_Level0 OF Structure : ARCHITECTURE IS TRUE;

    signal PADDI_out 	: std_logic := 'X';
    signal PWM2AD_ipd 	: std_logic := 'X';

    component xo2iobuf0003
      port (Z: out Std_logic; PAD: in Std_logic);
    end component;
  begin
    PWM2A_D_pad: xo2iobuf0003
      port map (Z=>PADDI_out, PAD=>PWM2AD_ipd);

    --  INPUT PATH DELAYs
    WireDelay : BLOCK
    BEGIN
      VitalWireDelay(PWM2AD_ipd, PWM2AD, tipd_PWM2AD);
    END BLOCK;

    VitalBehavior : PROCESS (PADDI_out, PWM2AD_ipd)
    VARIABLE PADDI_zd         	: std_logic := 'X';
    VARIABLE PADDI_GlitchData 	: VitalGlitchDataType;

    VARIABLE tviol_PWM2AD_PWM2AD          	: x01 := '0';
    VARIABLE periodcheckinfo_PWM2AD	: VitalPeriodDataType;

    BEGIN

    IF (TimingChecksOn) THEN
      VitalPeriodPulseCheck (
        TestSignal => PWM2AD_ipd,
        TestSignalName => "PWM2AD",
        Period => tperiod_PWM2AD,
        PulseWidthHigh => tpw_PWM2AD_posedge,
        PulseWidthLow => tpw_PWM2AD_negedge,
        PeriodData => periodcheckinfo_PWM2AD,
        Violation => tviol_PWM2AD_PWM2AD,
        MsgOn => MsgOn, XOn => XOn,
        HeaderMsg => InstancePath,
        CheckEnabled => TRUE,
        MsgSeverity => warning);

    END IF;

    PADDI_zd 	:= PADDI_out;

    VitalPathDelay01 (
      OutSignal => PADDI, OutSignalName => "PADDI", OutTemp => PADDI_zd,
      Paths      => (0 => (InputChangeTime => PWM2AD_ipd'last_event,
                           PathDelay => tpd_PWM2AD_PADDI,
                           PathCondition => TRUE)),
      GlitchData => PADDI_GlitchData,
      Mode       => vitaltransport, XOn => XOn, MsgOn => MsgOn);

    END PROCESS;

  end Structure;

-- entity PWM1B_DB
  library IEEE, vital2000, MACHXO2;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use MACHXO2.COMPONENTS.ALL;

  entity PWM1B_DB is
    -- miscellaneous vital GENERICs
    GENERIC (
      TimingChecksOn	: boolean := TRUE;
      XOn           	: boolean := FALSE;
      MsgOn         	: boolean := TRUE;
      InstancePath  	: string := "PWM1B_DB";

      tipd_PWM1BD  	: VitalDelayType01 := (0 ns, 0 ns);
      tpd_PWM1BD_PADDI	 : VitalDelayType01 := (0 ns, 0 ns);
      tperiod_PWM1BD 	: VitalDelayType := 0 ns;
      tpw_PWM1BD_posedge	: VitalDelayType := 0 ns;
      tpw_PWM1BD_negedge	: VitalDelayType := 0 ns);

    port (PADDI: out Std_logic; PWM1BD: in Std_logic);

    ATTRIBUTE Vital_Level0 OF PWM1B_DB : ENTITY IS TRUE;

  end PWM1B_DB;

  architecture Structure of PWM1B_DB is
    ATTRIBUTE Vital_Level0 OF Structure : ARCHITECTURE IS TRUE;

    signal PADDI_out 	: std_logic := 'X';
    signal PWM1BD_ipd 	: std_logic := 'X';

    component xo2iobuf0003
      port (Z: out Std_logic; PAD: in Std_logic);
    end component;
  begin
    PWM1B_D_pad: xo2iobuf0003
      port map (Z=>PADDI_out, PAD=>PWM1BD_ipd);

    --  INPUT PATH DELAYs
    WireDelay : BLOCK
    BEGIN
      VitalWireDelay(PWM1BD_ipd, PWM1BD, tipd_PWM1BD);
    END BLOCK;

    VitalBehavior : PROCESS (PADDI_out, PWM1BD_ipd)
    VARIABLE PADDI_zd         	: std_logic := 'X';
    VARIABLE PADDI_GlitchData 	: VitalGlitchDataType;

    VARIABLE tviol_PWM1BD_PWM1BD          	: x01 := '0';
    VARIABLE periodcheckinfo_PWM1BD	: VitalPeriodDataType;

    BEGIN

    IF (TimingChecksOn) THEN
      VitalPeriodPulseCheck (
        TestSignal => PWM1BD_ipd,
        TestSignalName => "PWM1BD",
        Period => tperiod_PWM1BD,
        PulseWidthHigh => tpw_PWM1BD_posedge,
        PulseWidthLow => tpw_PWM1BD_negedge,
        PeriodData => periodcheckinfo_PWM1BD,
        Violation => tviol_PWM1BD_PWM1BD,
        MsgOn => MsgOn, XOn => XOn,
        HeaderMsg => InstancePath,
        CheckEnabled => TRUE,
        MsgSeverity => warning);

    END IF;

    PADDI_zd 	:= PADDI_out;

    VitalPathDelay01 (
      OutSignal => PADDI, OutSignalName => "PADDI", OutTemp => PADDI_zd,
      Paths      => (0 => (InputChangeTime => PWM1BD_ipd'last_event,
                           PathDelay => tpd_PWM1BD_PADDI,
                           PathCondition => TRUE)),
      GlitchData => PADDI_GlitchData,
      Mode       => vitaltransport, XOn => XOn, MsgOn => MsgOn);

    END PROCESS;

  end Structure;

-- entity PWM1A_DB
  library IEEE, vital2000, MACHXO2;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use MACHXO2.COMPONENTS.ALL;

  entity PWM1A_DB is
    -- miscellaneous vital GENERICs
    GENERIC (
      TimingChecksOn	: boolean := TRUE;
      XOn           	: boolean := FALSE;
      MsgOn         	: boolean := TRUE;
      InstancePath  	: string := "PWM1A_DB";

      tipd_PWM1AD  	: VitalDelayType01 := (0 ns, 0 ns);
      tpd_PWM1AD_PADDI	 : VitalDelayType01 := (0 ns, 0 ns);
      tperiod_PWM1AD 	: VitalDelayType := 0 ns;
      tpw_PWM1AD_posedge	: VitalDelayType := 0 ns;
      tpw_PWM1AD_negedge	: VitalDelayType := 0 ns);

    port (PADDI: out Std_logic; PWM1AD: in Std_logic);

    ATTRIBUTE Vital_Level0 OF PWM1A_DB : ENTITY IS TRUE;

  end PWM1A_DB;

  architecture Structure of PWM1A_DB is
    ATTRIBUTE Vital_Level0 OF Structure : ARCHITECTURE IS TRUE;

    signal PADDI_out 	: std_logic := 'X';
    signal PWM1AD_ipd 	: std_logic := 'X';

    component xo2iobuf0003
      port (Z: out Std_logic; PAD: in Std_logic);
    end component;
  begin
    PWM1A_D_pad: xo2iobuf0003
      port map (Z=>PADDI_out, PAD=>PWM1AD_ipd);

    --  INPUT PATH DELAYs
    WireDelay : BLOCK
    BEGIN
      VitalWireDelay(PWM1AD_ipd, PWM1AD, tipd_PWM1AD);
    END BLOCK;

    VitalBehavior : PROCESS (PADDI_out, PWM1AD_ipd)
    VARIABLE PADDI_zd         	: std_logic := 'X';
    VARIABLE PADDI_GlitchData 	: VitalGlitchDataType;

    VARIABLE tviol_PWM1AD_PWM1AD          	: x01 := '0';
    VARIABLE periodcheckinfo_PWM1AD	: VitalPeriodDataType;

    BEGIN

    IF (TimingChecksOn) THEN
      VitalPeriodPulseCheck (
        TestSignal => PWM1AD_ipd,
        TestSignalName => "PWM1AD",
        Period => tperiod_PWM1AD,
        PulseWidthHigh => tpw_PWM1AD_posedge,
        PulseWidthLow => tpw_PWM1AD_negedge,
        PeriodData => periodcheckinfo_PWM1AD,
        Violation => tviol_PWM1AD_PWM1AD,
        MsgOn => MsgOn, XOn => XOn,
        HeaderMsg => InstancePath,
        CheckEnabled => TRUE,
        MsgSeverity => warning);

    END IF;

    PADDI_zd 	:= PADDI_out;

    VitalPathDelay01 (
      OutSignal => PADDI, OutSignalName => "PADDI", OutTemp => PADDI_zd,
      Paths      => (0 => (InputChangeTime => PWM1AD_ipd'last_event,
                           PathDelay => tpd_PWM1AD_PADDI,
                           PathCondition => TRUE)),
      GlitchData => PADDI_GlitchData,
      Mode       => vitaltransport, XOn => XOn, MsgOn => MsgOn);

    END PROCESS;

  end Structure;

-- entity IO22_DB
  library IEEE, vital2000, MACHXO2;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use MACHXO2.COMPONENTS.ALL;

  entity IO22_DB is
    -- miscellaneous vital GENERICs
    GENERIC (
      TimingChecksOn	: boolean := TRUE;
      XOn           	: boolean := FALSE;
      MsgOn         	: boolean := TRUE;
      InstancePath  	: string := "IO22_DB";

      tipd_IO22D  	: VitalDelayType01 := (0 ns, 0 ns);
      tpd_IO22D_PADDI	 : VitalDelayType01 := (0 ns, 0 ns);
      tperiod_IO22D 	: VitalDelayType := 0 ns;
      tpw_IO22D_posedge	: VitalDelayType := 0 ns;
      tpw_IO22D_negedge	: VitalDelayType := 0 ns);

    port (PADDI: out Std_logic; IO22D: in Std_logic);

    ATTRIBUTE Vital_Level0 OF IO22_DB : ENTITY IS TRUE;

  end IO22_DB;

  architecture Structure of IO22_DB is
    ATTRIBUTE Vital_Level0 OF Structure : ARCHITECTURE IS TRUE;

    signal PADDI_out 	: std_logic := 'X';
    signal IO22D_ipd 	: std_logic := 'X';

    component xo2iobuf0003
      port (Z: out Std_logic; PAD: in Std_logic);
    end component;
  begin
    IO22_D_pad: xo2iobuf0003
      port map (Z=>PADDI_out, PAD=>IO22D_ipd);

    --  INPUT PATH DELAYs
    WireDelay : BLOCK
    BEGIN
      VitalWireDelay(IO22D_ipd, IO22D, tipd_IO22D);
    END BLOCK;

    VitalBehavior : PROCESS (PADDI_out, IO22D_ipd)
    VARIABLE PADDI_zd         	: std_logic := 'X';
    VARIABLE PADDI_GlitchData 	: VitalGlitchDataType;

    VARIABLE tviol_IO22D_IO22D          	: x01 := '0';
    VARIABLE periodcheckinfo_IO22D	: VitalPeriodDataType;

    BEGIN

    IF (TimingChecksOn) THEN
      VitalPeriodPulseCheck (
        TestSignal => IO22D_ipd,
        TestSignalName => "IO22D",
        Period => tperiod_IO22D,
        PulseWidthHigh => tpw_IO22D_posedge,
        PulseWidthLow => tpw_IO22D_negedge,
        PeriodData => periodcheckinfo_IO22D,
        Violation => tviol_IO22D_IO22D,
        MsgOn => MsgOn, XOn => XOn,
        HeaderMsg => InstancePath,
        CheckEnabled => TRUE,
        MsgSeverity => warning);

    END IF;

    PADDI_zd 	:= PADDI_out;

    VitalPathDelay01 (
      OutSignal => PADDI, OutSignalName => "PADDI", OutTemp => PADDI_zd,
      Paths      => (0 => (InputChangeTime => IO22D_ipd'last_event,
                           PathDelay => tpd_IO22D_PADDI,
                           PathCondition => TRUE)),
      GlitchData => PADDI_GlitchData,
      Mode       => vitaltransport, XOn => XOn, MsgOn => MsgOn);

    END PROCESS;

  end Structure;

-- entity IO21_DB
  library IEEE, vital2000, MACHXO2;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use MACHXO2.COMPONENTS.ALL;

  entity IO21_DB is
    -- miscellaneous vital GENERICs
    GENERIC (
      TimingChecksOn	: boolean := TRUE;
      XOn           	: boolean := FALSE;
      MsgOn         	: boolean := TRUE;
      InstancePath  	: string := "IO21_DB";

      tipd_PADDO  	: VitalDelayType01 := (0 ns, 0 ns);
      tipd_IO21D  	: VitalDelayType01 := (0 ns, 0 ns);
      tpd_PADDO_IO21D	 : VitalDelayType01 := (0 ns, 0 ns);
      tperiod_IO21D 	: VitalDelayType := 0 ns;
      tpw_IO21D_posedge	: VitalDelayType := 0 ns;
      tpw_IO21D_negedge	: VitalDelayType := 0 ns);

    port (PADDO: in Std_logic; IO21D: inout Std_logic);

    ATTRIBUTE Vital_Level0 OF IO21_DB : ENTITY IS TRUE;

  end IO21_DB;

  architecture Structure of IO21_DB is
    ATTRIBUTE Vital_Level0 OF Structure : ARCHITECTURE IS TRUE;

    signal PADDO_ipd 	: std_logic := 'X';
    signal IO21D_ipd 	: std_logic := 'X';
    signal IO21D_out 	: std_logic := 'Z';

    signal GNDI: Std_logic;
    component gndB
      port (PWR0: out Std_logic);
    end component;
    component xo2iobuf
      port (I: in Std_logic; T: in Std_logic; Z: out Std_logic; 
            PAD: out Std_logic; PADI: in Std_logic);
    end component;
  begin
    IO21_D_pad: xo2iobuf
      port map (I=>PADDO_ipd, T=>GNDI, Z=>open, PAD=>IO21D_out, 
                PADI=>IO21D_ipd);
    DRIVEGND: gndB
      port map (PWR0=>GNDI);

    --  INPUT PATH DELAYs
    WireDelay : BLOCK
    BEGIN
      VitalWireDelay(PADDO_ipd, PADDO, tipd_PADDO);
      VitalWireDelay(IO21D_ipd, IO21D, tipd_IO21D);
    END BLOCK;

    VitalBehavior : PROCESS (PADDO_ipd, IO21D_ipd, IO21D_out)
    VARIABLE IO21D_zd         	: std_logic := 'X';
    VARIABLE IO21D_GlitchData 	: VitalGlitchDataType;

    VARIABLE tviol_IO21D_IO21D          	: x01 := '0';
    VARIABLE periodcheckinfo_IO21D	: VitalPeriodDataType;

    BEGIN

    IF (TimingChecksOn) THEN
      VitalPeriodPulseCheck (
        TestSignal => IO21D_ipd,
        TestSignalName => "IO21D",
        Period => tperiod_IO21D,
        PulseWidthHigh => tpw_IO21D_posedge,
        PulseWidthLow => tpw_IO21D_negedge,
        PeriodData => periodcheckinfo_IO21D,
        Violation => tviol_IO21D_IO21D,
        MsgOn => MsgOn, XOn => XOn,
        HeaderMsg => InstancePath,
        CheckEnabled => TRUE,
        MsgSeverity => warning);

    END IF;

    IO21D_zd 	:= IO21D_out;

    VitalPathDelay01 (
      OutSignal => IO21D, OutSignalName => "IO21D", OutTemp => IO21D_zd,
      Paths      => (0 => (InputChangeTime => PADDO_ipd'last_event,
                           PathDelay => tpd_PADDO_IO21D,
                           PathCondition => TRUE)),
      GlitchData => IO21D_GlitchData,
      Mode       => vitaltransport, XOn => XOn, MsgOn => MsgOn);

    END PROCESS;

  end Structure;

-- entity IO20_DB
  library IEEE, vital2000, MACHXO2;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use MACHXO2.COMPONENTS.ALL;

  entity IO20_DB is
    -- miscellaneous vital GENERICs
    GENERIC (
      TimingChecksOn	: boolean := TRUE;
      XOn           	: boolean := FALSE;
      MsgOn         	: boolean := TRUE;
      InstancePath  	: string := "IO20_DB";

      tipd_PADDO  	: VitalDelayType01 := (0 ns, 0 ns);
      tipd_IO20D  	: VitalDelayType01 := (0 ns, 0 ns);
      tpd_PADDO_IO20D	 : VitalDelayType01 := (0 ns, 0 ns);
      tperiod_IO20D 	: VitalDelayType := 0 ns;
      tpw_IO20D_posedge	: VitalDelayType := 0 ns;
      tpw_IO20D_negedge	: VitalDelayType := 0 ns);

    port (PADDO: in Std_logic; IO20D: inout Std_logic);

    ATTRIBUTE Vital_Level0 OF IO20_DB : ENTITY IS TRUE;

  end IO20_DB;

  architecture Structure of IO20_DB is
    ATTRIBUTE Vital_Level0 OF Structure : ARCHITECTURE IS TRUE;

    signal PADDO_ipd 	: std_logic := 'X';
    signal IO20D_ipd 	: std_logic := 'X';
    signal IO20D_out 	: std_logic := 'Z';

    signal GNDI: Std_logic;
    component gndB
      port (PWR0: out Std_logic);
    end component;
    component xo2iobuf
      port (I: in Std_logic; T: in Std_logic; Z: out Std_logic; 
            PAD: out Std_logic; PADI: in Std_logic);
    end component;
  begin
    IO20_D_pad: xo2iobuf
      port map (I=>PADDO_ipd, T=>GNDI, Z=>open, PAD=>IO20D_out, 
                PADI=>IO20D_ipd);
    DRIVEGND: gndB
      port map (PWR0=>GNDI);

    --  INPUT PATH DELAYs
    WireDelay : BLOCK
    BEGIN
      VitalWireDelay(PADDO_ipd, PADDO, tipd_PADDO);
      VitalWireDelay(IO20D_ipd, IO20D, tipd_IO20D);
    END BLOCK;

    VitalBehavior : PROCESS (PADDO_ipd, IO20D_ipd, IO20D_out)
    VARIABLE IO20D_zd         	: std_logic := 'X';
    VARIABLE IO20D_GlitchData 	: VitalGlitchDataType;

    VARIABLE tviol_IO20D_IO20D          	: x01 := '0';
    VARIABLE periodcheckinfo_IO20D	: VitalPeriodDataType;

    BEGIN

    IF (TimingChecksOn) THEN
      VitalPeriodPulseCheck (
        TestSignal => IO20D_ipd,
        TestSignalName => "IO20D",
        Period => tperiod_IO20D,
        PulseWidthHigh => tpw_IO20D_posedge,
        PulseWidthLow => tpw_IO20D_negedge,
        PeriodData => periodcheckinfo_IO20D,
        Violation => tviol_IO20D_IO20D,
        MsgOn => MsgOn, XOn => XOn,
        HeaderMsg => InstancePath,
        CheckEnabled => TRUE,
        MsgSeverity => warning);

    END IF;

    IO20D_zd 	:= IO20D_out;

    VitalPathDelay01 (
      OutSignal => IO20D, OutSignalName => "IO20D", OutTemp => IO20D_zd,
      Paths      => (0 => (InputChangeTime => PADDO_ipd'last_event,
                           PathDelay => tpd_PADDO_IO20D,
                           PathCondition => TRUE)),
      GlitchData => IO20D_GlitchData,
      Mode       => vitaltransport, XOn => XOn, MsgOn => MsgOn);

    END PROCESS;

  end Structure;

-- entity IO85_DB
  library IEEE, vital2000, MACHXO2;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use MACHXO2.COMPONENTS.ALL;

  entity IO85_DB is
    -- miscellaneous vital GENERICs
    GENERIC (
      TimingChecksOn	: boolean := TRUE;
      XOn           	: boolean := FALSE;
      MsgOn         	: boolean := TRUE;
      InstancePath  	: string := "IO85_DB";

      tipd_PADDO  	: VitalDelayType01 := (0 ns, 0 ns);
      tpd_PADDO_IO85D	 : VitalDelayType01 := (0 ns, 0 ns));

    port (PADDO: in Std_logic; IO85D: out Std_logic);

    ATTRIBUTE Vital_Level0 OF IO85_DB : ENTITY IS TRUE;

  end IO85_DB;

  architecture Structure of IO85_DB is
    ATTRIBUTE Vital_Level0 OF Structure : ARCHITECTURE IS TRUE;

    signal PADDO_ipd 	: std_logic := 'X';
    signal IO85D_out 	: std_logic := 'X';

    signal GNDI: Std_logic;
    component gndB
      port (PWR0: out Std_logic);
    end component;
    component xo2iobuf0002
      port (I: in Std_logic; T: in Std_logic; PAD: out Std_logic);
    end component;
  begin
    IO85_D_pad: xo2iobuf0002
      port map (I=>PADDO_ipd, T=>GNDI, PAD=>IO85D_out);
    DRIVEGND: gndB
      port map (PWR0=>GNDI);

    --  INPUT PATH DELAYs
    WireDelay : BLOCK
    BEGIN
      VitalWireDelay(PADDO_ipd, PADDO, tipd_PADDO);
    END BLOCK;

    VitalBehavior : PROCESS (PADDO_ipd, IO85D_out)
    VARIABLE IO85D_zd         	: std_logic := 'X';
    VARIABLE IO85D_GlitchData 	: VitalGlitchDataType;


    BEGIN

    IF (TimingChecksOn) THEN

    END IF;

    IO85D_zd 	:= IO85D_out;

    VitalPathDelay01 (
      OutSignal => IO85D, OutSignalName => "IO85D", OutTemp => IO85D_zd,
      Paths      => (0 => (InputChangeTime => PADDO_ipd'last_event,
                           PathDelay => tpd_PADDO_IO85D,
                           PathCondition => TRUE)),
      GlitchData => IO85D_GlitchData,
      Mode       => vitaltransport, XOn => XOn, MsgOn => MsgOn);

    END PROCESS;

  end Structure;

-- entity IO84_DB
  library IEEE, vital2000, MACHXO2;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use MACHXO2.COMPONENTS.ALL;

  entity IO84_DB is
    -- miscellaneous vital GENERICs
    GENERIC (
      TimingChecksOn	: boolean := TRUE;
      XOn           	: boolean := FALSE;
      MsgOn         	: boolean := TRUE;
      InstancePath  	: string := "IO84_DB";

      tipd_PADDO  	: VitalDelayType01 := (0 ns, 0 ns);
      tpd_PADDO_IO84D	 : VitalDelayType01 := (0 ns, 0 ns));

    port (PADDO: in Std_logic; IO84D: out Std_logic);

    ATTRIBUTE Vital_Level0 OF IO84_DB : ENTITY IS TRUE;

  end IO84_DB;

  architecture Structure of IO84_DB is
    ATTRIBUTE Vital_Level0 OF Structure : ARCHITECTURE IS TRUE;

    signal PADDO_ipd 	: std_logic := 'X';
    signal IO84D_out 	: std_logic := 'X';

    signal GNDI: Std_logic;
    component gndB
      port (PWR0: out Std_logic);
    end component;
    component xo2iobuf0002
      port (I: in Std_logic; T: in Std_logic; PAD: out Std_logic);
    end component;
  begin
    IO84_D_pad: xo2iobuf0002
      port map (I=>PADDO_ipd, T=>GNDI, PAD=>IO84D_out);
    DRIVEGND: gndB
      port map (PWR0=>GNDI);

    --  INPUT PATH DELAYs
    WireDelay : BLOCK
    BEGIN
      VitalWireDelay(PADDO_ipd, PADDO, tipd_PADDO);
    END BLOCK;

    VitalBehavior : PROCESS (PADDO_ipd, IO84D_out)
    VARIABLE IO84D_zd         	: std_logic := 'X';
    VARIABLE IO84D_GlitchData 	: VitalGlitchDataType;


    BEGIN

    IF (TimingChecksOn) THEN

    END IF;

    IO84D_zd 	:= IO84D_out;

    VitalPathDelay01 (
      OutSignal => IO84D, OutSignalName => "IO84D", OutTemp => IO84D_zd,
      Paths      => (0 => (InputChangeTime => PADDO_ipd'last_event,
                           PathDelay => tpd_PADDO_IO84D,
                           PathCondition => TRUE)),
      GlitchData => IO84D_GlitchData,
      Mode       => vitaltransport, XOn => XOn, MsgOn => MsgOn);

    END PROCESS;

  end Structure;

-- entity CC_CPLD_TOP
  library IEEE, vital2000, MACHXO2;
  use IEEE.STD_LOGIC_1164.all;
  use vital2000.vital_timing.all;
  use MACHXO2.COMPONENTS.ALL;

  entity CC_CPLD_TOP is
    port (IO14_D: in Std_logic; IO15_D: out Std_logic; IO49_D: inout Std_logic; 
          IO84_D: out Std_logic; IO85_D: out Std_logic; IO86_D: in Std_logic; 
          IO87_D: in Std_logic; IO20_D: inout Std_logic; 
          IO21_D: inout Std_logic; IO22_D: in Std_logic; IO23_D: in Std_logic; 
          PWM1A_D: in Std_logic; PWM1B_D: in Std_logic; PWM2A_D: in Std_logic; 
          PWM2B_D: in Std_logic; PWM3A_D: in Std_logic; PWM3B_D: in Std_logic; 
          PWM4A_D: in Std_logic; PWM4B_D: in Std_logic; PWM5A_D: in Std_logic; 
          PWM5B_D: in Std_logic; PWM6A_D: in Std_logic; PWM6B_D: in Std_logic; 
          PWM7A_D: in Std_logic; PWM7B_D: in Std_logic; PWM8A_D: in Std_logic; 
          PWM8B_D: in Std_logic; PWM9A_D: in Std_logic; PWM9B_D: in Std_logic; 
          TZ1n: inout Std_logic; TZ2n: inout Std_logic; PWM_ENn: out Std_logic; 
          PWM1A_C: out Std_logic; PWM1B_C: out Std_logic; 
          PWM2A_C: out Std_logic; PWM2B_C: out Std_logic; 
          PWM3A_C: out Std_logic; PWM3B_C: out Std_logic; FO1: in Std_logic; 
          PWM4A_C: out Std_logic; PWM4B_C: out Std_logic; 
          PWM5A_C: out Std_logic; PWM5B_C: out Std_logic; 
          PWM6A_C: out Std_logic; PWM6B_C: out Std_logic; FO2: in Std_logic; 
          PWM7A_C: out Std_logic; PWM7B_C: out Std_logic; 
          PWM8A_C: out Std_logic; PWM8B_C: out Std_logic; 
          PWM9A_C: out Std_logic; PWM9B_C: out Std_logic; FO3: in Std_logic; 
          PWM10A_C: out Std_logic; PWM10B_C: out Std_logic; 
          PWM11A_C: out Std_logic; PWM11B_C: out Std_logic; 
          PWM12A_C: out Std_logic; PWM12B_C: out Std_logic; FO4: in Std_logic; 
          PWM13A_C: out Std_logic; PWM13B_C: out Std_logic; 
          PWM14A_C: out Std_logic; PWM14B_C: out Std_logic; 
          PWM15A_C: out Std_logic; PWM15B_C: out Std_logic; FO5: in Std_logic; 
          PWM16A_C: out Std_logic; PWM16B_C: out Std_logic; 
          PWM17A_C: out Std_logic; PWM17B_C: out Std_logic; 
          PWM18A_C: out Std_logic; PWM18B_C: out Std_logic; FO6: in Std_logic; 
          CMP_OUT1: in Std_logic; CMP_OUT2: in Std_logic; 
          CMP_OUT3: in Std_logic; CMP_OUT4: in Std_logic; 
          CMP_OUT5: in Std_logic; CMP_OUT6: in Std_logic; 
          CMP_OUT7: in Std_logic; CMP_OUT8: in Std_logic; 
          CMP_OUT9: in Std_logic; CMP_OUT10: in Std_logic; 
          CMP_OUT11: in Std_logic; CMP_OUT12: in Std_logic; 
          IO0_C: out Std_logic; IO1_C: out Std_logic; IO2_C: out Std_logic; 
          IO3_C: out Std_logic; IO4_C: out Std_logic; IO5_C: out Std_logic; 
          IO6_C: out Std_logic; IO7_C: out Std_logic; IO8_C: out Std_logic; 
          IO9_C: in Std_logic; IO10_C: in Std_logic; IO11_C: in Std_logic; 
          IO12_C: inout Std_logic; IO13_C: inout Std_logic; 
          IO14_C: inout Std_logic; IO15_C: inout Std_logic; 
          IO16_C: inout Std_logic; IO17_C: inout Std_logic; 
          IO18_C: inout Std_logic; IO19_C: inout Std_logic; 
          IO20_C: inout Std_logic; IO21_C: inout Std_logic; 
          IO22_C: inout Std_logic; IO23_C: inout Std_logic);



  end CC_CPLD_TOP;

  architecture Structure of CC_CPLD_TOP is
    signal GND: Std_logic;
    signal IO1_C_c: Std_logic;
    signal IO8_C_c: Std_logic;
    signal IO84_D_c: Std_logic;
    signal IO9_C_c: Std_logic;
    signal IO4_C_c: Std_logic;
    signal IO3_C_c: Std_logic;
    signal IO2_C_c: Std_logic;
    signal PWM9B_C_c: Std_logic;
    signal PWM9A_C_c: Std_logic;
    signal PWM8B_C_c: Std_logic;
    signal PWM8A_C_c: Std_logic;
    signal PWM7B_C_c: Std_logic;
    signal PWM7A_C_c: Std_logic;
    signal PWM6B_C_c: Std_logic;
    signal PWM6A_C_c: Std_logic;
    signal PWM5B_C_c: Std_logic;
    signal PWM5A_C_c: Std_logic;
    signal PWM4A_C_c: Std_logic;
    signal PWM3B_C_c: Std_logic;
    signal PWM3A_C_c: Std_logic;
    signal PWM2B_C_c: Std_logic;
    signal PWM2A_C_c: Std_logic;
    signal PWM1A_C_c: Std_logic;
    signal VCCI: Std_logic;
    component SLICE_0
      port (F0: out Std_logic);
    end component;
    component IO49_DB
      port (PADDO: in Std_logic; IO49D: inout Std_logic);
    end component;
    component PWM10A_CB
      port (PADDO: in Std_logic; PWM10AC: out Std_logic);
    end component;
    component IO15_DB
      port (PADDO: in Std_logic; IO15D: out Std_logic);
    end component;
    component IO14_DB
      port (PADDI: out Std_logic; IO14D: in Std_logic);
    end component;
    component IO23_CB
      port (PADDO: in Std_logic; IO23C: inout Std_logic);
    end component;
    component IO22_CB
      port (PADDO: in Std_logic; IO22C: inout Std_logic);
    end component;
    component IO21_CB
      port (PADDO: in Std_logic; IO21C: inout Std_logic);
    end component;
    component IO20_CB
      port (PADDO: in Std_logic; IO20C: inout Std_logic);
    end component;
    component IO19_CB
      port (PADDO: in Std_logic; IO19C: inout Std_logic);
    end component;
    component IO18_CB
      port (PADDO: in Std_logic; IO18C: inout Std_logic);
    end component;
    component IO17_CB
      port (PADDO: in Std_logic; IO17C: inout Std_logic);
    end component;
    component IO16_CB
      port (PADDO: in Std_logic; IO16C: inout Std_logic);
    end component;
    component IO15_CB
      port (PADDO: in Std_logic; IO15C: inout Std_logic);
    end component;
    component IO14_CB
      port (PADDO: in Std_logic; IO14C: inout Std_logic);
    end component;
    component IO13_CB
      port (PADDO: in Std_logic; IO13C: inout Std_logic);
    end component;
    component IO12_CB
      port (PADDO: in Std_logic; IO12C: inout Std_logic);
    end component;
    component IO11_CB
      port (PADDI: out Std_logic; IO11C: in Std_logic);
    end component;
    component IO10_CB
      port (PADDI: out Std_logic; IO10C: in Std_logic);
    end component;
    component IO9_CB
      port (PADDI: out Std_logic; IO9C: in Std_logic);
    end component;
    component IO8_CB
      port (PADDO: in Std_logic; IO8C: out Std_logic);
    end component;
    component IO7_CB
      port (PADDO: in Std_logic; IO7C: out Std_logic);
    end component;
    component IO6_CB
      port (PADDO: in Std_logic; IO6C: out Std_logic);
    end component;
    component IO5_CB
      port (PADDO: in Std_logic; IO5C: out Std_logic);
    end component;
    component IO4_CB
      port (PADDO: in Std_logic; IO4C: out Std_logic);
    end component;
    component IO3_CB
      port (PADDO: in Std_logic; IO3C: out Std_logic);
    end component;
    component IO2_CB
      port (PADDO: in Std_logic; IO2C: out Std_logic);
    end component;
    component IO1_CB
      port (PADDO: in Std_logic; IO1C: out Std_logic);
    end component;
    component IO0_CB
      port (PADDO: in Std_logic; IO0C: out Std_logic);
    end component;
    component PWM18B_CB
      port (PADDO: in Std_logic; PWM18BC: out Std_logic);
    end component;
    component PWM18A_CB
      port (PADDO: in Std_logic; PWM18AC: out Std_logic);
    end component;
    component PWM17B_CB
      port (PADDO: in Std_logic; PWM17BC: out Std_logic);
    end component;
    component PWM17A_CB
      port (PADDO: in Std_logic; PWM17AC: out Std_logic);
    end component;
    component PWM16B_CB
      port (PADDO: in Std_logic; PWM16BC: out Std_logic);
    end component;
    component PWM16A_CB
      port (PADDO: in Std_logic; PWM16AC: out Std_logic);
    end component;
    component PWM15B_CB
      port (PADDO: in Std_logic; PWM15BC: out Std_logic);
    end component;
    component PWM15A_CB
      port (PADDO: in Std_logic; PWM15AC: out Std_logic);
    end component;
    component PWM14B_CB
      port (PADDO: in Std_logic; PWM14BC: out Std_logic);
    end component;
    component PWM14A_CB
      port (PADDO: in Std_logic; PWM14AC: out Std_logic);
    end component;
    component PWM13B_CB
      port (PADDO: in Std_logic; PWM13BC: out Std_logic);
    end component;
    component PWM13A_CB
      port (PADDO: in Std_logic; PWM13AC: out Std_logic);
    end component;
    component PWM12B_CB
      port (PADDO: in Std_logic; PWM12BC: out Std_logic);
    end component;
    component PWM12A_CB
      port (PADDO: in Std_logic; PWM12AC: out Std_logic);
    end component;
    component PWM11B_CB
      port (PADDO: in Std_logic; PWM11BC: out Std_logic);
    end component;
    component PWM11A_CB
      port (PADDO: in Std_logic; PWM11AC: out Std_logic);
    end component;
    component PWM10B_CB
      port (PADDO: in Std_logic; PWM10BC: out Std_logic);
    end component;
    component PWM9B_CB
      port (PADDO: in Std_logic; PWM9BC: out Std_logic);
    end component;
    component PWM9A_CB
      port (PADDO: in Std_logic; PWM9AC: out Std_logic);
    end component;
    component PWM8B_CB
      port (PADDO: in Std_logic; PWM8BC: out Std_logic);
    end component;
    component PWM8A_CB
      port (PADDO: in Std_logic; PWM8AC: out Std_logic);
    end component;
    component PWM7B_CB
      port (PADDO: in Std_logic; PWM7BC: out Std_logic);
    end component;
    component PWM7A_CB
      port (PADDO: in Std_logic; PWM7AC: out Std_logic);
    end component;
    component PWM6B_CB
      port (PADDO: in Std_logic; PWM6BC: out Std_logic);
    end component;
    component PWM6A_CB
      port (PADDO: in Std_logic; PWM6AC: out Std_logic);
    end component;
    component PWM5B_CB
      port (PADDO: in Std_logic; PWM5BC: out Std_logic);
    end component;
    component PWM5A_CB
      port (PADDO: in Std_logic; PWM5AC: out Std_logic);
    end component;
    component PWM4B_CB
      port (PADDO: in Std_logic; PWM4BC: out Std_logic);
    end component;
    component PWM4A_CB
      port (PADDO: in Std_logic; PWM4AC: out Std_logic);
    end component;
    component PWM3B_CB
      port (PADDO: in Std_logic; PWM3BC: out Std_logic);
    end component;
    component PWM3A_CB
      port (PADDO: in Std_logic; PWM3AC: out Std_logic);
    end component;
    component PWM2B_CB
      port (PADDO: in Std_logic; PWM2BC: out Std_logic);
    end component;
    component PWM2A_CB
      port (PADDO: in Std_logic; PWM2AC: out Std_logic);
    end component;
    component PWM1B_CB
      port (PADDO: in Std_logic; PWM1BC: out Std_logic);
    end component;
    component PWM1A_CB
      port (PADDO: in Std_logic; PWM1AC: out Std_logic);
    end component;
    component PWM_ENnB
      port (PADDO: in Std_logic; PWMENn: out Std_logic);
    end component;
    component TZ2nB
      port (PADDO: in Std_logic; TZ2nS: inout Std_logic);
    end component;
    component TZ1nB
      port (PADDO: in Std_logic; TZ1nS: inout Std_logic);
    end component;
    component PWM9B_DB
      port (PADDI: out Std_logic; PWM9BD: in Std_logic);
    end component;
    component PWM9A_DB
      port (PADDI: out Std_logic; PWM9AD: in Std_logic);
    end component;
    component PWM8B_DB
      port (PADDI: out Std_logic; PWM8BD: in Std_logic);
    end component;
    component PWM8A_DB
      port (PADDI: out Std_logic; PWM8AD: in Std_logic);
    end component;
    component PWM7B_DB
      port (PADDI: out Std_logic; PWM7BD: in Std_logic);
    end component;
    component PWM7A_DB
      port (PADDI: out Std_logic; PWM7AD: in Std_logic);
    end component;
    component PWM6B_DB
      port (PADDI: out Std_logic; PWM6BD: in Std_logic);
    end component;
    component PWM6A_DB
      port (PADDI: out Std_logic; PWM6AD: in Std_logic);
    end component;
    component PWM5B_DB
      port (PADDI: out Std_logic; PWM5BD: in Std_logic);
    end component;
    component PWM5A_DB
      port (PADDI: out Std_logic; PWM5AD: in Std_logic);
    end component;
    component PWM4B_DB
      port (PADDI: out Std_logic; PWM4BD: in Std_logic);
    end component;
    component PWM4A_DB
      port (PADDI: out Std_logic; PWM4AD: in Std_logic);
    end component;
    component PWM3B_DB
      port (PADDI: out Std_logic; PWM3BD: in Std_logic);
    end component;
    component PWM3A_DB
      port (PADDI: out Std_logic; PWM3AD: in Std_logic);
    end component;
    component PWM2B_DB
      port (PADDI: out Std_logic; PWM2BD: in Std_logic);
    end component;
    component PWM2A_DB
      port (PADDI: out Std_logic; PWM2AD: in Std_logic);
    end component;
    component PWM1B_DB
      port (PADDI: out Std_logic; PWM1BD: in Std_logic);
    end component;
    component PWM1A_DB
      port (PADDI: out Std_logic; PWM1AD: in Std_logic);
    end component;
    component IO22_DB
      port (PADDI: out Std_logic; IO22D: in Std_logic);
    end component;
    component IO21_DB
      port (PADDO: in Std_logic; IO21D: inout Std_logic);
    end component;
    component IO20_DB
      port (PADDO: in Std_logic; IO20D: inout Std_logic);
    end component;
    component IO85_DB
      port (PADDO: in Std_logic; IO85D: out Std_logic);
    end component;
    component IO84_DB
      port (PADDO: in Std_logic; IO84D: out Std_logic);
    end component;
  begin
    SLICE_0I: SLICE_0
      port map (F0=>GND);
    IO49_DI: IO49_DB
      port map (PADDO=>GND, IO49D=>IO49_D);
    PWM10A_CI: PWM10A_CB
      port map (PADDO=>GND, PWM10AC=>PWM10A_C);
    IO15_DI: IO15_DB
      port map (PADDO=>IO1_C_c, IO15D=>IO15_D);
    IO14_DI: IO14_DB
      port map (PADDI=>IO8_C_c, IO14D=>IO14_D);
    IO23_CI: IO23_CB
      port map (PADDO=>GND, IO23C=>IO23_C);
    IO22_CI: IO22_CB
      port map (PADDO=>GND, IO22C=>IO22_C);
    IO21_CI: IO21_CB
      port map (PADDO=>GND, IO21C=>IO21_C);
    IO20_CI: IO20_CB
      port map (PADDO=>GND, IO20C=>IO20_C);
    IO19_CI: IO19_CB
      port map (PADDO=>GND, IO19C=>IO19_C);
    IO18_CI: IO18_CB
      port map (PADDO=>GND, IO18C=>IO18_C);
    IO17_CI: IO17_CB
      port map (PADDO=>GND, IO17C=>IO17_C);
    IO16_CI: IO16_CB
      port map (PADDO=>GND, IO16C=>IO16_C);
    IO15_CI: IO15_CB
      port map (PADDO=>GND, IO15C=>IO15_C);
    IO14_CI: IO14_CB
      port map (PADDO=>GND, IO14C=>IO14_C);
    IO13_CI: IO13_CB
      port map (PADDO=>GND, IO13C=>IO13_C);
    IO12_CI: IO12_CB
      port map (PADDO=>GND, IO12C=>IO12_C);
    IO11_CI: IO11_CB
      port map (PADDI=>IO1_C_c, IO11C=>IO11_C);
    IO10_CI: IO10_CB
      port map (PADDI=>IO84_D_c, IO10C=>IO10_C);
    IO9_CI: IO9_CB
      port map (PADDI=>IO9_C_c, IO9C=>IO9_C);
    IO8_CI: IO8_CB
      port map (PADDO=>IO8_C_c, IO8C=>IO8_C);
    IO7_CI: IO7_CB
      port map (PADDO=>GND, IO7C=>IO7_C);
    IO6_CI: IO6_CB
      port map (PADDO=>GND, IO6C=>IO6_C);
    IO5_CI: IO5_CB
      port map (PADDO=>GND, IO5C=>IO5_C);
    IO4_CI: IO4_CB
      port map (PADDO=>IO4_C_c, IO4C=>IO4_C);
    IO3_CI: IO3_CB
      port map (PADDO=>IO3_C_c, IO3C=>IO3_C);
    IO2_CI: IO2_CB
      port map (PADDO=>IO2_C_c, IO2C=>IO2_C);
    IO1_CI: IO1_CB
      port map (PADDO=>IO1_C_c, IO1C=>IO1_C);
    IO0_CI: IO0_CB
      port map (PADDO=>GND, IO0C=>IO0_C);
    PWM18B_CI: PWM18B_CB
      port map (PADDO=>GND, PWM18BC=>PWM18B_C);
    PWM18A_CI: PWM18A_CB
      port map (PADDO=>GND, PWM18AC=>PWM18A_C);
    PWM17B_CI: PWM17B_CB
      port map (PADDO=>GND, PWM17BC=>PWM17B_C);
    PWM17A_CI: PWM17A_CB
      port map (PADDO=>GND, PWM17AC=>PWM17A_C);
    PWM16B_CI: PWM16B_CB
      port map (PADDO=>GND, PWM16BC=>PWM16B_C);
    PWM16A_CI: PWM16A_CB
      port map (PADDO=>GND, PWM16AC=>PWM16A_C);
    PWM15B_CI: PWM15B_CB
      port map (PADDO=>GND, PWM15BC=>PWM15B_C);
    PWM15A_CI: PWM15A_CB
      port map (PADDO=>GND, PWM15AC=>PWM15A_C);
    PWM14B_CI: PWM14B_CB
      port map (PADDO=>GND, PWM14BC=>PWM14B_C);
    PWM14A_CI: PWM14A_CB
      port map (PADDO=>GND, PWM14AC=>PWM14A_C);
    PWM13B_CI: PWM13B_CB
      port map (PADDO=>GND, PWM13BC=>PWM13B_C);
    PWM13A_CI: PWM13A_CB
      port map (PADDO=>GND, PWM13AC=>PWM13A_C);
    PWM12B_CI: PWM12B_CB
      port map (PADDO=>GND, PWM12BC=>PWM12B_C);
    PWM12A_CI: PWM12A_CB
      port map (PADDO=>GND, PWM12AC=>PWM12A_C);
    PWM11B_CI: PWM11B_CB
      port map (PADDO=>GND, PWM11BC=>PWM11B_C);
    PWM11A_CI: PWM11A_CB
      port map (PADDO=>GND, PWM11AC=>PWM11A_C);
    PWM10B_CI: PWM10B_CB
      port map (PADDO=>GND, PWM10BC=>PWM10B_C);
    PWM9B_CI: PWM9B_CB
      port map (PADDO=>PWM9B_C_c, PWM9BC=>PWM9B_C);
    PWM9A_CI: PWM9A_CB
      port map (PADDO=>PWM9A_C_c, PWM9AC=>PWM9A_C);
    PWM8B_CI: PWM8B_CB
      port map (PADDO=>PWM8B_C_c, PWM8BC=>PWM8B_C);
    PWM8A_CI: PWM8A_CB
      port map (PADDO=>PWM8A_C_c, PWM8AC=>PWM8A_C);
    PWM7B_CI: PWM7B_CB
      port map (PADDO=>PWM7B_C_c, PWM7BC=>PWM7B_C);
    PWM7A_CI: PWM7A_CB
      port map (PADDO=>PWM7A_C_c, PWM7AC=>PWM7A_C);
    PWM6B_CI: PWM6B_CB
      port map (PADDO=>PWM6B_C_c, PWM6BC=>PWM6B_C);
    PWM6A_CI: PWM6A_CB
      port map (PADDO=>PWM6A_C_c, PWM6AC=>PWM6A_C);
    PWM5B_CI: PWM5B_CB
      port map (PADDO=>PWM5B_C_c, PWM5BC=>PWM5B_C);
    PWM5A_CI: PWM5A_CB
      port map (PADDO=>PWM5A_C_c, PWM5AC=>PWM5A_C);
    PWM4B_CI: PWM4B_CB
      port map (PADDO=>IO4_C_c, PWM4BC=>PWM4B_C);
    PWM4A_CI: PWM4A_CB
      port map (PADDO=>PWM4A_C_c, PWM4AC=>PWM4A_C);
    PWM3B_CI: PWM3B_CB
      port map (PADDO=>PWM3B_C_c, PWM3BC=>PWM3B_C);
    PWM3A_CI: PWM3A_CB
      port map (PADDO=>PWM3A_C_c, PWM3AC=>PWM3A_C);
    PWM2B_CI: PWM2B_CB
      port map (PADDO=>PWM2B_C_c, PWM2BC=>PWM2B_C);
    PWM2A_CI: PWM2A_CB
      port map (PADDO=>PWM2A_C_c, PWM2AC=>PWM2A_C);
    PWM1B_CI: PWM1B_CB
      port map (PADDO=>IO3_C_c, PWM1BC=>PWM1B_C);
    PWM1A_CI: PWM1A_CB
      port map (PADDO=>PWM1A_C_c, PWM1AC=>PWM1A_C);
    PWM_ENnI: PWM_ENnB
      port map (PADDO=>GND, PWMENn=>PWM_ENn);
    TZ2nI: TZ2nB
      port map (PADDO=>GND, TZ2nS=>TZ2n);
    TZ1nI: TZ1nB
      port map (PADDO=>GND, TZ1nS=>TZ1n);
    PWM9B_DI: PWM9B_DB
      port map (PADDI=>PWM9B_C_c, PWM9BD=>PWM9B_D);
    PWM9A_DI: PWM9A_DB
      port map (PADDI=>PWM9A_C_c, PWM9AD=>PWM9A_D);
    PWM8B_DI: PWM8B_DB
      port map (PADDI=>PWM8B_C_c, PWM8BD=>PWM8B_D);
    PWM8A_DI: PWM8A_DB
      port map (PADDI=>PWM8A_C_c, PWM8AD=>PWM8A_D);
    PWM7B_DI: PWM7B_DB
      port map (PADDI=>PWM7B_C_c, PWM7BD=>PWM7B_D);
    PWM7A_DI: PWM7A_DB
      port map (PADDI=>PWM7A_C_c, PWM7AD=>PWM7A_D);
    PWM6B_DI: PWM6B_DB
      port map (PADDI=>PWM6B_C_c, PWM6BD=>PWM6B_D);
    PWM6A_DI: PWM6A_DB
      port map (PADDI=>PWM6A_C_c, PWM6AD=>PWM6A_D);
    PWM5B_DI: PWM5B_DB
      port map (PADDI=>PWM5B_C_c, PWM5BD=>PWM5B_D);
    PWM5A_DI: PWM5A_DB
      port map (PADDI=>PWM5A_C_c, PWM5AD=>PWM5A_D);
    PWM4B_DI: PWM4B_DB
      port map (PADDI=>IO4_C_c, PWM4BD=>PWM4B_D);
    PWM4A_DI: PWM4A_DB
      port map (PADDI=>PWM4A_C_c, PWM4AD=>PWM4A_D);
    PWM3B_DI: PWM3B_DB
      port map (PADDI=>PWM3B_C_c, PWM3BD=>PWM3B_D);
    PWM3A_DI: PWM3A_DB
      port map (PADDI=>PWM3A_C_c, PWM3AD=>PWM3A_D);
    PWM2B_DI: PWM2B_DB
      port map (PADDI=>PWM2B_C_c, PWM2BD=>PWM2B_D);
    PWM2A_DI: PWM2A_DB
      port map (PADDI=>PWM2A_C_c, PWM2AD=>PWM2A_D);
    PWM1B_DI: PWM1B_DB
      port map (PADDI=>IO3_C_c, PWM1BD=>PWM1B_D);
    PWM1A_DI: PWM1A_DB
      port map (PADDI=>PWM1A_C_c, PWM1AD=>PWM1A_D);
    IO22_DI: IO22_DB
      port map (PADDI=>IO2_C_c, IO22D=>IO22_D);
    IO21_DI: IO21_DB
      port map (PADDO=>GND, IO21D=>IO21_D);
    IO20_DI: IO20_DB
      port map (PADDO=>GND, IO20D=>IO20_D);
    IO85_DI: IO85_DB
      port map (PADDO=>IO9_C_c, IO85D=>IO85_D);
    IO84_DI: IO84_DB
      port map (PADDO=>IO84_D_c, IO84D=>IO84_D);
    VHI_INST: VHI
      port map (Z=>VCCI);
    PUR_INST: PUR
      port map (PUR=>VCCI);
    GSR_INST: GSR
      port map (GSR=>VCCI);
  end Structure;



  library IEEE, vital2000, MACHXO2;
  configuration Structure_CON of CC_CPLD_TOP is
    for Structure
    end for;
  end Structure_CON;



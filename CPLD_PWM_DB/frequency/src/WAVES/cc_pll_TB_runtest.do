setactivelib -work
#Compiling UUT entity design files
comp "C:\Users\yjhxfy\Google Drive\MMC\Hardware\Board\Code\CPLD_PWM_DB\CC_PLL.vhd"

#Compiling WAVES Testbench neccessary files
acom -work work "$dsn\src\WAVES\cc_pll_TB_pins.vhd"
acom -work work "$ALDEC\DAT\WAVES\waves_objects.vhd"
acom -work work "$dsn\src\WAVES\cc_pll_TB_declaration.vhd"
acom -work work "$ALDEC\DAT\WAVES\monitor_utilities.vhd"
acom -work work "$ALDEC\DAT\WAVES\waves_generator.vhd"
acom -work work "$dsn\src\WAVES\cc_pll_TB.vhd"

#Compiling timing configuration
#acom -work work "$dsn\src\WAVES\"

#Run simulation
asim +access +r  TESTBENCH_FOR_cc_pll

wave
wave -noreg STIM_CLKI
wave -noreg ACTUAL_CLKOP
wave -noreg ACTUAL_CLKOS2
wave WPL
wave ERR_STATUS

run

#End simulation macro

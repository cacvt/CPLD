setenv SIM_WORKING_FOLDER .
set newDesign 0
if {![file exists "C:/Users/yjhxfy/Google Drive/MMC/Hardware/Board/Code/CPLD_PWM_DB/frequency/frequency.adf"]} { 
	design create frequency "C:/Users/yjhxfy/Google Drive/MMC/Hardware/Board/Code/CPLD_PWM_DB"
  set newDesign 1
}
design open "C:/Users/yjhxfy/Google Drive/MMC/Hardware/Board/Code/CPLD_PWM_DB/frequency"
cd "C:/Users/yjhxfy/Google Drive/MMC/Hardware/Board/Code/CPLD_PWM_DB"
designverincludedir -clear
designverlibrarysim -PL -clear
designverlibrarysim -L -clear
designverlibrarysim -PL pmi_work
designverlibrarysim ovi_machxo2
designverdefinemacro -clear
if {$newDesign == 0} { 
  removefile -Y -D *
}
addfile "C:/Users/yjhxfy/Google Drive/MMC/Hardware/Board/Code/CPLD_PWM_DB/CC_PLL.vhd"
vlib "C:/Users/yjhxfy/Google Drive/MMC/Hardware/Board/Code/CPLD_PWM_DB/frequency/work"
set worklib work
adel -all
vcom -dbg -work work "C:/Users/yjhxfy/Google Drive/MMC/Hardware/Board/Code/CPLD_PWM_DB/CC_PLL.vhd"
entity Structure_CON
vsim  +access +r Structure_CON   -PL pmi_work -L ovi_machxo2
add wave *

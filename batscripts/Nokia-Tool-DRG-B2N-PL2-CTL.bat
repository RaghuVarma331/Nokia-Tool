@echo off
color f0
echo. 
echo.
echo     _________________________________________________
echo    #                                                 #
echo    #  Hi There! Welcome To Hmd Nokia Flash Tool      # 
echo    #                 By G.Raghu Varma                # 
echo    #            Contributors  Raghu varma            #
echo    #            All rights reserved 2019             # 
echo    #_________________________________________________#                                              
echo.


dir /b > list.txt
findstr "abl.img" list.txt > tmp.txt
set /p abla=<tmp.txt

findstr "abl.img" list.txt > tmp.txt
set /p ablb=<tmp.txt

findstr "xbl.img" list.txt > tmp.txt
set /p xbla=<tmp.txt

findstr "xbl.img" list.txt > tmp.txt
set /p xblb=<tmp.txt

findstr "bluetooth.img" list.txt > tmp.txt
set /p bluetooth=<tmp.txt

findstr "boot.img" list.txt > tmp.txt
set /p boot=<tmp.txt

findstr "cda.img" list.txt > tmp.txt
set /p cda=<tmp.txt

findstr "cmnlib.img" list.txt > tmp.txt
set /p cmnlib=<tmp.txt

findstr "cmnlib64.img" list.txt > tmp.txt
set /p cmnlib64=<tmp.txt

findstr "devcfg.img" list.txt > tmp.txt
set /p devcfg=<tmp.txt

findstr "dsp.img" list.txt > tmp.txt
set /p dsp=<tmp.txt

findstr "hidden.img" list.txt > tmp.txt
set /p hidden=<tmp.txt

findstr "hyp.img" list.txt > tmp.txt
set /p hyp=<tmp.txt

findstr "keymaster.img" list.txt > tmp.txt
set /p keymaster=<tmp.txt

findstr "mdtp.img" list.txt > tmp.txt
set /p mdtp=<tmp.txt

findstr "mdtpsecapp.img" list.txt > tmp.txt
set /p mdtpsecapp=<tmp.txt

findstr "modem.img" list.txt > tmp.txt
set /p modem=<tmp.txt

findstr "nvdef.img" list.txt > tmp.txt
set /p nvdef=<tmp.txt

findstr "pmic.img" list.txt > tmp.txt
set /p pmic=<tmp.txt

findstr "rpm.img" list.txt > tmp.txt
set /p rpm=<tmp.txt

findstr "splash.img" list.txt > tmp.txt
set /p splash=<tmp.txt

findstr "system.img" list.txt > tmp.txt
set /p system=<tmp.txt

findstr "systeminfo.img" list.txt > tmp.txt
set /p systeminfo=<tmp.txt

findstr "tz.img" list.txt > tmp.txt
set /p tz=<tmp.txt

findstr "vendor.img" list.txt > tmp.txt
set /p vendor=<tmp.txt


del list.txt
del tmp.txt

echo.
fastboot oem getversions
fastboot oem device-info
fastboot flash abl_a %abla%
fastboot flash abl_b %ablb%
fastboot flash xbl_a %xbla%
fastboot flash xbl_b %xblb%
fastboot flash bluetooth_a %bluetooth%
fastboot flash boot_a %boot%
fastboot flash cda_a %cda%
fastboot flash cmnlib_a %cmnlib%
fastboot flash cmnlib64_a %cmnlib64%
fastboot flash devcfg_a %devcfg%
fastboot flash dsp_a %dsp%
fastboot flash hidden_a %hidden%
fastboot flash hyp_a %hyp%
fastboot flash keymaster_a %keymaster%
fastboot flash mdtp_a %mdtp%
fastboot flash mdtpsecapp_a %mdtpsecapp% 
fastboot flash modem_a %modem%
fastboot flash nvdef_a %nvdef%
fastboot flash pmic_a %pmic%
fastboot flash rpm_a %rpm%
fastboot flash splash_a %splash% 
fastboot flash system_a %system%
fastboot flash systeminfo_a %systeminfo%
fastboot flash tz_a %tz%
fastboot flash vendor_a %vendor%
fastboot erase ssd
fastboot erase misc
fastboot erase sti
fastboot erase ddr
fastboot erase securefs
fastboot erase box
fastboot erase boot_b
fastboot --set-active=a
fastboot -w
fastboot reboot
echo.

pause
echo. 
echo.
echo     _________________________________
echo    #                                 #
echo    #  Stock Rom Successfully Flashed # 
echo    #  Have a great day peace..!!     # 
echo    #_________________________________#                                             
echo.
pause


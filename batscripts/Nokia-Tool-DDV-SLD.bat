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

findstr "bluetooth.img" list.txt > tmp.txt
set /p bluetooth=<tmp.txt

findstr "boot.img" list.txt > tmp.txt
set /p boot=<tmp.txt

findstr "cmnlib.img" list.txt > tmp.txt
set /p cmnlib=<tmp.txt

findstr "cmnlib64.img" list.txt > tmp.txt
set /p cmnlib64=<tmp.txt

findstr "devcfg.img" list.txt > tmp.txt
set /p devcfg=<tmp.txt

findstr "dtbo.img" list.txt > tmp.txt
set /p dtbo=<tmp.txt

findstr "hyp.img" list.txt > tmp.txt
set /p hyp=<tmp.txt

findstr "keymaster.img" list.txt > tmp.txt
set /p keymaster=<tmp.txt

findstr "modem.img" list.txt > tmp.txt
set /p modem=<tmp.txt

findstr "pmic.img" list.txt > tmp.txt
set /p pmic=<tmp.txt

findstr "rpm.img" list.txt > tmp.txt
set /p rpm=<tmp.txt

findstr "system.img" list.txt > tmp.txt
set /p system=<tmp.txt

findstr "tz.img" list.txt > tmp.txt
set /p tz=<tmp.txt

findstr "vbmeta.img" list.txt > tmp.txt
set /p vbmeta=<tmp.txt

findstr "vendor.img" list.txt > tmp.txt
set /p vendor=<tmp.txt

findstr "xbl.img" list.txt > tmp.txt
set /p xbla=<tmp.txt

findstr "xbl.img" list.txt > tmp.txt
set /p xblb=<tmp.txt


del list.txt
del tmp.txt

echo.
fastboot oem getversions
fastboot oem device-info
fastboot flash abl_a %abla%
fastboot flash abl_b %ablb%
fastboot flash bluetooth_a %bluetooth%
fastboot flash boot_a %boot%
fastboot flash cmnlib_a %cmnlib%
fastboot flash cmnlib64_a %cmnlib64%
fastboot flash devcfg_a %devcfg%
fastboot flash dtbo_a %dtbo%
fastboot flash hyp_a %hyp%
fastboot flash keymaster_a %keymaster%
fastboot flash modem_a %modem%
fastboot flash pmic_a %pmic%
fastboot flash rpm_a %rpm%
fastboot flash system_a %system%
fastboot flash tz_a %tz%
fastboot flash vbmeta_a --disable-verity --disable-verification %vbmeta%
fastboot flash vendor_a %vendor%
fastboot flash xbl_a %xbla%
fastboot flash xbl_b %xblb%
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


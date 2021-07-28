#!/bin/bash

set -e

REQUIRED_FILES=(
  "abl.img"
  "xbl.img"
  "bluetooth.img"
  "boot.img"
  "cmnlib.img"
  "cmnlib64.img"
  "devcfg.img"
  "dsp.img"
  "hidden.img"
  "mdtpsecapp.img"
  "modem.img"
  "nvdef.img"
  "pmic.img"
  "rpm.img"
  "splash.img"
  "system.img"
  "systeminfo.img"
  "tz.img"
  "vendor.img"
)

for file in ${REQUIRED_FILES[@]}; do
   if [[ -f "$file" ]]; then
      echo $file found
    else
      echo $file not found!
      echo Make sure that all files are next to this script.
      exit 1
    fi
done

echo "Device info:"
fastboot oem getversions
fastboot oem device-info

read -p "Ready to flash device? " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    [[ "$0" = "$BASH_SOURCE" ]] && exit 1 || return 1
fi

set -x

fastboot flash abl_a "abl.img"
fastboot flash abl_b "abl.img"
fastboot flash xbl_a "xbl.img"
fastboot flash xbl_b "xbl.img"
fastboot flash bluetooth_a "bluetooth.img"
fastboot flash boot_a "boot.img"
fastboot flash cmnlib_a "cmnlib.img"
fastboot flash cmnlib64_a "cmnlib64.img"
fastboot flash devcfg_a "devcfg.img"
fastboot flash dsp_a "dsp.img"
fastboot flash hidden_a "hidden.img"
fastboot flash hyp_a "hyp.img"
fastboot flash keymaster_a "keymaster.img"
fastboot flash mdtp_a "mdtp.img"
fastboot flash mdtpsecapp_a "mdtpsecapp.img"
fastboot flash modem_a "modem.img"
fastboot flash nvdef_a "nvdef.img"
fastboot flash pmic_a "pmic.img"
fastboot flash rpm_a "rpm.img"
fastboot flash splash_a "splash.img"
fastboot flash system_a "system.img"
fastboot flash systeminfo_a "systeminfo.img"
fastboot flash tz_a "tz.img"
fastboot flash vendor_a "vendor.img"

fastboot erase ssd
fastboot erase misc
fastboot erase sti
fastboot erase ddr
fastboot erase securefs
fastboot erase box
fastboot erase boot_b

fastboot --set-active=a
fastboot -w

set +x

read -p "Flash done! Reboot now? " -n 1 -r
echoshell linux
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    [[ "$0" = "$BASH_SOURCE" ]] && exit 1 || return 1
fi

fastboot reboot

#!/bin/bash

check_fail()
{
	if [ $? -ne 0 ]; then
		echo "ERROR: fastboot failed."
		exit -1
	fi
}

if [ -f fastboot ]; then
  fastboot="./fastboot"
else
  fastboot="./ota/fastboot"
fi

$fastboot flash gpt gpt_signed
check_fail

$fastboot flash motoboot motoboot
check_fail

$fastboot reboot-bootloader
check_fail
sleep 10

$fastboot flash boot boot_signed
check_fail

$fastboot flash recovery recovery_signed
check_fail

$fastboot flash motobp motobp
check_fail

$fastboot flash system system_signed
check_fail

$fastboot flash cdrom cdrom_signed
check_fail

echo "All AP images flashed successfully!"
echo ""
echo "To upgrade bootloader: https://sites.google.com/a/motorola.com/intel-bootloader"
echo "Note hardware key below for package selection"
$fastboot getvar rom-key
echo ""
$fastboot reboot

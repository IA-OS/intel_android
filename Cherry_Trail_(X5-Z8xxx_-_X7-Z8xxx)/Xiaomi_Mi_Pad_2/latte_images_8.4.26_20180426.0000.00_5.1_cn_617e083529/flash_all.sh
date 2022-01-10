set -o errexit

fastboot $* getvar product 2>&1 | grep "^product: *latte$"
if [ $? -ne 0 ] ; then echo "Missmatching image and device"; exit 1; fi
fastboot $* flash bootloader `dirname $0`/images/bootloader
fastboot $* format cache
fastboot $* flash data `dirname $0`/images/userdata.img
fastboot $* flash system `dirname $0`/images/system.img
fastboot $* flash boot `dirname $0`/images/boot.img
fastboot $* flash recovery `dirname $0`/images/recovery.img
fastboot $* reboot

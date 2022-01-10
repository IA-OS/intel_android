fastboot oem start_partitioning
fastboot flash /tmp/partition.tbl partition.tbl
fastboot oem partition /tmp/partition.tbl

fastboot erase system
fastboot erase cache
fastboot erase data
fastboot erase logs

fastboot oem stop_partitioning

fastboot flash radio radio_firmware.bin
fastboot flash boot boot.img
fastboot flash fastboot droidboot.img
fastboot flash recovery recovery.img
fastboot flash system system.img
fastboot flash /tmp/7160_conf_1.tlv 7160_conf_1.tlv
fastboot oem nvm apply /tmp/7160_conf_1.tlv
fastboot flash splashscreen_7 oemlogo_7.bin
fastboot flash splashscreen_8 oemlogo_8.bin
fastboot flash dnx dnx_fwr_PRQ.bin
fastboot flash dnx dnx_osr_PRQ.bin
fastboot flash ifwi for_product_ifwi_PRQ.bin

pause

fastboot reboot

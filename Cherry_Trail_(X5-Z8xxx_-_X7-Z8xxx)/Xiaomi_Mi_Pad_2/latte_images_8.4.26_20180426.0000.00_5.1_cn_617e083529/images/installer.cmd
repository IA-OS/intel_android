oem unlock
flash oemvars oemvars.txt
flash oemvars oemvars-battery-config-fake-disabled.txt
flash oemvars oemvars-battery-config-fake.txt
flash gpt gpt.bin
flash bootloader bootloader
oem rm /ESP/BIOSUPDATE.fv
erase misc
erase persistent
erase metadata
format config
format factory
format cache
flash data userdata.img
flash system system.img
flash boot boot.img
flash recovery recovery.img
oem lock
continue

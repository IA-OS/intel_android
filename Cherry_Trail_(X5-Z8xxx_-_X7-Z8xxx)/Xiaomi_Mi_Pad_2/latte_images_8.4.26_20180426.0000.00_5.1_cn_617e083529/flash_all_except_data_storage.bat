fastboot %* getvar product 2>&1 | findstr /r /c:"^product: *latte" || echo Missmatching image and device
fastboot %* getvar product 2>&1 | findstr /r /c:"^product: *latte" || exit /B 1
fastboot %* flash bootloader  %~dp0images\bootloader || exit /B 1
fastboot %* format cache
fastboot %* flash system  %~dp0images\system.img
fastboot %* flash boot  %~dp0images\boot.img
fastboot %* flash recovery  %~dp0images\recovery.img
fastboot %* reboot

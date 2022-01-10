@set fastboot=fastboot.exe

%fastboot%  flash  gpt gpt_signed
@if %errorlevel% neq 0 goto fail

%fastboot%  flash  motoboot motoboot
@if %errorlevel% neq 0 goto fail

%fastboot%  flash  boot boot_signed
@if %errorlevel% neq 0 goto fail

%fastboot%  flash  recovery recovery_signed
@if %errorlevel% neq 0 goto fail

@if %errorlevel% neq 0 goto fail

%fastboot%  flash  motobp motobp
@if %errorlevel% neq 0 goto fail

%fastboot%  flash  system system_signed
@if %errorlevel% neq 0 goto fail

%fastboot%  flash  cdrom cdrom_signed
@if %errorlevel% neq 0 goto fail

@echo.
@echo All AP images flashed successfully!
@echo.
@echo To upgrade bootloader: https://sites.google.com/a/motorola.com/intel-bootloader
@echo Note hardware key below for package selection
@fastboot getvar rom-key
@echo.

%fastboot% reboot
@pause
@exit /b 0

:fail
@echo fastboot flash fail!
@pause
@exit /b 1


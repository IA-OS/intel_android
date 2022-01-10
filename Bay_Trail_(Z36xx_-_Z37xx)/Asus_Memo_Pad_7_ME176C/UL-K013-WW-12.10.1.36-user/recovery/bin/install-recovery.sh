#!/system/bin/sh
if ! applypatch -c EMMC:/dev/block/by-name/recovery:9650176:fe90b505fd60c487e2c4d28f90b721ef54b1497a; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/by-name/boot:8790016:014e40473fb14d9055fc73a8087255bf13863ef2 EMMC:/dev/block/by-name/recovery fe90b505fd60c487e2c4d28f90b721ef54b1497a 9650176 014e40473fb14d9055fc73a8087255bf13863ef2:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi

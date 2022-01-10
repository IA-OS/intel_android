#!/system/bin/sh
log -t recovery "Start install recovery"
if ! applypatch -c EMMC:/dev/block/by-name/recovery:14302520:e744d4eb166da41f186535a55afad20d2d8e2e83; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/by-name/boot:12690740:d94951b8f75017a31ac7d38758ad304eaaea42e1 EMMC:/dev/block/by-name/recovery e744d4eb166da41f186535a55afad20d2d8e2e83 14302520 d94951b8f75017a31ac7d38758ad304eaaea42e1:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi

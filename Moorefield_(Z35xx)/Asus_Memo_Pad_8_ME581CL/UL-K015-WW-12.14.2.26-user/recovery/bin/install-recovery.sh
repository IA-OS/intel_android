#!/system/bin/sh
if ! applypatch -c EMMC:/dev/block/platform/intel/by-label/recovery:11592408:26e8ce56082d70af839fb7417ab919e7303e5bd5; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/platform/intel/by-label/boot:10867416:4dc0bbd4109b4279093aa6a0f860736a204c451f EMMC:/dev/block/platform/intel/by-label/recovery 26e8ce56082d70af839fb7417ab919e7303e5bd5 11592408 4dc0bbd4109b4279093aa6a0f860736a204c451f:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi

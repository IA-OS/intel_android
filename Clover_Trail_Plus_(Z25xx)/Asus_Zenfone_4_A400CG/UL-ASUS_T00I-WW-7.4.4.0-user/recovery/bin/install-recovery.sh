#!/system/bin/sh
if ! applypatch -c OSIP:/dev/block/by-name/recovery:10159104:4a12da84babcf69eab230820a0d4f83df3b3c936; then
  applypatch -b /system/etc/recovery-resource.dat OSIP:/dev/block/by-name/boot:9819136:33ce38f358b6acc1ff90ccc93549ede638f3db2c OSIP:/dev/block/by-name/recovery 4a12da84babcf69eab230820a0d4f83df3b3c936 10159104 33ce38f358b6acc1ff90ccc93549ede638f3db2c:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi

to do full support intel image there is something to do:

- bos_signed from medfield razr i this image similar to pos.bin refering to "provisioning"
need fix: different from boot & recovery with no header & signature bos have signature on the top 480 byte royax signature... mboot.c osm0sis need to add logic to check this.

- droidboot.img or "fastboot" have a bit different from the other osip image... on major version this image have 00 not 01 like usually osip header... androidbootimg.magic osm0sis need to change instead using $OS$\x00\x00\x01 why not using \x24\x4F\x53\x24 string for $OS$ like normal aosp bootimg ANDROID!.

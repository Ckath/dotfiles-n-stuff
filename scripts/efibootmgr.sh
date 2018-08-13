#!/bin/bash
efibootmgr -d /dev/sda -p 2 -c -L "Arch Linux" -l /vmlinuz-linux -u "root=/dev/sda1 rootflags=discard rw initrd=/initramfs-linux.img libahci.ignore_sss=1"

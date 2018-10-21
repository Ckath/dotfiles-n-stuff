#!/bin/bash
efibootmgr -d /dev/sdb -p 1 -c -L "Arch Linux" -l /vmlinuz-linux -u "root=/dev/sdb2 rw initrd=/initramfs-linux.img libahci.ignore_sss=1"

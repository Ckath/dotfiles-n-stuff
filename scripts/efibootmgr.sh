#!/bin/bash
efibootmgr -d /dev/sda -p 1 -c -L "Arch Linux" -l /vmlinuz-linux -u "root=/dev/sda2 rw initrd=/initramfs-linux.img libahci.ignore_sss=1 sysrq_always_enabled=1"

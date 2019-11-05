#!/bin/bash
efibootmgr -d /dev/sda -p 1 -c -L "Arch Linux" -l /vmlinuz-linux -u "root=PARTUUID=76d35af7-cd4a-c441-adc6-c263396d1b1f rw initrd=/initramfs-linux.img libahci.ignore_sss=1 libata.force=noncq sysrq_always_enabled=1"

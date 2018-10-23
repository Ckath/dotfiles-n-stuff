#!/bin/bash
efibootmgr -d /dev/sda -p 2 -c -L "Arch Linux" -l /vmlinuz-linux -u "root=/dev/sda1 rootflags=discard rw initrd=/initramfs-linux.img libahci.ignore_sss=1 i915.enable_rc6=1 i915.lvds_downclock=1 i915.semaphores=1"

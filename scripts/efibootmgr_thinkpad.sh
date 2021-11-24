#!/bin/bash
efibootmgr -d /dev/sda -p 1 -c -L "Arch Linux" -l "\vmlinuz-linux" -u "root=PARTUUID=b93be0b4-83f6-b842-b347-4ce6f04402d7 rw initrd=\initramfs-linux.img libahci.ignore_sss=1 i915.enable_rc6=1 i915.lvds_downclock=1 i915.semaphores=1"

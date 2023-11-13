#!/bin/sh

../linux-fujita/build/usr/gen_init_cpio qemu-initramfs.desc > qemu-initramfs.img

qemu-system-aarch64 \
        -machine 'virt' \
        -cpu 'cortex-a57' \
        -m 1G \
        -kernel /home/junzhe/Dev/Software/linux-fujita/build/arch/arm64/boot/Image \
        -initrd ../busybox/qemu-initramfs.img \
        -netdev tap,ifname=tap0,id=tap0,script=no,downscript=no -device e1000,netdev=tap0 \
        -nographic                                                                 \
        -append "root=LABEL=rootfs console=ttyAMA0" \

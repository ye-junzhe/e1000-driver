#!/bin/sh

busybox echo "[INFO] Init from a minimal initrd!"
busybox echo "============================"
busybox echo "[INFO] rust_helloworld module loaded"
busybox insmod rust_helloworld.ko
busybox echo "[INFO] fujita e1000 module loaded"
busybox insmod rust_e1000.ko
busybox echo "[INFO] e1000 module loaded"
busybox insmod e1000_for_linux.ko
busybox echo "============================"
busybox echo "[INFO] Network configured"
busybox echo "IP set to 192.168.100.224"
busybox ifconfig lo 127.0.0.1 netmask 255.0.0.0 up
busybox ifconfig eth0 192.168.100.224 netmask 255.255.255.0 broadcast 192.168.100.255 up
# busybox ip addr
busybox echo "============================"

export 'PS1=(kernel) >'
busybox sh

busybox poweroff -f

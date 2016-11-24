#!/bin/bash

lb config\
 --apt-indices none\
 --apt-recommends false\
 --architectures armhf\
 --binary-images tar\
 --binary-filesystem ext3\
 --bootloader ""\
 --cache false\
 --chroot-filesystem none\
 --debian-installer-gui false\
 --distribution jessie\
 --parent-distribution jessie\
 --parent-debian-installer-distribution jessie\
 --gzip-options '--best --rsyncable'\
 --initramfs auto\
 --linux-flavours ntc-mlc\
 --linux-packages linux-image-4.4.13\
 --bootstrap-qemu-arch armhf\
 --bootstrap-qemu-static /usr/bin/qemu-arm-static


cat << EOF > 0500-initrd.hook.chroot
#!/bin/bash -x
for i in boot/vmlinuz* ; do
    kernel="\$(basename "\$i")"
    version="\${kernel##vmlinuz-}"
    initrd="boot/initrd.img-\${version}"
    [ -f "\$initrd" ] || update-initramfs -c -k "\$version" || true
    flash-kernel
    cp /usr/lib/linux-image-\$version/sun5i-r8-chip.dtb /boot/
    cp /boot/vm* /boot/zImage
done
EOF



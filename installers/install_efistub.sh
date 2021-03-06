#!/usr/bin/env bash

#Add kernel and initramfs to your boot partition

sudo touch /etc/kernel/postinst.d/zz-update-efistub
echo '#!/bin/sh' | sudo tee -a /etc/kernel/postinst.d/zz-update-efistub
echo 'cp /boot/vmlinuz /boot/initrd.img /boot/efi/EFI/ubuntu/' | sudo tee -a /etc/kernel/postinst.d/zz-update-efistub
sudo chmod +x /etc/kernel/postinst.d/zz-update-efistub
sudo /etc/kernel/postinst.d/zz-update-efistub

label='Ubuntu (efistub)'
loader='\EFI\ubuntu\vmlinuz'
initrd='\EFI\ubuntu\initrd.img'

echo "Enter your boot disk device (e.g. /dev/sda)"
read disk

echo "Enter partition number for your boot partition"
read part

printf -v largs "%s " \
        "root=UUID=$(findmnt -kno UUID /) rw" \
        "initrd=${initrd}"

sudo efibootmgr -c -d "${disk}" -p "${part}" -L "${label}" -l "${loader}" -u "${largs%* } quiet splash" --verbose

#!/sbin/sh
#
# Copyright (C) 2018 Unlegacy Android Project
# Copyright (C) 2018 Svyatoslav Ryhel
#
# Made for Hammerhead 16GB
#

mkdir /tmp/backup
dd if=/dev/block/mmcblk0p27 of=/tmp/backup/crypto.img
dd if=/dev/block/mmcblk0p30 of=/tmp/backup/grow.img

umount /system
umount /vendor
umount /data
umount /sdcard
umount /cache

parted /dev/block/mmcblk0 <<EOF
  rm 25
  rm 26
  rm 27
  rm 28
  rm 29
  rm 30
  mkpart primary 192937984B 1266679807B
  name 25 system
  mkpart extended 1266679808B 1298137087B
  name 26 crypto
  mkpart primary 1298137088B 2032140287B
  name 27 cache
  mkpart primary 2032140288B 15757977599B
  name 28 userdata
  mkpart primary 15757977600B 15757983231B
  name 29 grow
  quit
EOF

make_ext4fs /dev/block/mmcblk0p25
make_ext4fs /dev/block/mmcblk0p27
make_ext4fs /dev/block/mmcblk0p28

ln -sf /dev/block/mmcblk0p25 system
ln -sf /dev/block/mmcblk0p26 crypto
ln -sf /dev/block/mmcblk0p27 cache
ln -sf /dev/block/mmcblk0p28 userdata
ln -sf /dev/block/mmcblk0p29 grow

dd if=/tmp/backup/crypto.img of=/dev/block/mmcblk0p26
dd if=/tmp/backup/grow.img of=/dev/block/mmcblk0p29

rm /tmp/backup/crypto.img
rm /tmp/backup/grow.img
rm /sbin/parted
reboot recovery

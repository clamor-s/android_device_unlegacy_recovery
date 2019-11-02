#!/sbin/sh
#
# Copyright (C) 2018 Unlegacy Android Project
# Copyright (C) 2018 Svyatoslav Ryhel
#
# Made for Hammerhead 32GB
#

mkdir /tmp/backup
dd if=/dev/block/mmcblk0p26 of=/tmp/backup/crypto.img
dd if=/dev/block/mmcblk0p29 of=/tmp/backup/grow.img

umount /system
umount /data
umount /sdcard
umount /cache

parted /dev/block/mmcblk0 <<EOF
  rm 25
  rm 26
  rm 27
  rm 28
  rm 29
  mkpart primary 192937984B 1803551231B 
  name 25 system
  mkpart primary 1803551232B 2065695231B
  name 26 vendor
  mkpart primary 2065695232B 2097152511B
  name 27 crypto
  mkpart primary 2097152512B 2306867711B 
  name 28 cache
  mkpart primary 2306867712B 31268513791B
  name 29 userdata
  mkpart primary 31268513792B 31268519423B
  name 30 grow
  quit
EOF

make_ext4fs /dev/block/mmcblk0p25
make_ext4fs /dev/block/mmcblk0p26
make_ext4fs /dev/block/mmcblk0p28
make_ext4fs /dev/block/mmcblk0p29

ln -sf /dev/block/mmcblk0p25 system
ln -sf /dev/block/mmcblk0p26 vendor
ln -sf /dev/block/mmcblk0p27 crypto
ln -sf /dev/block/mmcblk0p28 cache
ln -sf /dev/block/mmcblk0p29 userdata
ln -sf /dev/block/mmcblk0p30 grow

dd if=/tmp/backup/crypto.img of=/dev/block/mmcblk0p27
dd if=/tmp/backup/grow.img of=/dev/block/mmcblk0p30

rm /tmp/backup/crypto.img
rm /tmp/backup/grow.img
rm /sbin/parted
reboot recovery

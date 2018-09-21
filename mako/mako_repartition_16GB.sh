#!/sbin/sh
#
# Copyright (C) 2018 Unlegacy Android Project
# Copyright (C) 2018 Svyatoslav Ryhel
#
# Made for Mako 16GB
#

umount /data
umount /sdcard
umount /cache

parted /dev/block/mmcblk0 <<EOF
  rm 21
  rm 22
  rm 23
  mkpart primary 159383552B 1732247551B
  name 21 system
  mkpart primary 1732247552B 1994391551B
  name 22 vendor
  mkpart primary 1994391552B 2099249151B
  name 23 cache
  mkpart primary 2099249152B 15756951551B
  name 26 userdata
  quit
EOF

make_ext4fs /dev/block/mmcblk0p21
make_ext4fs /dev/block/mmcblk0p22
make_ext4fs /dev/block/mmcblk0p23
make_ext4fs /dev/block/mmcblk0p26

ln -sf /dev/block/mmcblk0p21 system
ln -sf /dev/block/mmcblk0p22 vendor
ln -sf /dev/block/mmcblk0p23 cache
ln -sf /dev/block/mmcblk0p26 userdata

rm /sbin/parted
reboot recovery

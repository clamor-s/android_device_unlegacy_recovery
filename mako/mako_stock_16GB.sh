#!/sbin/sh
#
# Copyright (C) 2018 Unlegacy Android Project
# Copyright (C) 2018 Svyatoslav Ryhel
#
# Made for Mako 16GB
#

umount /system
umount /vendor
umount /data
umount /sdcard
umount /cache

parted /dev/block/mmcblk0 <<EOF
  rm 21
  rm 22
  rm 23
  rm 26
  mkpart primary 159383552B 1040187391B
  name 21 system
  mkpart primary 1040187392B 1627389951B
  name 22 cache
  mkpart primary 1627389952B 15756951551B
  name 23 userdata
  quit
EOF

make_ext4fs /dev/block/mmcblk0p21
make_ext4fs /dev/block/mmcblk0p22
make_ext4fs /dev/block/mmcblk0p23

ln -sf /dev/block/mmcblk0p21 system
ln -sf /dev/block/mmcblk0p22 cache
ln -sf /dev/block/mmcblk0p23 userdata

rm /sbin/parted
reboot recovery

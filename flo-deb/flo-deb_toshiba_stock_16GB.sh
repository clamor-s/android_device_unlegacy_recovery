#!/sbin/sh
#
# Copyright (C) 2018 Unlegacy Android Project
# Copyright (C) 2018 Svyatoslav Ryhel
#
# Made for Flo and Deb 16GB (Toshiba)
#

mkdir /tmp/backup
dd if=/dev/block/mmcblk0p24 of=/tmp/backup/misc.img
dd if=/dev/block/mmcblk0p25 of=/tmp/backup/recovery.img

umount /system
umount /vendor
umount /data
umount /sdcard
umount /cache

parted /dev/block/mmcblk0 <<EOF
  rm 22
  rm 23
  rm 24
  rm 25
  rm 30
  rm 31
  mkpart primary 671088640B 1551892479B
  name 22 system
  mkpart primary 1551892480B 2139095039B
  name 23 cache
  mkpart primary 2147483648B 2148532223B
  name 24 misc
  mkpart primary 2214592512B 2225078271B
  name 25 recovery
  mkpart primary 2415919104B 15757983231B
  name 30 userdata
  quit
EOF

make_ext4fs /dev/block/mmcblk0p22
make_ext4fs /dev/block/mmcblk0p23
make_ext4fs /dev/block/mmcblk0p30

ln -sf /dev/block/mmcblk0p22 system
ln -sf /dev/block/mmcblk0p23 cache
ln -sf /dev/block/mmcblk0p24 misc
ln -sf /dev/block/mmcblk0p25 recovery
ln -sf /dev/block/mmcblk0p30 userdata

dd if=/tmp/backup/misc.img of=/dev/block/mmcblk0p24
dd if=/tmp/backup/recovery.img of=/dev/block/mmcblk0p14

rm /tmp/backup/misc.img
rm /tmp/backup/recovery.img
rm /sbin/parted
reboot

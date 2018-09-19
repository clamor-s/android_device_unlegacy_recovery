#!/sbin/sh
#
# Copyright (C) 2018 Unlegacy Android Project
# Copyright (C) 2018 Svyatoslav Ryhel
#
# Made for Flo and Deb 32GB
#

mkdir /tmp/backup
dd if=/dev/block/mmcblk0p24 of=/tmp/backup/misc.img
dd if=/dev/block/mmcblk0p25 of=/tmp/backup/recovery.img

umount /data
umount /sdcard
umount /cache

parted /dev/block/mmcblk0 <<EOF
  rm 22
  rm 23
  rm 24
  rm 25
  rm 30
  mkpart primary 614429696B 2187293695B
  name 22 system
  mkpart primary 2187293696B 2263875583B
  name 23 cache
  mkpart primary 2263875584B 2264924159B
  name 24 misc
  mkpart primary 2264924160B 2281701375B
  name 25 recovery
  mkpart primary 2348843008B 2610987007B
  name 30 vendor
  mkpart primary 2610987008B 31272713727B
  name 31 userdata
  quit
EOF

make_ext4fs /dev/block/mmcblk0p22
make_ext4fs /dev/block/mmcblk0p23
make_ext4fs /dev/block/mmcblk0p30
make_ext4fs /dev/block/mmcblk0p31

ln -sf /dev/block/mmcblk0p22 system
ln -sf /dev/block/mmcblk0p23 cache
ln -sf /dev/block/mmcblk0p24 misc
ln -sf /dev/block/mmcblk0p25 recovery
ln -sf /dev/block/mmcblk0p30 vendor
ln -sf /dev/block/mmcblk0p31 userdata

dd if=/tmp/backup/misc.img of=/dev/block/mmcblk0p24
dd if=/tmp/backup/recovery.img of=/dev/block/mmcblk0p25

rm /tmp/backup/misc.img
rm /tmp/backup/recovery.img
rm /sbin/parted
reboot recovery

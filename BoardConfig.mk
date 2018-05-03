#
# Copyright (C) 2018 Unlegacy Android Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Platform
TARGET_BOARD_PLATFORM := msm8974
TARGET_BOOTLOADER_BOARD_NAME := hammerhead
TARGET_NO_RADIOIMAGE := true
TARGET_NO_BOOTLOADER := true

# Architecture
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := krait

# Partitions sizes
BOARD_BOOTIMAGE_PARTITION_SIZE := 23068672 # 22M
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 23068672 # 22M
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1073741824 # 1G
# BOARD_USERDATAIMAGE_PARTITION_SIZE := 13725837312 # 12.8G
BOARD_CACHEIMAGE_PARTITION_SIZE := 734003200 # 700M

# Partitions types
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4

# Partitions block size
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)

# Only pre-optimize the boot image
WITH_DEXPREOPT_BOOT_IMG_ONLY := true

# Kernel information
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 androidboot.hardware=hammerhead user_debug=31 maxcpus=2 msm_watchdog_v2.enable=1 androidboot.bootdevice=msm_sdcc.1
BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x02900000 --tags_offset 0x02700000
BOARD_KERNEL_IMAGE_NAME := zImage-dtb

# Kernel source
TARGET_KERNEL_SOURCE := kernel/lge/hammerhead
TARGET_KERNEL_CONFIG := lineageos_hammerhead_defconfig

# Kernel toolchain
KERNEL_TOOLCHAIN := $(ANDROID_BUILD_TOP)/prebuilts/gcc/$(HOST_OS)-x86/arm/arm-eabi-4.8/bin
KERNEL_TOOLCHAIN_PREFIX := arm-eabi-

# Use mke2fs to create ext4 images
TARGET_USES_MKE2FS := true

# TWRP Configuration
TW_THEME := portrait_hdpi
TARGET_RECOVERY_FSTAB = device/lge/hammerhead/fstab.hammerhead
BOARD_HAS_NO_REAL_SDCARD := true
BOARD_SUPPRESS_SECURE_ERASE := true
RECOVERY_SDCARD_ON_DATA := true
TW_NO_USB_STORAGE := true
TW_INCLUDE_CRYPTO := true
TW_EXCLUDE_SUPERSU := true
# The real path for this is /sys/devices/mdp.0/qcom,cmdss_fb_primary.160/leds/lcd-backlight/brightness but the comma doesn't compile correctly
TW_BRIGHTNESS_PATH := "/sys/devices/mdp.0/qcom\x2cmdss_fb_primary.160/leds/lcd-backlight/brightness"
TW_MAX_BRIGHTNESS := 255

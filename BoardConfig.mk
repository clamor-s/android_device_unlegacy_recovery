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
TARGET_BOARD_PLATFORM := msm8960
TARGET_BOOTLOADER_BOARD_NAME := flo
TARGET_BOOTLOADER_NAME := flo
TARGET_NO_RADIOIMAGE := true
TARGET_NO_BOOTLOADER := true

# Architecture
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := krait

# Partitions sizes
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216 # 16M
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16777216 # 16M
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1572864000 # 1.5G
BOARD_CACHEIMAGE_PARTITION_SIZE := 76581888 # 73M
BOARD_VENDORIMAGE_PARTITION_SIZE := 262144000 # 250M
BOARD_PERSISTIMAGE_PARTITION_SIZE := 15360000 # 14.6M
# BOARD_USERDATAIMAGE_PARTITION_SIZE := 28661726720 # 26.7G

# Partitions types
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_PERSISTIMAGE_FILE_SYSTEM_TYPE := ext4

# Partitions block size
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_SYSTEMIMAGE_JOURNAL_SIZE := 0

# Kernel information
BOARD_KERNEL_BASE := 0x80200000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 androidboot.hardware=flo user_debug=31 msm_rtb.filter=0x3F ehci-hcd.park=3
BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x02000000

# Kernel source
TARGET_KERNEL_SOURCE := kernel/qcom/msm8960
TARGET_KERNEL_CONFIG := flo_defconfig

# Kernel toolchain
KERNEL_TOOLCHAIN := $(ANDROID_BUILD_TOP)/prebuilts/gcc/$(HOST_OS)-x86/arm/arm-eabi-4.8/bin
KERNEL_TOOLCHAIN_PREFIX := arm-eabi-

# Use mke2fs to create ext4 images
TARGET_USES_MKE2FS := true

# TWRP Configuration
TW_THEME := portrait_hdpi
TW_DEVICE_VERSION := 1 UA
TARGET_RECOVERY_FSTAB = device/asus/flo/fstab.flo
BOARD_HAS_NO_REAL_SDCARD := true
RECOVERY_SDCARD_ON_DATA := true
TW_NO_USB_STORAGE := true
TW_INCLUDE_CRYPTO := true

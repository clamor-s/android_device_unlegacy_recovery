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

# Platform
TARGET_BOARD_PLATFORM := tegra3
TARGET_BOOTLOADER_BOARD_NAME := grouper
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

# Architecture
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_VARIANT := cortex-a9
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon

# Partitions sizes
BOARD_BOOTIMAGE_PARTITION_SIZE := 8388608 # 8 M
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 12582912 # 12 M
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 681574400 # 650 M
BOARD_CACHEIMAGE_PARTITION_SIZE := 464519168 # 443 M
# BOARD_USERDATAIMAGE_PARTITION_SIZE := 6567231488 # 6.2 G

# Partitions types
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# Partitions block size
BOARD_FLASH_BLOCK_SIZE := 4096

# Kernel information
BOARD_KERNEL_CMDLINE := androidboot.hardware=$(TARGET_BOOTLOADER_BOARD_NAME) androidboot.selinux=permissive
TARGET_KERNEL_CONFIG := grouper_recovery_defconfig
TARGET_KERNEL_SOURCE := kernel/nvidia/tegra3

# Kernel toolchain
KERNEL_TOOLCHAIN := $(ANDROID_BUILD_TOP)/prebuilts/gcc/$(HOST_OS)-x86/arm/arm-eabi-4.8/bin
KERNEL_TOOLCHAIN_PREFIX := arm-eabi-

# Use mke2fs to create ext4 images
TARGET_USES_MKE2FS := true

# TWRP Configuration
TW_THEME := portrait_hdpi
TW_DEVICE_VERSION := 0 UA
TARGET_RECOVERY_FSTAB := device/asus/grouper/fstab.grouper
RECOVERY_SDCARD_ON_DATA := true
BOARD_HAS_NO_REAL_SDCARD := true
TW_NO_USB_STORAGE := false
TW_INCLUDE_CRYPTO := true
TW_EXCLUDE_TWRPAPP := true

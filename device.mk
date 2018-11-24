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

# Device characteritics
# PRODUCT_CHARACTERISTICS := phone
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := hdpi

# Dalvik VM config
$(call inherit-product, frameworks/native/build/phone-hdpi-512-dalvik-heap.mk)

# Filesystem configuration
PRODUCT_COPY_FILES += \
	device/htc/htcleo/fstab.htcleo:root/fstab.htcleo \
	device/htc/htcleo/twrp.fstab:recovery/root/etc/twrp.fstab

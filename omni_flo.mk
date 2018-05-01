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

# Inherit some common omni stuff.
$(call inherit-product-if-exists, vendor/omni/config/common.mk)

# Inherit full-base
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

# Inherit from tf device
$(call inherit-product, device/asus/flo/device.mk)

# Setup device specific product configuration.
PRODUCT_NAME := omni_flo
PRODUCT_DEVICE := flo
PRODUCT_BRAND := Android
PRODUCT_MODEL := Nexus 7
PRODUCT_MANUFACTURER := ASUS

# Device build info and fingerprint
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=razor \
    BUILD_FINGERPRINT="google/razor/flo:6.0.1/MOB30X/3036618:user/release-keys" \
    PRIVATE_BUILD_DESC="razor-user 6.0.1 MOB30X 3036618 release-keys"

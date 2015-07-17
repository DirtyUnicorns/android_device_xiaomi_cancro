# Copyright (C) 2014 The CyanogenMod Project
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

# Boot animation
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080
TARGET_CONTINUOUS_SPLASH_ENABLED := true

# Inherit from those products. Most specific first
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from cancro device
$(call inherit-product, device/xiaomi/cancro/cancro.mk)

ifeq ($(XIAOMI_DEVICE),mi3)
# Enhanced NFC
$(call inherit-product, vendor/cm/config/nfc_enhanced.mk)
endif

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_mini_phone.mk)

# Product configuration
PRODUCT_NAME := cm_cancro
PRODUCT_DEVICE := cancro
PRODUCT_BRAND := Xiaomi
PRODUCT_MANUFACTURER := Xiaomi
PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

ifeq ($(XIAOMI_DEVICE),mi3)
PRODUCT_MODEL := MI 3W
TARGET_UNOFFICIAL_BUILD_ID := mi3
endif

ifeq ($(XIAOMI_DEVICE),mi4)
PRODUCT_MODEL := MI 4W
TARGET_UNOFFICIAL_BUILD_ID := mi4
endif

# Build prop overrides
PRODUCT_BUILD_PROP_OVERRIDES += \
    TARGET_DEVICE="cancro" \
    PRODUCT_NAME="cancro" \
    BUILD_FINGERPRINT="Xiaomi/cancro/cancro:5.1.1/LMY48G:userdebug/test-keys" \
    PRIVATE_BUILD_DESC="cancro-userdebug 5.1.1 LMY48G test-keys"

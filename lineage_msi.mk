#
# Copyright (C) 2025 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Inherit from msi device
$(call inherit-product, device/motorola/msi/device.mk)

PRODUCT_DEVICE := msi
PRODUCT_NAME := lineage_msi
PRODUCT_BRAND := motorola
PRODUCT_MODEL := motorola edge 2024
PRODUCT_MANUFACTURER := motorola

PRODUCT_GMS_CLIENTID_BASE := android-motorola

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="avatrn_g-user 14 U2UANS34M.72-43-1-8 04ba4 release-keys"

BUILD_FINGERPRINT := motorola/avatrn_g/msi:14/U2UANS34M.72-43-1-8/04ba4:user/release-keys

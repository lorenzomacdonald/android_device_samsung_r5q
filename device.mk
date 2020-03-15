#
# Copyright (C) 2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/samsung/r5q

$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)

# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

PRODUCT_TARGET_VNDK_VERSION := 29
PRODUCT_SHIPPING_API_LEVEL := 29
PRODUCT_USE_DYNAMIC_PARTITIONS := true
PRODUCT_BUILD_SUPER_PARTITION := false

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(DEVICE_PATH)/overlay \
    $(DEVICE_PATH)/overlay-lineage

# No A/B
AB_OTA_UPDATER := false

# Audio 
PRODUCT_PACKAGES += \
    audio.a2dp.default

# Camera
PRODUCT_PACKAGES += \
    Snap

# fastbootd
PRODUCT_PACKAGES += \
    fastbootd

# Init
PRODUCT_PACKAGES += \
    fstab.qcom \
    init.qcom.rc

# Keylayout
PRODUCT_COPY_FILES += \
    device/samsung/r5q/keylayout/gpio-keys.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/gpio-keys.kl

# Telephony
PRODUCT_PACKAGES += \
    telephony-ext

PRODUCT_BOOT_JARS += \
    telephony-ext

#
# Copyright (C) 2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/samsung/r5q

$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)

# Call the proprietary setup
$(call inherit-product, vendor/samsung/r5q/r5q-vendor.mk)

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

# Init
PRODUCT_PACKAGES += \
    fstab.qcom \
    init.qcom.rc

# Keylayout
PRODUCT_COPY_FILES += \
    device/samsung/r5q/keylayout/gpio-keys.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/gpio-keys.kl

# Lights
PRODUCT_PACKAGES += \
    android.hardware.light@2.0-service.r5q

# Recovery
PRODUCT_PACKAGES += \
    fastbootd \
    init.recovery.qcom.rc

# Telephony
PRODUCT_PACKAGES += \
    telephony-ext

PRODUCT_BOOT_JARS += \
    telephony-ext

# Copyright (C) 2014 The Android Open Source Project
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

-include device/sony/customization/customization.mk

# Enable building packages from device namspaces.
# Might be temporary! See:
# https://android.googlesource.com/platform/build/soong/+/master/README.md#name-resolution
PRODUCT_SOONG_NAMESPACES += \
    $(PLATFORM_COMMON_PATH) \
    vendor/qcom/opensource/core-utils

# \
    hardware/qcom/display/sde

# Common path
COMMON_PATH := device/sony/common

# Build scripts
SONY_CLEAR_VARS := $(COMMON_PATH)/sony_clear_vars.mk
SONY_BUILD_SYMLINKS := $(COMMON_PATH)/sony_build_symlinks.mk

DEVICE_PACKAGE_OVERLAYS += $(COMMON_PATH)/overlay

PRODUCT_ENFORCE_RRO_TARGETS := *

PRODUCT_DEXPREOPT_SPEED_APPS += SystemUI

PRODUCT_FULL_TREBLE_OVERRIDE := false
PRODUCT_ENFORCE_VINTF_MANIFEST_OVERRIDE := false

# VNDK
# Force using VNDK regardless of shipping API level
PRODUCT_USE_VNDK_OVERRIDE := true
# Include vndk/vndk-sp/ll-ndk modules
PRODUCT_PACKAGES += \
    vndk_package

# Force building a recovery image: Needed for OTA packaging to work since Q
PRODUCT_BUILD_RECOVERY_IMAGE := true

KERNEL_PATH := kernel/sony/msm-$(SOMC_KERNEL_VERSION)
# Sanitized prebuilt kernel headers
-include $(KERNEL_PATH)/common-headers/KernelHeaders.mk

# Codecs Configuration
PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_video.xml

# Common etc
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/system/etc/nfcee_access.xml:system/etc/nfcee_access.xml

# GPS Configuration
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/vendor/etc/gps.conf:$(TARGET_COPY_OUT_VENDOR)/etc/gps.conf


# QMI Configuration
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/vendor/etc/qmi_fw.conf:$(TARGET_COPY_OUT_VENDOR)/etc/qmi_fw.conf

# QMI
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/vendor/etc/data/dsi_config.xml:$(TARGET_COPY_OUT_VENDOR)/etc/data/dsi_config.xml \
    $(COMMON_PATH)/rootdir/vendor/etc/data/netmgr_config.xml:$(TARGET_COPY_OUT_VENDOR)/etc/data/netmgr_config.xml \
    $(COMMON_PATH)/rootdir/vendor/etc/data/qmi_config.xml:$(TARGET_COPY_OUT_VENDOR)/etc/data/qmi_config.xml

# Sec Configuration
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/vendor/etc/sec_config:$(TARGET_COPY_OUT_VENDOR)/etc/sec_config

# Seccomp policy
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/vendor/etc/seccomp_policy/mediaextractor.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/mediaextractor.policy \
    $(COMMON_PATH)/rootdir/vendor/etc/seccomp_policy/mediacodec.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/mediacodec.policy

# Audio Configuration
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/vendor/etc/audio_effects.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.xml \
    frameworks/av/services/audiopolicy/config/a2dp_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/a2dp_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/a2dp_in_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/a2dp_in_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/audio_policy_volumes.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_volumes.xml \
    frameworks/av/services/audiopolicy/config/bluetooth_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/default_volume_tables.xml \
    frameworks/av/services/audiopolicy/config/r_submix_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/r_submix_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/usb_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/usb_audio_policy_configuration.xml


# # Audio Configuration
# PRODUCT_COPY_FILES += \
#     $(COMMON_PATH)/rootdir/vendor/etc/audio_effects.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.xml \
#     $(COMMON_PATH)/rootdir/vendor/etc/audio_policy_configuration_a2dp_offload_disabled.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration_a2dp_offload_disabled.xml \
#     $(COMMON_PATH)/rootdir/vendor/etc/audio_policy_configuration_bluetooth_legacy_hal.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration_bluetooth_legacy_hal.xml \
#     $(COMMON_PATH)/rootdir/vendor/etc/bluetooth_hearing_aid_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth_hearing_aid_audio_policy_configuration.xml \
#     $(COMMON_PATH)/rootdir/vendor/etc/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/default_volume_tables.xml \
#     frameworks/av/services/audiopolicy/config/a2dp_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/a2dp_audio_policy_configuration.xml \
#     frameworks/av/services/audiopolicy/config/a2dp_in_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/a2dp_in_audio_policy_configuration.xml \
#     frameworks/av/services/audiopolicy/config/bluetooth_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth_audio_policy_configuration.xml \
#     frameworks/av/services/audiopolicy/config/hearing_aid_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/hearing_aid_audio_policy_configuration.xml \
#     frameworks/av/services/audiopolicy/config/usb_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/usb_audio_policy_configuration.xml \
#     frameworks/av/services/audiopolicy/config/r_submix_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/r_submix_audio_policy_configuration.xml \
#     frameworks/av/services/audiopolicy/config/audio_policy_volumes.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_volumes.xml \
#         # ^ WARNING: AOSP uses c1/b1
#     # frameworks/av/services/audiopolicy/config/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/default_volume_tables.xml \
#     # $(COMMON_PATH)/rootdir/vendor/etc/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration.xml \

# Public Libraries
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/vendor/etc/public.libraries.txt:$(TARGET_COPY_OUT_VENDOR)/etc/public.libraries.txt

# PRODUCT_PLATFORM isn't set yet, thus we check the available path
ifneq (,$(filter userdebug eng,$(TARGET_BUILD_VARIANT)))
# ramdump cleaner
PRODUCT_PACKAGES += \
    rdclean.sh
endif

# Depend on symlink creation in /vendor:
PRODUCT_PACKAGES += \
    adreno_symlinks \
    camera_symlinks \
    qca_cld3_symlinks \
    rfsa_symlinks \
    tftp_symlinks

# Create firmware mount point folders in /vendor:
PRODUCT_PACKAGES += \
    firmware_folders

# Community APN list
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/vendor/etc/apns-conf.xml:system/etc/apns-conf.xml

MODEM_CONFIG := $(shell find $(COMMON_PATH)/rootdir/vendor/oem -type f -printf '%p:$(TARGET_COPY_OUT_VENDOR)/oem/%P\n')
$(warning $(MODEM_CONFIG))
PRODUCT_COPY_FILES += $(MODEM_CONFIG)

-include device/sony/customization/customization.mk

$(call inherit-product, device/sony/common/common-init.mk)
$(call inherit-product, device/sony/common/common-odm.mk)
$(call inherit-product, device/sony/common/common-packages.mk)
$(call inherit-product, device/sony/common/common-perm.mk)
$(call inherit-product, device/sony/common/common-prop.mk)
$(call inherit-product, device/sony/common/common-treble.mk)

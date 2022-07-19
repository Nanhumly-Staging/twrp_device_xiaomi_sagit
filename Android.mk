#
# Copyright 2022 The Android Open Source Project
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

# This contains the module build definitions for the hardware-specific
# components for this device.
#
# As much as possible, those components should be built unconditionally,
# with device-specific names to avoid collisions, to avoid device-specific
# bitrot and build breakages. Building a component unconditionally does
# *not* include it on all devices, so it is safe even with hardware-specific
# components.

LOCAL_PATH := $(call my-dir)

ifneq ($(filter sagit,$(TARGET_DEVICE)),)
include $(call all-makefiles-under,$(LOCAL_PATH))

include $(CLEAR_VARS)
LOCAL_CHECK_ELF_FILES := false
LOCAL_MODULE := android.hardware.gatekeeper@1.0-service_recovery
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_MODULE_PATH := $(TARGET_RECOVERY_ROOT_OUT)/system/bin
LOCAL_MODULE_STEM := android.hardware.gatekeeper@1.0-service
LOCAL_REQUIRED_MODULES := android.hardware.gatekeeper@1.0-service android.hardware.keymaster@3.0-service_recovery
LOCAL_SRC_FILES := ../../../$(TARGET_OUT_VENDOR_EXECUTABLES)/hw/android.hardware.gatekeeper@1.0-service
LOCAL_POST_INSTALL_CMD := \
    touch $(TARGET_RECOVERY_ROOT_OUT)/system/bin/qseecomd; \
    bash device/qcom/twrp-common/scripts/service_cleanup.bash;
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_CHECK_ELF_FILES := false
LOCAL_MODULE := android.hardware.keymaster@3.0-service_recovery
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_MODULE_PATH := $(TARGET_RECOVERY_ROOT_OUT)/system/bin
LOCAL_MODULE_STEM := android.hardware.keymaster@3.0-service
LOCAL_REQUIRED_MODULES := android.hardware.keymaster@3.0-service
LOCAL_SRC_FILES := ../../../$(TARGET_OUT_VENDOR_EXECUTABLES)/hw/android.hardware.keymaster@3.0-service
include $(BUILD_PREBUILT)

endif

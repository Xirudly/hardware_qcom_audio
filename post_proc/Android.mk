ifeq ($(strip $(AUDIO_FEATURE_ENABLED_EXTN_POST_PROC)),true)
LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)

ifeq ($(strip $(AUDIO_FEATURE_ENABLED_PROXY_DEVICE)),true)
    LOCAL_CFLAGS += -DAFE_PROXY_ENABLED
endif

LOCAL_SRC_FILES:= \
	bundle.c \
	equalizer.c \
	bass_boost.c \
	virtualizer.c \
	reverb.c \
	effect_api.c

LOCAL_CFLAGS+= -O2 -fvisibility=hidden
LOCAL_CFLAGS+= -Wno-error

LOCAL_HEADER_LIBRARIES := libhardware_headers
LOCAL_SHARED_LIBRARIES := \
	libcutils \
	liblog \
	libhardware \
	libtinyalsa

LOCAL_MODULE_TAGS := optional

LOCAL_VENDOR_MODULE := true

LOCAL_MODULE_RELATIVE_PATH := soundfx
LOCAL_MODULE:= libqcompostprocbundle

LOCAL_C_INCLUDES := \
	external/tinyalsa/include \
	$(call include-path-for, audio-effects)

LOCAL_HEADER_LIBRARIES := generated_kernel_headers

include $(BUILD_SHARED_LIBRARY)

endif

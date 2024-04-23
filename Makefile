ifeq ($(ROOTLESS),1)
THEOS_PACKAGE_SCHEME=rootless
endif

DEBUG=0
FINALPACKAGE=1
TARGET := iphone:clang:latest:13.0
ARCHS = arm64
PACKAGE_VERSION = 3.0.3

THEOS_DEVICE_IP = 192.168.1.9
THEOS_DEVICE_PORT = 22

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = uYouFix
$(TWEAK_NAME)_FILES = Tweak.x

include $(THEOS_MAKE_PATH)/tweak.mk

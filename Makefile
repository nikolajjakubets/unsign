ARCHS = arm64

include $(THEOS)/makefiles/common.mk

TOOL_NAME = unsign
$(TOOL_NAME)_FILES = src/endian.c src/unsign.c
$(TOOL_NAME)_FRAMEWORKS = CoreFoundation
$(TOOL_NAME)_CODESIGN_FLAGS = -Sent.plist

include $(THEOS_MAKE_PATH)/tool.mk

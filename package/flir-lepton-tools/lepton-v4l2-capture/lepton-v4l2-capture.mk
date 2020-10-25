################################################################################
#
# lepton-v4l2-capture
#
################################################################################

LEPTON_V4L2_CAPTURE_VERSION = v1.0.0
LEPTON_V4L2_CAPTURE_SITE = $(call github,l4es,lepton-v4l2-capture,$(LEPTON_V4L2_CAPTURE_VERSION))
LEPTON_V4L2_CAPTURE_INSTALL_STAGING = YES

LEPTON_V4L2_CAPTURE_DEPENDENCIES = flir-lepton-sdk-at91 v4l2loopback

LEPTON_V4L2_CAPTURE_CFLAGS = -I$(STAGING_DIR)/usr/include \
				-L$(STAGING_DIR)/usr/lib \
				$(TARGET_CFLAGS)

LEPTON_V4L2_CAPTURE_CXXFLAGS = -I$(STAGING_DIR)/usr/include \
				-L$(STAGING_DIR)/usr/lib \
				$(TARGET_CXXFLAGS)
define LEPTON_V4L2_CAPTURE_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) CC="$(TARGET_CC)" CXX="$(TARGET_CXX)" LD="$(TARGET_LD)" CFLAGS="$(LEPTON_V4L2_CAPTURE_CFLAGS)" CXXFLAGS="$(LEPTON_V4L2_CAPTURE_CXXFLAGS)" -C $(@D) all
endef

define LEPTON_V4L2_CAPTURE_INSTALL_TARGET_CMDS
	$(TARGET_MAKE_ENV) $(INSTALL) -D -m 0755 $(@D)/lepton_v4l2_capture $(TARGET_DIR)/usr/bin
endef

$(eval $(generic-package))

################################################################################
#
# lepton-v4l2-stream
#
################################################################################

LEPTON_V4L2_STREAM_VERSION = v1.0.0
LEPTON_V4L2_STREAM_SITE = $(call github,l4es,lepton-v4l2-stream,$(LEPTON_V4L2_STREAM_VERSION))
LEPTON_V4L2_STREAM_INSTALL_STAGING = NO

LEPTON_V4L2_STREAM_DEPENDENCIES = libglib2 websocketpp boost gstreamer1

LEPTON_V4L2_STREAM_CFLAGS = -I$(STAGING_DIR)/usr/include \
				-L$(STAGING_DIR)/usr/lib \
				$(TARGET_CFLAGS)

LEPTON_V4L2_STREAM_CXXFLAGS = -I$(STAGING_DIR)/usr/include \
				-L$(STAGING_DIR)/usr/lib \
				$(TARGET_CXXFLAGS)
define LEPTON_V4L2_STREAM_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) CC="$(TARGET_CC)" CXX="$(TARGET_CXX)" LD="$(TARGET_LD)" \
			CFLAGS="$(LEPTON_V4L2_STREAM_CFLAGS)" CXXFLAGS="$(LEPTON_V4L2_STREAM_CXXFLAGS)" -C $(@D) lepton_v4l2_stream
endef

define LEPTON_V4L2_STREAM_INSTALL_TARGET_CMDS
	$(TARGET_MAKE_ENV) $(INSTALL) -D -m 0755 $(@D)/lepton_v4l2_stream $(TARGET_DIR)/usr/bin
	$(TARGET_MAKE_ENV) $(INSTALL) -d $(TARGET_DIR)/usr/share/lepton-v4l2-stream/public
	$(TARGET_MAKE_ENV) $(INSTALL) -m 0755 $(@D)/public/* $(TARGET_DIR)/usr/share/lepton-v4l2-stream/public
endef

$(eval $(generic-package))

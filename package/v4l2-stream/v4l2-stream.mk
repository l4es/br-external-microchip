################################################################################
#
# v4l2-stream
#
################################################################################

V4L2_STREAM_VERSION = v1.0.0
V4L2_STREAM_SITE = $(call github,l4es,v4l2-stream,$(V4L2_STREAM_VERSION))
V4L2_STREAM_INSTALL_STAGING = NO

V4L2_STREAM_DEPENDENCIES = libglib2 websocketpp boost

V4L2_STREAM_CFLAGS = -I$(STAGING_DIR)/usr/include \
				-L$(STAGING_DIR)/usr/lib \
				$(TARGET_CFLAGS)

V4L2_STREAM_CXXFLAGS = -I$(STAGING_DIR)/usr/include \
				-L$(STAGING_DIR)/usr/lib \
				$(TARGET_CXXFLAGS)
define V4L2_STREAM_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) CC="$(TARGET_CC)" CXX="$(TARGET_CXX)" LD="$(TARGET_LD)" \
			CFLAGS="$(V4L2_STREAM_CFLAGS)" CXXFLAGS="$(V4L2_STREAM_CXXFLAGS)" -C $(@D) v4l2-streamer
endef

define V4L2_STREAM_INSTALL_TARGET_CMDS
	$(TARGET_MAKE_ENV) $(INSTALL) -D -m 0755 $(@D)/v4l2-streamer $(TARGET_DIR)/usr/bin
	$(TARGET_MAKE_ENV) $(INSTALL) -d $(TARGET_DIR)/usr/share/v4l2-streamer/public
	$(TARGET_MAKE_ENV) $(INSTALL) -m 0755 $(@D)/public/* $(TARGET_DIR)/usr/share/v4l2-streamer/public
endef

$(eval $(generic-package))

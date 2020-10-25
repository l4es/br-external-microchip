################################################################################
#
# lepton-spidev-capture
#
################################################################################

LEPTON_SPIDEV_CAPTURE_VERSION = v1.0.0
LEPTON_SPIDEV_CAPTURE_SITE = $(call github,l4es,lepton-spidev-capture,$(LEPTON_SPIDEV_CAPTURE_VERSION))
LEPTON_SPIDEV_CAPTURE_INSTALL_STAGING = NO

define LEPTON_SPIDEV_CAPTURE_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D) all
endef

define LEPTON_SPIDEV_CAPTURE_INSTALL_TARGET_CMDS
	$(TARGET_MAKE_ENV) $(INSTALL) -D -m 0755 $(@D)/lepton_spidev_capture $(TARGET_DIR)/usr/bin
endef

$(eval $(generic-package))

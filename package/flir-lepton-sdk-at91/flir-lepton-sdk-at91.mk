################################################################################
#
# flir-lepton-sdk-at91
#
################################################################################

FLIR_LEPTON_SDK_AT91_VERSION = v1.0.0
FLIR_LEPTON_SDK_AT91_SITE = $(call github,l4es,flir-lepton-sdk-at91,$(FLIR_LEPTON_SDK_AT91_VERSION))
FLIR_LEPTON_SDK_AT91_INSTALL_STAGING = NO

define FLIR_LEPTON_SDK_AT91_BUILD_CMDS
$(MAKE) CC="$(TARGET_CC)" CXX="$(TARGET_CXX)" CFG=$(BR2_PACKAGE_FLIR_LEPTON_SDK_AT91_CONF) LD="$(TARGET_LD)" -C $(@D) all
endef

define FLIR_LEPTON_SDK_AT91_INSTALL_TARGET_CMDS
#$(INSTALL) -D -m 0755 $(@D)/lepton_spidev_capture $(TARGET_DIR)/usr/lib
endef

$(eval $(generic-package))

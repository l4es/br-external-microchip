################################################################################
#
# flir-lepton-tools
#
################################################################################

FLIR_LEPTON_TOOLS_VERSION = v1.0.0
FLIR_LEPTON_TOOLS_SITE = https://github.com/l4es/flir-lepton-tools.git
FLIR_LEPTON_TOOLS_SITE_METHOD = git
FLIR_LEPTON_TOOLS_INSTALL_STAGING = NO

define FLIR_LEPTON_TOOLS_BUILD_CMDS
$(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D) all
endef

define FLIR_LEPTON_TOOLS_INSTALL_TARGET_CMDS
$(INSTALL) -D -m 0755 $(@D)/spidev_capture $(TARGET_DIR)/usr/bin
endef

$(eval $(generic-package))

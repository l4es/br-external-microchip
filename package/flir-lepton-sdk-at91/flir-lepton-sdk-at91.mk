################################################################################
#
# flir-lepton-sdk-at91
#
################################################################################

FLIR_LEPTON_SDK_AT91_VERSION = v1.0.0
FLIR_LEPTON_SDK_AT91_SITE = $(call github,l4es,flir-lepton-sdk-at91,$(FLIR_LEPTON_SDK_AT91_VERSION))
FLIR_LEPTON_SDK_AT91_INSTALL_STAGING = YES

define FLIR_LEPTON_SDK_AT91_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) CC="$(TARGET_CC)" CXX="$(TARGET_CXX)" CFG=$(BR2_PACKAGE_FLIR_LEPTON_SDK_AT91_CONF) LD="$(TARGET_LD)" -C $(@D) all
endef

FLIR_LEPTON_SDK_AT91_CONF = $(call qstrip,$(BR2_PACKAGE_FLIR_LEPTON_SDK_AT91_CONF))

define FLIR_LEPTON_SDK_AT91_INSTALL_STAGING_CMDS
	$(TARGET_MAKE_ENV) $(INSTALL) -D -m 0755 $(@D)/$(FLIR_LEPTON_SDK_AT91_CONF)/libLEPTON_SDK.a $(STAGING_DIR)/usr/lib/libLEPTON_SDK.a

	$(TARGET_MAKE_ENV) $(INSTALL) -D -m 0644 $(@D)/LEPTON_SDK.h $(STAGING_DIR)/usr/include/LEPTON_SDK.h
	$(TARGET_MAKE_ENV) $(INSTALL) -D -m 0644 $(@D)/LEPTON_SDKConfig.h $(STAGING_DIR)/usr/include/LEPTON_SDKConfig.h
	$(TARGET_MAKE_ENV) $(INSTALL) -D -m 0644 $(@D)/LEPTON_Types.h $(STAGING_DIR)/usr/include/LEPTON_Types.h
	$(TARGET_MAKE_ENV) $(INSTALL) -D -m 0644 $(@D)/LEPTON_ErrorCodes.h $(STAGING_DIR)/usr/include/LEPTON_ErrorCodes.h
	$(TARGET_MAKE_ENV) $(INSTALL) -D -m 0644 $(@D)/LEPTON_I2C_Protocol.h $(STAGING_DIR)/usr/include/LEPTON_I2C_Protocol.h
	$(TARGET_MAKE_ENV) $(INSTALL) -D -m 0644 $(@D)/LEPTON_I2C_Service.h $(STAGING_DIR)/usr/include/LEPTON_I2C_Service.h
	$(TARGET_MAKE_ENV) $(INSTALL) -D -m 0644 $(@D)/LEPTON_SYS.h $(STAGING_DIR)/usr/include/LEPTON_SYS.h

endef

define FLIR_LEPTON_SDK_AT91_INSTALL_TARGET_CMDS
#	$(INSTALL) -D -m 0755 $(@D)/$(FLIR_LEPTON_SDK_AT91_CONF)/libLEPTON_SDK.so* $(TARGET_DIR)/usr/lib
endef

$(eval $(generic-package))

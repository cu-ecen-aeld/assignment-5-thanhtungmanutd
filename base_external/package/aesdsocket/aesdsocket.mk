
##############################################################
#
# AESDSOCKET
#
##############################################################

#TODO: Fill up the contents below in order to reference your assignment 3 git contents
AESDSOCKET_VERSION = e8251f35ecece0cf5436cdceff0aab94fcfc9ada
# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
AESDSOCKET_SITE = git@github.com:cu-ecen-aeld/assignments-3-and-later-thanhtungmanutd.git
AESDSOCKET_SITE_METHOD = git
AESDSOCKET_GIT_SUBMODULES = YES

define AESDSOCKET_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/server all
endef

# TODO add your writer, finder and finder-test utilities/scripts to the installation steps below
define AESDSOCKET_INSTALL_TARGET_CMDS
	$(INSTALL) -d $(TARGET_DIR)/etc/init.d/S99aesdsocket
	$(INSTALL) -m 0755 $(@D)/server/aesdsocket $(TARGET_DIR)/bin
	$(INSTALL) -m 0755 $(@D)/server/aesdsocket-start-stop.sh $(TARGET_DIR)/etc/init.d/S99aesdsocket
endef

$(eval $(generic-package))

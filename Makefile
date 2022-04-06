
# WARNING:


# This environment is multi-lingual with Linux and Windows.
# As a result, it is required to run from root, in /root/env.
# If you are operating from Linux native, it will copy the 
# repository into your /root/env directory. You must use that
# directory after cloning the code.



THIS_PATH=/root/env
OS_CODING_ENVIRONMENT=$(THIS_PATH)/AUM-Ono-OS-Code-Environment
DEPENDENCY_INSTALLER=$(THIS_PATH)/AUM-Ono-OS-Dependencies-And-Installers
EMULATORS=$(THIS_PATH)/AUM-Ono-OS-Run




buildOS:
	@tput init
	@echo If this directory can not be located, you may need to first run make installDependencies from a fresh clone to generate it.
	@tput setab 9
	@tput setaf 16 
	cd $(OS_CODING_ENVIRONMENT)/Build/Build-Script && make buildOS
	@tput init




cleanBuildOS:
	@tput init
	@echo If this directory can not be located, you may need to first run make installDependencies from a fresh clone to generate it.
	@tput setab 9
	@tput setaf 16 
	cd $(OS_CODING_ENVIRONMENT)/Build/Build-Script && make cleanBuildOS
	@tput init




installDependencies:
	-cp -rf ./ $(THIS_PATH)
	cd $(DEPENDENCY_INSTALLER)/Linux && make installDependencies




# WARNING:


# This command will only run on Linux native.
# Run the Run-AUM-Ono-OS.bat after building if on Windows.
# You can set up a hotkey for that to make it faster.
qemuRunOS:
	cd $(EMULATORS)/Linux/QEMU && make qemuRunOS

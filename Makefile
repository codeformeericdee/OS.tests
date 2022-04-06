# WARNING:

# This environment is multi-lingual with Linux and Windows.
# As a result, it is required to run from root, in /root/env.
# If you are operating from Linux native, it will copy the 
# repository into your /root/env directory. You must use that
# directory after cloning the code.

THIS_PATH=/root/env
osCodeEnvironment=$(THIS_PATH)/AUM-Ono-OS-Code-Environment

buildOS:
	cd $(osCodeEnvironment)/Build/Build-Script && make buildOS

cleanBuildOS:
	cd $(osCodeEnvironment)/Build/Build-Script && make cleanBuildOS

# WARNING:

# This command will only run on Linux native.
# Run the QEMU.bat after building if on Windows.
# You can set up a hotkey for that to make it faster.
qemuRunOS:
	cd $(osCodeEnvironment)/Run/QEMU && make qemuRunOS
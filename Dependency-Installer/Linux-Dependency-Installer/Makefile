# WARNING:

# This environment is multi-lingual with Linux and Windows.
# As a result, it is required to run from root, in /root/env.
# If you are operating from Linux native, it will copy the 
# repository into your /root/env directory. You must use that
# directory after cloning the code.

THIS_PATH=/root/env
osCodeEnvironment=$(THIS_PATH)/AUM-Ono-OS-Code-Environment

createOS:
	make buildOS 
	make qemuRunOS

buildOS:
	cd $(osCodeEnvironment)/Build/Settings/Linux && make buildOS

qemuRunOS:
	cd $(osCodeEnvironment)/Run/QEMU && make qemuRunOS

setupAll:
	apt-get install -y qemu-system-i386
	apt-get install -y tree
	make setupVim
	tree

TMP_DIRECTORY=/root/tmp
setupVim:
	-mkdir $(TMP_DIRECTORY)
	-touch .vimrc
	echo :set dir=$(TMP_DIRECTORY) > .vimrc
	cat .vimrc

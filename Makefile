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

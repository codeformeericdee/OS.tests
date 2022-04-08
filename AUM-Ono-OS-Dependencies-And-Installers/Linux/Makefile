
# WARNING:


# This environment is multi-lingual with Linux and Windows.
# As a result, it is required to run from root, in /root/env.
# If you are operating from Linux native, it will copy the 
# repository into your /root/env directory. You must use that
# directory after cloning the code.



THIS_PATH=/root/env
TMP_DIRECTORY=~/tmp



installDependencies:
	apt-get update
	apt-get upgrade -y
	apt-get install -y nasm
	apt-get install -y clang
	apt-get install -y make
	apt-get install -y vim
	apt-get install -y qemu-system-i386
	apt-get install -y tree
	make setupVim
	cd $(THIS_PATH) && tree



setupVim:
	-mkdir $(TMP_DIRECTORY)
	-touch ~/.vimrc
	echo :set dir=$(TMP_DIRECTORY) > ~/.vimrc
	cat ~/.vimrc

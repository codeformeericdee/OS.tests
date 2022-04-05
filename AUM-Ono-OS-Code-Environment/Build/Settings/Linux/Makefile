

# There is a top level Run directory for running emulators.
THIS_PATH=/root/env/AUM-Ono-OS-Code-Environment
BUILD=$(THIS_PATH)/Build
BUILD_SETTINGS=$(BUILD)/Settings
BUILD_BINARY=$(BUILD)/Binary
THIS_DIRECTORY=$(BUILD_SETTINGS)/Linux
SOURCE_CODE=$(THIS_PATH)/Source
BOOT_CODE=$(SOURCE_CODE)/Boot

RESULT=$(THIS_PATH)/Operating-System
THIS_BOOTLOADER = $(BUILD_BINARY)/AUM-Ono-Bootloader.bin
THIS_KERNEL = $(BUILD_BINARY)/AUM-Ono-Kernel.bin
THIS_OS = $(RESULT)/AUM-Ono-OS.bin
buildOS:
	nasm $(BOOT_CODE)/Bootloader.asm -o $(THIS_BOOTLOADER)
	nasm $(BOOT_CODE)/Kernel.asm -o $(THIS_KERNEL)
	cat $(THIS_BOOTLOADER) $(THIS_KERNEL) > $(THIS_OS)

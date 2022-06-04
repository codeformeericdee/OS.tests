# There is a top level Run directory for running emulators.

THIS_PATH=/root/env/AUM-Ono-OS-Code-Environment
THIS_ALL_SOURCE_CODE=$(THIS_PATH)/Source
THIS_BUILD=$(THIS_PATH)/Build
THIS_BINARY=$(THIS_BUILD)/Binary
THIS_BOOT_CODE=$(THIS_ALL_SOURCE_CODE)/Boot
THIS_OPERATING_SYSTEM_CODE=$(THIS_ALL_SOURCE_CODE)/Operating-System

#

BUILD_RESULTS=$(THIS_BUILD)/Result
THIS_BOOTLOADER_BIN = $(THIS_BINARY)/AUM-Ono-Bootloader.bin
THIS_BOOT_STAGE_TWO_BIN = $(THIS_BINARY)/AUM-Ono-Boot-Stage-Two.bin
THIS_OPERATING_SYSTEM_BIN = $(THIS_BINARY)/AUM-Ono-Operating-System.bin
THIS_OS = $(BUILD_RESULTS)/AUM-Ono-OS.flp

buildOS:
	nasm $(THIS_BOOT_CODE)/Bootloader.asm -o $(THIS_BOOTLOADER_BIN)
	nasm $(THIS_BOOT_CODE)/Boot-Stage-Two.asm -o $(THIS_BOOT_STAGE_TWO_BIN)
	nasm $(THIS_OPERATING_SYSTEM_CODE)/Operating-System.asm -o $(THIS_OPERATING_SYSTEM_BIN)
	cat $(THIS_BOOTLOADER_BIN) $(THIS_BOOT_STAGE_TWO_BIN) $(THIS_OPERATING_SYSTEM_BIN) > $(THIS_OS)

clean:
	@-rm $(THIS_BINARY)/*
	@-rm $(THIS_OS)

cleanBuildOS:
	make clean
	make buildOS


# There is a top level Run directory for running emulators.
THIS_PATH=/root/env/AUM-Ono-OS-Code-Environment
THIS_SOURCE_CODE=$(THIS_PATH)/Source
THIS_BOOT_CODE=$(THIS_SOURCE_CODE)/Boot
THIS_BUILD=$(THIS_PATH)/Build
THIS_BINARY=$(THIS_BUILD)/Binary

RESULT=$(THIS_BUILD)/Result
THIS_BOOTLOADER = $(THIS_BINARY)/AUM-Ono-Bootloader.bin
THIS_KERNEL = $(THIS_BINARY)/AUM-Ono-Kernel.bin
THIS_OS = $(RESULT)/AUM-Ono-OS.bin
buildOS:
	nasm $(THIS_BOOT_CODE)/Bootloader.asm -o $(THIS_BOOTLOADER)
	nasm $(THIS_BOOT_CODE)/Kernel.asm -o $(THIS_KERNEL)
	cat $(THIS_BOOTLOADER) $(THIS_KERNEL) > $(THIS_OS)

cleanBuildOS:
	make clean
	nasm $(THIS_BOOT_CODE)/Bootloader.asm -o $(THIS_BOOTLOADER)
	nasm $(THIS_BOOT_CODE)/Kernel.asm -o $(THIS_KERNEL)
	cat $(THIS_BOOTLOADER) $(THIS_KERNEL) > $(THIS_OS)

clean:
	rm $(THIS_BINARY)/*.bin
	rm $(RESULT)/*.bin
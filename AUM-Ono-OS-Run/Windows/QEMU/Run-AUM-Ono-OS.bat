
cd ..
cd ..
cd ..
cd AUM-Ono-OS-Code-Environment
cd Build
cd Result
rem Locates the Program Files directory this way
"%CD:~0,3%Program Files\qemu\qemu-system-i386" -fda %CD%\AUM-Ono-OS.bin -L "%CD:~0,3%Program Files\qemu"
pause
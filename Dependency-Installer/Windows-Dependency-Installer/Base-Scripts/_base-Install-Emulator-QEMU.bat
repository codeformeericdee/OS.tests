powershell curl -o QEMU-Installer.exe https://qemu.weilnetz.de/w64/2021/qemu-w64-setup-20210203.exe
rem Moves QEMU onto the current drive so that the execution can be completed outside of sys32:
move QEMU-Installer.exe %CD:~0,3%QEMU-Installer.exe
start %CD:~0,3%QEMU-Installer.exe
rem Deletes the installer after running, and informs the user of that (The file is (100+ MB) large):
@echo When finished installing QEMU press enter, and the %CD:~0,3%Qemu-Installer.exe file will be deleted.
pause
del %CD:~0,3%QEMU-Installer.exe
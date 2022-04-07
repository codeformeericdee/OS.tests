@echo off
echo Please give Chocolatey, and Docker some time to load.
rem Install Chocolatey:
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "[System.Net.ServicePointManager]::SecurityProtocol = 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"
rem Install Docker for desktop:
choco install docker-desktop
rem WSL2 is needed for Docker to operate:
powershell dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
powershell dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
powershell curl -o LinuxKernelUpdatePackage.msi https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi
start LinuxKernelUpdatePackage.msi
rem Confirm installation, and delete the installer:
echo.
echo When finished installing press enter, and the %CD%\LinuxKernelUpdatePackage.msi file will be deleted.
echo Then the computer will reboot to allow the use of Docker.
echo After the computer reboots, please return to this directory, and run the Admin-Start-And-Build-Docker.bat script.
echo.
echo.
echo ****************
echo WARNING:
echo IF YOU ARE RUNNING THE INSTALL ALL SCRIPT, PLEASE WAIT FOR QEMU TO FINISH INSTALLING BEFORE CONTINUING,
echo BECAUSE YOUR COMPUTER WILL RESTART IF YOU PRESS ENTER.
echo ****************
echo.
echo.
echo.
pause
wsl --set-default-version 2
del LinuxKernelUpdatePackage.msi
rem Restart the computer for Docker to function:
echo Restarting the computer in 16 seconds to allow the use of Docker.
shutdown -t 16 -r -f
pause
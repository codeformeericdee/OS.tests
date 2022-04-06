All of these scripts do the installations for you.
Just double click them to run them and follow the instructions.

1. Admin-Install-All.bat
    Installation milestones:
    After the installation of QEMU completes, press enter in the Chocolatey/Docker window.
    This will then complete the installation, and restart your computer.
    The installation includes setting up WSL2 so you don't have to.

After restart
2. Admin-Start-And-Build-Docker.bat
    Installation milestones:
    This will start Docker Desktop (dockerd.exe/CLI is deprecated, and desktop is required).
    After Docker Desktop is running, press enter as prompted.
    It will then build an Ubuntu image using the Dockerfile in /Base-Scripts.

3. Admin-Start-And-Run-Docker.bat
    This will start Docker Desktop, or bring it to front if it is running.
    It will then run Docker Desktop using the image that was build previously.

4. You can use the Makefile commands found in the /root/env directory at this point.
    Build milestones:
    Use the make buildOS, or make cleanBuildOS to build the Operating System.

5. After building the OS
    Run the OS using the Run-AUM-Ono-OS.bat script located in AUM-Ono-OS-Run/Windows/QEMU
    Run milestones:
    A Linux container cannot run a GUI. You must run the batch script from Windows natively.
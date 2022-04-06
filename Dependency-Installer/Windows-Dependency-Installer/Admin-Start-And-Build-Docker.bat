powershell start-process "%CD%\Base-Scripts\_base-Start-Docker-Desktop.bat" -verb runas
start _base-Build-Docker-Image.bat

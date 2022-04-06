rem Due to relative searching, this script needs to be found in its own folder.

@echo off
echo.
echo *Please wait for Docker Desktop to start.****
echo.
echo.
echo If the docker process is currently running, then press any key.
pause
cd ..
cd ..
cd ..
powershell -command docker run -p 127.0.0.1:256:256 --user=root -it -v "%CD%:/root/env" --rm operating-system-coding-environment
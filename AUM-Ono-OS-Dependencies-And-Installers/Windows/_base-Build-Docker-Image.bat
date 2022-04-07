rem Due to relative searching, this script needs to be found in its own folder.

@echo off
echo.
echo *Please wait for Docker Desktop to start.****
echo.
echo.
echo If the docker process is currently running, then press any key.
pause
docker pull ubuntu
docker build --no-cache=true -f "%CD%\Base-Scripts\Dockerfile" "%CD%" -t operating-system-coding-environment
pause
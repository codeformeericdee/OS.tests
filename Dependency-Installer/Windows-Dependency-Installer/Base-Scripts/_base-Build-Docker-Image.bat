@echo off
set %CD%
echo.
echo *Please wait for Docker Desktop to start.****
echo.
echo.
echo If the docker process is currently running, then press any key.
pause
docker pull ubuntu
docker build --no-cache=true -f "%CD%\Dockerfile" "%CD%" -t operating-system-coding-environment
pause
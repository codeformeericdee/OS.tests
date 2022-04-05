powershell -command docker run -p 127.0.0.1:81:81 --user=root -it -v "${pwd}:/root/env" --rm operating-system-code
pause
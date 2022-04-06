rem Due to relative searching, this script needs to be found in its own folder.

cd ..
cd ..
powershell -command docker run -p 127.0.0.1:256:256 --user=root -it -v "%CD%:/root/env" --rm operating-system-coding-environment
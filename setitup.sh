#~/bin/bash
git submodule update --init --recursive
git submodule foreach --recursive git fetch
git submodule foreach git merge origin master
cd ./flight_ws 
chmod +x setitup.sh
./setitup.sh

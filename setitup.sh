#~/bin/bash
git submodule init 
git submodule update --recursive
cd ./flight_ws 
chmod +x setitup.sh
./setitup.sh

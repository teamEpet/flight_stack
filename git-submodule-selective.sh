#!/bin/sh
while [ "$1" != "" ]; do
    case $1 in
        -f  )  flight_ws=false;;
        -r  )  rotors_simulator=false;;
        -F  )  Firmware=false;;
	-s  )  sitl_gazebo=false;;
	-S  )  flight_stack=false;;
	*   )  CMD=$*
        break;;
    esac
    shift
done
cd flight_ws
if [ "$flight_ws" != false ] ; then
	echo "CWD flight_ws"
        git $@
fi 
cd src/rotors_simulator
if [ "$rotors_simulator" != false ] ; then
	echo "CWD rotors_simulator"
        git $CMD
fi 
cd ../../../Firmware
if [ "$Firmware" != false ] ; then
	echo "CWD Firmware"
        git $CMD
fi 
cd Tools/sitl_gazebo
if [ "$sitl_gazebo" != false ] ; then
	echo "CWD sitl_gazebo"
        git $CMD
fi 
cd ../../../
if [ "$flight_stack" != false ] ; then
	echo "CWD flight_stack"
        git $CMD
fi 


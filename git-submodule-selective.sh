#!/bin/sh
flight_ws=false
rotors_simulator=false
Firmware=false
sitl_gazebo=false
flight_stack=true
while [ "$1" != "" ]; do
    case $1 in
        -f  )  flight_ws=true;;
        -r  )  rotors_simulator=true;;
        -F  )  Firmware=true;;
	    -s  )  sitl_gazebo=true;;
	    -S  )  flight_stack=false;;
	    *   )  CMD=$*
        break;;
    esac
    shift
done
cd flight_ws
if [ "$flight_ws" != false ] ; then
    echo ""
    echo ""
	echo "----------------------------CWD flight_ws----------------------------------------"
        git $@
fi 
cd src/rotors_simulator
if [ "$rotors_simulator" != false ] ; then
    echo ""
    echo ""
	echo "----------------------------CWD rotors_simulator---------------------------------"
        git $CMD
fi 
cd ../../../Firmware
if [ "$Firmware" != false ] ; then
    echo ""
    echo ""
	echo "----------------------------CWD Firmware-----------------------------------------"
        git $CMD
fi 
cd Tools/sitl_gazebo
if [ "$sitl_gazebo" != false ] ; then
    echo ""
    echo ""
	echo "----------------------------CWD sitl_gazebo--------------------------------------"
        git $CMD
fi 
cd ../../../
if [ "$flight_stack" != false ] ; then
    echo ""
    echo ""
	echo "----------------------------CWD flight_stack-------------------------------------"
        git $CMD
fi 


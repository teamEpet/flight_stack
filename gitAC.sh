#!/bin/sh
while [ "$1" != "" ]; do
    case $1 in
        -f  )  flight_ws=true;;
        -r  )  rotors_simulator=true;;
        -F  )  Firmware=true;;
	    -s  )  sitl_gazebo=true;;
	    -S  )  flight_stack=true;;
	    *   )  CMD=$*
        break;;
    esac
    shift
done

if [ "$flight_ws" = true ] ; then
    echo ""
    echo ""
	echo "----------------------------CWD flight_ws----------------------------------------"
	cd flight_ws
    git add . 
    git commit -m "$CMD"
    cd ..
    git add flight_ws
    git commit -m "flight_ws: $CMD"
fi 

if [ "$rotors_simulator" = true ] ; then
    echo ""
    echo ""
	echo "----------------------------CWD rotors_simulator---------------------------------"
	cd flight_ws/src/rotors_simulator
    git add . 
    git commit -m "$CMD"
    cd ..
    git add rotors_simulator
    git commit -m "rotors_simulator: $CMD"
    cd ../..
    git add . 
    git commit -m "flight_ws: $CMD"
fi 

if [ "$Firmware" = true ] ; then
	cd Firmware 
    echo ""
    echo ""
	echo "----------------------------CWD Firmware-----------------------------------------"
    git add . 
    git commit -m "$CMD"
    cd ..
    git add Firmware
    git commit -m "Firmware: $CMD"
fi 

if [ "$sitl_gazebo" = true ] ; then
	cd Firmware/Tools/sitl_gazebo
    echo ""
    echo ""
	echo "----------------------------CWD sitl_gazebo--------------------------------------"
    git add . 
    git commit -m "$CMD"
    cd ..
    git add sitl_gazebo
    git commit -m "sitl_gazebo: $CMD"
    cd ../../
    git add Firmware		
    git commit -m "Firmware: $CMD"
    cd ../../../
fi 

#!/bin/bash
echo "------------------------"
echo "Created By: Fahad Ahammed"
echo "https://obakfahad.com"
echo "Github Repository: https://github.com/obakfahad/giffider"
echo "------------------------"
me=$(whoami)
loc=/home/$me/Pictures/
cd $loc
echo "1. Giffider in Full Screen?"
echo "2. Giffider in specific Windows?"
read fw
if [ $fw = "1" ]
then	

	hor=$(xdpyinfo | awk -F'[ x]+' '/dimensions:/{print $3}')
	ver=$(xdpyinfo | awk -F'[ x]+' '/dimensions:/{print $4}')
	echo "Dual monitor ? Type 'y' if Yes and 'n' for no."
	read ifdual
	if [ $ifdual = "y" ]
		then
			echo "Horizontal = "$hor	
			echo "Vertical="$ver
			echo "Your gif Duration ?"
			read duration
			echo "Your gif's name ?"
			read giffidername
			byzanz-record --duration=$duration --width=$hor --height=$ver giffider-$giffidername.gif
		else
			echo "Horizontal = "$[hor/2]
			horizontal=$[hor/2]
			echo "Vertical="$ver
			echo "Your gif Duration ?"
			read duration
			echo "Your gif's name ?"
			read giffidername
			byzanz-record --duration=$duration --width=$horizontal --height=$ver giffider-$giffidername.gif
	fi

fi




if [ $fw = "2" ]
then
	
	rm file.txt
	rm 1.txt
	xwininfo >> file.txt
	sed -n '8,13p' file.txt | awk 'NF{print $NF}' >> 1.txt
	X=$(sed -n '1p' 1.txt)
	Y=$(sed -n '2p' 1.txt)
	width=$(sed -n '5p' 1.txt)
	height=$(sed -n '6p' 1.txt)
	echo "Your gif Duration ?"
	read duration
	echo "Your gif's name ?"
	read giffidername
	byzanz-record --duration=$duration --x=$X --y=$Y --width=$width --height=$height giffider-$giffidername.gif
	
fi

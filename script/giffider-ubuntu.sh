#!/bin/bash
echo "------------------------"
echo "Created By: Fahad Ahammed"
echo "https://obakfahad.com"
echo "Github Repository: https://github.com/obakfahad/giffider"
echo "------------------------"
echo "OS: UBUNTU"
echo "------------------------"
ifex=$(which byzanz-record)
if [[ $ifex == "/usr/bin/byzanz-record" ]]
 then
 echo "Starting.........."
 else
 echo "Need to install Dependency."
 sudo apt-get install byzanz
fi
me=$(whoami)
loc=/home/$me/Pictures/
cd $loc
echo "-----------------------------"
echo "1. Giffider in Full Screen?"
echo "2. Giffider in specific Window?"
echo "-----------------------------"
read fw
if [ $fw = "1" ]
then	
	echo "-----------------------------"
	hor=$(xdpyinfo | awk -F'[ x]+' '/dimensions:/{print $3}')
	ver=$(xdpyinfo | awk -F'[ x]+' '/dimensions:/{print $4}')
	echo "a. Dual monitor ?"
	echo "b. Single Monitor ?"
	read ifdual
	if [ $ifdual = "a" ]
		then
			echo "-----------------------------"
			echo "a. Dual Monitor."
			echo "-----------------------------"
			echo "1. Left Monitor ?"
			echo "2. Right Monitor ?"
			echo "-----------------------------"
			read iflr
			if [ $iflr = '1' ]
			then
				echo "-----------------------------"
				echo "1. Left Monitor."
				echo "-----------------------------"
				horizontal=$[hor/2]
				echo "Horizontal = "$horizontal
				echo "Vertical="$ver
				echo "Your gif Duration in Seconds?"
				read duration
				echo "Your gif's name ?"
				read giffidername
				byzanz-record --duration=$duration --width=$horizontal --height=$ver giffider-$giffidername.gif
				eog giffider-$giffidername.gif &
				echo ""
				nautilus -n $loc
				echo "File Location: "$loc
			fi
			if [ $iflr = '2' ]
			then
				echo "-----------------------------"
				echo "2. Right Monitor."
				echo "-----------------------------"
				echo "Yet to be processed."
				#rhor=$[hor/2]
				#echo "Horizontal = "$rhor	
				#echo "Vertical="$ver
				#echo "Your gif Duration in Seconds?"
				#read duration
				#echo "Your gif's name ?"
				#read giffidername
				#byzanz-record --duration=$duration --width=$hor --height=$ver giffider-$giffidername.gif
				#convert giffider-$giffidername.gif -crop $rhorx768+$rhor+0 giffider-$giffidername.gif
			fi
	fi
			
			
			
			
	if [ $ifdual = "b" ]
	then
			echo "-----------------------------"
			echo "b. Single Monitor"
			echo "-----------------------------"
			echo "Horizontal = "$hor
			echo "Vertical="$ver
			echo "Your gif Duration in Seconds?"
			read duration
			echo "Your gif's name ?"
			read giffidername
			byzanz-record --duration=$duration --width=$hor --height=$ver giffider-$giffidername.gif
			eog giffider-$giffidername.gif &
			echo ""
			nautilus -n $loc
			echo "File Location: "$loc
	fi
fi




if [ $fw = "2" ]
then
	echo "-----------------------------"
	rm .file.txt
	rm .1.txt
	xwininfo >> .file.txt
	sed -n '8,13p' .file.txt | awk 'NF{print $NF}' >> .1.txt
	X=$(sed -n '1p' .1.txt)
	Y=$(sed -n '2p' .1.txt)
	width=$(sed -n '5p' .1.txt)
	height=$(sed -n '6p' .1.txt)
	echo "Your gif Duration in Seconds?"
	read duration
	echo "Your gif's name ?"
	read giffidername
	byzanz-record --duration=$duration --x=$X --y=$Y --width=$width --height=$height giffider-$giffidername.gif
	eog giffider-$giffidername.gif &
	echo ""
	nautilus -n $loc
	echo "File Location: "$loc
fi

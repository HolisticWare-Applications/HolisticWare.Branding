#!/bin/bash

export INKSCAPE=/Applications/Inkscape.app/Contents/Resources/bin/inkscape 

export FILES_SVG="`find . -type f  -name '*.svg'`"
#echo $FILES_SVG

function convert
{
	for FILE_SVG in "${FILES_SVG}"
	do		
		echo "+++" "$FILE_SVG"		
		#mkdir -p "$FILE_PATH_CHANGED"

		#convert_for_android "$FILE_SVG" "$FILE_PATH_CHANGED"

	done		
}

function path_change()
{
	echo $(echo "$1" | sed "s/svgs/pngs/g")
}

function convert_for_android()
{
	echo from $1
	echo   to      $2

	# | Name                | Density (dpi)   | Pixel (pc) | Usage                             |
	# |---------------------|-----------------|------------|-----------------------------------|
	# | ldpi (0.75x)        | 120             | 36 x 36    | Low density screen                |
	# | mdpi (baseline)     | 160             | 48 x 48    | Medium density screen             |
	# | hdpi (1.5x)         | 240             | 72 x 72    | High density screen               |
	# | xhdpi (2x)          | 320             | 96 x 96    | Extra-high density screen         |
	# | xxhdpi (3x)         | 480             | 144 x 144  | Extra-extra-high density screen   |
	# | xxxhdpi (4x)        | 640             | 192 x 192  | launcher icon only*               |
	# | playstore-icon.png  |  /              | 512 x 512  | Google Play store                 |
	# |---------------------|-----------------|------------|-----------------------------------|

		
	#$INKSCAPE \
		--export-png $(pwd)/pngs/holisticware/component/HolisticWare.svg.512x512.png \
		-w 512 -h 512 \
		$(pwd)/svgs/holisticware/HolisticWare.svg 
}	

#export FILES_PNG=$(find . -name *.svg -exec bash -c '(echo "$1" | sed "s/svgs/pngs/g")' - {} \;)
#echo $FILES_PNG

convert

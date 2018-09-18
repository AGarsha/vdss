#!/bin/bash

# convert .html files from VDSS to json
array=( [0]=vdss_center_based_v0.html \
	[1]=vdss_centers_v0.html \
	[2]=vdss_family_home_v0.html \
	[3]=vdss_home_based_v0.html \
	[4]=vdss_preschool_v0.html \
	[5]=vdss_religious_v0.html \
	[6]=vdss_short_term_v0.html \
	[7]=vdss_voluntary_registered_v0.html )

# extract .html
for i in "${array[@]}"; do
	cat $i | ~/go/bin/pup 'tbody td a' > ${i[@]//v0.html/v1.html}
	cat $i | ~/go/bin/pup 'tbody td[width="30%"]:nth-child(2)' > ${i[@]//v0.html/v2.html}
	cat $i | ~/go/bin/pup 'tbody td[width="30%"]:nth-child(3)' > ${i[@]//v0.html/v3.html}
done

# extract .html elements and format as .json
for i in "${array[@]}"; do
	cat $i | ~/go/bin/pup 'tbody td a json{}' > ${i[@]//v0.html/v1.json}
	cat $i | ~/go/bin/pup 'tbody td[width="30%"]:nth-child(2) json{}' > ${i[@]//v0.html/v2.json}
	cat $i | ~/go/bin/pup 'tbody td[width="30%"]:nth-child(3) json{}' > ${i[@]//v0.html/v3.json}
done

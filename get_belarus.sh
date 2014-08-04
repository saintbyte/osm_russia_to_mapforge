#!/bin/bash
# ISO Code 
CODE=BY
echo `date +%c` > ${CODE}
set -x
set -ue
BBOX=""
cont_str=`cat int_names | grep "${CODE};"`
BBOX=`echo ${cont_str} | awk -F ";" '{ print $3 }'`
CENTER=`echo ${cont_str} | awk -F ";" '{ print $4 }'`
ZOOM=`echo ${cont_str} | awk -F ";" '{ print $5 }'`

#wget -P ./osmsrc http://download.geofabrik.de/europe/belarus-latest.osm.bz2
#bunzip2 -c ./osmsrc/belarus-latest.osm.bz2 > ./tmp/${CODE}.osm
#osmosis --rx file=./tmp/${CODE}.osm --mapfile-writer file=./map/BY.map type=hd  bbox=$BBOX map-start-position=${CENTER} map-start-zoom=${ZOOM}
zip -D -9 -r ./zip/${CODE}.zip    ./map/${CODE}.map

echo `date +%c` >> ${CODE}
#!/bin/bash
set -x
set -ue
# ISO Code 
CODE=BY
#echo `date +%c` > ${CODE}
BBOX=""
cont_str=`cat int_names | grep "${CODE};"`
BBOX=`echo ${cont_str} | awk -F ";" '{ print $3 }'`
CENTER=`echo ${cont_str} | awk -F ";" '{ print $4 }'`
ZOOM=`echo ${cont_str} | awk -F ";" '{ print $5 }'`
cont_url=`cat int_src_url | grep "${CODE};"`
URL=`echo ${cont_str} | awk -F ";" '{ print $2 }'`
if [ ! -f "./tmp/${CODE}.osm" ]
then
wget -P ./osmsrc http://download.geofabrik.de/europe/belarus-latest.osm.bz2
bunzip2 -c ./osmsrc/belarus-latest.osm.bz2 > ./tmp/${CODE}.osm
fi
osmosis --rx file=./tmp/${CODE}.osm --mapfile-writer file=./map/BY.map type=hd  bbox=$BBOX map-start-position=${CENTER} map-start-zoom=${ZOOM}
zip -D -9 -r ./zip/${CODE}.zip    ./map/${CODE}.map

echo `date +%c` >> ${CODE}
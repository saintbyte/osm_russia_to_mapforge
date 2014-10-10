#!/bin/bash 
set +ue
set -x
#http://download.geofabrik.de/europe.html
if [ ! -f "./osmsrc/finland-latest.osm.bz2" ]
then 
    wget -P ./osmsrc http://download.geofabrik.de/europe/finland-latest.osm.bz2
fi
if [ ! -f "./tmp/FI.osm" ]
then 
 bunzip2 -c ./osmsrc/finland-latest.osm.bz2 > ./tmp/FI.osm 
fi 
osmosis --rx file=./tmp/FI.osm --mapfile-writer file=./map/FI.map type=hd  bbox=59.28783,19.02427,70.09959,31.60089
#unzip2 -c ./osmsrc/finland-latest.osm.bz2 > ./tmp/FI.osm 
zip -D -9 -r ./zip/FI.zip    ./map/FI.map

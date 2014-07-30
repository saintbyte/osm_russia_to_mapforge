#!/bin/bash 
set +ue
set -x
#http://download.geofabrik.de/europe.html
#wget -P ./osmsrc http://download.geofabrik.de/europe/great-britain-latest.osm.bz2


bunzip2 -c ./osmsrc/great-britain-latest.osm.bz2  > ./tmp/GB.osm 
#osmosis --rx file=./tmp/GB.osm --mapfile-writer file=./map/GB.map type=hd  bbox=59.28783,19.02427,70.09959,31.60089
#unzip2 -c ./osmsrc/finland-latest.osm.bz2 > ./tmp/FI.osm 
#zip -D -9 -r ./zip/FI.zip    ./map/FI.map

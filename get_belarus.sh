#!/bin/bash
# ISO Code 
CODE=BY
set -x
set -ue
BBOX=""
wget -P ./osmsrc http://download.geofabrik.de/europe/belarus-latest.osm.bz2
bunzip2 -c ./osmsrc/belarus-latest.osm.bz2 > ./tmp/${CODE}.osm
osmosis --rx file=./tmp/${CODE}.osm --mapfile-writer file=./map/BY.map type=hd  bbox=$BBOX
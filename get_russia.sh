#!/bin/bash
set -x
set -ue
#Russia Asia
wget -P ./osmsrc http://download.geofabrik.de/asia/russia-asian-part-latest.osm.bz2
#Russia Europe
wget -P ./osmsrc http://download.geofabrik.de/europe/russia-european-part-latest.osm.bz2

bunzip2 -c ./osmsrc/russia-asian-part-latest.osm.bz2 > ./tmp/russia-asian-part-latest.osm
bunzip2 -c ./osmsrc/russia-european-part-latest.osm.bz2 > ./tmp/russia-european-part-latest.osm
#osmosis --rx 1.osm --rx 2.osm --rx 3.osm --merge --merge --wx merged.osm
osmosis --rx ./tmp/russia-european-part-latest.osm --rx ./tmp/russia-asian-part-latest.osm --merge  --wx russia_all.osm
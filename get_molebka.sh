#!/bin/bash
set +ue
set -x
NAME="molebka.osm"
BBOX="57.2044,56.9847,58.2701,57.4413"
#wget -O "./topo_src1/${NAME}" http://overpass-api.de/api/map?bbox=$BBOX
for fl in `ls ./topo_src2/${NAME}/*.osm`
do
echo $fl
./delete_osm_start_tag.sh "${fl}"
done
cat "./topo_src1/${NAME}" | grep -v "</osm>" > "./tmp/${NAME}"
for fl in `ls ./topo_src2/${NAME}/*.osm1`
do 
cat $fl >> "./tmp/${NAME}"
done
echo "</osm>" >>  "./tmp/${NAME}" 
#osmosis --rx file="./tmp/molebka1.osm" --mapfile-writer file=./map/${NAME}.map type=hd  bbox=$BBOX
osmosis --rx file="./tmp/${NAME}" --mapfile-writer file=./map/${NAME}.map   bbox=$BBOX
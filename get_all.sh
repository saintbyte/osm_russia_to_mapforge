#!/bin/bash
set +ue
set -x
#src OSM DUMPs  http://gis-lab.info/projects/osm_dump/

#Создаем директории на случай если их грохнули до этого 
function makedefault
{
  mkdir ./osmsrc/
  mkdir ./map/
  mkdir ./tmp/
}
# Очистка директорий для того чтоб скачать свежие
function clearup
{
  echo "clearup"
  rm -rf ./map/*.*
  rm -rf ./tmp/*.*
}
function make_map
{
 oblname=$1
 BBOX=$2
 osmosis --rx file=./tmp/${oblname}.osm --mapfile-writer file=./map/${oblname}.map type=hd  bbox=$BBOX
}

makedefault
clearup
for oblname in `cat to_names | awk -F ";" '{ print $1}'` 
do
if [ -f "./osmsrc/${oblname}.osm.bz2" ]
then
 BBOX=`cat to_names| grep ${oblname} | awk -F ";" '{ print $3 }'`
 echo $BBOX
 if [ ! -f ./tmp/${oblname}.osm ] 
 then
    bunzip2 -c ./osmsrc/${oblname}.osm.bz2 > ./tmp/${oblname}.osm
 fi 
 make_map ${oblname} $BBOX
 rm -rf ./tmp/${oblname}.osm
fi
done
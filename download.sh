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
  rm -rf ./osmsrc/*.*
  rm -rf ./map/*.*
  rm -rf ./tmp/*.*
}
makedefault
clearup
for oblname in `cat to_names | awk -F ";" '{ print $1}'` 
do 
if [ ! -f "./osmsrc/${oblname}.osm.bz2" ] 
then
    url_to_download="http://be.gis-lab.info/data/osm_dump/dump/latest/${oblname}.osm.bz2"
    echo $url_to_download
    wget -P ./osmsrc $url_to_download
fi
done

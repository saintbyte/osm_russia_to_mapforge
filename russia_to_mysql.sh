#!/bin/bash
set -x
set +ue
echo "TRUNCATE TABLE maps_files;" > to_names.sql
cat to_names | while read line; do
    #echo "INSERT INTO test (IP,MAC,SERVER) VALUES ('$ip', '$mac', '$server');"
    #echo $line
    file=`echo $line | awk -F ";" '{ print $1}'`
    title=`echo $line | awk -F ";" '{ print $2}'`
    bbox=`echo $line | awk -F ";" '{ print $3}'`
    minlat=`echo $bbox | awk -F "," '{ print $1}'`
    minlon=`echo $bbox | awk -F "," '{ print $2}'`
    maxlat=`echo $bbox | awk -F "," '{ print $3}'`
    maxlon=`echo $bbox | awk -F "," '{ print $4}'`
    #echo $file
    #echo $title
    #echo $bbox
    #echo $minlat
    #echo $minlon
    #echo $maxlat
    #echo $maxlon
    echo "INSERT INTO maps_files(mapid ,countryid ,location ,title ,file ,minlat ,minlon,maxlat,maxlon) VALUES (NULL ,  '1',  '${file}',  '${title}',  '${file}',  '${minlat}',  '${minlon}',  '${maxlat}',  '${maxlon}');" >> to_names.sql
    #echo "
done 
mysql -utwmap -p123123 twmap <  to_names.sql
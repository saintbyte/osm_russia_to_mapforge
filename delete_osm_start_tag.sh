#!/bin/bash
#set -x
#set +ue
#version="1"/>
#timestamp="2010-01-11T11:11:11Z" changeset="1" uid="1" user="1" version="1"/>
string_to_replace='version="1"'
dest_file="$1.osm1"
replace_text='timestamp="2010-01-11T11:11:11Z" changeset="1" uid="1" user="1" version="1" '
cat $1 | grep -v "<?xml version=" | grep -v "<osm version=" | grep -v "<bounds minlat=" | grep -v "</osm>" > ${dest_file}.tmp

rm -f $dest_file
#echo -n "" > $dest_file
while read line
do 
result_string="${line/$string_to_replace/$replace_text}"
echo $result_string  >> $dest_file
done < ${dest_file}.tmp
#rm -f ${dest_file}.tmp

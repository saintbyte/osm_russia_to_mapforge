#!/bin/bash
set +ue
set +x

echo "["
while read line           
do
 #echo "line:${line}"
 map_name=`echo $line | awk -F";" '{ print $1}'`
 obl_name=`echo $line | awk -F";" '{ print $2}'`
 en_obl_name=`echo "${obl_name}" | sed "s/'/\\\\\'/g"`
 location=`echo $line | awk -F";" '{ print $3}'`
 #echo "map_name:${map_name}"
 if [  -f ./map/${map_name}.map ] 
 then
    #echo "${oblname} BAD"
    echo -n "{ \"map_name\":\"${map_name}\",\"name\":\"${en_obl_name}\",\"location_borders\":\"${location}\" }"
    echo ","
  fi
done < to_names
echo "{}"
echo "]"
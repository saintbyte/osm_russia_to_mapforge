#!/bin/bash
set +ue
set +x
mkdir zip
#zip -9 -r ./zip/${f}.zip ./map/$f
touch ./before_zip
for oblname in `cat to_names | awk -F ";" '{ print $1}'`.
do
  touch ./before_zip
  
  SIZE=`stat -c"%s" ./map/${oblname}.map`
  echo ${oblname}:$SIZE >> ./before_zip
  zip -D -9 -r ./zip/${oblname}.zip    ./map/${oblname}.map
  
done

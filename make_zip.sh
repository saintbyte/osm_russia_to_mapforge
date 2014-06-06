#!/bin/bash
set +ue
set +x
mkdir zip
#zip -9 -r ./zip/${f}.zip ./map/$f
for oblname in `cat to_names | awk -F ";" '{ print $1}'`.
do
  zip -D -9 -r ./zip/${oblname}.zip    ./map/${oblname}.map
done

#!/bin/bash
set +ue
set +x
mkdir zip
for f in `ls ./map`; 
do
echo $f
f1="${fullfile##*/}"
zip -9 -r ./zip/${f}.zip ./map/$f
done


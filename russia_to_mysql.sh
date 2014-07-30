#!/bin/bash
set -x
set +ue
cat to_names | while read ip mac server; do
    echo "INSERT INTO test (IP,MAC,SERVER) VALUES ('$ip', '$mac', '$server');"
done |
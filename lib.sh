#!/bin/bash
function make_map
{
 oblname=$1
 BBOX=$2
 osmosis --rx file=./tmp/${oblname}.osm --mapfile-writer file=./map/${oblname}.map
}


convert_to_mapsforge()
{

}
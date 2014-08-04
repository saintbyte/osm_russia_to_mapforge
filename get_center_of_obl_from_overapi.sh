#!/bin/bash
urlencode() {
    # urlencode <string>
 
    local length="${#1}"
    for (( i = 0; i < length; i++ )); do
        local c="${1:i:1}"
        case $c in
            [a-zA-Z0-9.~_-]) printf "$c" ;;
            *) printf '%%%02X' "'$c"
        esac
    done
}
 
urldecode() {
    # urldecode <string>
     local url_encoded="${1//+/ }"
    printf '%b' "${url_encoded//%/\x}"
}
"""
<osm-script output="json" timeout="25"><id-query {{nominatimArea:Россия}} into="area"/><query type="node"><has-kv k="capital" v="yes"/><has-kv k="place" v="city"/><area-query from="area"/></query><print mode="body"/><recurse type="down"/><print mode="skeleton" order="quadtile"/></osm-script>
"""
#while read line
#do
#http://overpass-api.de/api/interpreter?data=%3Cosm-script%20output%3D%22json%22%20timeout%3D%2225%22%3E%0A%20%20%3Cid-query%20type%3D%22area%22%20ref%3D%223600060189%22%20into%3D%22area%22%2F%3E%0A%20%20%20%20%3Cquery%20type%3D%22node%22%3E%0A%20%20%20%20%20%20%3Chas-kv%20k%3D%22admin_level%22%20v%3D%224%22%2F%3E%0A%20%20%20%20%20%20%3Chas-kv%20k%3D%22place%22%20v%3D%22city%22%2F%3E%20%20%0A%20%20%20%20%20%20%3Carea-query%20from%3D%22area%22%2F%3E%0A%20%20%20%20%3C%2Fquery%3E%0A%20%20%3Cprint%20mode%3D%22body%22%2F%3E%0A%20%20%3Cprint%20mode%3D%22skeleton%22%20order%3D%22quadtile%22%2F%3E%0A%3C%2Fosm-script%3E
#wget http://overpass-api.de/api/interpreter?data=%3Cosm-script%20output%3D%22json%22%20timeout%3D%2225%22%3E%0A%3Cid-query%20type%3D%22area%22%20ref%3D%223600060189%22%20into%3D%22area%22%2F%3E%0A%3Cquery%20type%3D%22node%22%3E%0A%3Chas-kv%20k%3D%22capital%22%20v%3D%22yes%22%2F%3E%0A%3Chas-kv%20k%3D%22place%22%20v%3D%22city%22%2F%3E%0A%3Carea-query%20from%3D%22area%22%2F%3E%0A%3C%2Fquery%3E%0A%3Cprint%20mode%3D%22body%22%2F%3E%0A%3Crecurse%20type%3D%22down%22%2F%3E%0A%3Cprint%20mode%3D%22skeleton%22%20order%3D%22quadtile%22%2F%3E%0A%3C%2Fosm-script%3E
query='<osm-script output="json" timeout="25"><id-query {{nominatimArea:Россия}} into="area"/><query type="node"><has-kv k="capital" v="yes"/><has-kv k="place" v="city"/><area-query from="area"/></query><print mode="body"/><recurse type="down"/><print mode="skeleton" order="quadtile"/></osm-script>'
query=urlencode ${query}
query=`echo ${query} | tr -s "=" "%3D"`
wget "http://overpass-api.de/api/interpreter?data=${query}"
#done < to_names
#!/usr/bin/env python2.7
# -*- coding: utf-8 -*-
import sys 
import urllib
reload(sys) 
sys.setdefaultencoding('utf-8')
cnt=0
#QUERY='<osm-script output="json" timeout="25"><id-query {{nominatimArea:Россия}} into="area"/><query type="node"><has-kv k="capital" v="yes"/><has-kv k="place" v="city"/><area-query from="area"/></query><print mode="body"/><recurse type="down"/><print mode="skeleton" order="quadtile"/></osm-script>'
try:
    loc=sys.argv[1]
finally:
    loc="Россия"
QUERY='<osm-script output="json" timeout="25"><id-query {{nominatimArea:'+loc+'}} into="area"/><query type="node"><has-kv k="capital" v="yes"/><has-kv k="place" v="city"/><area-query from="area"/></query><print mode="body"/><recurse type="down"/><print mode="skeleton" order="quadtile"/></osm-script>'
QUERY=urllib.quote_plus(QUERY)
url="http://overpass-api.de/api/interpreter?data="+QUERY
print url
for a in sys.argv:
    print str(cnt)+" "+a
    cnt +=1
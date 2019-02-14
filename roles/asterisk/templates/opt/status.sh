#!/bin/bash

BASE_DIR={{ asterisk_optdir }}

/usr/sbin/rasterisk -x "sip show registry" | awk 'BEGIN{print "{\n  \"trunks\": {"; separator="    ";ORS=""} NR>1 && NF>4 {gsub(/:.+/, "", $1); print ""separator"\""$3"\": \""$5"\""; separator=",\n    "} END{print "\n  }\n}\n";}' > $BASE_DIR/status.json

curl -X POST -H "Content-Type: application/json" -d @$BASE_DIR/status.json "`cat $BASE_DIR/status.url`"

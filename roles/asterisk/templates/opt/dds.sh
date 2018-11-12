#!/bin/bash

BASE_DIR=/opt/asterisk

rasterisk -x "sip show peers" | awk -F"/" '{print $1}' | egrep '^[[:digit:]]{7,}' | grep -v nodds > $BASE_DIR/dds.txt

function asterisk_call()
{
	echo "Call $1 => $2"
	rasterisk -x "channel originate SIP/$2@$1 extension wait@callback"
} 

while read line
do
	if [ -z "$FIRST_MSISDN" ]
	then
		FIRST_MSISDN=$line
		continue
	elif [ -z "$SECOND_MSISDN" ]
	then
		SECOND_MSISDN=$line
	fi
	
	asterisk_call $line $FIRST_MSISDN	
done < $BASE_DIR/dds.txt

asterisk_call $FIRST_MSISDN $SECOND_MSISDN

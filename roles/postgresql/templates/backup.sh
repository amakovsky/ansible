#!/bin/bash

# Backup  PostgreSQL

DIR="{{ postgresql_backup_dir }}"
TIMENAME=`date +%Y-%m-%d.%H.%M`
PG_DUMP="/usr/bin/pg_dump"
SUDO="/usr/bin/sudo"
GZIP="/bin/gzip"
ExcludeTable="-T cdr"
id=310330615
state=0

check_error() {
if [[ $? -ne 0 ]]; then
state=1
fi
}

telegram(){
#echo $1
curl --header 'Content-Type: application/json' --request 'POST' --data "{\"chat_id\":\"$id\",\"text\":\"$1\"}" "https://api.telegram.org/bot629640079:AAFS1CtMST9wDJ9XUkk0y3thN3aA1_p8B3o/sendMessage"
}
while read p; do
	DBNAME=${p}
 	DIR="/root/backup/$DBNAME"
	if [[ ! -d "$DIR" ]]
          then
          mkdir ${DIR}
        fi
	BACKUP=${DIR}/psql-${DBNAME}-backup-${TIMENAME}-db.sql.gz

#	echo "$SUDO -u postgres $PG_DUMP $DBNAME $ExcludeTable | $GZIP > $BACKUP";

	${SUDO} -i -u postgres ${PG_DUMP} ${DBNAME} ${ExcludeTable} 2>>/tmp/error.log | ${GZIP} > ${BACKUP} 2>>/tmp/error.log ; test ${PIPESTATUS[0]} -eq 0
    check_error
#	echo `/usr/bin/du -hsx ${BACKUP}`;
    if test -e /usr/bin/s3cmd; then
	    /usr/bin/s3cmd put ${BACKUP} s3://gettwifi-b/postgres/${p}/ 1>/dev/null 2>>/tmp/error.log
	    check_error
	fi
	find "${DIR}" -name "*.gz" -mtime +7 -exec rm -f {} \; 1>/dev/null 2>>/tmp/error.log
	check_error
done < /root/backup/backup_list.txt

if [[ ${state} -ne 0 ]]; then
   err=$(cat /tmp/error.log | sed 's/\"/ /g')
   telegram "$err"
   cp /tmp/error.log {{ postgresql_backup_dir }}/logs/error.log-$(date "+%Y-%m-%d_%H-%M-%S")
fi
rm /tmp/error.log

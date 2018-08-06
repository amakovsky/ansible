#!/bin/bash
state=0
hour=$(date +"%H")
patch="{{ root_dir }}/{{ xtra_dir }}"
backup="{{ root_dir }}/{{ backup_dir }}"
name="vps3_xtra"
pass=$(cat /root/.mysql)
last=$(ls -td ${patch}/* | head -1)
########################################
incremental(){
       mkdir ${patch}/${hour}

       innobackupex --defaults-file=/etc/mysql/my.cnf --password=${pass} --no-timestamp  --throttle=40  --rsync --incremental ${patch}/${1} --incremental-basedir=${2} 2>&1 > /root/out.txt

       if [[ $? -ne 0 ]]; then
          state=1
       fi

#       innobackupex --defaults-file=/etc/my.cnf --password=$pass --no-timestamp  --throttle=40 --apply-log $2 --incremental-dir=$patch/$1 2>&1 >> /root/out.txt

#       if [[ $? -ne 0 ]]; then
#          state=1
#       fi
       touch ${patch}/${hour}
}
############################################

full(){
       rm -rf ${patch}/*
       mkdir -p ${patch}/full
       innobackupex --defaults-file=/etc/mysql/my.cnf --password=${pass} --no-timestamp  --rsync ${patch}/full 2>&1
#       touch $patch/$hour

#       innobackupex --defaults-file=/etc/my.cnf --apply-log --redo-only --password=$pass --no-timestamp  --throttle=40 $patch/full 2>&1

}
############################################

if [[ $((10#$hour)) -lt "{{ cron_hour }}" ]] || [[ ! -d ${patch}/full ]]
   then
       tar -czvf ${backup}/${name}+`date "+%Y-%m-%d_%H"`.gz -C ${patch} . 1>/dev/null
       full

#elif [[ $hour -eq 1 ]]
#   then
#        incremental $hour $last

elif [[ ! -d ${patch}/${hour} ]]; then
         incremental ${hour} ${last}

fi
if [[ ${state} -ne 0 ]]; then
echo "error" >> /root/error.txt
fi

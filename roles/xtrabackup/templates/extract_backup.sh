#!/bin/bash
patch="/tmp/backup"
date=$(date "+%Y-%m-%d_%H-%M-%S")
if [[ -d "$patch" ]]
  then
    echo "Папка $patch существует и будет очищена"
    rm -rf $patch/*
else
    mkdir $patch
fi

if [[ -z $1 ]]
  then
    echo "No argument supplied"
    exit
fi

arch=$(realpath $1)
if [[ ! -f $arch ]]
  then
    echo "not found backup in folder"
    exit
fi
cd $patch && tar -xzvf $arch
last=$(ls -tdr $patch/* | tail -1)
list=$(ls -tdr $patch/*)
# не работает из за слешей в адресе
#list=$(sed 's/'"$patch"'//g' <<< $list)
#unset list[0]
x=0
for i in $list
do
if [[ $i == "$patch/full" ]]; then
echo "first"
innobackupex --apply-log --redo-only "$patch/full" > /dev/null
elif [[ $i == $last ]]; then
echo "second"
innobackupex --apply-log "$patch/full" --incremental-dir=$i > /dev/null
else
echo "other"
innobackupex --apply-log --redo-only "$patch/full" --incremental-dir=$i > /dev/null
fi
#x=$(($x+1))
#echo $x

done

innobackupex --apply-log "$patch/full"

/usr/sbin/service mysqld stop
mkdir "/var/lib/mysql_$date"
/bin/mv /var/lib/mysql/* "/var/lib/mysql_$date"

innobackupex --copy-back "$patch/full"

chown -R mysql:mysql /var/lib/mysql

/usr/sbin/service mysqld start

rm -rf $patch

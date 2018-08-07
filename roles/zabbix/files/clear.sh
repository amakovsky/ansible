#!/bin/bash
/usr/lib/zabbix/externalscripts/autoreg-enable-tls-psk_comm.py $1
sed -i 's/^TLSConnect=unencrypted/TLSConnect=psk/' /etc/zabbix/zabbix_agentd.conf
sed -i 's/^TLSAccept=unencrypted,psk/TLSAccept=psk/' /etc/zabbix/zabbix_agentd.conf
rm /usr/lib/zabbix/externalscripts/autoreg-enable-tls-psk_comm.py
rm /etc/zabbix/zabbix_agentd.d/userparameter.conf
service zabbix-agent restart
rm /usr/lib/zabbix/externalscripts/clear.sh
exit 0

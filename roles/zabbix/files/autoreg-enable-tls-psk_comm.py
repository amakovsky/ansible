#!/usr/bin/env python
import sys
from zabbix.api import ZabbixAPI
#import time
#time.sleep(5)
PSK="" 
zapi = ZabbixAPI(url='https://zabbix.likvi.com/', user='Admin', password='PuqN215S')
res1 = zapi.do_request('host.get', { 'filter': {'name': sys.argv[1]}, 'output': 'hostid'})
res2 = str(res1.get(u'result')).split('\'')
zabbix_hostid = res2[3]
zapi.do_request('host.update', {'hostid': zabbix_hostid, 'tls_connect': 2, 'tls_accept': 2, 'tls_psk_identity': "PSK BOSS", 'tls_psk': PSK, 'templates': 10001 })

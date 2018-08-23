<?php
// Zabbix GUI configuration file.
global $DB;

$DB['TYPE']     = 'MYSQL';
$DB['SERVER']   = '{{ zabbix_db_host }}';
$DB['PORT']     = '0';
$DB['DATABASE'] = '{{ zabbix_db_name }}';
$DB['USER']     = '{{ zabbix_db_user }}';
$DB['PASSWORD'] = '{{ zabbix_db_pass }}';

// Schema name. Used for IBM DB2 and PostgreSQL.
$DB['SCHEMA'] = '';

$ZBX_SERVER      = 'localhost';
$ZBX_SERVER_PORT = '10051';
$ZBX_SERVER_NAME = '{{ zabbix_host_name }}';

$IMAGE_FORMAT_DEFAULT = IMAGE_FORMAT_PNG;

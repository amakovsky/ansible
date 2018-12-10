[![Build Status](https://gitlab.gettwifi.com/DevOps/ansible/badges/master/pipeline.svg)](https://gitlab.gettwifi.com/DevOps/ansible/commits/master)

Все сервера описанны в inventories/prod/group_vars/сервер/{vars.yml | vault.yml}

    vars.yml - переменные в открытом виде
    
    vault.yml - зашифрованные файлы
    
Инвентаризационный файл inventory/prod/hosts

openvpn
=======

VPN сервер для доступа к внутренней сети

настройка
---------

    ansible-playbook -i inventories/prod/hosts openvpn.yml --ask-vault-pass
    
Роли
----
    common
    ufw
    openvpn
    zabbix

dns
====

DNS сервер для обслуживания внутренних доменов (gw.lan)

настройка
---------

    ansible-playbook -i inventories/prod/hosts dns.yml --ask-vault-pass
    
Роли
----

    common    
    ufw
    ssh
    dns
    zabbix
    
zabbix
======

Устанавливает и настраивает Zabbix сервер

настройка
---------

    ansible-playbook -i inventories/prod/hosts zabbix-server.yml --ask-vault-pass
    
Роли
----

    common
    user
    mariadb
    ufw
    zabbix-server
    xtrabackup
    
gitlab
======

Gitlab сервер работающий в docker контейнере. ssh порт контейнера 22 хостовой машины 2222

настройка
---------

    ansible-playbook -i inventories/prod/hosts gitlab.yml --ask-vault-pass
    
роли
----

    common
    docker
    ufw
    gitlab
    zabbix
    
gitlab-runner
=============

Воркер для gitlab-ci, запущен в докер контейнере

настройка
---------

    ansible-playbook -i inventories/prod/hosts gitlab-runner.yml --ask-vault-pass
    
роли
----

    common
    docker
    ufw
    gitlab-runner
    zabbix
    
postgresql
==========

master-slave кластер postgresql 

настройка
---------

    ansible-playbook -i inventories/prod/hosts postgres.yml --ask-vault-pass
    
    при первом запуске создает пустые базы и скачивает бекап с мастера на слейв
  
роли
----

    common
    ufw
    postgresql
    monit
    s3cmd
    zabbix
    
redis
=====

redis кластер

настройка
---------

    ansible-playbook -i inventories/prod/hosts redis.yml --ask-vault-pass
    
роли
----

    common
    ufw
    redis
    zabbix
    
cassandra
=========

cassandra cluster

настройка
---------

    ansible-playbook -i inventories/prod/hosts cassandra.yml --ask-vault-pass

роли
----

    common
    ufw
    cassandra
    zabbix
    
asterisk
========

asterisk сервер

настройка
---------

    ansible-playbook -i inventories/prod/hosts asterisk.yml --ask-vault-pass
    
роли
----

    common
    ufw
    asterisk
    zabbix
    
radius
======

Freeradius сервер

настройка
---------

    ansible-playbook -i inventories/prod/hosts radius.yml --ask-vault-pass

роли
----

    common
    ufw
    radius
    monit
    zabbix
    
softether
======

vpn для точек

настройка
---------

    ansible-playbook -i inventories/prod/hosts softether.yml --ask-vault-pass

роли
----

    common
    ufw
    softether
    user
    monit
    haproxy
    sniffr
    zabbix
    
node
======

nodejs сервер

настройка
---------

    ansible-playbook -i inventories/prod/hosts node.yml --ask-vault-pass

роли
----

    common
    ufw
    user
    nginx
    nodejs
    letsencrypt
    zabbix
    web_nodejs
    
web
======

web сервер

настройка
---------

    ansible-playbook -i inventories/prod/hosts web.yml --ask-vault-pass

роли
----

    common
    ufw
    user
    rvm
    nodejs
    passenger
    monit
    web_ruby
    zabbix
    
web-data
======

web-data сервер

настройка
---------

    ansible-playbook -i inventories/prod/hosts web_data.yml --ask-vault-pass

роли
----

    common
    ufw
    user
    rvm
    nodejs
    monit
    web_ruby
    zabbix
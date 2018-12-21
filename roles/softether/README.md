softeher
=========

Настраивает softether vpn server

Requirements
------------

none

Role Variables
--------------

    softether_bindir
    
Директрория установки

    softether_source_url
    
Источник артифактов

    softether_template:
      - src: 'vpnserver.service'
        dest: '/lib/systemd/system/vpnserver.service'
    
Пример заданя конфигурационных файлов
      

Dependencies
------------

none

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
       - roles:
          - softether

License
-------

BSD

Author Information
------------------

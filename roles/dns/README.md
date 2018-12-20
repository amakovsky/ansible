dns
=========

Устанавливает и настраивает DNS сервер

Requirements
------------

none

Role Variables
--------------

    domain
    
Имя домена

     rev_domain
    
Обратная зона

    ansible_fqdn
    
FQDN присваевоемое серверу

    records:
      local:
        ns1:
          forward: 10.135.96.185
          type: A
          last: 185.96
          rev: 135.10.in-addr.arpa
    
Структура dictionary для создания записей в DNS

    zones:
      local:
        name: gw.local
      gettwifi:
        name: gitlab.gettwifi.com
    
Зоны создаваемые на сервере

    dns_list_public
    
Указывает будет ли сервер доступен на публичном адресе
  

Dependencies
------------

None.

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
       - roles:
          - dns

License
-------

BSD

Author Information
------------------



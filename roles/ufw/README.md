ufw
=========

Настраивает firewall на сервере

Requirements
------------

none

Role Variables
--------------

    ufw_reset
    
Задает необходимость сброса существующих правил

    ufw_rules:
      - rule: 'allow'
        port: 22
        proto: 'tcp'
        from_ip:
          - 0.0.0.0/0
    
Пример задания правил
   

Dependencies
------------

None.

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
       - roles:
          - ufw

License
-------

BSD

Author Information
------------------

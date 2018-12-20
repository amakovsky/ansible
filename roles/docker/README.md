docker
=========

Устанавливает и настраивает docker на сервере

Requirements
------------

none

Role Variables
--------------

    docker_key
    
ключ подписи репозитория

     docker_repository
    
докер репозиторий

    docker_package
    
требуемые пакеты устанавливаемые через apt

    docker_pip_package
    
требуемые пакеты устанавливаемые через pip

Dependencies
------------

None.

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
       - roles:
          - docker

License
-------

BSD

Author Information
------------------

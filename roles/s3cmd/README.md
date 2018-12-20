s3cmd
=========

Устанавиливает S3 совместимый клиент на сервер

Requirements
------------

none

Role Variables
--------------

    access_key: " "
    secret_key: " "
    host_base: "ams3.digitaloceanspaces.com"
    host_bucket: "%(bucket)s.{{ host_base }}"
    
Настроики доступа к S3 хранилищу
   

Dependencies
------------

None.

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
       - roles:
          - s3cmd

License
-------

BSD

Author Information
------------------

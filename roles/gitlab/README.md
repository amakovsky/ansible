gitlab
=========

Устанавливает и настраивает gitlab на сервере в docker контейнере

Requirements
------------

docker

Role Variables
--------------

    gitlab_name
    
имя по которому будет доступен сервере

    gitlab_registry_port
    
порт на котором доступен докер регистр

    spaces_access_key
    
ключ от S3 хранилища

    spaces_secret_key
    
пароль от S3 хранилища

    spaces_endpoint
    


    space_name


    
    gitlab_cert_source
    
Имя дериктории содержащей ssl ключи (должна распологаться в папке files
в корне проекта)

Dependencies
------------

None.

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
       - roles:
          - gitlab

License
-------

BSD

Author Information
------------------

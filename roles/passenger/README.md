passenger
=========

Настраивает nginx для работы с ruby

Requirements
------------

Для успешной компиляции на сервере должно быть минимум 2Gb оперативной памяти

Role Variables
--------------

    passenger_nginx_dir

Директория расположения конфигурационных файлов

    nginx_bindir
    
Директория расположения бинарного файла

    passenger_template
    
Список преднастроенных конфигурациооных файлов

       nginx_global_config_options 

Глобальные конфигурационные настройки nginx

    nginx_dir
    
Директории необходимые для работы nginx

    nginx_user
    
Пользователь из под которого запускается nginx

Dependencies
------------

На сервере должны быть установленны rvm и gem

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
         - { role: username.rolename, x: 42 }

License
-------

BSD

Author Information
------------------

An optional section for the role authors to include contact information, or a website (HTML is not allowed).

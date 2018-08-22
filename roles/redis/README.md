Redis
=========

Устанавливает и настраивает redis cluster с поддержкой sentinel

Requirements
------------

ubuntu 16.04

Role Variables
--------------

    redis_bindir

Директория расположения бинарного файла

    redis_srcdir
    
Директория компиляции приложения

    redis_user
    
Польлователь из под которого работает redis

    redis_datadir
    
Директория расположения данных

    redis_config_folder
    
Директория с конфигами


    redis_log_folders
    
Директория с логами

    redis_source_url
    
Адрес исходников

    redis_configs
    
Имена конфигурационных файлов

    redis_global_config_options
    
Глобальные конфигурационные параметры редиса

    redis_slave_config_options
    
Конфигурационные параметры для слейвов

    sentinel_global_config_options
    
Глобальные конфигурационные параметры sentinel

    recreate_cluster
    
Флаг определяющий необходимость пересоздать кластер (удаляет все данные)

Dependencies
------------

none

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

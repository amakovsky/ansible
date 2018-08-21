Cassandra
=========

Устанавливает и настраивает cassandra cluster

Requirements
------------

none

Role Variables
--------------

    cassandra_bindir
    
Дирректория расположения бинарного файла

    cassandra_repository
    
Репозиторий

    cassandra_key
    
Ключи для добавления репозитория

    cassandra_config_path
    
Путь расположения конфигурационного файла

    cassandra_cluster_name
    
Имя кластера

    cassandra_recriate_cluster
    
Флаг указывающий на необходимость пересоздать кластер (все данные удаляются)

    cassandra_global_config_options
    
Конфигурационные опции необходимые для работы кластера

Dependencies
------------

Зависит от роли java. Включена в плейбук, должна присутствовать в проекте

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
       - roles:
          - cassandra

License
-------

BSD

Author Information
------------------

An optional section for the role authors to include contact information, or a website (HTML is not allowed).

Asterisk
=========

Устанавливает asterisk из исходников на сервер

Requirements
------------

Все необходимые компоненты включены в роль

Role Variables
--------------

    asterisk_srcdir
    
Директория для скачивания исходников

    asterisk_username
    
Имя пользователя для процесса Asterisk (создается системный пользователь без домашней папки)

    asterisk_bindir
    
Дирректория расположения бинарного файла asterisk

    asterisk_template
    
Список кастомных конфигов для asterisk сервера

    asterisk_optdir
    
Дирректория раположения кастомных конфигов

    del_config
    
Список конфигов подлежащих удалению

    asterisk_global_config_options
    
Глобальные настройки кофнига (используется если не указан кастомный конфиг)

    asterisk_exec
    
Кастомные скрипты, добавляемые в крон

Dependencies
------------

None.

Example Playbook
----------------

    - hosts: servers
      roles:
         - asterisk

License
-------

BSD

Author Information
------------------

An optional section for the role authors to include contact information, or a website (HTML is not allowed).

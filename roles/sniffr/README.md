sniffr
=========

Настраивает сниффер mac адресов на сервер

Requirements
------------

monit (требуется для запуска приложения)

Role Variables
--------------

    sniffr_dir
    
Директрория установки

    sniffr_port
    
UDP порт прослушиваемый приложением

    sniffr_source
    
Источник артифактов

    sniffr_template:
      - src: 'sniffr.sh.j2'
        dest: '{{ sniffr_dir }}/sniffr.sh'
        mode: '0770'
      - src: 'sniffr'
        dest: '/etc/logrotate.d/sniffr'
        mode: '0644'
    
Пример заданя конфигурационных файлов
   
    gitlab_private_token
    
Токен для доступа к API gitlab сервера

Dependencies
------------

monit

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
       - roles:
          - sniffr

License
-------

BSD

Author Information
------------------

wev_ruby
=========

Настраивает web сервер

Requirements
------------

rvm
passenger

Role Variables
--------------

    gitlab
    
Адрес gitlab сервера

    git_repo
    
Репозиторий с проектом

    git_branch
    
Ветка проекта

    ruby_project_folder
    
Путь установки проекта

    ruby_config_folders
    
Дирректория с конфигами

    ruby_configs:
      - dir: ""
        template:
          - src: 'hotspot/database.yml'
            dest: 'database.yml'

Формат словаря для загрузки конфигов на сервер
    
    web_user
    
Пользователь от имени которого запущен проект

    web_cron:
      - name: "Scheduler ticks"
        minute: "{{ ansible_play_hosts.index(inventory_hostname) }}-59/{{ ansible_play_hosts | length }}"
        job: "cd {{ ruby_project_folder }}/current && bundle exec bin/sidekiq_pusher scheduler > /dev/null"
      
Пример создания cron задач на сервере

    web_cron_vars:
      - name: RAILS_ENV
        value: production
        
Пример словаря, для конфигурирования cron


Dependencies
------------

    rvm
    passenger

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
       - roles:
          - web_ruby

License
-------

BSD

Author Information
------------------

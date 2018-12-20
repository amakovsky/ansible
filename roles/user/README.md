user
=========

Задает пароль для рута и создает необходимых пользователей

Requirements
------------

none

Role Variables
--------------

    password
    
Пароль root пользователя

    local_user:
      - name: "{{ web_user }}"
        group: web
        password: 1128256asdf
        password_lock: yes
        home: /opt/www
        shell: /bin/bash
        allow_key:
          - 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC9ekjWWGmeAACPWwfyq2p7DiIwBSQ8TxfKWt/Jlv2BjOH4KxrMkcxvAqvgVXkQZEfR0f+KtbM9Kp1f7ug52XNsZMXe2gB7u3D7g6qyWcXqbudCji7sPOypcp7j72KxOCH6zVOuDeC6BSbH34CZYi+oTsOW8G7jWtVxYe4h7hV+teqVHFGf1P1ThbLAx5pqD4MTjkjaV/lf6Lm8uX/5pNX7Bzegxd8S6feDnKl/ylMwJs2DPNf10AGa1YwILJZJcWbW9rbsMzG0UbXbfgY2mrjFO8+aEPezPvzNNyEP6ob9sLBqkP8+QCb/DthqO7sGiRaxIJtZCucpGhRtxaYj7Yfb web@gettwifi.com'
          - 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCyyf5SJ2JZDZo0AEDVN+TeHt8a+XtqwAO1RbC52VB8vsQagohis5nL8YHXa2/k26gc/hvTuXk/OkjiGrSAhoY5lETy0t2MWczM5WNrdI8ncbV/irADohMxhuyQHJ9D9Zz0IBYOOLwjR3AJqU0DLSXoE5T0ruV7xtCp59y5+dwbhCJAf3+11nrE6ey/KtA70J/RmBpeOxTnbXm1/G2KQNdG2ND2nxiHCpG+CY70q6gPK8ZnjtwJlienpaOHLJTd5nsz3lsIPB1jp5HeUhQXB4rFMWrckaGLgboXX90Sog4hVBtu3vatVEvw1Igu+t0xn+pkFjHncltN1O1odhGPlgH/ vizoria@astralteam.com'
        groups:
          - rvm
          - web
    
Пример описания пользователя

    password_lock
    
Запрещает для пользователя авторизацию по паролю

Dependencies
------------

None.

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
       - roles:
          - user

License
-------

BSD

Author Information
------------------

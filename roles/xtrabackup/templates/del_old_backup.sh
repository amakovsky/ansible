#!/bin/bash
find "{{ root_dir }}/{{ backup_dir }}" -name "*.gz" -mtime +7 -exec rm -f {} \;
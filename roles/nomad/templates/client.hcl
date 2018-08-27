bind_addr = "{{ inventory_hostname }}"
data_dir = "{{ nomad_data_dir }}"

client {
  enabled = true
  network_interface = "{{ nomad_jobs_interface }}"
  servers = [
  {% for item in groups['nomad'] %}
  {% if loop.index  < groups['nomad']|length %}
"{{item}}",
  {% else %}
"{{item}}"
  {% endif %}
  {% endfor %}
  ]
}
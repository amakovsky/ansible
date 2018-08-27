bind_addr = "0.0.0.0"
#bind_addr = "{{ inventory_hostname }}"

# Increase log verbosity
# log_level = "DEBUG"

# Setup data dir
data_dir = "{{ nomad_data_dir }}"

# Give the agent a unique name. Defaults to hostname
{% for item in groups['nomad'] %}
{% if item == inventory_hostname  %}
name = "server{{ loop.index }}"
{% endif %}
{% endfor %}


advertise {
  # This should be the IP of THIS MACHINE and must be routable by every node
  # in your cluster
  rpc = "{{ inventory_hostname }}:4647"
  http = "127.0.0.1"
  serf = "{{ inventory_hostname }}"
}

# Enable the server
server {
  enabled = true
  retry_join = [
  {% for item in groups['nomad'] %}
  {% if loop.index  < groups['nomad']|length %}
"{{item}}",
  {% else %}
"{{item}}"
  {% endif %}
  {% endfor %}
]

  # Self-elect, should be 3 or 5 for production
  bootstrap_expect = 3
}
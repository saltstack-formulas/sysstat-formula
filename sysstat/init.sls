sysstat:
  pkg:
    - installed
    - name: sysstat
  service.running: 
    - enable: True
{% if grains['os_family'] == 'Debian' %}
    - watch:
      - file: /etc/default/sysstat
{% endif %}
    - require:
      - pkg: sysstat

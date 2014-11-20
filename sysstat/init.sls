{% from "sysstat/map.jinja" import sysstat with context %}

sysstat:
  pkg:
    - installed
    - name: {{ sysstat.pkg }}
{% if grains['os_family'] != 'RedHat' %}
  service.running: 
    - enable: True
    - require:
      - pkg: sysstat
{% endif %}

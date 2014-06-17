{% from "sysstat/map.jinja" import sysstat with context %}

sysstat:
  pkg:
    - installed
    - name: {{ sysstat.pkg }}
  service.running: 
    - enable: True
    - require:
      - pkg: sysstat

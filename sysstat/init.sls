sysstat:
  pkg:
    - installed
    - name: sysstat
  service.running: 
    - enable: True
    - watch:
      -file: /etc/default/sysstat
    - require:
      - pkg: sysstat

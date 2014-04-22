sysstat:
  pkg:
    - installed
    - name: sysstat
  service.running: 
    - enable: True
    - watch: /etc/default/sysstat
    - require:
      - pkg: sysstat

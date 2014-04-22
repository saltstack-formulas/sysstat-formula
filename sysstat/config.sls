sysstat-config:
  file.managed:
    - name: /etc/default/sysstat
    - source: salt://sysstat/sysstat.default
    - mode: 644
    - user: root
    - group: root

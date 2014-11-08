{% from "sysstat/map.jinja" import sysstat with context %}
{% set enabled = salt['pillar.get']('sysstat_config:enabled', 'false') %}
{% set sa1_opts = salt['pillar.get']('sysstat_config:sa1_options', '-S DISK') %}
{% set sa2_opts = salt['pillar.get']('sysstat_config:sa2_options', '') %}
include:
  - sysstat

sysstat-config:
  file.managed:
    - name: {{ sysstat.config }}
    - source: salt://sysstat/sysstat.default
    - mode: 644
    - user: root
    - group: root
    - template: jinja
    - defaults:
        enabled: "{{ enabled }}"
        sa1_options: {{ sa1_opts }}
        sa2_options: {{ sa2_opts }}
    - watch_in:
      - service: sysstat
    - require:
      - pkg: sysstat

# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- set sls_config_file = tplroot ~ '.config.file' %}
{%- from tplroot ~ "/map.jinja" import sysstat with context %}

include:
  - {{ sls_config_file }}

sysstat-service-running-service-unmasked:
  service.unmasked:
    - name: {{ sysstat.service.name }}
    - onlyif: systemctl list-unit-files | grep {{ sysstat.service.name }} >/dev/null 2>&1

sysstat-service-running-service-running:
  service.running:
    - name: {{ sysstat.service.name }}
    - enable: True
  {%- if 'config' in sysstat and sysstat.config %}
    - watch:
      - file: sysstat-config-file-file-managed-config_file
    - require:
      - sls: {{ sls_config_file }}
    - onlyif: systemctl list-unit-files | grep {{ sysstat.service.name }} >/dev/null 2>&1
  {%- endif %}

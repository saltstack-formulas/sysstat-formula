# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import sysstat with context %}

sysstat-service-clean-service-dead:
  service.dead:
    - name: {{ sysstat.service.name }}
    - enable: False

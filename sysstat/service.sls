# -*- coding: utf-8 -*-
# vim: ft=sls

{## import settings from map.jinja ##}
{% from "sysstat/map.jinja" import sysstat_settings with context %}

{% if systat_settings.service.enabled %}
systat-service:
  service.running:
    - name: {{ systat_settings.service.name }}
    - enable: True
{% endif %}

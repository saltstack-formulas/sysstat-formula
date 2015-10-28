# -*- coding: utf-8 -*-
# vim: ft=sls

{## import settings from map.jinja ##}
{% from "sysstat/map.jinja" import sysstat_settings with context %}

{% if sysstat_settings.service.enabled %}
sysstat-service:
  service.running:
    - name: {{ sysstat_settings.service.name }}
    - enable: True
{% endif %}

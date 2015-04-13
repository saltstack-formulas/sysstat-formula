# -*- coding: utf-8 -*-
# vim: ft=sls

{## import settings from map.jinja ##}
{% from "sysstat/map.jinja" import sysstat_settings with context %}

systat-pkg:
  pkg.installed:
    - name: {{ systat_settings.pkg }}
    - failhard: True

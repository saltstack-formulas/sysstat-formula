# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import sysstat with context %}

    {%- if grains.os_family not in ('FreeBSD', 'Windows', 'MacOS',) %}

include:
  - {{ '.source' if sysstat.pkg.use_upstream_source else '.package' }}
  - .config
  - .service

    {%- else %}

sysstat-not-available-to-install:
  test.show_notification:
    - text: |
        The sysstat package is unavailable on {{ salt['grains.get']('osfinger', grains.os_family) }}

    {%- endif %}

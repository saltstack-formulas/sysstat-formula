# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import node with context %}

    {%- if grains.os_family not in ('FreeBSD', 'Windows', 'MacOS',) %}

include:
  - {{ '.source' if node.pkg.use_upstream_source else '.package' }}
  - .config
  - .service

    {%- else %}

node-not-available-to-install:
  test.show_notification:
    - text: |
        The node package is unavailable on {{ salt['grains.get']('osfinger', grains.os_family) }}

    {%- endif %}

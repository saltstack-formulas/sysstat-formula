# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import sysstat with context %}
{%- from tplroot ~ "/libtofs.jinja" import files_switch with context %}

{%- if 'config' in sysstat and sysstat.config %}
    {%- if sysstat.pkg.use_upstream_source %}
        {%- set sls_package_install = tplroot ~ '.source.install' %}
    {%- else %}
        {%- set sls_package_install = tplroot ~ '.package.install' %}
    {%- endif %}

include:
  - {{ sls_package_install }}

sysstat-config-file-file-managed-config_file:
  file.managed:
    - name: {{ sysstat.config_file }}
    - source: {{ files_switch(['sysstat.default.jinja'],
                              lookup='sysstat-config-file-file-managed-config_file'
                 )
              }}
    - mode: 640
    - user: root
    - group: {{ sysstat.rootgroup }}
    - makedirs: True
    - template: jinja
    - context:
        enabled: "{{ sysstat.config.enabled }}"
        sa1_options: {{ sysstat.config.sa1_options }}
        sa2_options: {{ sysstat.config.sa2_options }}
    - require:
      - sls: {{ sls_package_install }}

{%- endif %}

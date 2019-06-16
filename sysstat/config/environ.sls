# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- set sls_source_install = tplroot ~ '.source.install' %}
{%- set sls_package_install = tplroot ~ '.package.install' %}
{%- from tplroot ~ "/map.jinja" import sysstat with context %}
{%- from tplroot ~ "/libtofs.jinja" import files_switch with context %}

include:
  - {{ sls_source_install if sysstat.pkg.use_upstream_source else sls_package_install }}

sysstat-config-file-file-managed-environ_file:
  file.managed:
    - name: {{ sysstat.environ_file }}
    - source: {{ files_switch(['sysstat.sh.jinja'],
                              lookup='sysstat-config-file-file-managed-environ_file'
                 )
              }}
    - mode: 640
    - user: root
    - group: {{ sysstat.rootgroup }}
    - makedirs: True
    - template: jinja
    - context:
        config: {{ sysstat.environ|json }}
    - require:
      - sls: {{ sls_source_install if sysstat.pkg.use_upstream_source else sls_package_install }}

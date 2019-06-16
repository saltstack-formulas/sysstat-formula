# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import sysstat with context %}
{%- from tplroot ~ "/jinja/macros.jinja" import format_kwargs with context %}

sysstat-package-source-install-file-directory:
  file.directory:
    - name: {{ sysstat.pkg.source.name }}
    - user: root
    - group: root
    - mode: 755
    - makedirs: True
    - require_in:
      - source: sysstat-package-source-install-source-extracted
    - recurse:
        - user
        - group
        - mode

sysstat-package-source-install-source-extracted:
  archive.extracted:
    {{- format_kwargs(sysstat.pkg.source) }}
    - retry:
        attempts: 3
        until: True
        interval: 60
        splay: 10
    - user: root
    - group: root
    - recurse:
        - user
        - group

sysstat-package-source-install-cmd-run-make-install:
  cmd.run:
    - cwd: {{ sysstat.pkg.source.name }}
    - names:
      - ./configure
      - make
      - make install
    - unless:
      - test -d /usr/local/lib/sa
      - test -f /usr/local/bin/sar
    - require:
      - archive: sysstat-package-source-install-source-extracted

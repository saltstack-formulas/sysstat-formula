# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import node with context %}
{%- from tplroot ~ "/files/macros.jinja" import format_kwargs with context %}

# Get the node.js version to find out if we have to install it again.
# Checkinstall appends -1 as revision number, so remove it if found.
{% set nodeVersion = salt['pkg.version']('node')|replace('-1', '') -%}
{% if nodeVersion != node.version %}

node-package-source-install-prerequisites:
  pkg.installed:
    - names: {{ node.pkg.deps }}
  file.directory:
    - name: {{ node.dir.source }}
    - user: {{ node.rootuser }}
    - group: {{ node.rootgroup }}
    - mode: 755
    - makedirs: True
      - pkg: node-package-source-install-prerequisites
    - require_in:
      - source: node-package-source-install-prerequisites
    - recurse:
        - user
        - group
        - mode
  archive.extracted:
    {{- format_kwargs(node.pkg.source) }}
    - retry: {{ node.retry_option }}
    - user: {{ node.rootuser }}
    - group: {{ node.rootgroup }}
    - recurse:
        - user
        - group
    - require:
      - file: node-package-source-install-prerequisites
  cmd.run:
    - cwd: {{ node.dir.source }}/node-{{ node.version }}
    - names:
      - ./configure
      - make -j 4
    - require:
      - archive: node-package-source-install-prerequisites

    {% if grains.os_family in ('RedHat',) %}

node-package-source-install-make:
  gem.installed:
    - name: fpm
  cmd.run:
    - cwd: {{ node.dir.source }}/node-{{ node.version }}
    - names:
      - make install DESTDIR=./tmp
      - fpm -s dir -t rpm -C ./tmp -n node -v "{{node.version}}" --iteration 1 -d "Node v{{node.version}} (fpm)" -f
    - onchanges:
      - cmd: node-package-source-install-prerequisites
  pkg.installed:
    - sources:
      - node: {{ node.dir.source }}/node-{{ node.version }}/node-{{ node.version }}-1.x86_64.rpm
    - onchanges:
      - cmd: node-package-source-install-make

    {% else %}

node-package-source-install-checkinstall:
  cmd.run:
    - cwd: {{ node.dir.source }}/node-{{ node.version }}
    - name: checkinstall --install=yes --pkgname=node --pkgversion "{{ node.version }}" --default
    - onchanges:
      - cmd: node-package-source-install-prerequisites

    {% endif %}
{% else %}

node-package-source-version-checked-out:
  test.succeed_without_changes:
    - name: Node version {{ nodeVersion }} already installed

{% endif %}

# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import sysstat with context %}

sysstat-package-source-clean-file-absent:
  file.absent:
    - names:
      - {{ sysstat.pkg.source.name }}/sysstat*
      - /usr/local/lib/sa
      - /usr/local/bin/sar
      - /usr/local/bin/sadf
      - /usr/local/bin/iostat
      - /usr/local/bin/tapestat
      - /usr/local/bin/mpstat
      - /usr/local/bin/pidstat
      - /usr/local/bin/cifsiostat
      - /etc/sysconfig/sysstat.ioconf
      - /etc/sysconfig/sysstat/sysstat
      - /usr/local/share/doc/sysstat-{{ sysstat.version }}
      - /usr/local/share/man/man8/sa1.8*
      - /usr/local/share/man/man8/sa2.8*
      - /usr/local/share/man/man8/sadc.8*
      - /usr/local/share/man/man1/sar.1
      - /usr/local/share/man/man1/sadf.1
      - /usr/local/share/man/man5/sysstat.5
      - /usr/local/share/man/man1/iostat.1
      - /usr/local/share/man/man1/tapestat.1
      - /usr/local/share/man/man1/mpstat.1
      - /usr/local/share/man/man1/pidstat.1
      - /usr/local/share/man/man1/cifsiostat.1
      - /var/log/sa

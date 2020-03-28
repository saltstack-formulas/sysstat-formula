# -*- coding: utf-8 -*-
# vim: ft=sls

    {%- if grains.os_family not in ('FreeBSD', 'Windows', 'MacOS',) %}

include:
  - .service.clean
  - .config.clean
  - .package.clean
  - .source.clean

    {%- else %}

sysstat-not-available-to-clean:
  test.show_notification:
    - text: |
        The sysstat package is unavailable on {{ salt['grains.get']('osfinger', grains.os_family) }}

    {%- endif %}

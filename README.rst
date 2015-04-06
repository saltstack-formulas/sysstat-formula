=======
sysstat
=======

Formula to install sysstat/sar and configure it.

Status
======

* This formula has been tested on Ubuntu 12.04.4 LTS and CentOS 6.5.
* Supports configuration through pillar data for all

Usage
================
Install the formula files as required by your salt master configuration. 

To use the formula in a state setup the following code block:
.. code-block:: Saltstack
    include:
      - sysstat

To override defaults for the formula setup and include pillar as recommended in 
``pillar.example`` file. 

.. code-block:: Saltstack
  # -*- coding: utf-8 -*-
  # vim: ft=yaml
  sysstat:
    lookup:
      service:
        enabled: False

Available states
================

.. contents::
    :local:

``sysstat``
-----------
Include the following states in order of package, config, service. Each state
is fully configurable by the pillar. There shouldnt be a need to include the 
rest of the states as this state sets up sysstat fully based on the pillar.

Included states
================

``sysstat.package``
-------------
Installs package specified in pillar['sysstat:lookup:pkg'], defaults to value
specified in ``sysstat/defaults.yml``

``sysstat.config``
-------------
Sets up the config in pillar['sysstat:lookup:config:path'] with values setup 
under pillar['sysstat:lookup:config'].

``sysstat.service``
-------------
Toggled by sysstat:service:running config, will enable service or not. Defaults
off for RedHat setup in ``sysstat/map.jinja`` and on for rest as setup in 
``sysstat/defaults.yml``

Disclaimer
================
Parts of the formula may or may not work in versions earlier than 2014.7

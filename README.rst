=======
sysstat
=======

Formula to install sysstat/sar and configure it.

Status
======

* This formula has been tested on Ubuntu 12.04.4 LTS and CentOS 6.5.
* Supports configuration through pillar data for Debian-family systems.

Available states
================

.. contents::
    :local:


``sysstat``
-----------

Install the package


``sysstat.config``
-------------

.. note::
    Debian family OS only

Enable it as deamon by enabling in /etc/default/sysstat

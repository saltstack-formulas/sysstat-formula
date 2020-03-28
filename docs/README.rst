.. _readme:

sysstat-formula
===============

|img_travis| |img_sr|

.. |img_travis| image:: https://travis-ci.com/saltstack-formulas/sysstat-formula.svg?branch=master
   :alt: Travis CI Build Status
   :scale: 100%
   :target: https://travis-ci.com/saltstack-formulas/sysstat-formula
.. |img_sr| image:: https://img.shields.io/badge/%20%20%F0%9F%93%A6%F0%9F%9A%80-semantic--release-e10079.svg
   :alt: Semantic Release
   :scale: 100%
   :target: https://github.com/semantic-release/semantic-release

Formula to install sysstat/sar and configure it on GNU/Linux.

.. contents:: **Table of Contents**

General notes
-------------

See the full `SaltStack Formulas installation and usage instructions
<https://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html>`_.

If you are interested in writing or contributing to formulas, please pay attention to the `Writing Formula Section
<https://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html#writing-formulas>`_.

If you want to use this formula, please pay attention to the ``FORMULA`` file and/or ``git tag``,
which contains the currently released version. This formula is versioned according to `Semantic Versioning <http://semver.org/>`_.

See `Formula Versioning Section <https://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html#versioning>`_ for more details.

Contributing to this repo
-------------------------

**Commit message formatting is significant!!**

Please see `How to contribute <https://github.com/saltstack-formulas/.github/blob/master/CONTRIBUTING.rst>`_ for more details.

Available states
----------------

.. contents::
   :local:

``sysstat``
^^^^^^^^^^^

*Meta-state (This is a state that includes other states)*.

This installs the sysstat package,
manages the sysstat configuration file and then
starts the associated sysstat service.

``sysstat.package``
^^^^^^^^^^^^^^^^^^^

This state will install the sysstat package only.

``sysstat.source``
^^^^^^^^^^^^^^^^^^

This state will install the sysstat from source only.

``sysstat.config``
^^^^^^^^^^^^^^^^^^

This state will configure the sysstat service and has a dependency on ``sysstat.install``
via include list.

``sysstat.service``
^^^^^^^^^^^^^^^^^^^

This state will start the sysstat service and has a dependency on ``sysstat.config``
via include list.

``sysstat.clean``
^^^^^^^^^^^^^^^^^

*Meta-state (This is a state that includes other states)*.

this state will undo everything performed in the ``sysstat`` meta-state in reverse order, i.e.
stops the service,
removes the configuration file and
then uninstalls the package.

``sysstat.service.clean``
^^^^^^^^^^^^^^^^^^^^^^^^^

This state will stop the sysstat service and disable it at boot time.

``sysstat.config.clean``
^^^^^^^^^^^^^^^^^^^^^^^^

This state will remove the configuration of the sysstat service and has a
dependency on ``sysstat.service.clean`` via include list.

``sysstat.package.clean``
^^^^^^^^^^^^^^^^^^^^^^^^^

This state will remove the sysstat package and has a depency on

``sysstat.source.clean``
^^^^^^^^^^^^^^^^^^^^^^^^

This state will remove the sysstat package and has a depency on
``sysstat.config.clean`` via include list.

Testing
-------

Linux testing is done with ``kitchen-salt``.

Requirements
^^^^^^^^^^^^

* Ruby
* Docker

.. code-block:: bash

   $ gem install bundler
   $ bundle install
   $ bin/kitchen test [platform]

Where ``[platform]`` is the platform name defined in ``kitchen.yml``,
e.g. ``debian-9-2019-2-py3``.

``bin/kitchen converge``
^^^^^^^^^^^^^^^^^^^^^^^^

Creates the docker instance and runs the ``sysstat`` main state, ready for testing.

``bin/kitchen verify``
^^^^^^^^^^^^^^^^^^^^^^

Runs the ``inspec`` tests on the actual instance.

``bin/kitchen destroy``
^^^^^^^^^^^^^^^^^^^^^^^

Removes the docker instance.

``bin/kitchen test``
^^^^^^^^^^^^^^^^^^^^

Runs all of the stages above in one go: i.e. ``destroy`` + ``converge`` + ``verify`` + ``destroy``.

``bin/kitchen login``
^^^^^^^^^^^^^^^^^^^^^

Gives you SSH access to the instance for manual testing.


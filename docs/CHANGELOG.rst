
Changelog
=========

`0.4.0 <https://github.com/saltstack-formulas/sysstat-formula/compare/v0.3.0...v0.4.0>`_ (2020-03-28)
---------------------------------------------------------------------------------------------------------

Bug Fixes
^^^^^^^^^


* **libtofs:** “files_switch” mess up the variable exported by “map.jinja” [skip ci] (\ `47470ba <https://github.com/saltstack-formulas/sysstat-formula/commit/47470ba27415b0bee3e0244d236bb86b11593c7f>`_\ )
* **release.config.js:** use full commit hash in commit link [skip ci] (\ `d60feaf <https://github.com/saltstack-formulas/sysstat-formula/commit/d60feaf42abd27c4bd3d178cc8f6c091d759af7a>`_\ )

Continuous Integration
^^^^^^^^^^^^^^^^^^^^^^


* **gemfile:** restrict ``train`` gem version until upstream fix [skip ci] (\ `15c1847 <https://github.com/saltstack-formulas/sysstat-formula/commit/15c184760f62c8094e1c2c1057f0f5817fb60571>`_\ )
* **kitchen:** avoid using bootstrap for ``master`` instances [skip ci] (\ `98b1708 <https://github.com/saltstack-formulas/sysstat-formula/commit/98b1708327b9c6155512527d27c5119fe9217f2d>`_\ )
* **kitchen:** change ``log_level`` to ``debug`` instead of ``info`` (\ `f29dadb <https://github.com/saltstack-formulas/sysstat-formula/commit/f29dadb2462299f543af5b1fa4bd5b7b51dcd2f6>`_\ )
* **kitchen:** install required packages to bootstrapped ``opensuse`` [skip ci] (\ `c2a22b5 <https://github.com/saltstack-formulas/sysstat-formula/commit/c2a22b54b58f76703209c5a5da37a779ac459cba>`_\ )
* **kitchen:** use ``debian-10-master-py3`` instead of ``develop`` [skip ci] (\ `9a0551c <https://github.com/saltstack-formulas/sysstat-formula/commit/9a0551cde11224a829b912d43bc5063e2671323a>`_\ )
* **kitchen:** use ``develop`` image until ``master`` is ready (\ ``amazonlinux``\ ) [skip ci] (\ `9c99c79 <https://github.com/saltstack-formulas/sysstat-formula/commit/9c99c79426aac0e1085a4e32d59efcf4c9d6c09a>`_\ )
* **kitchen:** use bootstrapped ``opensuse`` images until ``2019.2.2`` [skip ci] (\ `72b7884 <https://github.com/saltstack-formulas/sysstat-formula/commit/72b7884ddba7a3d423af5ced968c5b2d2f87d231>`_\ )
* **kitchen+travis:** replace EOL pre-salted images (\ `b9e16d5 <https://github.com/saltstack-formulas/sysstat-formula/commit/b9e16d5a3760f4651919b2a2d132a9574d162925>`_\ )
* **kitchen+travis:** upgrade matrix after ``2019.2.2`` release [skip ci] (\ `cfca07f <https://github.com/saltstack-formulas/sysstat-formula/commit/cfca07f9abcf784dd335e703e90ecfbf95488e37>`_\ )
* **platform:** add ``arch-base-latest`` (\ `c5db9a5 <https://github.com/saltstack-formulas/sysstat-formula/commit/c5db9a54b6c3958eb4ced5c3a91ea982612b4bb1>`_\ )
* **travis:** apply changes from build config validation [skip ci] (\ `e9b9c35 <https://github.com/saltstack-formulas/sysstat-formula/commit/e9b9c351d496acf7a1c328e42d4bb58c5eb5c278>`_\ )
* **travis:** opt-in to ``dpl v2`` to complete build config validation [skip ci] (\ `d49d6c5 <https://github.com/saltstack-formulas/sysstat-formula/commit/d49d6c51e340f5d9b5fe8e6517cee507f77ec937>`_\ )
* **travis:** quote pathspecs used with ``git ls-files`` [skip ci] (\ `c211ac5 <https://github.com/saltstack-formulas/sysstat-formula/commit/c211ac523a7df476411a584f1a93d42388d3d424>`_\ )
* **travis:** run ``shellcheck`` during lint job [skip ci] (\ `056d015 <https://github.com/saltstack-formulas/sysstat-formula/commit/056d015f18e1cf21ef790af3e7e924667522c273>`_\ )
* **travis:** update ``salt-lint`` config for ``v0.0.10`` [skip ci] (\ `64b821e <https://github.com/saltstack-formulas/sysstat-formula/commit/64b821e19725db93f3c0b5b2aea722c352621ab7>`_\ )
* **travis:** use ``major.minor`` for ``semantic-release`` version [skip ci] (\ `ca4508a <https://github.com/saltstack-formulas/sysstat-formula/commit/ca4508ae0180e906f7b668b0031302750e580dd9>`_\ )
* **travis:** use build config validation (beta) [skip ci] (\ `91489dd <https://github.com/saltstack-formulas/sysstat-formula/commit/91489dd175bf0138ffc0f30d99a1f83497d808d8>`_\ )
* merge travis matrix, add ``salt-lint`` & ``rubocop`` to ``lint`` job (\ `2e40417 <https://github.com/saltstack-formulas/sysstat-formula/commit/2e40417837a791a61f39266b9ce858340bd6d62d>`_\ )
* merge travis matrix, add ``salt-lint`` & ``rubocop`` to ``lint`` job (\ `29af05e <https://github.com/saltstack-formulas/sysstat-formula/commit/29af05ef16824245dd989d6f81bf1d673f5f7f4a>`_\ )
* **yamllint:** add rule ``empty-values`` & use new ``yaml-files`` setting (\ `2cea0b2 <https://github.com/saltstack-formulas/sysstat-formula/commit/2cea0b2894a7bc941cb11e46a896f3258a193c38>`_\ )
* use ``dist: bionic`` & apply ``opensuse-leap-15`` SCP error workaround (\ `142ff66 <https://github.com/saltstack-formulas/sysstat-formula/commit/142ff661eb07b4911e65e46240076c3b48ba6953>`_\ )

Documentation
^^^^^^^^^^^^^


* **contributing:** remove to use org-level file instead [skip ci] (\ `4cf5a60 <https://github.com/saltstack-formulas/sysstat-formula/commit/4cf5a60f5946056a6e5c4db19b7f1fd1724936db>`_\ )
* **readme:** update link to ``CONTRIBUTING`` [skip ci] (\ `b5d30cf <https://github.com/saltstack-formulas/sysstat-formula/commit/b5d30cf8e99012c182c09c8ca5988dc32247534e>`_\ )

Features
^^^^^^^^


* **os:** graceful fail for unsupported os (\ `be66570 <https://github.com/saltstack-formulas/sysstat-formula/commit/be66570a0b0baa8b24b2fa46127e63ae28aa39e9>`_\ )

Performance Improvements
^^^^^^^^^^^^^^^^^^^^^^^^


* **travis:** improve ``salt-lint`` invocation [skip ci] (\ `cf877cf <https://github.com/saltstack-formulas/sysstat-formula/commit/cf877cf4c79358b5f0265f5f19b9c2be41e39e29>`_\ )

`0.3.0 <https://github.com/saltstack-formulas/sysstat-formula/compare/v0.2.0...v0.3.0>`_ (2019-08-17)
---------------------------------------------------------------------------------------------------------

Features
^^^^^^^^


* **yamllint:** include for this repo and apply rules throughout (\ `a8cc767 <https://github.com/saltstack-formulas/sysstat-formula/commit/a8cc767>`_\ )

`0.2.0 <https://github.com/saltstack-formulas/sysstat-formula/compare/v0.1.0...v0.2.0>`_ (2019-07-19)
---------------------------------------------------------------------------------------------------------

Bug Fixes
^^^^^^^^^


* **example:** fix pillar example (\ `d4e6442 <https://github.com/saltstack-formulas/sysstat-formula/commit/d4e6442>`_\ )
* **macro:** remove unused 'concat_args' macro (\ `ee6f30f <https://github.com/saltstack-formulas/sysstat-formula/commit/ee6f30f>`_\ )
* **suse:** correct the service name on suse (\ `d69bd4e <https://github.com/saltstack-formulas/sysstat-formula/commit/d69bd4e>`_\ )

Code Refactoring
^^^^^^^^^^^^^^^^


* **formula:** align with template-formula v3.0.0 (\ `873ae0f <https://github.com/saltstack-formulas/sysstat-formula/commit/873ae0f>`_\ )

Features
^^^^^^^^


* **formula:** align with template-formula v3.0.0 (\ `12a9c76 <https://github.com/saltstack-formulas/sysstat-formula/commit/12a9c76>`_\ )
* **formula:** apply pr review comments (\ `ad30f21 <https://github.com/saltstack-formulas/sysstat-formula/commit/ad30f21>`_\ )
* **formula:** apply pr review comments (\ `1e3cdc9 <https://github.com/saltstack-formulas/sysstat-formula/commit/1e3cdc9>`_\ )

Tests
^^^^^


* **inspec:** fix unit test (\ `84e697a <https://github.com/saltstack-formulas/sysstat-formula/commit/84e697a>`_\ )

IT Blog
==========

|Deployment Status|

Powered by Hugo_.

Uses `Minimal theme`_.

Website is live at https://blog.samarchyan.me.

Installation
--------------

Run ``make bootstrap``.

Usage
------

| Run ``make post [post-name]`` to create a new post.
| Run ``make run`` to preview the site. The preview is available here - http://localhost:1313.
| Run ``make help`` to get a list of all available commands.

Run in docker:

1. Run ``make docker-build``
2. Run ``make docker-run``

CI/CD
----------------------------
`GitHub Actions`_  are used for CI/CD.

Deployment is automatically done in master branch.

The following GitHub Actions are used:

* Checkout_
* `Setup Node.js environment`_
* `Docker Login`_
* `Build and push Docker images`_
* `Kubectl tool installer`_
* Cache_
* `Docker Setup Buildx`_
* `GitHub Actions Version Updater`_

Cron jobs
----------------------------
Cron jobs are run with `GitHub Actions`_. Time zone is UTC.

- ``Find broken links`` runs at 04:00 UTC (00:00 EDT) on the first day of the month
- ``Update GitHub actions`` runs at 04:00 UTC (00:00 EDT) on the first day of the month

Fonts used
----------------------------
* Orbitron_ for logo

.. |Deployment Status| image:: https://github.com/desecho/blog/actions/workflows/deployment.yaml/badge.svg
   :target: https://github.com/desecho/blog/actions/workflows/deployment.yaml

.. _Hugo: https://gohugo.io/
.. _Minimal theme: https://github.com/calintat/minimal
.. _Orbitron: https://fonts.google.com/specimen/Orbitron
.. _GitHub Actions: https://github.com/features/actions

.. _Checkout: https://github.com/marketplace/actions/checkout
.. _Setup Node.js environment: https://github.com/marketplace/actions/setup-node-js-environment
.. _Docker Login: https://github.com/marketplace/actions/docker-login
.. _Build and push Docker images: https://github.com/marketplace/actions/build-and-push-docker-images
.. _Kubectl tool installer: https://github.com/marketplace/actions/kubectl-tool-installer
.. _Cache: https://github.com/marketplace/actions/cache
.. _Docker Setup Buildx: https://github.com/marketplace/actions/docker-setup-buildx
.. _GitHub Actions Version Updater: https://github.com/marketplace/actions/github-actions-version-updater

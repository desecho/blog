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

* `Cancel Workflow Action`_
* Checkout_
* `Setup Node.js environment`_
* `Docker Login`_
* `Docker Build & Push Action`_
* `Kubectl tool installer`_

Fonts used
----------------------------
* Orbitron_ for logo.

.. |Deployment Status| image:: https://github.com/desecho/blog/actions/workflows/deployment.yaml/badge.svg
   :target: https://github.com/desecho/blog/actions/workflows/deployment.yaml

.. _Hugo: https://gohugo.io/
.. _Minimal theme: https://github.com/calintat/minimal
.. _Orbitron: https://fonts.google.com/specimen/Orbitron
.. _GitHub Actions: https://github.com/features/actions
.. _Cancel Workflow Action: https://github.com/marketplace/actions/cancel-workflow-action
.. _Checkout: https://github.com/marketplace/actions/checkout
.. _Setup Node.js environment: https://github.com/marketplace/actions/setup-node-js-environment
.. _Docker Login: https://github.com/marketplace/actions/docker-login
.. _Docker Build & Push Action: https://github.com/marketplace/actions/docker-build-push-action
.. _Kubectl tool installer: https://github.com/marketplace/actions/kubectl-tool-installer

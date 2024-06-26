Python Package Skeleton
=======================

|PyPI| |GitHub Actions|

.. |PyPI| image:: https://img.shields.io/pypi/v/makenew-pypackage.svg
   :target: https://pypi.python.org/pypi/makenew-pypackage
   :alt: PyPI
.. |GitHub Actions| image:: https://github.com/makenew/pypackage/actions/workflows/check.yml/badge.svg
   :target: https://github.com/makenew/pypackage/actions/workflows/check.yml
   :alt: GitHub Actions

Package skeleton for a Python module.

Description
-----------

Bootstrap a new Python_ package in less than a minute.

.. _Python: https://www.python.org/

Features
~~~~~~~~

- Publishing to PyPI_.
- Secure dependency management with Poetry_.
- Extremely fast Python linting and code formatting with Ruff_.
- pytest_ helps you write better programs.
- Code coverage reporting with Codecov_.
- Fully automated version management and package publishing with semantic-release__.
- Continuous checks and tests with `GitHub Actions`__.
- `Keep a CHANGELOG`_.
- Consistent coding with EditorConfig_.
- Badges from Shields.io_.
- Start coding instantly with `GitHub Codespaces`_.

.. _Codecov: https://codecov.io/
.. _EditorConfig: https://editorconfig.org/
.. _GitHub Codespaces: https://github.com/features/codespaces
.. _Keep a CHANGELOG: https://keepachangelog.com/
.. _PyPI: https://pypi.python.org/pypi
.. _Ruff: https://github.com/astral-sh/ruff
.. _Shields.io: https://shields.io/
.. __: https://semantic-release.gitbook.io/semantic-release/
.. __: https://github.com/features/actions
.. _pytest: https://docs.pytest.org/

Bootstrapping a New Project
~~~~~~~~~~~~~~~~~~~~~~~~~~~

1. Create an empty (**non-initialized**) repository on GitHub.
2. Clone the main branch of this repository with

   ::

       $ git clone --single-branch https://github.com/makenew/pypackage.git new-pypackage
       $ cd new-pypackage

   Optionally, reset to the latest
   `release <https://github.com/makenew/pypackage/releases>`__ with

   ::

       $ git reset --hard <version-tag>

3. Run

   ::

       $ ./makenew.sh

   This will replace the boilerplate, delete itself,
   remove the git remote, remove upstream tags,
   and stage changes for commit.

4. Create the required GitHub repository secrets
5. Review, commit, and push the changes to GitHub with

   ::

     $ git diff --cached
     $ git commit -m "Replace makenew boilerplate"
     $ git remote add origin git@github.com:<user>/<new-pypackage>.git
     $ git push -u origin main

6. Ensure the GitHub action passes,
   then publish the initial version of the package with

   ::

     $ poetry install
     $ poetry version patch
     $ make version

Updating
~~~~~~~~

If you want to pull in future updates from this skeleton,
you can fetch and merge in changes from this repository.

Add this as a new remote with

::

    $ git remote rename origin upstream

and then configure your ``origin`` branch as normal.

Otherwise, add this as a new remote with

::

    $ git remote add upstream git@github.com:makenew/pypackage.git

You can then fetch and merge changes with

::

    $ git fetch --no-tags upstream
    $ git merge upstream/main

Changelog
^^^^^^^^^

Note that ``CHANGELOG.md`` is just a template for this skeleton. The
actual changes for this project are documented in the commit history and
summarized under
`Releases <https://github.com/makenew/pypackage/releases>`__.

Installation
------------

This package is registered on the `Python Package Index (PyPI)`_
as makenew-pypackage_.

Install it with

::

    $ poetry add makenew-pypackage

.. _makenew-pypackage: https://pypi.python.org/pypi/makenew-pypackage
.. _Python Package Index (PyPI): https://pypi.python.org/

Development and Testing
-----------------------

Quickstart
~~~~~~~~~~

::

    $ git clone https://github.com/makenew/pypackage.git
    $ cd pypackage
    $ poetry install

Run each command below in a separate terminal window:

::

    $ make watch

Primary development tasks are defined in the `Makefile`.

Source Code
~~~~~~~~~~~

The `source code`__ is hosted on GitHub.
Clone the project with

::

    $ git clone https://github.com/makenew/pypackage.git

.. __: https://github.com/makenew/pypackage

Requirements
~~~~~~~~~~~~

You will need `Python 3`_ and Poetry_.

Install the development dependencies with

::

    $ poetry install

.. _Poetry: https://poetry.eustace.io/
.. _Python 3: https://www.python.org/

Tests
~~~~~

Lint code with

::

    $ make lint


Run tests with

::

    $ make test

Run tests on changes with

::

    $ make watch

Publishing
~~~~~~~~~~

New versions are created with `poetry version`_.

Automatic
^^^^^^^^^

New versions are released automatically with semantic-release_
as long as commits follow the `Angular Commit Message Conventions`_.

.. _Angular Commit Message Conventions: https://semantic-release.gitbook.io/semantic-release/#commit-message-format
.. _semantic-release: https://semantic-release.gitbook.io/

Manual
^^^^^^

Publish a new version by triggering a `version workflow_dispatch on GitHub Actions`_.
The `version` input will be passed as the first argument to `poetry version`_.

This may be done on the web or using the `GitHub CLI`_ with

::

    $ gh workflow run version.yml --raw-field version=<version>

.. _Poetry version: https://python-poetry.org/docs/cli/#version
.. _GitHub CLI: https://cli.github.com/
.. _version workflow_dispatch on GitHub Actions: https://github.com/makenew/pypackage/actions?query=workflow%3Aversion

GitHub Actions
--------------

*GitHub Actions should already be configured: this section is for reference only.*

The following repository secrets must be set on GitHub Actions.

- ``PYPI_API_TOKEN``: API token for publishing on PyPI.

These must be set manually.

Secrets for Optional GitHub Actions
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The version, format, generate, and semantic-release GitHub actions
require a user with write access to the repository
including access to read and write packages.
Set these additional secrets to enable the action:

- ``GH_TOKEN``: A personal access token for the user.
- ``GIT_USER_NAME``: The name to set for Git commits.
- ``GIT_USER_EMAIL``: The email to set for Git commits.
- ``GPG_PRIVATE_KEY``: The `GPG private key`_.
- ``GPG_PASSPHRASE``: The GPG key passphrase.

.. _GPG private key: https://github.com/marketplace/actions/import-gpg#prerequisites

Contributing
------------

Please submit and comment on bug reports and feature requests.

To submit a patch:

1. Fork it (https://github.com/makenew/pypackage/fork).
2. Create your feature branch (`git checkout -b my-new-feature`).
3. Make changes.
4. Commit your changes (`git commit -am 'Add some feature'`).
5. Push to the branch (`git push origin my-new-feature`).
6. Create a new Pull Request.

License
-------

This Python package is licensed under the MIT license.

Warranty
--------

This software is provided by the copyright holders and contributors "as is" and
any express or implied warranties, including, but not limited to, the implied
warranties of merchantability and fitness for a particular purpose are
disclaimed. In no event shall the copyright holder or contributors be liable for
any direct, indirect, incidental, special, exemplary, or consequential damages
(including, but not limited to, procurement of substitute goods or services;
loss of use, data, or profits; or business interruption) however caused and on
any theory of liability, whether in contract, strict liability, or tort
(including negligence or otherwise) arising in any way out of the use of this
software, even if advised of the possibility of such damage.

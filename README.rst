Python collections of Nix Expressions for various projects
==========================================================

Aim of ``nixpkgs-python`` is to automate the process of generating Nix
expressions for python related projects. The same contribution rules apply as
for ``nixpkgs`` (fork, add new python collection and send PR).


Usage
-----

TODO: once flask collection is finished add how to use collection with existing
``nixpkgs``.


Current collections
-------------------

attrs
^^^^^

:maintainers: `seppeljordan`_

This is a small collection of attrs_ and its test dependencies.  It is
its own collection to check for circular dependencies with pytest.

Flake8
^^^^^^

:maintainers: `seppeljordan`_

This is a collection of Flake8_ and its plugins.

Flask
^^^^^

:maintainers: `garbas`_

This is a collections of Flask_ micro framework and its extensions.


Pelican
^^^^^^^

:maintainers: `garbas`_

This is a collections of Pelican_ and Pelican extensions packages.


Science
^^^^^^^^

:maintainers: ??? (Looking for maintainer)

This is a collections of science related packages.



Django
^^^^^^

:maintainers: ??? (Looking for maintainer)

This is a collections of Django_ framework and its extensions.


Pyramid
^^^^^^^

:maintainers: ??? (Looking for maintainer)

This is a collections of Pyramid_ framework and its extensions.

pykube
^^^^^^

:maintainers: seppeljordan_

This is pykube_ and its dependencies as a package set.

pypiserver
^^^^^^^^^^

:maintainers: seppeljordan_

Package set containing pypiserver_ and its dependencies.

pytest
^^^^^^

:maintainers: seppeljordan_

Package set containing pytest and some of its plugins.

Sphinx
^^^^^^

:maintainers: seppeljordan_

Package set containing Sphinx and some of its extension.

HTTPie
^^^^^^

:maintainers: garbas_

Package set containing httpie and some of its plugins.


pypi2nix
^^^^^^^^

:maintainers: seppeljordan_

Package set containing pypi2nix_ and its dependencies


openstackclient
^^^^^^^^^^^^^^^

:maintainers: lewo_

Package set containing openstackclient and its dependencies


.. _Flak8: https://gitlab.com/pycqa/flake8
.. _Flask: http://flask.pocoo.org
.. _HomeAssistant: http://home-assistant.io
.. _Pelican: http://blog.getpelican.com
.. _Pyramid: https://trypyramid.com
.. _Django: https://www.djangoproject.com
.. _PyPi: https://pypi.python.org
.. _garbas: https://github.com/garbas
.. _seppeljordan: https://github.com/seppeljordan
.. _pykube: https://github.com/kelproject/pykube
.. _pypiserver: https://github.com/pypiserver/pypiserver
.. _pypi2nix: https://github.com/garbas/pypi2nix
.. _lewo: https://github.com/nlewo

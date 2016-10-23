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

Flask
^^^^^

:maintainers: `garbas`_

This is a collections of Flask_ micro framework and its extensions.


TODO
----

- [ ] publish binary cache

- [ ] create (bi-)monthly release cycle and create channels accordingly

- [ ] start science collection. this should be a collection of all the science
  python packages (numpy, scipy, ...)
  
- [ ] create status page of a collection and publish it on some url (eg. S3).
  alongside binary cache.


FAQ
---

TODO: answers questions below. for now i'm just writting down questions i'm
      receiving.

- Why not contribute this to ``nixpkgs``?

- Why not package all of PyPi_ index?


.. _Flask: http://flask.pocoo.org
.. _PyPi: https://pypi.python.org
.. _garbas: https://github.com/garbas

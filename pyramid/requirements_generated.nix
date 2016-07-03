# generated using pypi2nix tool (version: 1.1.1)
#
# COMMAND:
#   pypi2nix -r pyramid/requirements.txt
#

{ pkgs, python, commonBuildInputs ? [], commonDoCheck ? false }:

self: {

  "Chameleon" = python.mkDerivation {
    name = "Chameleon-2.24";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/5a/9e/637379ffa13c5172b5c0e704833ffea6bf51cec7567f93fd6e903d53ed74/Chameleon-2.24.tar.gz";
      md5= "1b01f1f6533a8a11d0d2f2366dec5342";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = {
      homepage = "";
      license = "BSD-like (http://repoze.org/license.html)";
      description = "Fast HTML/XML Template Compiler.";
    };
  };



  "Jinja2" = python.mkDerivation {
    name = "Jinja2-2.8";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/f2/2f/0b98b06a345a761bec91a079ccae392d282690c2d8272e708f4d10829e22/Jinja2-2.8.tar.gz";
      md5= "edb51693fe22c53cee5403775c71a99e";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
    self."MarkupSafe"
  ];
    meta = {
      homepage = "";
      license = "BSD";
      description = "A small but fast and easy to use stand-alone template engine written in pure python.";
    };
  };



  "Mako" = python.mkDerivation {
    name = "Mako-1.0.4";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/7a/ae/925434246ee90b42e8ef57d3b30a0ab7caf9a2de3e449b876c56dcb48155/Mako-1.0.4.tar.gz";
      md5= "c5fc31a323dd4990683d2f2da02d4e20";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
    self."MarkupSafe"
  ];
    meta = {
      homepage = "";
      license = "lib.mit";
      description = "A super-fast templating language that borrows the  best ideas from the existing templating languages.";
    };
  };



  "MarkupSafe" = python.mkDerivation {
    name = "MarkupSafe-0.23";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/c0/41/bae1254e0396c0cc8cf1751cb7d9afc90a602353695af5952530482c963f/MarkupSafe-0.23.tar.gz";
      md5= "f5ab3deee4c37cd6a922fb81e730da6e";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = {
      homepage = "";
      license = "BSD";
      description = "Implements a XML/HTML/XHTML Markup safe string for Python";
    };
  };



  "PasteDeploy" = python.mkDerivation {
    name = "PasteDeploy-1.5.2";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/0f/90/8e20cdae206c543ea10793cbf4136eb9a8b3f417e04e40a29d72d9922cbd/PasteDeploy-1.5.2.tar.gz";
      md5= "352b7205c78c8de4987578d19431af3b";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = {
      homepage = "";
      license = "lib.mit";
      description = "Load, configure, and compose WSGI applications and servers";
    };
  };



  "PyYAML" = python.mkDerivation {
    name = "PyYAML-3.11";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/04/60/abfb3a665ee0569b60c89148b7187ddd8a36cb65e254fba945ae1315645d/PyYAML-3.11.zip";
      md5= "89cbc92cda979042533b640b76e6e055";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = {
      homepage = "";
      license = "lib.mit";
      description = "YAML parser and emitter for Python";
    };
  };



  "Pygments" = python.mkDerivation {
    name = "Pygments-2.1.3";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/b8/67/ab177979be1c81bc99c8d0592ef22d547e70bb4c6815c383286ed5dec504/Pygments-2.1.3.tar.gz";
      md5= "ed3fba2467c8afcda4d317e4ef2c6150";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = {
      homepage = "";
      license = "BSD License";
      description = "Pygments is a syntax highlighting package written in Python.";
    };
  };



  "SQLAlchemy" = python.mkDerivation {
    name = "SQLAlchemy-1.0.13";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/1d/e2/3df2e0e8cd3cf7e6e2905f1a3d44f1ba51c4fceab0968cc0cb3dcefcb53a/SQLAlchemy-1.0.13.tar.gz";
      md5= "cef0c4aa0e2464a6f903a9cac9b280d8";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = {
      homepage = "";
      license = "MIT License";
      description = "Database Abstraction Library";
    };
  };



  "WebOb" = python.mkDerivation {
    name = "WebOb-1.6.1";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/5d/c7/7c1565b188d8d32bf3657a24b9d71621e35ba20ec4179a0a7f9803511099/WebOb-1.6.1.tar.gz";
      md5= "04049d82e9d12dd91f6f46f54cc826aa";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = {
      homepage = "";
      license = "lib.mit";
      description = "WSGI request and response object";
    };
  };



  "WebTest" = python.mkDerivation {
    name = "WebTest-2.0.21";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/7e/07/6bc0dab871f00ee898c7eff4860d52d30d0b651637a8de38a9bfb0b0cebd/WebTest-2.0.21.tar.gz";
      md5= "98e8b59da3cc6c150cebca8c92b66041";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
    self."PasteDeploy"
    self."WebOb"
    self."beautifulsoup4"
    self."mock"
    self."six"
    self."waitress"
  ];
    meta = {
      homepage = "";
      license = "lib.mit";
      description = "Helper to test WSGI applications";
    };
  };



  "beautifulsoup4" = python.mkDerivation {
    name = "beautifulsoup4-4.4.1";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/26/79/ef9a8bcbec5abc4c618a80737b44b56f1cb393b40238574078c5002b97ce/beautifulsoup4-4.4.1.tar.gz";
      md5= "8fbd9a7cac0704645fa20d1419036815";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = {
      homepage = "";
      license = "lib.mit";
      description = "Screen-scraping library";
    };
  };



  "bravado-core" = python.mkDerivation {
    name = "bravado-core-4.2.2";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/4a/a7/e8b30b9940e781076b8bd457f5999ba270572fe84725be7eb253aa5fe8ea/bravado-core-4.2.2.tar.gz";
      md5= "a24b9c640a8e64a1a39a7767683feada";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
    self."PyYAML"
    self."jsonschema"
    self."python-dateutil"
    self."simplejson"
    self."six"
    self."swagger-spec-validator"
  ];
    meta = {
      homepage = "";
      license = "BSD 3-Clause License";
      description = "Library for adding Swagger support to clients and servers";
    };
  };



  "colander" = python.mkDerivation {
    name = "colander-1.3.1";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/62/23/14a8cf54ce7d521680a29061e02133885016ae53bdccd132662c53382a4e/colander-1.3.1.tar.gz";
      md5= "a1d93135f2d3f7b15c894297c0cd019e";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
    self."iso8601"
    self."translationstring"
  ];
    meta = {
      homepage = "";
      license = "BSD-derived (http://www.repoze.org/LICENSE.txt)";
      description = "A simple schema-based serialization and deserialization library";
    };
  };



  "deform" = python.mkDerivation {
    name = "deform-0.9.9";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/a3/54/996d2f7d658e0da1a0b1c7b75cf3d83d57b1327ec325d81fa1a728715fe0/deform-0.9.9.tar.gz";
      md5= "c6c1bc332173e55e4224c79187f2ee08";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
    self."Chameleon"
    self."beautifulsoup4"
    self."colander"
    self."peppercorn"
    self."translationstring"
    self."zope.deprecation"
  ];
    meta = {
      homepage = "";
      license = "BSD-derived (http://www.repoze.org/LICENSE.txt)";
      description = "Another form generation library";
    };
  };



  "funcsigs" = python.mkDerivation {
    name = "funcsigs-1.0.2";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/94/4a/db842e7a0545de1cdb0439bb80e6e42dfe82aaeaadd4072f2263a4fbed23/funcsigs-1.0.2.tar.gz";
      md5= "7e583285b1fb8a76305d6d68f4ccc14e";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = {
      homepage = "";
      license = "ASL";
      description = "Python function signatures from PEP362 for Python 2.6, 2.7 and 3.2+";
    };
  };



  "functools32" = python.mkDerivation {
    name = "functools32-3.2.3.post2";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/5e/1a/0aa2c8195a204a9f51284018562dea77e25511f02fe924fac202fc012172/functools32-3.2.3-2.zip";
      md5= "d55232eb132ec779e6893c902a0bc5ad";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = {
      homepage = "";
      license = "PSF license";
      description = "Backport of the functools module from Python 3.2.3 for use on 2.7 and PyPy.";
    };
  };



  "gevent" = python.mkDerivation {
    name = "gevent-1.1.1";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/12/dc/0b2e57823225de86f6e111a65d212c9e3b64847dddaa19691a6cb94b0b2e/gevent-1.1.1.tar.gz";
      md5= "1532f5396ab4d07a231f1935483be7c3";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
    self."greenlet"
  ];
    meta = {
      homepage = "";
      license = "lib.mit";
      description = "Coroutine-based network library";
    };
  };



  "gevent-socketio" = python.mkDerivation {
    name = "gevent-socketio-0.3.6";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/57/8f/16b508f602cff2dd506636b8d415e39cacb3400d49e885f002bf6436a777/gevent-socketio-0.3.6.tar.gz";
      md5= "33f745d74885366a07da516c000854b6";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
    self."gevent"
    self."gevent-websocket"
  ];
    meta = {
      homepage = "";
      license = "BSD";
      description = "SocketIO server based on the Gevent pywsgi server, a Python network library";
    };
  };



  "gevent-websocket" = python.mkDerivation {
    name = "gevent-websocket-0.9.5";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/de/93/6bc86ddd65435a56a2f2ea7cc908d92fea894fc08e364156656e71cc1435/gevent-websocket-0.9.5.tar.gz";
      md5= "03a8473b9a61426b0ef6094319141389";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
    self."gevent"
  ];
    meta = {
      homepage = "";
      license = "Copyright 2011-2013 Jeffrey Gelens <jeffrey@noppo.pro>";
      description = "Websocket handler for the gevent pywsgi server, a Python network library";
    };
  };



  "greenlet" = python.mkDerivation {
    name = "greenlet-0.4.10";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/67/62/ca2a95648666eaa2ffeb6a9b3964f21d419ae27f82f2e66b53da5b943fc4/greenlet-0.4.10.zip";
      md5= "bed0c4b3b896702131f4d5c72f87c41d";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = {
      homepage = "";
      license = "MIT License";
      description = "Lightweight in-process concurrent programming";
    };
  };



  "iso8601" = python.mkDerivation {
    name = "iso8601-0.1.11";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/c0/75/c9209ee4d1b5975eb8c2cba4428bde6b61bd55664a98290dd015cdb18e98/iso8601-0.1.11.tar.gz";
      md5= "b06d11cd14a64096f907086044f0fe38";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = {
      homepage = "";
      license = "lib.mit";
      description = "Simple module to parse ISO 8601 dates";
    };
  };



  "jsonschema" = python.mkDerivation {
    name = "jsonschema-2.5.1";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/58/0d/c816f5ea5adaf1293a1d81d32e4cdfdaf8496973aa5049786d7fdb14e7e7/jsonschema-2.5.1.tar.gz";
      md5= "374e848fdb69a3ce8b7e778b47c30640";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
    self."functools32"
    self."repoze.lru"
  ];
    meta = {
      homepage = "";
      license = "lib.mit";
      description = "An implementation of JSON Schema validation for Python";
    };
  };



  "mock" = python.mkDerivation {
    name = "mock-2.0.0";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/0c/53/014354fc93c591ccc4abff12c473ad565a2eb24dcd82490fae33dbf2539f/mock-2.0.0.tar.gz";
      md5= "0febfafd14330c9dcaa40de2d82d40ad";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
    self."Jinja2"
    self."Pygments"
    self."funcsigs"
    self."pbr"
    self."six"
  ];
    meta = {
      homepage = "";
      license = "";
      description = "Rolling backport of unittest.mock for all Pythons";
    };
  };



  "pbr" = python.mkDerivation {
    name = "pbr-1.10.0";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/c3/2c/63275fab26a0fd8cadafca71a3623e4d0f0ee8ed7124a5bb128853d178a7/pbr-1.10.0.tar.gz";
      md5= "8e4968c587268f030e38329feb9c8f17";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = {
      homepage = "";
      license = "";
      description = "Python Build Reasonableness";
    };
  };



  "peppercorn" = python.mkDerivation {
    name = "peppercorn-0.5";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/45/ec/a62ec317d1324a01567c5221b420742f094f05ee48097e5157d32be3755c/peppercorn-0.5.tar.gz";
      md5= "f08efbca5790019ab45d76b7244abd40";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = {
      homepage = "";
      license = "BSD-derived (http://www.repoze.org/LICENSE.txt)";
      description = "A library for converting a token stream into a data structure for use in web form posts";
    };
  };



  "py" = python.mkDerivation {
    name = "py-1.4.31";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/f4/9a/8dfda23f36600dd701c6722316ba8a3ab4b990261f83e7d3ffc6dfedf7ef/py-1.4.31.tar.gz";
      md5= "5d2c63c56dc3f2115ec35c066ecd582b";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = {
      homepage = "";
      license = "MIT license";
      description = "library with cross-python path, ini-parsing, io, code, log facilities";
    };
  };



  "pyramid" = python.mkDerivation {
    name = "pyramid-1.7";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/6f/54/aa41f426335fb146a7554b2a370042b45503c9d3b4cde55a62c06a37dbb4/pyramid-1.7.tar.gz";
      md5= "acc2c511d0c4ab3281cffe307f849618";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
    self."PasteDeploy"
    self."WebOb"
    self."WebTest"
    self."repoze.lru"
    self."translationstring"
    self."venusian"
    self."zope.deprecation"
    self."zope.interface"
  ];
    meta = {
      homepage = "";
      license = "BSD-derived (http://www.repoze.org/LICENSE.txt)";
      description = "The Pyramid Web Framework, a Pylons project";
    };
  };



  "pyramid-chameleon" = python.mkDerivation {
    name = "pyramid-chameleon-0.3";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/8a/cd/ae2f1f2c547884bc6fa16aa607d21f8e85a0b7997b0ba6426e35212b1e2d/pyramid_chameleon-0.3.tar.gz";
      md5= "5bb5938356dfd13fce06e095f132e137";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
    self."Chameleon"
    self."pyramid"
  ];
    meta = {
      homepage = "";
      license = "BSD-derived (http://www.repoze.org/LICENSE.txt)";
      description = "pyramid_chameleon";
    };
  };



  "pyramid-debugtoolbar" = python.mkDerivation {
    name = "pyramid-debugtoolbar-3.0.2";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/8e/2c/2b72775dcda1f7897ce605f942c9a76a86193fbd8c8f29dca1173bacd51a/pyramid_debugtoolbar-3.0.2.tar.gz";
      md5= "d562573dd5808946dc0b32ef4eb06ba9";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
    self."Pygments"
    self."WebTest"
    self."pyramid"
    self."pyramid-mako"
    self."repoze.lru"
  ];
    meta = {
      homepage = "";
      license = "BSD";
      description = "A package which provides an interactive HTML debugger for Pyramid application development";
    };
  };



  "pyramid-deform" = python.mkDerivation {
    name = "pyramid-deform-0.2";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/f3/92/707f6e725aa9585179fc4919f7ef710815732bc54885a209b584d903c3c3/pyramid_deform-0.2.tar.gz";
      md5= "cd2818f1b5f19062798dbb947a01497c";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
    self."deform"
    self."mock"
    self."pyramid"
  ];
    meta = {
      homepage = "";
      license = "BSD-derived (http://www.repoze.org/LICENSE.txt)";
      description = "Bindings to the Deform form library for the Pyramid web framework";
    };
  };



  "pyramid-exclog" = python.mkDerivation {
    name = "pyramid-exclog-0.7";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/f1/0b/5b2b6fd39ce6230ea73a6d674f0120fce9c4fc715794f32ec412646ed021/pyramid_exclog-0.7.tar.gz";
      md5= "05df86758b0d30ee6f8339ff36cef7a0";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
    self."pyramid"
  ];
    meta = {
      homepage = "";
      license = "BSD-derived (http://www.repoze.org/LICENSE.txt)";
      description = "A package which logs to a Python logger when an exception is raised by a Pyramid application";
    };
  };



  "pyramid-jinja2" = python.mkDerivation {
    name = "pyramid-jinja2-2.6.2";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/37/00/ac38702305dcf08fe1f1d6d882e8e2d957543bc96c62de52d99d43433c23/pyramid_jinja2-2.6.2.tar.gz";
      md5= "10ca075934ebf8f52acfc9898991966d";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
    self."Jinja2"
    self."MarkupSafe"
    self."WebTest"
    self."pyramid"
    self."zope.deprecation"
  ];
    meta = {
      homepage = "";
      license = "BSD-derived (http://www.repoze.org/LICENSE.txt)";
      description = "Jinja2 template bindings for the Pyramid web framework";
    };
  };



  "pyramid-mako" = python.mkDerivation {
    name = "pyramid-mako-1.0.2";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/f1/92/7e69bcf09676d286a71cb3bbb887b16595b96f9ba7adbdc239ffdd4b1eb9/pyramid_mako-1.0.2.tar.gz";
      md5= "ee25343a97eb76bd90abdc2a774eb48a";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
    self."Mako"
    self."WebTest"
    self."pyramid"
  ];
    meta = {
      homepage = "";
      license = "BSD-derived (http://www.repoze.org/LICENSE.txt)";
      description = "Mako template bindings for the Pyramid web framework";
    };
  };



  "pyramid-socketio" = python.mkDerivation {
    name = "pyramid-socketio-0.9";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/f3/e8/47482965df3757ff629bd356f41e0ff7f090dabeb7da745688791ff12ecc/pyramid_socketio-0.9.tar.gz";
      md5= "d00cc808b2654c61acaabda9334f7cec";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
    self."gevent"
    self."gevent-socketio"
    self."gevent-websocket"
    self."greenlet"
    self."pyramid"
  ];
    meta = {
      homepage = "";
      license = "";
      description = "Gevent-based Socket.IO pyramid integration and helpers";
    };
  };



  "pyramid-sqlalchemy" = python.mkDerivation {
    name = "pyramid-sqlalchemy-1.6";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/f8/ef/1a7350be383d58efb806f1192ff09a8b2764082ef69719a20d2424d213b4/pyramid_sqlalchemy-1.6.tar.gz";
      md5= "bda594ec10c4f85ba9a4191360eae7f3";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
    self."SQLAlchemy"
    self."mock"
    self."pyramid"
    self."zope.sqlalchemy"
  ];
    meta = {
      homepage = "";
      license = "BSD";
      description = "SQLAlchemy integration for pyramid";
    };
  };



  "pyramid-swagger" = python.mkDerivation {
    name = "pyramid-swagger-2.2.3";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/3c/a4/51418c9aa0a2bd8e2d6b2df6b38539a6f4564af107709512635e08d3ced2/pyramid_swagger-2.2.3.tar.gz";
      md5= "dff00cdbe8da199dcfb14ce62f0d6e9a";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
    self."bravado-core"
    self."jsonschema"
    self."pyramid"
    self."simplejson"
  ];
    meta = {
      homepage = "";
      license = "BSD 3-clause";
      description = "Swagger tools for use in pyramid webapps";
    };
  };



  "pyramid-tm" = python.mkDerivation {
    name = "pyramid-tm-0.12.1";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/35/1b/8b2f965c9832d3d131de637732dbe2de93db403b19c5a3b99a5f41df6100/pyramid_tm-0.12.1.tar.gz";
      md5= "0e28a172f0f06319d218abc9836fb951";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
    self."WebTest"
    self."pyramid"
    self."transaction"
  ];
    meta = {
      homepage = "";
      license = "BSD-derived (http://www.repoze.org/LICENSE.txt)";
      description = "A package which allows Pyramid requests to join the active transaction";
    };
  };



  "pyramid-who" = python.mkDerivation {
    name = "pyramid-who-0.3";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/2e/09/664840034d88a3e68a6c4256723da769e7a18a2edcde99b304340ca3e43b/pyramid_who-0.3.tar.gz";
      md5= "66c310d4503d177b06ac95065d9db408";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
    self."pyramid"
    self."repoze.who"
  ];
    meta = {
      homepage = "";
      license = "BSD-derived (http://www.repoze.org/LICENSE.txt)";
      description = "Pyramid authentication policies based on repoze.who";
    };
  };



  "pyramid-zcml" = python.mkDerivation {
    name = "pyramid-zcml-1.0.0";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/10/fe/4f625133356da420cbc8075f7a211cada1e234e3d33a271306f935d31f10/pyramid_zcml-1.0.0.tar.gz";
      md5= "446ad9ea7969f61cb50b761e5a1f36a7";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
    self."WebTest"
    self."pyramid"
    self."zope.configuration"
  ];
    meta = {
      homepage = "";
      license = "BSD-derived (http://www.repoze.org/LICENSE.txt)";
      description = "Zope Config Markup Language support for Pyramid";
    };
  };



  "pytest" = python.mkDerivation {
    name = "pytest-2.9.2";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/f0/ee/6e2522c968339dca7d9abfd5e71312abeeb5ee902e09b4daf44f07b2f907/pytest-2.9.2.tar.gz";
      md5= "b65c2944dfaa0efb62c0239afb424f5b";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
    self."py"
  ];
    meta = {
      homepage = "";
      license = "MIT license";
      description = "pytest: simple powerful testing with Python";
    };
  };



  "pytest-pyramid" = python.mkDerivation {
    name = "pytest-pyramid-0.2.0";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/a5/93/adfd44a3e90263d2f43c14ba9aacc148a4c882a4ee60ad6ba4ad1c72eacf/pytest_pyramid-0.2.0.tar.gz";
      md5= "b1d0dd8b3cba7d00ba076458e4540c67";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
    self."WebTest"
    self."pyramid"
    self."pytest"
  ];
    meta = {
      homepage = "";
      license = "MIT License";
      description = "pytest pyramid providing basic fixtures for testing pyramid applications with pytest test suite";
    };
  };



  "python-dateutil" = python.mkDerivation {
    name = "python-dateutil-2.5.3";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/3e/f5/aad82824b369332a676a90a8c0d1e608b17e740bbb6aeeebca726f17b902/python-dateutil-2.5.3.tar.gz";
      md5= "05ffc6d2cc85a7fd93bb245807f715ef";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
    self."six"
  ];
    meta = {
      homepage = "";
      license = "Simplified BSD";
      description = "Extensions to the standard Python datetime module";
    };
  };



  "repoze.lru" = python.mkDerivation {
    name = "repoze.lru-0.6";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/6e/1e/aa15cc90217e086dc8769872c8778b409812ff036bf021b15795638939e4/repoze.lru-0.6.tar.gz";
      md5= "2c3b64b17a8e18b405f55d46173e14dd";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = {
      homepage = "";
      license = "BSD-derived (http://www.repoze.org/LICENSE.txt)";
      description = "A tiny LRU cache implementation and decorator";
    };
  };



  "repoze.who" = python.mkDerivation {
    name = "repoze.who-2.3";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/19/ae/94cdd6ea2d3f79a1430993ee044da1ea6fb547675e0d0ca958c71009ddde/repoze.who-2.3.tar.gz";
      md5= "dce338570327dbeb5e42f3c33ba36370";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
    self."WebOb"
    self."zope.interface"
  ];
    meta = {
      homepage = "";
      license = "BSD-derived (http://www.repoze.org/LICENSE.txt)";
      description = "repoze.who is an identification and authentication framework for WSGI.";
    };
  };



  "simplejson" = python.mkDerivation {
    name = "simplejson-3.8.2";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/f0/07/26b519e6ebb03c2a74989f7571e6ae6b82e9d7d81b8de6fcdbfc643c7b58/simplejson-3.8.2.tar.gz";
      md5= "53b1371bbf883b129a12d594a97e9a18";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = {
      homepage = "";
      license = "MIT License";
      description = "Simple, fast, extensible JSON encoder/decoder for Python";
    };
  };



  "six" = python.mkDerivation {
    name = "six-1.10.0";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/b3/b2/238e2590826bfdd113244a40d9d3eb26918bd798fc187e2360a8367068db/six-1.10.0.tar.gz";
      md5= "34eed507548117b2ab523ab14b2f8b55";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = {
      homepage = "";
      license = "lib.mit";
      description = "Python 2 and 3 compatibility utilities";
    };
  };



  "swagger-spec-validator" = python.mkDerivation {
    name = "swagger-spec-validator-2.0.2";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/98/79/b3243192c42cf3ce983e76f2bf38b3dc343f594f35dec6ec3793055f50b8/swagger_spec_validator-2.0.2.tar.gz";
      md5= "67d5dfa6bb98d36c3c7cc888c16601e2";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
    self."jsonschema"
    self."six"
  ];
    meta = {
      homepage = "";
      license = "Apache License, Version 2.0";
      description = "Validation of Swagger specifications";
    };
  };



  "transaction" = python.mkDerivation {
    name = "transaction-1.6.1";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/b8/55/7dfb7a5701b25459dc9e0d2d21a965b59a2bd818b229fa35467b61c068da/transaction-1.6.1.tar.gz";
      md5= "c4d06a981434735f6d750013a1cfa0c5";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
    self."mock"
    self."zope.interface"
  ];
    meta = {
      homepage = "";
      license = "lib.zpt21";
      description = "Transaction management for Python";
    };
  };



  "translationstring" = python.mkDerivation {
    name = "translationstring-1.3";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/5e/eb/bee578cc150b44c653b63f5ebe258b5d0d812ddac12497e5f80fcad5d0b4/translationstring-1.3.tar.gz";
      md5= "a4b62e0f3c189c783a1685b3027f7c90";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = {
      homepage = "";
      license = "BSD-like (http://repoze.org/license.html)";
      description = "Utility library for i18n relied on by various Repoze and Pyramid packages";
    };
  };



  "venusian" = python.mkDerivation {
    name = "venusian-1.0";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/86/20/1948e0dfc4930ddde3da8c33612f6a5717c0b4bc28f591a5c5cf014dd390/venusian-1.0.tar.gz";
      md5= "dccf2eafb7113759d60c86faf5538756";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = {
      homepage = "";
      license = "BSD-derived (http://www.repoze.org/LICENSE.txt)";
      description = "A library for deferring decorator actions";
    };
  };



  "waitress" = python.mkDerivation {
    name = "waitress-0.9.0";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/fd/6c/f26e54acb01ee6731d9e2c8f8718a8ff8c44fbfa0f76f446e821487adec2/waitress-0.9.0.tar.gz";
      md5= "88eccb32edec524c4d7fa03dfbed9cb1";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = {
      homepage = "";
      license = "lib.zpt21";
      description = "Waitress WSGI server";
    };
  };



  "zope.configuration" = python.mkDerivation {
    name = "zope.configuration-4.0.3";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/37/d7/653c2a05d876e787a1532b51ef7f89917ff17885daaac41af9da5e2f140b/zope.configuration-4.0.3.tar.gz";
      md5= "d85ff342b524bfa819916632d5ef096a";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
    self."zope.i18nmessageid"
    self."zope.interface"
    self."zope.schema"
  ];
    meta = {
      homepage = "";
      license = "lib.zpt21";
      description = "Zope Configuration Markup Language (ZCML)";
    };
  };



  "zope.deprecation" = python.mkDerivation {
    name = "zope.deprecation-4.1.2";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/c1/d3/3919492d5e57d8dd01b36f30b34fc8404a30577392b1eb817c303499ad20/zope.deprecation-4.1.2.tar.gz";
      md5= "e9a663ded58f4f9f7881beb56cae2782";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = {
      homepage = "";
      license = "lib.zpt21";
      description = "Zope Deprecation Infrastructure";
    };
  };



  "zope.event" = python.mkDerivation {
    name = "zope.event-4.2.0";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/cd/a5/4927363244aaa7fd8a696d32005ea8214c4811550d35edea27797ebbd4fd/zope.event-4.2.0.tar.gz";
      md5= "c97ef5c7fd1003c754cf72d7bee0a47c";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = {
      homepage = "";
      license = "lib.zpt21";
      description = "Very basic event publishing system";
    };
  };



  "zope.i18nmessageid" = python.mkDerivation {
    name = "zope.i18nmessageid-4.0.3";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/97/16/e76c4d7833d8e4246e0ebec826b68facbf21c97a1a62a9292f0b2779e3a1/zope.i18nmessageid-4.0.3.tar.gz";
      md5= "fc20d6e548d1671da4ab1d9110667f13";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = {
      homepage = "";
      license = "lib.zpt21";
      description = "Message Identifiers for internationalization";
    };
  };



  "zope.interface" = python.mkDerivation {
    name = "zope.interface-4.2.0";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/ea/a3/38bdc8e8bd068ea5b4d21a2d80eca1547cd8509318e8d7c875f7247abe43/zope.interface-4.2.0.tar.gz";
      md5= "2950a6db7e985e19c7a846cc20f5d82a";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
    self."zope.event"
  ];
    meta = {
      homepage = "";
      license = "lib.zpt21";
      description = "Interfaces for Python";
    };
  };



  "zope.schema" = python.mkDerivation {
    name = "zope.schema-4.4.2";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/0d/b2/41fdc6c42c4320f326c65810eff785247e65e4ea856cff15120e47b93509/zope.schema-4.4.2.tar.gz";
      md5= "939680fec2a5cf9e214cc80d6665065c";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
    self."zope.event"
    self."zope.interface"
  ];
    meta = {
      homepage = "";
      license = "lib.zpt21";
      description = "zope.interface extension for defining data schemas";
    };
  };



  "zope.sqlalchemy" = python.mkDerivation {
    name = "zope.sqlalchemy-0.7.7";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/14/95/47ef5f5fbf5f18dc95d6d39b7dbd690818b541afa724d14ed176e415b134/zope.sqlalchemy-0.7.7.tar.gz";
      md5= "4e09a383d1e3585fde5c293892a5e0d2";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
    self."SQLAlchemy"
    self."transaction"
    self."zope.interface"
  ];
    meta = {
      homepage = "";
      license = "lib.zpt21";
      description = "Minimal Zope/SQLAlchemy transaction integration";
    };
  };

}
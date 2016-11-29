# generated using pypi2nix tool (version: 1.6.0)
#
# COMMAND:
#   pypi2nix -v -V 3.5 -r requirements.txt -r requirements-dev.txt -E postgresql
#

{ pkgs, python, commonBuildInputs ? [], commonDoCheck ? false }:

self: {

  "Chameleon" = python.mkDerivation {
    name = "Chameleon-2.25";
    src = pkgs.fetchurl { url = "https://pypi.python.org/packages/bc/98/373f98967203f581f7675a29cf0c823e7454b047f5795b42615caccb46f6/Chameleon-2.25.tar.gz"; sha256 = "6b2740e077626306c10a659bb9fe80d2eb8b6ceb89b521dfbed2f1432b2b496d"; };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = "BSD-like (http://repoze.org/license.html)";
      description = "Fast HTML/XML Template Compiler.";
    };
  };



  "Jinja2" = python.mkDerivation {
    name = "Jinja2-2.8";
    src = pkgs.fetchurl { url = "https://pypi.python.org/packages/f2/2f/0b98b06a345a761bec91a079ccae392d282690c2d8272e708f4d10829e22/Jinja2-2.8.tar.gz"; sha256 = "bc1ff2ff88dbfacefde4ddde471d1417d3b304e8df103a7a9437d47269201bf4"; };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."MarkupSafe"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.bsdOriginal;
      description = "A small but fast and easy to use stand-alone template engine written in pure python.";
    };
  };



  "Mako" = python.mkDerivation {
    name = "Mako-1.0.6";
    src = pkgs.fetchurl { url = "https://pypi.python.org/packages/56/4b/cb75836863a6382199aefb3d3809937e21fa4cb0db15a4f4ba0ecc2e7e8e/Mako-1.0.6.tar.gz"; sha256 = "48559ebd872a8e77f92005884b3d88ffae552812cdf17db6768e5c3be5ebbe0d"; };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."MarkupSafe"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "A super-fast templating language that borrows the  best ideas from the existing templating languages.";
    };
  };



  "MarkupSafe" = python.mkDerivation {
    name = "MarkupSafe-0.23";
    src = pkgs.fetchurl { url = "https://pypi.python.org/packages/c0/41/bae1254e0396c0cc8cf1751cb7d9afc90a602353695af5952530482c963f/MarkupSafe-0.23.tar.gz"; sha256 = "a4ec1aff59b95a14b45eb2e23761a0179e98319da5a7eb76b56ea8cdc7b871c3"; };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.bsdOriginal;
      description = "Implements a XML/HTML/XHTML Markup safe string for Python";
    };
  };



  "PasteDeploy" = python.mkDerivation {
    name = "PasteDeploy-1.5.2";
    src = pkgs.fetchurl { url = "https://pypi.python.org/packages/0f/90/8e20cdae206c543ea10793cbf4136eb9a8b3f417e04e40a29d72d9922cbd/PasteDeploy-1.5.2.tar.gz"; sha256 = "d5858f89a255e6294e63ed46b73613c56e3b9a2d82a42f1df4d06c8421a9e3cb"; };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "Load, configure, and compose WSGI applications and servers";
    };
  };



  "Pygments" = python.mkDerivation {
    name = "Pygments-2.1.3";
    src = pkgs.fetchurl { url = "https://pypi.python.org/packages/b8/67/ab177979be1c81bc99c8d0592ef22d547e70bb4c6815c383286ed5dec504/Pygments-2.1.3.tar.gz"; sha256 = "88e4c8a91b2af5962bfa5ea2447ec6dd357018e86e94c7d14bd8cacbc5b55d81"; };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.bsdOriginal;
      description = "Pygments is a syntax highlighting package written in Python.";
    };
  };



  "SQLAlchemy" = python.mkDerivation {
    name = "SQLAlchemy-1.1.4";
    src = pkgs.fetchurl { url = "https://pypi.python.org/packages/ca/ca/c2436fdb7bb75d772d9fa17ba60c4cfded6284eed053a7274b2beb96596a/SQLAlchemy-1.1.4.tar.gz"; sha256 = "701b57d628b9fa1cfb82f10665e7214d5d2db23251ca6f23b91c5f56fcdbdeb5"; };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."psycopg2"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "Database Abstraction Library";
    };
  };



  "WebOb" = python.mkDerivation {
    name = "WebOb-1.6.3";
    src = pkgs.fetchurl { url = "https://pypi.python.org/packages/9c/38/5a27acd4a3b60780273d306cbef8b42afdc8425f19e33812964552520a85/WebOb-1.6.3.tar.gz"; sha256 = "1b03115e162dd0102f6147c5d5ed71a3a2ba0f58ef829244b64f52fe6dbf5888"; };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "WSGI request and response object";
    };
  };



  "WebTest" = python.mkDerivation {
    name = "WebTest-2.0.23";
    src = pkgs.fetchurl { url = "https://pypi.python.org/packages/e7/d8/23d3f73976fb9ccba29f04565d1ddbd0300cf9c09db57e252718700d1203/WebTest-2.0.23.tar.gz"; sha256 = "879da5c2310b75c74dffa23a45a7a74d09c2a0fcc7e7a128b4f92a4f64722e97"; };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."PasteDeploy"
      self."WebOb"
      self."beautifulsoup4"
      self."six"
      self."waitress"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "Helper to test WSGI applications";
    };
  };



  "alembic" = python.mkDerivation {
    name = "alembic-0.8.9";
    src = pkgs.fetchurl { url = "https://pypi.python.org/packages/63/ca/c60ba17274b6737ff9ff1f89f0fbc7da93e05dd12bbdaae5099df8b60d38/alembic-0.8.9.tar.gz"; sha256 = "0932bed55a4546b8aa6f59b8ad8b92b0161e7bd46adc538d50afb1c96b3571c1"; };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."Mako"
      self."SQLAlchemy"
      self."python-editor"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "A database migration tool for SQLAlchemy.";
    };
  };



  "amqp" = python.mkDerivation {
    name = "amqp-2.1.1";
    src = pkgs.fetchurl { url = "https://pypi.python.org/packages/26/31/5ef415192dc8c150f23d47c926282dbd69dcd1a9c1158c18586036aeca4c/amqp-2.1.1.tar.gz"; sha256 = "6d16feb4118cc9f5da9e98a10908d128252691bba2d4d31399ddc3092fb5226f"; };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."vine"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.bsdOriginal;
      description = "Low-level AMQP client for Python (fork of amqplib).";
    };
  };



  "arrow" = python.mkDerivation {
    name = "arrow-0.9.0";
    src = pkgs.fetchurl { url = "https://pypi.python.org/packages/02/44/13330b2e617cf0da9036dba69c8d6a3e30f88e94c4fce467f6ed413649a4/arrow-0.9.0.tar.gz"; sha256 = "c266f0db8f7aeb79764ce3c0aca6cb88978cfd27bfb9fb7588405b5ed331fd3e"; };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."python-dateutil"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.asl20;
      description = "Better dates and times for Python";
    };
  };



  "beautifulsoup4" = python.mkDerivation {
    name = "beautifulsoup4-4.5.1";
    src = pkgs.fetchurl { url = "https://pypi.python.org/packages/86/ea/8e9fbce5c8405b9614f1fd304f7109d9169a3516a493ce4f7f77c39435b7/beautifulsoup4-4.5.1.tar.gz"; sha256 = "3c9474036afda9136aac6463def733f81017bf9ef3510d25634f335b0c87f5e1"; };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "Screen-scraping library";
    };
  };



  "billiard" = python.mkDerivation {
    name = "billiard-3.5.0.2";
    src = pkgs.fetchurl { url = "https://pypi.python.org/packages/e6/b8/6e6750f21309c21ea267834d5e76b89ce64a9ddf38fa4161fd6fb32ffc3b/billiard-3.5.0.2.tar.gz"; sha256 = "3eb01a8fe44116aa6d63d2010515ef1526e40caee5f766f75b2d28393332dcaa"; };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.bsdOriginal;
      description = "Python multiprocessing fork with improvements and bugfixes";
    };
  };



  "celery" = python.mkDerivation {
    name = "celery-4.0.0";
    src = pkgs.fetchurl { url = "https://pypi.python.org/packages/47/a6/1b5f1cc0a720ef17abd4ab4ee47e769d6bd4bad38b5b7fec3248ff33b4fc/celery-4.0.0.tar.gz"; sha256 = "3e38a9a7f2868f774dffbb49e3afd2e56f57875deb06cb3ee3808f572601a8f0"; };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."SQLAlchemy"
      self."billiard"
      self."gevent"
      self."kombu"
      self."pytz"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.bsdOriginal;
      description = "Distributed Task Queue.";
    };
  };



  "click" = python.mkDerivation {
    name = "click-6.6";
    src = pkgs.fetchurl { url = "https://pypi.python.org/packages/7a/00/c14926d8232b36b08218067bcd5853caefb4737cda3f0a47437151344792/click-6.6.tar.gz"; sha256 = "cc6a19da8ebff6e7074f731447ef7e112bd23adf3de5c597cf9989f2fd8defe9"; };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.bsdOriginal;
      description = "A simple wrapper around optparse for powerful command line utilities.";
    };
  };



  "colander" = python.mkDerivation {
    name = "colander-1.3.1";
    src = pkgs.fetchurl { url = "https://pypi.python.org/packages/62/23/14a8cf54ce7d521680a29061e02133885016ae53bdccd132662c53382a4e/colander-1.3.1.tar.gz"; sha256 = "48bdbb5e8f50fcf2f05aab6bb2c0ab58d6ec7eed81a72b7d0272744fe72fafc2"; };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."iso8601"
      self."translationstring"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = "BSD-derived (http://www.repoze.org/LICENSE.txt)";
      description = "A simple schema-based serialization and deserialization library";
    };
  };



  "cryptacular" = python.mkDerivation {
    name = "cryptacular-1.4.1";
    src = pkgs.fetchurl { url = "https://pypi.python.org/packages/73/bd/714b3fbfb3392d6b4e658638d9b74f77ce1072725209c08a6becd90836a7/cryptacular-1.4.1.tar.gz"; sha256 = "273f03d03f9b316671ae4f1c1c6b8d3c883da19a5706873e8f3d6543e13dd4a1"; };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."pbkdf2"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "A password hashing framework with bcrypt and pbkdf2.";
    };
  };



  "decorator" = python.mkDerivation {
    name = "decorator-4.0.10";
    src = pkgs.fetchurl { url = "https://pypi.python.org/packages/13/8a/4eed41e338e8dcc13ca41c94b142d4d20c0de684ee5065523fee406ce76f/decorator-4.0.10.tar.gz"; sha256 = "9c6e98edcb33499881b86ede07d9968c81ab7c769e28e9af24075f0a5379f070"; };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.bsdOriginal;
      description = "Better living through Python with decorators";
    };
  };



  "deform" = python.mkDerivation {
    name = "deform-2.0.3";
    src = pkgs.fetchurl { url = "https://pypi.python.org/packages/10/fc/a357ab21a8d9f11f4c38d08963cd5f6969b5106e441b9f90fbcabee699dc/deform-2.0.3.tar.gz"; sha256 = "25b102bbc35055a695fe42516d83329d323d13572d34f4f7dcda9b5a399ad945"; };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."Chameleon"
      self."Pygments"
      self."beautifulsoup4"
      self."colander"
      self."iso8601"
      self."peppercorn"
      self."pyramid"
      self."translationstring"
      self."waitress"
      self."zope.deprecation"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = "BSD-derived (http://www.repoze.org/LICENSE.txt)";
      description = "Form library with advanced features like nested forms";
    };
  };



  "gevent" = python.mkDerivation {
    name = "gevent-1.1.2";
    src = pkgs.fetchurl { url = "https://pypi.python.org/packages/43/8f/cb3224a0e6ab663547f45c10d0651cfd52633fde4283bf68d627084df8cc/gevent-1.1.2.tar.gz"; sha256 = "cb15cf73d69a2eeefed330858f09634e2c50bf46da9f9e7635730fcfb872c02c"; };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."greenlet"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "Coroutine-based network library";
    };
  };



  "gevent-socketio" = python.mkDerivation {
    name = "gevent-socketio-0.3.6";
    src = pkgs.fetchurl { url = "https://pypi.python.org/packages/57/8f/16b508f602cff2dd506636b8d415e39cacb3400d49e885f002bf6436a777/gevent-socketio-0.3.6.tar.gz"; sha256 = "53394ab93fbd84d9dbbb2bef85349f6a503bfc53d86a9be8653250f1a0412aff"; };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."gevent"
      self."gevent-websocket"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.bsdOriginal;
      description = "SocketIO server based on the Gevent pywsgi server, a Python network library";
    };
  };



  "gevent-websocket" = python.mkDerivation {
    name = "gevent-websocket-0.9.5";
    src = pkgs.fetchurl { url = "https://pypi.python.org/packages/de/93/6bc86ddd65435a56a2f2ea7cc908d92fea894fc08e364156656e71cc1435/gevent-websocket-0.9.5.tar.gz"; sha256 = "0091d6e6aa7298510cadcccb8068e1097a50d4e19090d0c055a93068d4530056"; };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."gevent"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = "Copyright 2011-2013 Jeffrey Gelens <jeffrey@noppo.pro>";
      description = "Websocket handler for the gevent pywsgi server, a Python network library";
    };
  };



  "greenlet" = python.mkDerivation {
    name = "greenlet-0.4.10";
    src = pkgs.fetchurl { url = "https://pypi.python.org/packages/f2/3f/09412b656067f280cf017ce5b6465e6339089129212425111117be5557d9/greenlet-0.4.10.tar.gz"; sha256 = "c4417624aa88380cdf0fe110a8a6e0dbcc26f80887197fe5df0427dfa348ae62"; };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "Lightweight in-process concurrent programming";
    };
  };



  "ipython" = python.mkDerivation {
    name = "ipython-5.1.0";
    src = pkgs.fetchurl { url = "https://pypi.python.org/packages/89/63/a9292f7cd9d0090a0f995e1167f3f17d5889dcbc9a175261719c513b9848/ipython-5.1.0.tar.gz"; sha256 = "7ef4694e1345913182126b219aaa4a0047e191af414256da6772cf249571b961"; };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."Pygments"
      self."decorator"
      self."pexpect"
      self."pickleshare"
      self."prompt-toolkit"
      self."simplegeneric"
      self."traitlets"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.bsdOriginal;
      description = "IPython: Productive Interactive Computing";
    };
  };



  "ipython-genutils" = python.mkDerivation {
    name = "ipython-genutils-0.1.0";
    src = pkgs.fetchurl { url = "https://pypi.python.org/packages/71/b7/a64c71578521606edbbce15151358598f3dfb72a3431763edc2baf19e71f/ipython_genutils-0.1.0.tar.gz"; sha256 = "3a0624a251a26463c9dfa0ffa635ec51c4265380980d9a50d65611c3c2bd82a6"; };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.bsdOriginal;
      description = "Vestigial utilities from IPython";
    };
  };



  "iso8601" = python.mkDerivation {
    name = "iso8601-0.1.11";
    src = pkgs.fetchurl { url = "https://pypi.python.org/packages/c0/75/c9209ee4d1b5975eb8c2cba4428bde6b61bd55664a98290dd015cdb18e98/iso8601-0.1.11.tar.gz"; sha256 = "e8fb52f78880ae063336c94eb5b87b181e6a0cc33a6c008511bac9a6e980ef30"; };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "Simple module to parse ISO 8601 dates";
    };
  };



  "kombu" = python.mkDerivation {
    name = "kombu-4.0.0";
    src = pkgs.fetchurl { url = "https://pypi.python.org/packages/95/fc/596472db8daa607efd599bb10cadd0bba0934fe1334ab1084201eeb38311/kombu-4.0.0.tar.gz"; sha256 = "fb855eccbe83d3b97d44ac3f5bb809f97b73938017e383953baf3cb60dbb1ea9"; };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."amqp"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.bsdOriginal;
      description = "Messaging library for Python.";
    };
  };



  "marshmallow" = python.mkDerivation {
    name = "marshmallow-2.10.4";
    src = pkgs.fetchurl { url = "https://pypi.python.org/packages/6a/05/df86959e68ca1ef543306d11a85a9f73cb0976480138cc1bf37881b6b58b/marshmallow-2.10.4.tar.gz"; sha256 = "338d2d34bf6de771a05e67556093d4fe12f023a9a253bf180c11893f276dd7ee"; };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."python-dateutil"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "A lightweight library for converting complex datatypes to and from native Python datatypes.";
    };
  };



  "marshmallow-validators" = python.mkDerivation {
    name = "marshmallow-validators-2.0.0";
    src = pkgs.fetchurl { url = "https://pypi.python.org/packages/20/ea/2fb38d3931b816f2c2c0db3d51f4f8f26e95135b6577dec0f496f287d357/marshmallow-validators-2.0.0.tar.gz"; sha256 = "8e95fa1804b49fb1d953951546ea2992820778545f597db7daccab0cfd439525"; };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."marshmallow"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = "Copyright 2015 Steven Loria and contributors";
      description = "Use 3rd-party validators (e.g. from WTForms and colander) with marshmallow";
    };
  };



  "pbkdf2" = python.mkDerivation {
    name = "pbkdf2-1.3";
    src = pkgs.fetchurl { url = "https://pypi.python.org/packages/02/c0/6a2376ae81beb82eda645a091684c0b0becb86b972def7849ea9066e3d5e/pbkdf2-1.3.tar.gz"; sha256 = "ac6397369f128212c43064a2b4878038dab78dab41875364554aaf2a684e6979"; };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "PKCS#5 v2.0 PBKDF2 Module";
    };
  };



  "peppercorn" = python.mkDerivation {
    name = "peppercorn-0.5";
    src = pkgs.fetchurl { url = "https://pypi.python.org/packages/45/ec/a62ec317d1324a01567c5221b420742f094f05ee48097e5157d32be3755c/peppercorn-0.5.tar.gz"; sha256 = "921cba5d51fa211e6da0fbd2120b9a98d663422a80f5bb669ad81ffb0909774b"; };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = "BSD-derived (http://www.repoze.org/LICENSE.txt)";
      description = "A library for converting a token stream into a data structure for use in web form posts";
    };
  };



  "pexpect" = python.mkDerivation {
    name = "pexpect-4.2.1";
    src = pkgs.fetchurl { url = "https://pypi.python.org/packages/e8/13/d0b0599099d6cd23663043a2a0bb7c61e58c6ba359b2656e6fb000ef5b98/pexpect-4.2.1.tar.gz"; sha256 = "3d132465a75b57aa818341c6521392a06cc660feb3988d7f1074f39bd23c9a92"; };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."ptyprocess"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.isc;
      description = "Pexpect allows easy control of interactive console applications.";
    };
  };



  "pickleshare" = python.mkDerivation {
    name = "pickleshare-0.7.4";
    src = pkgs.fetchurl { url = "https://pypi.python.org/packages/69/fe/dd137d84daa0fd13a709e448138e310d9ea93070620c9db5454e234af525/pickleshare-0.7.4.tar.gz"; sha256 = "84a9257227dfdd6fe1b4be1319096c20eb85ff1e82c7932f36efccfe1b09737b"; };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "Tiny 'shelve'-like database with concurrency support";
    };
  };



  "prompt-toolkit" = python.mkDerivation {
    name = "prompt-toolkit-1.0.9";
    src = pkgs.fetchurl { url = "https://pypi.python.org/packages/83/14/5ac258da6c530eca02852ee25c7a9ff3ca78287bb4c198d0d0055845d856/prompt_toolkit-1.0.9.tar.gz"; sha256 = "cd6523b36adc174cc10d54b1193eb626b4268609ff6ea92c15bcf1996609599c"; };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."six"
      self."wcwidth"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.bsdOriginal;
      description = "Library for building powerful interactive command lines in Python";
    };
  };



  "psycopg2" = python.mkDerivation {
    name = "psycopg2-2.6.2";
    src = pkgs.fetchurl { url = "https://pypi.python.org/packages/7b/a8/dc2d50a6f37c157459cd18bab381c8e6134b9381b50fbe969997b2ae7dbc/psycopg2-2.6.2.tar.gz"; sha256 = "70490e12ed9c5c818ecd85d185d363335cc8a8cbf7212e3c185431c79ff8c05c"; };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.lgpl2;
      description = "psycopg2 - Python-PostgreSQL Database Adapter";
    };
  };



  "ptyprocess" = python.mkDerivation {
    name = "ptyprocess-0.5.1";
    src = pkgs.fetchurl { url = "https://pypi.python.org/packages/db/d7/b465161910f3d1cef593c5e002bff67e0384898f597f1a7fdc8db4c02bf6/ptyprocess-0.5.1.tar.gz"; sha256 = "0530ce63a9295bfae7bd06edc02b6aa935619f486f0f1dc0972f516265ee81a6"; };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = "";
      description = "Run a subprocess in a pseudo terminal";
    };
  };



  "py" = python.mkDerivation {
    name = "py-1.4.31";
    src = pkgs.fetchurl { url = "https://pypi.python.org/packages/f4/9a/8dfda23f36600dd701c6722316ba8a3ab4b990261f83e7d3ffc6dfedf7ef/py-1.4.31.tar.gz"; sha256 = "a6501963c725fc2554dabfece8ae9a8fb5e149c0ac0a42fd2b02c5c1c57fc114"; };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "library with cross-python path, ini-parsing, io, code, log facilities";
    };
  };



  "pyramid" = python.mkDerivation {
    name = "pyramid-1.7.3";
    src = pkgs.fetchurl { url = "https://pypi.python.org/packages/9c/6d/9b9f9acf22c5d221f25cf6756645bce9ea54ee741466197674fe77f2eee3/pyramid-1.7.3.tar.gz"; sha256 = "74b8eedf2b0a1a658ab79ae4b0ecf68fa8cdd5debcfec579c8b40bec83d1864e"; };
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
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = "License :: Repoze Public License";
      description = "The Pyramid Web Framework, a Pylons project";
    };
  };



  "pyramid-authstack" = python.mkDerivation {
    name = "pyramid-authstack-1.0.1";
    src = pkgs.fetchurl { url = "https://pypi.python.org/packages/01/4b/e84cb8fda19f0f03f96231195fd074212b9291f732aa07f90edcfb21ff34/pyramid_authstack-1.0.1.tar.gz"; sha256 = "039a291588f99a00585f145deca40a48ba23194aa2582e4f244d5da98303cad3"; };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."pyramid"
      self."zope.interface"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "Use multiple authentication policies with pyramid";
    };
  };



  "pyramid-chameleon" = python.mkDerivation {
    name = "pyramid-chameleon-0.3";
    src = pkgs.fetchurl { url = "https://pypi.python.org/packages/8a/cd/ae2f1f2c547884bc6fa16aa607d21f8e85a0b7997b0ba6426e35212b1e2d/pyramid_chameleon-0.3.tar.gz"; sha256 = "d176792a50eb015d7865b44bd9b24a7bd0489fa9a5cebbd17b9e05048cef9017"; };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."Chameleon"
      self."pyramid"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = "License :: Repoze Public License";
      description = "pyramid_chameleon";
    };
  };



  "pyramid-debugtoolbar" = python.mkDerivation {
    name = "pyramid-debugtoolbar-3.0.5";
    src = pkgs.fetchurl { url = "https://pypi.python.org/packages/64/0e/df00bfb55605900e7a2f7e4a18dd83575a6651688e297d5a0aa4c208fd7d/pyramid_debugtoolbar-3.0.5.tar.gz"; sha256 = "6bf9dd67e75ef89c91a70d479a84912a86f4cc81183cfd44e5f0b7704fcd4ffc"; };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."Pygments"
      self."WebTest"
      self."pyramid"
      self."pyramid-mako"
      self."repoze.lru"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.bsdOriginal;
      description = "A package which provides an interactive HTML debugger for Pyramid application development";
    };
  };



  "pyramid-deform" = python.mkDerivation {
    name = "pyramid-deform-0.2";
    src = pkgs.fetchurl { url = "https://pypi.python.org/packages/f3/92/707f6e725aa9585179fc4919f7ef710815732bc54885a209b584d903c3c3/pyramid_deform-0.2.tar.gz"; sha256 = "09a73ceb0d351a20b3b85ded31fbf417b4756bafefd620cfd488202e2ad0fb7c"; };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."deform"
      self."pyramid"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = "BSD-derived (http://www.repoze.org/LICENSE.txt)";
      description = "Bindings to the Deform form library for the Pyramid web framework";
    };
  };



  "pyramid-exclog" = python.mkDerivation {
    name = "pyramid-exclog-0.8";
    src = pkgs.fetchurl { url = "https://pypi.python.org/packages/96/c0/a904095ee344b9339cfef2129b936420d24a27e571640cd8466bff2149a5/pyramid_exclog-0.8.tar.gz"; sha256 = "67cb22dbdd193ee15d524d15d683fb0b80a1f3e074ea3a95f0dbec6fe42ab472"; };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."pyramid"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = "License :: Repoze Public License";
      description = "A package which logs to a Python logger when an exception is raised by a Pyramid application";
    };
  };



  "pyramid-ipython" = python.mkDerivation {
    name = "pyramid-ipython-0.2";
    src = pkgs.fetchurl { url = "https://pypi.python.org/packages/13/62/f3b231221556fc603ae683a414d16acf6cd354decf68ba87bb18f2e4af0e/pyramid_ipython-0.2.tar.gz"; sha256 = "1c8bc09648e6f5aaebbbd01e55d36a73d7cfb5c369a8eb32696d32f759eca815"; };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."ipython"
      self."pyramid"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = "License :: Repoze Public License";
      description = "pyramid ipython pshell";
    };
  };



  "pyramid-jinja2" = python.mkDerivation {
    name = "pyramid-jinja2-2.7";
    src = pkgs.fetchurl { url = "https://pypi.python.org/packages/d8/80/d60a7233823de22ce77bd864a8a83736a1fe8b49884b08303a2e68b2c853/pyramid_jinja2-2.7.tar.gz"; sha256 = "5c21081f65a5bec0b76957990c2b89ed41f4fd11257121387110cb722fd0e5eb"; };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."Jinja2"
      self."MarkupSafe"
      self."WebTest"
      self."pyramid"
      self."zope.deprecation"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = "License :: Repoze Public License";
      description = "Jinja2 template bindings for the Pyramid web framework";
    };
  };



  "pyramid-mailer" = python.mkDerivation {
    name = "pyramid-mailer-0.14.1";
    src = pkgs.fetchurl { url = "https://pypi.python.org/packages/43/02/a32823750dbdee4280090843d5788cc550ab6f24f23fcabbeb7f912bf5fe/pyramid_mailer-0.14.1.tar.gz"; sha256 = "ca8cc82ce94ce8f4c92d349e711d126eac02fd3553b78b0673b120acc3c9e93f"; };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."pyramid"
      self."repoze.sendmail"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.bsdOriginal;
      description = "Sendmail package for Pyramid";
    };
  };



  "pyramid-mako" = python.mkDerivation {
    name = "pyramid-mako-1.0.2";
    src = pkgs.fetchurl { url = "https://pypi.python.org/packages/f1/92/7e69bcf09676d286a71cb3bbb887b16595b96f9ba7adbdc239ffdd4b1eb9/pyramid_mako-1.0.2.tar.gz"; sha256 = "6da0987b9874cf53e72139624665a73965bbd7fbde504d1753e4231ce916f3a1"; };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."Mako"
      self."WebTest"
      self."pyramid"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = "License :: Repoze Public License";
      description = "Mako template bindings for the Pyramid web framework";
    };
  };



  "pyramid-socketio" = python.mkDerivation {
    name = "pyramid-socketio-0.9";
    src = pkgs.fetchurl { url = "https://pypi.python.org/packages/f3/e8/47482965df3757ff629bd356f41e0ff7f090dabeb7da745688791ff12ecc/pyramid_socketio-0.9.tar.gz"; sha256 = "b4ec2ca36d8f423cffde85887d266af3b84cdf4d2fd54b7f58c476d9329756ec"; };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."gevent"
      self."gevent-socketio"
      self."gevent-websocket"
      self."greenlet"
      self."pyramid"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = "";
      description = "Gevent-based Socket.IO pyramid integration and helpers";
    };
  };



  "pyramid-sqlalchemy" = python.mkDerivation {
    name = "pyramid-sqlalchemy-1.6";
    src = pkgs.fetchurl { url = "https://pypi.python.org/packages/f8/ef/1a7350be383d58efb806f1192ff09a8b2764082ef69719a20d2424d213b4/pyramid_sqlalchemy-1.6.tar.gz"; sha256 = "377a18834e15ff59ba89c882be7d40bdc92ab5ad39a881ff2eba111b84f2418b"; };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."SQLAlchemy"
      self."pyramid"
      self."zope.sqlalchemy"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.bsdOriginal;
      description = "SQLAlchemy integration for pyramid";
    };
  };



  "pyramid-storage" = python.mkDerivation {
    name = "pyramid-storage-0.1.2";
    src = pkgs.fetchurl { url = "https://pypi.python.org/packages/05/31/df7c4dca7bc1d7a6dc6fd92bf6764a14abd0745d2d966e64b789377cd2a7/pyramid_storage-0.1.2.tar.gz"; sha256 = "f9d381492b7b74fa2020db27e7a5b70fd0f1b130aabe9df4dc4c83f884aac978"; };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."pyramid"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.bsdOriginal;
      description = "File storage package for Pyramid";
    };
  };



  "pyramid-tm" = python.mkDerivation {
    name = "pyramid-tm-1.1.1";
    src = pkgs.fetchurl { url = "https://pypi.python.org/packages/1a/fc/c161699a17a66c2c917fecb3926c22020585d9f1e392e8e92ef33b92f781/pyramid_tm-1.1.1.tar.gz"; sha256 = "6d8133e174118375d88dd0112f7dc509eae40074017d587648a17625f539ecd4"; };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."WebTest"
      self."pyramid"
      self."transaction"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = "License :: Repoze Public License";
      description = "A package which allows Pyramid requests to join the active transaction";
    };
  };



  "pyramid-who" = python.mkDerivation {
    name = "pyramid-who-0.3";
    src = pkgs.fetchurl { url = "https://pypi.python.org/packages/2e/09/664840034d88a3e68a6c4256723da769e7a18a2edcde99b304340ca3e43b/pyramid_who-0.3.tar.gz"; sha256 = "ab682af0bd1c105184ad2fd417f3557c36e7bf803b1b290fa8325ce1ff83302d"; };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."pyramid"
      self."repoze.who"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = "BSD-derived (http://www.repoze.org/LICENSE.txt)";
      description = "Pyramid authentication policies based on repoze.who";
    };
  };



  "pyramid-zcml" = python.mkDerivation {
    name = "pyramid-zcml-1.0.0";
    src = pkgs.fetchurl { url = "https://pypi.python.org/packages/10/fe/4f625133356da420cbc8075f7a211cada1e234e3d33a271306f935d31f10/pyramid_zcml-1.0.0.tar.gz"; sha256 = "66f2773d5fce8dbbc68d69589b4c0db85ff751f1d63e4ee594f4d8aeb7812705"; };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."WebTest"
      self."pyramid"
      self."zope.configuration"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = "License :: Repoze Public License";
      description = "Zope Config Markup Language support for Pyramid";
    };
  };



  "pytest" = python.mkDerivation {
    name = "pytest-3.0.4";
    src = pkgs.fetchurl { url = "https://pypi.python.org/packages/2f/03/0c636d7191255e1737012e5f9c42368f11b55463aeea46fb1955892cab0d/pytest-3.0.4.tar.gz"; sha256 = "879fee2c1fdbaacd1bf2c0047677c6dd4aee05b9c1e64330b34d130a584fa40d"; };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."py"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "pytest: simple powerful testing with Python";
    };
  };



  "pytest-mock" = python.mkDerivation {
    name = "pytest-mock-1.5.0";
    src = pkgs.fetchurl { url = "https://pypi.python.org/packages/00/ee/07a76dada65cbafa1f5c8802a0cdb07b21615be482e587743da6b2aa97a4/pytest-mock-1.5.0.tar.gz"; sha256 = "782f23f227874bac4cee878637c2af8efdd2c34c48fcbf9e79b00a0872056ffb"; };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."pytest"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "Thin-wrapper around the mock package for easier use with py.test";
    };
  };



  "pytest-pyramid" = python.mkDerivation {
    name = "pytest-pyramid-0.2.0";
    src = pkgs.fetchurl { url = "https://pypi.python.org/packages/a5/93/adfd44a3e90263d2f43c14ba9aacc148a4c882a4ee60ad6ba4ad1c72eacf/pytest_pyramid-0.2.0.tar.gz"; sha256 = "67e40761c7c10640a617e2bb7c0dbe3688d054778765d6e0b585afe347d7857e"; };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."WebTest"
      self."pyramid"
      self."pytest"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "pytest pyramid providing basic fixtures for testing pyramid applications with pytest test suite";
    };
  };



  "python-dateutil" = python.mkDerivation {
    name = "python-dateutil-2.6.0";
    src = pkgs.fetchurl { url = "https://pypi.python.org/packages/51/fc/39a3fbde6864942e8bb24c93663734b74e281b984d1b8c4f95d64b0c21f6/python-dateutil-2.6.0.tar.gz"; sha256 = "62a2f8df3d66f878373fd0072eacf4ee52194ba302e00082828e0d263b0418d2"; };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."six"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.bsdOriginal;
      description = "Extensions to the standard Python datetime module";
    };
  };



  "python-editor" = python.mkDerivation {
    name = "python-editor-1.0.3";
    src = pkgs.fetchurl { url = "https://pypi.python.org/packages/65/1e/adf6e000ea5dc909aa420352d6ba37f16434c8a3c2fa030445411a1ed545/python-editor-1.0.3.tar.gz"; sha256 = "a3c066acee22a1c94f63938341d4fb374e3fdd69366ed6603d7b24bed1efc565"; };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = "License :: OSI Approved :: Apache Software License";
      description = "Programmatically open an editor, capture the result.";
    };
  };



  "pytz" = python.mkDerivation {
    name = "pytz-2016.7";
    src = pkgs.fetchurl { url = "https://pypi.python.org/packages/53/35/6376f58fb82ce69e2c113ca0ebe5c0f69b20f006e184bcc238a6007f4bdb/pytz-2016.7.tar.bz2"; sha256 = "6eab31709e3a4aea748457707da45e805b650cbb352583805d2417de2a1dd71e"; };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "World timezone definitions, modern and historical";
    };
  };



  "repoze.lru" = python.mkDerivation {
    name = "repoze.lru-0.6";
    src = pkgs.fetchurl { url = "https://pypi.python.org/packages/6e/1e/aa15cc90217e086dc8769872c8778b409812ff036bf021b15795638939e4/repoze.lru-0.6.tar.gz"; sha256 = "0f7a323bf716d3cb6cb3910cd4fccbee0b3d3793322738566ecce163b01bbd31"; };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = "License :: Repoze Public License";
      description = "A tiny LRU cache implementation and decorator";
    };
  };



  "repoze.sendmail" = python.mkDerivation {
    name = "repoze.sendmail-4.2";
    src = pkgs.fetchurl { url = "https://pypi.python.org/packages/29/3f/b78aee2b8a7a84560fc7eff88f6e1334d9884f55c045695d86d670818c22/repoze.sendmail-4.2.tar.gz"; sha256 = "ae6363c7694773331c41654d542a204523259206780f2063ac4af44f8d7cb30d"; };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."transaction"
      self."zope.interface"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.zpt21;
      description = "Repoze Sendmail";
    };
  };



  "repoze.who" = python.mkDerivation {
    name = "repoze.who-2.3";
    src = pkgs.fetchurl { url = "https://pypi.python.org/packages/19/ae/94cdd6ea2d3f79a1430993ee044da1ea6fb547675e0d0ca958c71009ddde/repoze.who-2.3.tar.gz"; sha256 = "b95dadc1242acc55950115a629cfb1352669774b46d22def51400ca683efea28"; };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."WebOb"
      self."zope.interface"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = "BSD-derived (http://www.repoze.org/LICENSE.txt)";
      description = "repoze.who is an identification and authentication framework for WSGI.";
    };
  };



  "setuptools-scm" = python.mkDerivation {
    name = "setuptools-scm-1.15.0";
    src = pkgs.fetchurl { url = "https://pypi.python.org/packages/80/b7/31b6ae5fcb188e37f7e31abe75f9be90490a5456a72860fa6e643f8a3cbc/setuptools_scm-1.15.0.tar.gz"; sha256 = "daf12d05aa2155a46aa357453757ffdc47d87f839e62114f042bceac6a619e2f"; };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "the blessed package to manage your versions by scm tags";
    };
  };



  "simplegeneric" = python.mkDerivation {
    name = "simplegeneric-0.8.1";
    src = pkgs.fetchurl { url = "https://pypi.python.org/packages/3d/57/4d9c9e3ae9a255cd4e1106bb57e24056d3d0709fc01b2e3e345898e49d5b/simplegeneric-0.8.1.zip"; sha256 = "dc972e06094b9af5b855b3df4a646395e43d1c9d0d39ed345b7393560d0b9173"; };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.zpt21;
      description = "Simple generic functions (similar to Python's own len(), pickle.dump(), etc.)";
    };
  };



  "six" = python.mkDerivation {
    name = "six-1.10.0";
    src = pkgs.fetchurl { url = "https://pypi.python.org/packages/b3/b2/238e2590826bfdd113244a40d9d3eb26918bd798fc187e2360a8367068db/six-1.10.0.tar.gz"; sha256 = "105f8d68616f8248e24bf0e9372ef04d3cc10104f1980f54d57b2ce73a5ad56a"; };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "Python 2 and 3 compatibility utilities";
    };
  };



  "traitlets" = python.mkDerivation {
    name = "traitlets-4.3.1";
    src = pkgs.fetchurl { url = "https://pypi.python.org/packages/b1/d6/5b5aa6d5c474691909b91493da1e8972e309c9f01ecfe4aeafd272eb3234/traitlets-4.3.1.tar.gz"; sha256 = "ba8c94323ccbe8fd792e45d8efe8c95d3e0744cc8c085295b607552ab573724c"; };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."decorator"
      self."ipython-genutils"
      self."pytest"
      self."six"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.bsdOriginal;
      description = "Traitlets Python config system";
    };
  };



  "transaction" = python.mkDerivation {
    name = "transaction-2.0.3";
    src = pkgs.fetchurl { url = "https://pypi.python.org/packages/8c/af/3ffafe85bcc93ecb09459f3f2bd8fbe142e9ab34048f9e2774543b470cbd/transaction-2.0.3.tar.gz"; sha256 = "67bfb81309ba9717edbb2ca2e5717c325b78beec0bf19f44e5b4b9410f82df7f"; };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."zope.interface"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.zpt21;
      description = "Transaction management for Python";
    };
  };



  "translationstring" = python.mkDerivation {
    name = "translationstring-1.3";
    src = pkgs.fetchurl { url = "https://pypi.python.org/packages/5e/eb/bee578cc150b44c653b63f5ebe258b5d0d812ddac12497e5f80fcad5d0b4/translationstring-1.3.tar.gz"; sha256 = "4ee44cfa58c52ade8910ea0ebc3d2d84bdcad9fa0422405b1801ec9b9a65b72d"; };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = "BSD-like (http://repoze.org/license.html)";
      description = "Utility library for i18n relied on by various Repoze and Pyramid packages";
    };
  };



  "venusian" = python.mkDerivation {
    name = "venusian-1.0";
    src = pkgs.fetchurl { url = "https://pypi.python.org/packages/86/20/1948e0dfc4930ddde3da8c33612f6a5717c0b4bc28f591a5c5cf014dd390/venusian-1.0.tar.gz"; sha256 = "1720cff2ca9c369c840c1d685a7c7a21da1afa687bfe62edd93cae4bf429ca5a"; };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = "BSD-derived (http://www.repoze.org/LICENSE.txt)";
      description = "A library for deferring decorator actions";
    };
  };



  "versiontools" = python.mkDerivation {
    name = "versiontools-1.9.1";
    src = pkgs.fetchurl { url = "https://pypi.python.org/packages/37/a0/2de15402f69bc054fd57d1ef7278a52a9be474682e374d6bc60abde27f8f/versiontools-1.9.1.tar.gz"; sha256 = "a969332887a18a9c98b0df0ea4d4ca75972f24ca94f06fb87d591377e83414f6"; };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.lgpl2;
      description = "Smart replacement for plain tuple used in __version__";
    };
  };



  "vine" = python.mkDerivation {
    name = "vine-1.1.3";
    src = pkgs.fetchurl { url = "https://pypi.python.org/packages/35/21/308904b027636f13c3970ed7caf2c53fca77fa160122ae3ac392d9eb6307/vine-1.1.3.tar.gz"; sha256 = "87b95da19249373430a8fafca36f1aecb7aa0f1cc78545877857afc46aea2441"; };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.bsdOriginal;
      description = "Promises, promises, promises.";
    };
  };



  "waitress" = python.mkDerivation {
    name = "waitress-1.0.1";
    src = pkgs.fetchurl { url = "https://pypi.python.org/packages/78/7d/84d11b96c3f60164dec3bef4a859a03aeae0231aa93f57fbe0d05fa4ff36/waitress-1.0.1.tar.gz"; sha256 = "2daacaece189ede6a23440afe03bda58089a6207f1d80a1e9497f979dfb741fc"; };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.zpt21;
      description = "Waitress WSGI server";
    };
  };



  "wcwidth" = python.mkDerivation {
    name = "wcwidth-0.1.7";
    src = pkgs.fetchurl { url = "https://pypi.python.org/packages/55/11/e4a2bb08bb450fdbd42cc709dd40de4ed2c472cf0ccb9e64af22279c5495/wcwidth-0.1.7.tar.gz"; sha256 = "3df37372226d6e63e1b1e1eda15c594bca98a22d33a23832a90998faa96bc65e"; };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "Measures number of Terminal column cells of wide-character codes";
    };
  };



  "zope.configuration" = python.mkDerivation {
    name = "zope.configuration-4.0.3";
    src = pkgs.fetchurl { url = "https://pypi.python.org/packages/37/d7/653c2a05d876e787a1532b51ef7f89917ff17885daaac41af9da5e2f140b/zope.configuration-4.0.3.tar.gz"; sha256 = "b6f0f718597945fc6fda7aee72dab9636302fb2035dd222ab5b7fa773d762df5"; };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."zope.i18nmessageid"
      self."zope.interface"
      self."zope.schema"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.zpt21;
      description = "Zope Configuration Markup Language (ZCML)";
    };
  };



  "zope.deprecation" = python.mkDerivation {
    name = "zope.deprecation-4.2.0";
    src = pkgs.fetchurl { url = "https://pypi.python.org/packages/51/85/b9d2fdcaf38ce3271ad759c7e8f0e9a28f6d900c1ad495085e4ab1de3795/zope.deprecation-4.2.0.tar.gz"; sha256 = "ff32c5bb5388b77b22c83ed1f1aa01cdbb076d9f2cfa2b825450ce9e2ecfd738"; };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.zpt21;
      description = "Zope Deprecation Infrastructure";
    };
  };



  "zope.event" = python.mkDerivation {
    name = "zope.event-4.2.0";
    src = pkgs.fetchurl { url = "https://pypi.python.org/packages/cd/a5/4927363244aaa7fd8a696d32005ea8214c4811550d35edea27797ebbd4fd/zope.event-4.2.0.tar.gz"; sha256 = "ce11004217863a4827ea1a67a31730bddab9073832bdb3b9be85869259118758"; };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.zpt21;
      description = "Very basic event publishing system";
    };
  };



  "zope.i18nmessageid" = python.mkDerivation {
    name = "zope.i18nmessageid-4.0.3";
    src = pkgs.fetchurl { url = "https://pypi.python.org/packages/97/16/e76c4d7833d8e4246e0ebec826b68facbf21c97a1a62a9292f0b2779e3a1/zope.i18nmessageid-4.0.3.tar.gz"; sha256 = "b4feca4eda7361d8451fac473dbf1a6006e1bb049278296b4365d209e0f554e7"; };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.zpt21;
      description = "Message Identifiers for internationalization";
    };
  };



  "zope.interface" = python.mkDerivation {
    name = "zope.interface-4.3.2";
    src = pkgs.fetchurl { url = "https://pypi.python.org/packages/38/1b/d55c39f2cf442bd9fb2c59760ed058c84b57d25c680819c25f3aff741e1f/zope.interface-4.3.2.tar.gz"; sha256 = "6a0e224a052e3ce27b3a7b1300a24747513f7a507217fcc2a4cb02eb92945cee"; };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."zope.event"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.zpt21;
      description = "Interfaces for Python";
    };
  };



  "zope.schema" = python.mkDerivation {
    name = "zope.schema-4.4.2";
    src = pkgs.fetchurl { url = "https://pypi.python.org/packages/0d/b2/41fdc6c42c4320f326c65810eff785247e65e4ea856cff15120e47b93509/zope.schema-4.4.2.tar.gz"; sha256 = "d32a089d2a774fe67fd19864780e12ebd88d09e89b5c780f6c0795d59b1c24dd"; };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."zope.event"
      self."zope.interface"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.zpt21;
      description = "zope.interface extension for defining data schemas";
    };
  };



  "zope.sqlalchemy" = python.mkDerivation {
    name = "zope.sqlalchemy-0.7.7";
    src = pkgs.fetchurl { url = "https://pypi.python.org/packages/14/95/47ef5f5fbf5f18dc95d6d39b7dbd690818b541afa724d14ed176e415b134/zope.sqlalchemy-0.7.7.tar.gz"; sha256 = "5da8ff6b060f3a47fc0cbc61cfd6a83b959b5e730f95e492edcf7b9bf3ec987a"; };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."SQLAlchemy"
      self."transaction"
      self."zope.interface"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.zpt21;
      description = "Minimal Zope/SQLAlchemy transaction integration";
    };
  };

}
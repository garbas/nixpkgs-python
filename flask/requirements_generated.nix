# generated using pypi2nix tool (version: 1.6.0)
#
# COMMAND:
#   pypi2nix -v -T -V 3.5 -r requirements.txt -r requirements-dev.txt
#

{ pkgs, python, commonBuildInputs ? [], commonDoCheck ? false }:

self: {

  "Flask" = python.mkDerivation {
    name = "Flask-0.11.1";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/55/8a/78e165d30f0c8bb5d57c429a30ee5749825ed461ad6c959688872643ffb3/Flask-0.11.1.tar.gz";
      sha256 = "b4713f2bfb9ebc2966b8a49903ae0d3984781d5c878591cf2f7b484d28756b0e";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."Jinja2"
      self."Werkzeug"
      self."click"
      self."itsdangerous"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.bsdOriginal;
      description = "A microframework based on Werkzeug, Jinja2 and good intentions";
    };
  };



  "Flask-Cache" = python.mkDerivation {
    name = "Flask-Cache-0.13.1";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/91/c4/f71095437bd4b691c63f240e72a20c57e2c216085cbc271f79665885d3da/Flask-Cache-0.13.1.tar.gz";
      sha256 = "90126ca9bc063854ef8ee276e95d38b2b4ec8e45fd77d5751d37971ee27c7ef4";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."Flask"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.bsdOriginal;
      description = "Adds cache support to your Flask application";
    };
  };



  "Flask-Cors" = python.mkDerivation {
    name = "Flask-Cors-3.0.2";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/1d/ea/86765a4ae667b4517dc16ef0fc8dd632ca3ea56ef419c4a6de31e715324e/Flask-Cors-3.0.2.tar.gz";
      sha256 = "0a09f3559ded4759387dfa2a355de59bc161f67269a1f4b7b0712a64b1f7dad6";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."Flask"
      self."six"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "A Flask extension adding a decorator for CORS support";
    };
  };



  "Flask-Login" = python.mkDerivation {
    name = "Flask-Login-0.4.0";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/70/96/20cae731ef27084dcb183f3a6e3073d0232f10c1fd7be76729bd7bd4b994/Flask-Login-0.4.0.tar.gz";
      sha256 = "d25e356b14a59f52da0ab30c31c2ad285fa23a840f0f6971df7ed247c77082a7";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."Flask"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "User session management for Flask";
    };
  };



  "Flask-SQLAlchemy" = python.mkDerivation {
    name = "Flask-SQLAlchemy-2.1";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/b3/52/227aaf4e8cebb153e239c518a9e916590b2fe0e4350e6b02d92b546b69b7/Flask-SQLAlchemy-2.1.tar.gz";
      sha256 = "c5244de44cc85d2267115624d83faef3f9e8f088756788694f305a5d5ad137c5";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."Flask"
      self."SQLAlchemy"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.bsdOriginal;
      description = "Adds SQLAlchemy support to your Flask application";
    };
  };



  "Jinja2" = python.mkDerivation {
    name = "Jinja2-2.8";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/f2/2f/0b98b06a345a761bec91a079ccae392d282690c2d8272e708f4d10829e22/Jinja2-2.8.tar.gz";
      sha256 = "bc1ff2ff88dbfacefde4ddde471d1417d3b304e8df103a7a9437d47269201bf4";
    };
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



  "MarkupSafe" = python.mkDerivation {
    name = "MarkupSafe-0.23";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/c0/41/bae1254e0396c0cc8cf1751cb7d9afc90a602353695af5952530482c963f/MarkupSafe-0.23.tar.gz";
      sha256 = "a4ec1aff59b95a14b45eb2e23761a0179e98319da5a7eb76b56ea8cdc7b871c3";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.bsdOriginal;
      description = "Implements a XML/HTML/XHTML Markup safe string for Python";
    };
  };



  "PyYAML" = python.mkDerivation {
    name = "PyYAML-3.12";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/4a/85/db5a2df477072b2902b0eb892feb37d88ac635d36245a72a6a69b23b383a/PyYAML-3.12.tar.gz";
      sha256 = "592766c6303207a20efc445587778322d7f73b161bd994f227adaa341ba212ab";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "YAML parser and emitter for Python";
    };
  };



  "SQLAlchemy" = python.mkDerivation {
    name = "SQLAlchemy-1.1.3";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/84/83/322a268e3187c088aa2867c2560869227da5fc7b9a697c5e382df811bd3c/SQLAlchemy-1.1.3.tar.gz";
      sha256 = "8b0ed90292a294e17d24482c9328abe69eb8e3143e2bd7103b6fadae2562638f";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "Database Abstraction Library";
    };
  };



  "Werkzeug" = python.mkDerivation {
    name = "Werkzeug-0.11.11";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/43/2e/d822b4a4216804519ace92e0368dcfc4b0b2887462d852fdd476b253ecc9/Werkzeug-0.11.11.tar.gz";
      sha256 = "e72c46bc14405cba7a26bd2ce28df734471bc9016bc8b4cb69466c2c14c2f7e5";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.bsdOriginal;
      description = "The Swiss Army knife of Python web development";
    };
  };



  "apipkg" = python.mkDerivation {
    name = "apipkg-1.4";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/32/37/6ce6dbaa8035730efa95e60b09498ec17000d137742391ff46974d9ef859/apipkg-1.4.tar.gz";
      sha256 = "2e38399dbe842891fe85392601aab8f40a8f4cc5a9053c326de35a1cc0297ac6";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "apipkg: namespace control and lazy-import mechanism";
    };
  };



  "click" = python.mkDerivation {
    name = "click-6.6";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/7a/00/c14926d8232b36b08218067bcd5853caefb4737cda3f0a47437151344792/click-6.6.tar.gz";
      sha256 = "cc6a19da8ebff6e7074f731447ef7e112bd23adf3de5c597cf9989f2fd8defe9";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.bsdOriginal;
      description = "A simple wrapper around optparse for powerful command line utilities.";
    };
  };



  "clickclick" = python.mkDerivation {
    name = "clickclick-1.2.1";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/6f/46/28462eb039bbce3651084d5260c50ab83dc3af0724626e6a81c93d950b2c/clickclick-1.2.1.tar.gz";
      sha256 = "22eedfce2499d7a8c5b8c868fc93a495eb74bf7b753a6cb9ed2aa6a32a3ddd05";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."PyYAML"
      self."click"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.asl20;
      description = "Click utility functions";
    };
  };



  "connexion" = python.mkDerivation {
    name = "connexion-1.0.129";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/ca/b1/1b40f5ba85b275bfc1878d030722809281e4a6f05c62b75abba3861be9f7/connexion-1.0.129.tar.gz";
      sha256 = "dbee8e66c66c09e0db3083bd40f6c2c1a6ae193e06bb57c48202642429da70ad";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."Flask"
      self."PyYAML"
      self."clickclick"
      self."jsonschema"
      self."requests"
      self."six"
      self."strict-rfc3339"
      self."swagger-spec-validator"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.asl20;
      description = "Connexion - API first applications with OpenAPI/Swagger and Flask";
    };
  };



  "coverage" = python.mkDerivation {
    name = "coverage-4.2";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/53/fe/9e0fbdbca15c2c1253379c3a694f4315a420555e7874445b06edeaeacaea/coverage-4.2.tar.gz";
      sha256 = "e312776d3ef04632ec742ce2d2b7048b635073e0245e4f44dfe8b08cc50ac656";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.asl20;
      description = "Code coverage measurement for Python";
    };
  };



  "decorator" = python.mkDerivation {
    name = "decorator-4.0.10";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/13/8a/4eed41e338e8dcc13ca41c94b142d4d20c0de684ee5065523fee406ce76f/decorator-4.0.10.tar.gz";
      sha256 = "9c6e98edcb33499881b86ede07d9968c81ab7c769e28e9af24075f0a5379f070";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.bsdOriginal;
      description = "Better living through Python with decorators";
    };
  };



  "execnet" = python.mkDerivation {
    name = "execnet-1.4.1";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/eb/ee/43729e7dee8772e69b3b01715ab9742790be2eace2d18cf53d219b9c31f8/execnet-1.4.1.tar.gz";
      sha256 = "f66dd4a7519725a1b7e14ad9ae7d3df8e09b2da88062386e08e941cafc0ef3e6";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."apipkg"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "execnet: rapid multi-Python deployment";
    };
  };



  "flake8" = python.mkDerivation {
    name = "flake8-3.0.4";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/b0/56/48727b2a6c92b7e632180cf2c1411a0de7cf4f636b4f844c6c46f7edc86b/flake8-3.0.4.tar.gz";
      sha256 = "b4c210c998f07d6ff24325dd91fbc011f2c37bcd6bf576b188de01d8656e970d";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."mccabe"
      self."pycodestyle"
      self."pyflakes"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "the modular source code checker: pep8, pyflakes and co";
    };
  };



  "itsdangerous" = python.mkDerivation {
    name = "itsdangerous-0.24";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/dc/b4/a60bcdba945c00f6d608d8975131ab3f25b22f2bcfe1dab221165194b2d4/itsdangerous-0.24.tar.gz";
      sha256 = "cbb3fcf8d3e33df861709ecaf89d9e6629cff0a217bc2848f1b41cd30d360519";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.bsdOriginal;
      description = "Various helpers to pass trusted data to untrusted environments and back.";
    };
  };



  "jsonschema" = python.mkDerivation {
    name = "jsonschema-2.5.1";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/58/0d/c816f5ea5adaf1293a1d81d32e4cdfdaf8496973aa5049786d7fdb14e7e7/jsonschema-2.5.1.tar.gz";
      sha256 = "36673ac378feed3daa5956276a829699056523d7961027911f064b52255ead41";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."strict-rfc3339"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "An implementation of JSON Schema validation for Python";
    };
  };



  "mccabe" = python.mkDerivation {
    name = "mccabe-0.5.2";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/f1/b7/ff36d1a163079688633a776e1717b5459caccbb68973afab2aa8345ac40f/mccabe-0.5.2.tar.gz";
      sha256 = "3473f06c8b757bbb5cdf295099bf64032e5f7d6fe0ec2f97ee9b23cb0a435aff";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "McCabe checker, plugin for flake8";
    };
  };



  "mock" = python.mkDerivation {
    name = "mock-2.0.0";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/0c/53/014354fc93c591ccc4abff12c473ad565a2eb24dcd82490fae33dbf2539f/mock-2.0.0.tar.gz";
      sha256 = "b158b6df76edd239b8208d481dc46b6afd45a846b7812ff0ce58971cf5bc8bba";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."Jinja2"
      self."pbr"
      self."six"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.bsdOriginal;
      description = "Rolling backport of unittest.mock for all Pythons";
    };
  };



  "nose" = python.mkDerivation {
    name = "nose-1.3.7";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/58/a5/0dc93c3ec33f4e281849523a5a913fa1eea9a3068acfa754d44d88107a44/nose-1.3.7.tar.gz";
      sha256 = "f1bffef9cbc82628f6e7d7b40d7e255aefaa1adb6a1b1d26c69a8b79e6208a98";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.lgpl2;
      description = "nose extends unittest to make testing easier";
    };
  };



  "pbr" = python.mkDerivation {
    name = "pbr-1.10.0";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/c3/2c/63275fab26a0fd8cadafca71a3623e4d0f0ee8ed7124a5bb128853d178a7/pbr-1.10.0.tar.gz";
      sha256 = "186428c270309e6fdfe2d5ab0949ab21ae5f7dea831eab96701b86bd666af39c";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = "License :: OSI Approved :: Apache Software License";
      description = "Python Build Reasonableness";
    };
  };



  "py" = python.mkDerivation {
    name = "py-1.4.31";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/f4/9a/8dfda23f36600dd701c6722316ba8a3ab4b990261f83e7d3ffc6dfedf7ef/py-1.4.31.tar.gz";
      sha256 = "a6501963c725fc2554dabfece8ae9a8fb5e149c0ac0a42fd2b02c5c1c57fc114";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "library with cross-python path, ini-parsing, io, code, log facilities";
    };
  };



  "pycodestyle" = python.mkDerivation {
    name = "pycodestyle-2.0.0";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/db/b1/9f798e745a4602ab40bf6a9174e1409dcdde6928cf800d3aab96a65b1bbf/pycodestyle-2.0.0.tar.gz";
      sha256 = "37f0420b14630b0eaaf452978f3a6ea4816d787c3e6dcbba6fb255030adae2e7";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "Python style guide checker";
    };
  };



  "pyflakes" = python.mkDerivation {
    name = "pyflakes-1.2.3";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/54/80/6a641f832eb6c6a8f7e151e7087aff7a7c04dd8b4aa6134817942cdda1b6/pyflakes-1.2.3.tar.gz";
      sha256 = "2e4a1b636d8809d8f0a69f341acf15b2e401a3221ede11be439911d23ce2139e";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "passive checker of Python programs";
    };
  };



  "pytest" = python.mkDerivation {
    name = "pytest-3.0.3";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/a0/2f/076c816e2402c4911ccee4b93ba0475145b7cffd0320ca8efa0add7c469c/pytest-3.0.3.tar.gz";
      sha256 = "f213500a356800a483e8a146ff971ae14a8df3f2c0ae4145181aad96996abee7";
    };
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



  "pytest-cov" = python.mkDerivation {
    name = "pytest-cov-2.4.0";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/00/c0/2bfd1fcdb9d407b8ac8185b1cb5ff458105c6b207a9a7f0e13032de9828f/pytest-cov-2.4.0.tar.gz";
      sha256 = "53d4179086e1eec1c688705977387432c01031b0a7bd91b8ff6c912c08c3820d";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."coverage"
      self."pytest"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.bsdOriginal;
      description = "Pytest plugin for measuring coverage.";
    };
  };



  "pytest-runner" = python.mkDerivation {
    name = "pytest-runner-2.9";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/11/d4/c335ddf94463e451109e3494e909765c3e5205787b772e3b25ee8601b86a/pytest-runner-2.9.tar.gz";
      sha256 = "50378de59b02f51f64796d3904dfe71b9dc6f06d88fc6bfbd5c8e8366ae1d131";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "Invoke py.test as distutils command with dependency resolution";
    };
  };



  "pytest-xdist" = python.mkDerivation {
    name = "pytest-xdist-1.15.0";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/dc/b2/a59db3ef996b93c3ef35dbbc33557a71ef67a6839d94a52c88eeb1086002/pytest-xdist-1.15.0.tar.gz";
      sha256 = "6238395f8bd050f9288a3b10f34330edece80f4424cf2b4204d6e7d622f0f00b";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."execnet"
      self."py"
      self."pytest"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "py.test xdist plugin for distributed testing and loop-on-failing modes";
    };
  };



  "requests" = python.mkDerivation {
    name = "requests-2.11.1";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/2e/ad/e627446492cc374c284e82381215dcd9a0a87c4f6e90e9789afefe6da0ad/requests-2.11.1.tar.gz";
      sha256 = "5acf980358283faba0b897c73959cecf8b841205bb4b2ad3ef545f46eae1a133";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.asl20;
      description = "Python HTTP for Humans.";
    };
  };



  "setuptools-scm" = python.mkDerivation {
    name = "setuptools-scm-1.15.0";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/80/b7/31b6ae5fcb188e37f7e31abe75f9be90490a5456a72860fa6e643f8a3cbc/setuptools_scm-1.15.0.tar.gz";
      sha256 = "daf12d05aa2155a46aa357453757ffdc47d87f839e62114f042bceac6a619e2f";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "the blessed package to manage your versions by scm tags";
    };
  };



  "six" = python.mkDerivation {
    name = "six-1.10.0";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/b3/b2/238e2590826bfdd113244a40d9d3eb26918bd798fc187e2360a8367068db/six-1.10.0.tar.gz";
      sha256 = "105f8d68616f8248e24bf0e9372ef04d3cc10104f1980f54d57b2ce73a5ad56a";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "Python 2 and 3 compatibility utilities";
    };
  };



  "strict-rfc3339" = python.mkDerivation {
    name = "strict-rfc3339-0.7";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/56/e4/879ef1dbd6ddea1c77c0078cd59b503368b0456bcca7d063a870ca2119d3/strict-rfc3339-0.7.tar.gz";
      sha256 = "5cad17bedfc3af57b399db0fed32771f18fc54bbd917e85546088607ac5e1277";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.gpl3;
      description = "Strict, simple, lightweight RFC3339 functions";
    };
  };



  "swagger-spec-validator" = python.mkDerivation {
    name = "swagger-spec-validator-2.0.2";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/98/79/b3243192c42cf3ce983e76f2bf38b3dc343f594f35dec6ec3793055f50b8/swagger_spec_validator-2.0.2.tar.gz";
      sha256 = "1947d671cac6096eb578d28767209a65e02a4d24081bf6fc605f09ed6ae1d66b";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."jsonschema"
      self."six"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.asl20;
      description = "Validation of Swagger specifications";
    };
  };



  "unittest2py3k" = python.mkDerivation {
    name = "unittest2py3k-0.5.1";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/4e/3d/d44421e8d828af1399c1509c196db92e2a58f3764b01a0ee928d7025d1ca/unittest2py3k-0.5.1.tar.gz";
      sha256 = "78249c5f1ac508a34d9d131d43a89d77bf154186f3ea5f7a6b993d3f3535d403";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.bsdOriginal;
      description = "A Python 3 compatible version of unittest2";
    };
  };



  "vcversioner" = python.mkDerivation {
    name = "vcversioner-2.16.0.0";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/c5/cc/33162c0a7b28a4d8c83da07bc2b12cee58c120b4a9e8bba31c41c8d35a16/vcversioner-2.16.0.0.tar.gz";
      sha256 = "dae60c17a479781f44a4010701833f1829140b1eeccd258762a74974aa06e19b";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.isc;
      description = "Use version control tags to discover version numbers";
    };
  };

}
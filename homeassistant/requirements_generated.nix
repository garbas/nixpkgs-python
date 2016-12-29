# generated using pypi2nix tool (version: 1.6.0)
#
# COMMAND:
#   pypi2nix -v -V 3.5 -r requirements.txt -r requirements-dev.txt
#

{ pkgs, python, commonBuildInputs ? [], commonDoCheck ? false }:

self: {

  "Jinja2" = python.mkDerivation {
    name = "Jinja2-2.8.1";
    src = pkgs.fetchurl { url = "https://pypi.python.org/packages/5f/bd/5815d4d925a2b8cbbb4b4960f018441b0c65f24ba29f3bdcfb3c8218a307/Jinja2-2.8.1.tar.gz"; sha256 = "35341f3a97b46327b3ef1eb624aadea87a535b8f50863036e085e7c426ac5891"; };
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



  "PyYAML" = python.mkDerivation {
    name = "PyYAML-3.12";
    src = pkgs.fetchurl { url = "https://pypi.python.org/packages/4a/85/db5a2df477072b2902b0eb892feb37d88ac635d36245a72a6a69b23b383a/PyYAML-3.12.tar.gz"; sha256 = "592766c6303207a20efc445587778322d7f73b161bd994f227adaa341ba212ab"; };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "YAML parser and emitter for Python";
    };
  };



  "aiohttp" = python.mkDerivation {
    name = "aiohttp-1.1.6";
    src = pkgs.fetchurl { url = "https://pypi.python.org/packages/e4/c5/c131fb2c8e42eb8cf0e42d41c8cecfc22e1247307c25a0f77c4565ca690f/aiohttp-1.1.6.tar.gz"; sha256 = "0742feb9759a5832aa4a30abf64e53055e139ed41e26f79b9558d08e05c74d60"; };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."async-timeout"
      self."chardet"
      self."multidict"
      self."yarl"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.asl20;
      description = "http client/server for asyncio";
    };
  };



  "async-timeout" = python.mkDerivation {
    name = "async-timeout-1.1.0";
    src = pkgs.fetchurl { url = "https://pypi.python.org/packages/29/f6/eeac39dfadd3a7610bb33842cf611a1f09fcd2e445ab76e4c951efde0c2b/async-timeout-1.1.0.tar.gz"; sha256 = "b88bd1fe001b800ec23c7bf27a81b32819e2a56668e9fba5646a7f3618143081"; };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.asl20;
      description = "Timeout context manager for asyncio programs";
    };
  };



  "chardet" = python.mkDerivation {
    name = "chardet-2.3.0";
    src = pkgs.fetchurl { url = "https://pypi.python.org/packages/7d/87/4e3a3f38b2f5c578ce44f8dc2aa053217de9f0b6d737739b0ddac38ed237/chardet-2.3.0.tar.gz"; sha256 = "e53e38b3a4afe6d1132de62b7400a4ac363452dc5dfcf8d88e8e0cce663c68aa"; };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.lgpl2;
      description = "Universal encoding detector for Python 2 and 3";
    };
  };



  "enum-compat" = python.mkDerivation {
    name = "enum-compat-0.0.2";
    src = pkgs.fetchurl { url = "https://pypi.python.org/packages/95/6e/26bdcba28b66126f66cf3e4cd03bcd63f7ae330d29ee68b1f6b623550bfa/enum-compat-0.0.2.tar.gz"; sha256 = "939ceff18186a5762ae4db9fa7bfe017edbd03b66526b798dd8245394c8a4192"; };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "enum/enum34 compatibility package";
    };
  };



  "homeassistant" = python.mkDerivation {
    name = "homeassistant-0.35.3";
    src = pkgs.fetchurl { url = "https://pypi.python.org/packages/5f/bc/47e5185f283b4ea7d5cb5ffda00bdcb1e8f1010fa745b934a4a931fc9d9a/homeassistant-0.35.3.tar.gz"; sha256 = "e2eb230b6597a17e200e91823f91cf48dcb71da9704b22577334236c31a0558b"; };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."Jinja2"
      self."PyYAML"
      self."aiohttp"
      self."async-timeout"
      self."pytz"
      self."requests"
      self."typing"
      self."voluptuous"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "Open-source home automation platform running on Python 3.";
    };
  };



  "multidict" = python.mkDerivation {
    name = "multidict-2.1.4";
    src = pkgs.fetchurl { url = "https://pypi.python.org/packages/2a/df/eaea73e46a58fd780c35ecc304ca42364fa3c1f4cd03568ed33b9d2c7547/multidict-2.1.4.tar.gz"; sha256 = "a77aa8c9f68846c3b5db43ff8ed2a7a884dbe845d01f55113a3fba78518c4cd7"; };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.asl20;
      description = "multidict implementation";
    };
  };



  "netdisco" = python.mkDerivation {
    name = "netdisco-0.7.7";
    src = pkgs.fetchurl { url = "https://pypi.python.org/packages/d2/5c/220997aba36946596570f8670b0d3b96a119f0f2b12aaac66a88b206f4eb/netdisco-0.7.7.tar.gz"; sha256 = "ece9c994c16c59794bb1b80a7e33f5837529dd1757369df6dccf082a8178115c"; };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."netifaces"
      self."requests"
      self."zeroconf"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "Discover devices on your local network";
    };
  };



  "netifaces" = python.mkDerivation {
    name = "netifaces-0.10.5";
    src = pkgs.fetchurl { url = "https://pypi.python.org/packages/a7/4c/8e0771a59fd6e55aac993a7cc1b6a0db993f299514c464ae6a1ecf83b31d/netifaces-0.10.5.tar.gz"; sha256 = "59d8ad52dd3116fcb6635e175751b250dc783fb011adba539558bd764e5d628b"; };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "Portable network interface information.";
    };
  };



  "py" = python.mkDerivation {
    name = "py-1.4.32";
    src = pkgs.fetchurl { url = "https://pypi.python.org/packages/93/bd/8a90834a287e0c1682eab8e20ada672e4f4cf7d5b99f2833ddbf31ed1a6d/py-1.4.32.tar.gz"; sha256 = "c4b89fd1ff1162375115608d01f77c38cca1d0f28f37fd718005e19b28be41a7"; };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "library with cross-python path, ini-parsing, io, code, log facilities";
    };
  };



  "pytest" = python.mkDerivation {
    name = "pytest-3.0.5";
    src = pkgs.fetchurl { url = "https://pypi.python.org/packages/a8/87/b7ca49efe52d2b4169f2bfc49aa5e384173c4619ea8e635f123a0dac5b75/pytest-3.0.5.tar.gz"; sha256 = "4a003aa956f023ce91aa6e166b555e6f02a4b0aeb459ac61e14f64c0d39037fd"; };
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



  "pytest-runner" = python.mkDerivation {
    name = "pytest-runner-2.9";
    src = pkgs.fetchurl { url = "https://pypi.python.org/packages/11/d4/c335ddf94463e451109e3494e909765c3e5205787b772e3b25ee8601b86a/pytest-runner-2.9.tar.gz"; sha256 = "50378de59b02f51f64796d3904dfe71b9dc6f06d88fc6bfbd5c8e8366ae1d131"; };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "Invoke py.test as distutils command with dependency resolution";
    };
  };



  "pytz" = python.mkDerivation {
    name = "pytz-2016.10";
    src = pkgs.fetchurl { url = "https://pypi.python.org/packages/d0/e1/aca6ef73a7bd322a7fc73fd99631ee3454d4fc67dc2bee463e2adf6bb3d3/pytz-2016.10.tar.bz2"; sha256 = "7016b2c4fa075c564b81c37a252a5fccf60d8964aa31b7f5eae59aeb594ae02b"; };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "World timezone definitions, modern and historical";
    };
  };



  "requests" = python.mkDerivation {
    name = "requests-2.12.4";
    src = pkgs.fetchurl { url = "https://pypi.python.org/packages/5b/0b/34be574b1ec997247796e5d516f3a6b6509c4e064f2885a96ed885ce7579/requests-2.12.4.tar.gz"; sha256 = "ed98431a0631e309bb4b63c81d561c1654822cb103de1ac7b47e45c26be7ae34"; };
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



  "typing" = python.mkDerivation {
    name = "typing-3.5.2.2";
    src = pkgs.fetchurl { url = "https://pypi.python.org/packages/19/2f/b1090ace275335a9c0dde9a4623b109b7960a2b5370ae59d1eb1539afd8a/typing-3.5.2.2.tar.gz"; sha256 = "2bce34292653af712963c877f3085250a336738e64f99048d1b8509bebc4772f"; };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.psfl;
      description = "Type Hints for Python";
    };
  };



  "voluptuous" = python.mkDerivation {
    name = "voluptuous-0.9.2";
    src = pkgs.fetchurl { url = "https://pypi.python.org/packages/4a/f8/82762db7c28d36800052a61ce26a9c8d362d765aff1c5ce8cb6a01418b7a/voluptuous-0.9.2.tar.gz"; sha256 = "01f21a3168a911551cbf89373763273189cb84196f0c7a5c0b86bd48c01f8d8b"; };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.bsdOriginal;
      description = "# Voluptuous is a Python data validation library";
    };
  };



  "yarl" = python.mkDerivation {
    name = "yarl-0.8.1";
    src = pkgs.fetchurl { url = "https://pypi.python.org/packages/10/1b/be30529bde22c85c2975a4e21cf7f13edbcb291350fbbde8bc13938620c8/yarl-0.8.1.tar.gz"; sha256 = "9f0397ae540124bf16a8a5b89bc3ea1c07f8ae70c3e44231a40a9edd254d5712"; };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."multidict"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.asl20;
      description = "Yet another URL library";
    };
  };



  "zeroconf" = python.mkDerivation {
    name = "zeroconf-0.17.6";
    src = pkgs.fetchurl { url = "https://pypi.python.org/packages/b8/15/d4b1773e91f8ff54681c3a0d45baec553ffa850f42beb62353156ab4a64c/zeroconf-0.17.6.tar.gz"; sha256 = "b614baa73833bdfc8ae64f2a9f5d19b014ad3164fbbc8513ef27a7bbe1e6c5e3"; };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."enum-compat"
      self."netifaces"
      self."six"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.lgpl2;
      description = "Pure Python Multicast DNS Service Discovery Library (Bonjour/Avahi compatible)";
    };
  };

}
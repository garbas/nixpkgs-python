# generated using pypi2nix tool (version: 1.6.0)
#
# COMMAND:
#   pypi2nix -v -V 3.5 -r requirements.txt -E libffi openssl -s pytz
#

{ pkgs, python, commonBuildInputs ? [], commonDoCheck ? false }:

self: {

  "BlinkStick" = python.mkDerivation {
    name = "BlinkStick-1.1.8";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/bc/cb/8b6d768c9d11da5833220837e15b4f1f1319d93d95127a37372c7b6b17e0/BlinkStick-1.1.8.tar.gz";
      sha256 = "3edf4b83a3fa1a7bd953b452b76542d54285ff6f1145b6e19f9b5438120fa408";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."pyusb"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = "LICENSE.txt";
      description = "Python package to control BlinkStick USB devices.";
    };
  };



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



  "PlexAPI" = python.mkDerivation {
    name = "PlexAPI-2.0.2";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/0e/6e/56de724747eefe467c42aea34a370afa88a7e90c456eb56aa5ca785fc1ba/PlexAPI-2.0.2.tar.gz";
      sha256 = "292449f71cbee268a1c9184e4d734239bb01cf48d56e24720e38e5f60bb8bae5";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."requests"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = "";
      description = "Python bindings for the Plex API.";
    };
  };



  "PyChromecast" = python.mkDerivation {
    name = "PyChromecast-0.7.6";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/84/ee/ea82c4aea54a90dc6e85ed940cf199bf925a77868da47d64f6d588ab671c/PyChromecast-0.7.6.tar.gz";
      sha256 = "156da838f36449766746a28510d9170065ddf142ae5ff4d02486db27f0cec682";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."protobuf"
      self."requests"
      self."six"
      self."zeroconf"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "Python module to talk to Google Chromecast.";
    };
  };



  "PyDispatcher" = python.mkDerivation {
    name = "PyDispatcher-2.0.5";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/cd/37/39aca520918ce1935bea9c356bcbb7ed7e52ad4e31bff9b943dfc8e7115b/PyDispatcher-2.0.5.tar.gz";
      sha256 = "5570069e1b1769af1fe481de6dd1d3a388492acddd2cdad7a3bde145615d5caf";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.bsdOriginal;
      description = "Multi-producer-multi-consumer signal dispatching mechanism";
    };
  };



  "PyISY" = python.mkDerivation {
    name = "PyISY-1.0.7";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/b3/12/661fbb7d511209d9cc2a777829a20f515b4323ce2177bb4d2f24eb5cfa66/PyISY-1.0.7.tar.gz";
      sha256 = "bccad88e1a2ecbb3aab44266928afd6001e4a996dacd1efaded779d82d568132";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."VarEvents"
      self."requests"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.asl20;
      description = "Python module to talk to ISY994 from UDI.";
    };
  };



  "PyJWT" = python.mkDerivation {
    name = "PyJWT-1.4.2";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/8f/10/9ce7e91d8ec9d852db6f9f2b076811d9f51ed7b0360602432d95e6ea4feb/PyJWT-1.4.2.tar.gz";
      sha256 = "87a831b7a3bfa8351511961469ed0462a769724d4da48a501cb8c96d1e17f570";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."cryptography"
      self."flake8"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "JSON Web Token implementation in Python";
    };
  };



  "PyMata" = python.mkDerivation {
    name = "PyMata-2.13";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/9c/a8/5f454582218e2fc43a2704101eb00e011917d7315754e04830b4655b1052/PyMata-2.13.tar.gz";
      sha256 = "837d5a0d8c35fa58c475fdaa1fb81ef3ab5c4181185664c8dd279ac25c3895e4";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."pyserial"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.gpl3Plus;
      description = "A Python Protocol Abstraction Library For Arduino Firmata";
    };
  };



  "PySocks" = python.mkDerivation {
    name = "PySocks-1.5.7";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/16/56/9b3513078f837fa8cb88ee01ec1cd805ed8104a37bc02ca8c2588ae8fe5a/PySocks-1.5.7.tar.gz";
      sha256 = "e51c7694b10288e6fd9a28e15c0bcce9aca0327e7b32ebcd9af05fcd56f38b88";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.bsdOriginal;
      description = "A Python SOCKS client module. See https://github.com/Anorov/PySocks for more information.";
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



  "SecretStorage" = python.mkDerivation {
    name = "SecretStorage-2.3.1";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/a5/a5/0830cfe34a4cfd0d1c3c8b614ede1edb2aaf999091ac8548dd19cb352e79/SecretStorage-2.3.1.tar.gz";
      sha256 = "3af65c87765323e6f64c83575b05393f9e003431959c9395d1791d51497f29b6";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."cryptography"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.bsdOriginal;
      description = "Python bindings to FreeDesktop.org Secret Service API";
    };
  };



  "Twisted" = python.mkDerivation {
    name = "Twisted-16.6.0";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/dc/c0/a0114a6d7fa211c0904b0de931e8cafb5210ad824996cc6a9d67f3bae22c/Twisted-16.6.0.tar.bz2";
      sha256 = "d0fe115ea7ef8cf632d05103de60356c6e992b2153d6830bdc4476f8accb1fca";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."constantly"
      self."cryptography"
      self."h2"
      self."idna"
      self."incremental"
      self."pyasn1"
      self."pyflakes"
      self."pyserial"
      self."zope.interface"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "An asynchronous networking framework written in Python";
    };
  };



  "TwitterAPI" = python.mkDerivation {
    name = "TwitterAPI-2.4.2";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/17/33/aa35d9ab831d131a1921245a952f05dec6b10d3d649966a496690129fea2/TwitterAPI-2.4.2.tar.gz";
      sha256 = "a905fc5da6bbf6b5fdf9e3140a275a51088197c7c3206b77c2b1873899b8e09c";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."requests"
      self."requests-oauthlib"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "Minimal wrapper for Twitter's REST and Streaming APIs";
    };
  };



  "VarEvents" = python.mkDerivation {
    name = "VarEvents-1.0.0";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/b8/eb/0b00b73ccbae3b47788be89bafc971170d0c324b25b2ed6a4fb1ccf1a25f/VarEvents-1.0.0.tar.gz";
      sha256 = "82306168ac5e3b577c3361a7c3e32adfd50dc1cbb30c243e9b9df9a3dc9f4a87";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.asl20;
      description = "Python module to create variables that can raise custom events.";
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



  "XBee" = python.mkDerivation {
    name = "XBee-2.2.3";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/53/13/c3f53a63b5a9d8890e7911580c466b25a90b732a500d437a1205fef47a68/XBee-2.2.3.tar.gz";
      sha256 = "00fd0a817012c4ed72d1aeaf755afeeea3ad93836c82e4ed7e1e37b09edb805c";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = "LICENSE.txt";
      description = "Python tools for working with XBee radios";
    };
  };



  "aiohttp" = python.mkDerivation {
    name = "aiohttp-1.0.5";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/09/5a/7b81ea8729d41f44c6fe6a116e466c8fb884950a0061aa3768dbd6bee2f8/aiohttp-1.0.5.tar.gz";
      sha256 = "c3e1897726f97d40e067e8b658b2dbdfe216f32b801c5c589212e1b1f9aa8388";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."async-timeout"
      self."chardet"
      self."multidict"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.asl20;
      description = "http client/server for asyncio";
    };
  };



  "aiohttp-cors" = python.mkDerivation {
    name = "aiohttp-cors-0.4.0";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/88/c6/0fa0b81704871a1987edc6aa75fc7c75632de280b892afdd9a58e298f9b6/aiohttp_cors-0.4.0.tar.gz";
      sha256 = "4f4e8f7026f1c476f00498ee6f3f16110fcd65a9eb04fd02647aef3344830dca";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."aiohttp"
      self."typing"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.asl20;
      description = "CORS support for aiohttp";
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


  "anel-pwrctrl" = python.mkDerivation {
    name = "anel-pwrctrl-0.0.1";
    src = pkgs.fetchurl {
      url = "https://github.com/mweinelt/anel-pwrctrl/archive/ed26e8830e28a2bfa4260a9002db23ce3e7e63d7.zip";
      sha256 = "8fbe93f65222e0f0d88f779475f328e5e9d4d958d705b85a78a9e1b4af57aeb0";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."anel-pwrctrl"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "Discover and control ANEL NET-PwrCtrl devices.";
    };
  };



  "apcaccess" = python.mkDerivation {
    name = "apcaccess-0.0.4";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/b2/41/778e50f8fe668c6d5db2dd50f44dabff91aec728d096e218086fce321aff/apcaccess-0.0.4.tar.gz";
      sha256 = "4f626f1b2471ea96203a95e54d3b56cd9698d5bafdb228f7694bd410c58d52c5";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = "";
      description = "This project implements the apcaccess tool in pure Python and provides";
    };
  };



  "apns2" = python.mkDerivation {
    name = "apns2-0.1.1";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/40/cd/9b4ef15be03adec2fcf847e1816bdb0e8e5c1c88dea0d0dd07e3c3733823/apns2-0.1.1.tar.gz";
      sha256 = "900d337fdab43c11046038cc65a174106532101cd788b2d19cb811ebaee2e57b";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."hyper"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "A python library for interacting with the Apple Push Notification Service via HTTP/2 protocol";
    };
  };



  "astral" = python.mkDerivation {
    name = "astral-1.3";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/99/96/0dbd2401195a20ef9b4373c295bac2e8945fd0ad56c07f06857c416328af/astral-1.3.zip";
      sha256 = "7dd41ae0ec91ea3c053b6b40ed00de2b72157f956c61630a23c5fddb141f14c4";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."pytz"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = "Apache-2.0";
      description = "Calculations for the position of the sun and moon.";
    };
  };



  "async-timeout" = python.mkDerivation {
    name = "async-timeout-1.0.0";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/c3/5b/d00e06296f5fe2c1db230f5f3f39538a4ae23c153adb1672e87e94137f89/async_timeout-1.0.0.tar.gz";
      sha256 = "c7afd7355b93fca0aecc15811aa53eea57f6fd7307b5bff2336b01419ebeda36";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.asl20;
      description = "Timeout context manager for asyncio programs";
    };
  };



  "asyncio" = python.mkDerivation {
    name = "asyncio-3.4.3";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/da/54/054bafaf2c0fb8473d423743e191fcdf49b2c1fd5e9af3524efbe097bafd/asyncio-3.4.3.tar.gz";
      sha256 = "83360ff8bc97980e4ff25c964c7bd3923d333d177aa4f7fb736b019f26c7cb41";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = "";
      description = "reference implementation of PEP 3156";
    };
  };



  "batinfo" = python.mkDerivation {
    name = "batinfo-0.4.2";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/a3/51/a0a9ad2d19bb498f2779754209ca80b7ea53f948995367a2bf408b2bef7c/batinfo-0.4.2.tar.gz";
      sha256 = "497e29efc9353ec52e71d43bd040bdfb6d685137ddc2b9143cded4583af572f5";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.lgpl3;
      description = "A simple Python module to retrieve battery information";
    };
  };



  "beautifulsoup4" = python.mkDerivation {
    name = "beautifulsoup4-4.5.1";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/86/ea/8e9fbce5c8405b9614f1fd304f7109d9169a3516a493ce4f7f77c39435b7/beautifulsoup4-4.5.1.tar.gz";
      sha256 = "3c9474036afda9136aac6463def733f81017bf9ef3510d25634f335b0c87f5e1";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "Screen-scraping library";
    };
  };



  "bitstring" = python.mkDerivation {
    name = "bitstring-3.1.5";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/f3/e5/dfe4c49c93d174a5fd807ed307d3a3f38c6b3e140972945f81a5f5578ca7/bitstring-3.1.5.zip";
      sha256 = "c163a86fcef377c314690051885d86b47419e3e1770990c212e16723c1c08faa";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "Simple construction, analysis and modification of binary data.";
    };
  };



  "blockchain" = python.mkDerivation {
    name = "blockchain-1.3.3";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/7e/64/f0db6d429993280a4122e62ec9098a237f1f06ce400140ed4b9f02356bf9/blockchain-1.3.3.tar.gz";
      sha256 = "819b84dde3744d7d057c30f8ba3330fa3906cbf38d4b5ecde9d440bbbcde60f2";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "Blockchain API library (v1)";
    };
  };



  "boto3" = python.mkDerivation {
    name = "boto3-1.3.1";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/d9/6c/1063a4984d13f1b22edb30f3b97b6df7e0bdc7792ebc2f638b31f8b2ff79/boto3-1.3.1.tar.gz";
      sha256 = "6e4d33f2935580278af84b8d63760306d9586a5144780e4ba37737a1f2bdc56f";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."botocore"
      self."jmespath"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.asl20;
      description = "The AWS SDK for Python";
    };
  };



  "botocore" = python.mkDerivation {
    name = "botocore-1.4.78";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/cb/d4/bb0d9037329a2419f28d0c039bbb2345eb920b44e51bfef8c23d9250f979/botocore-1.4.78.tar.gz";
      sha256 = "5053ff212b429c74b18dd7a8aa27eec057e16c17a841c67d4c6a2b4b620abd1e";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."docutils"
      self."jmespath"
      self."python-dateutil"
      self."simplejson"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.asl20;
      description = "Low-level, data-driven core of boto 3.";
    };
  };



  "braviarc" = python.mkDerivation {
    name = "braviarc-0.3.6";
    src = pkgs.fetchurl {
      url = "https://github.com/aparraga/braviarc/archive/0.3.6.zip";
      sha256 = "fb8bcd08e877e7b1d1744d0dfb3e93ce3ccec0d1640d99a751ceacb6dfe9447f";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."requests"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = "";
      description = "# BraviaRC Python Package";
    };
  };



  "certifi" = python.mkDerivation {
    name = "certifi-2016.9.26";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/4f/75/e1bc6e363a2c76f8d7e754c27c437dbe4086414e1d6d2f6b2a3e7846f22b/certifi-2016.9.26.tar.gz";
      sha256 = "8275aef1bbeaf05c53715bfc5d8569bd1e04ca1e8e69608cc52bcaac2604eb19";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = "ISC";
      description = "Python package for providing Mozilla's CA Bundle.";
    };
  };



  "cffi" = python.mkDerivation {
    name = "cffi-1.9.1";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/a1/32/e3d6c3a8b5461b903651dd6ce958ed03c093d2e00128e3f33ea69f1d7965/cffi-1.9.1.tar.gz";
      sha256 = "563e0bd53fda03c151573217b3a49b3abad8813de9dd0632e10090f6190fdaf8";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."pycparser"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "Foreign Function Interface for Python calling C code.";
    };
  };



  "chardet" = python.mkDerivation {
    name = "chardet-2.3.0";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/7d/87/4e3a3f38b2f5c578ce44f8dc2aa053217de9f0b6d737739b0ddac38ed237/chardet-2.3.0.tar.gz";
      sha256 = "e53e38b3a4afe6d1132de62b7400a4ac363452dc5dfcf8d88e8e0cce663c68aa";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.lgpl2;
      description = "Universal encoding detector for Python 2 and 3";
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



  "coinmarketcap" = python.mkDerivation {
    name = "coinmarketcap-2.0.1";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/c2/d0/c0e07dd23278b8d0515c8c8d5b7712512350f14833e5818b09e1eeca4790/coinmarketcap-2.0.1.tar.gz";
      sha256 = "e72736bdca90e25686e291d2d1c5e85e9f53fe368392def4e5ef8f032d755d5d";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = "Apache v2.0 License";
      description = "Python API for coinmarketcap.com.";
    };
  };



  "colorlog" = python.mkDerivation {
    name = "colorlog-2.10.0";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/33/3e/1e9affd7ee817370f04f33f675ed4b3e91b01ad569cbafa31b0dfda869c5/colorlog-2.10.0.tar.gz";
      sha256 = "229cd0794a19d8f33b2b4a4b70e1225b6c010af96c2dc8615279abbc1bb3929a";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "Log formatting with colors!";
    };
  };



  "concord232" = python.mkDerivation {
    name = "concord232-0.14";
    src = pkgs.fetchurl {
      url = "https://github.com/JasonCarter80/concord232/archive/1ea0aa570df1cebb800ff83b9b6c394ce8e6008b.tar.gz";
      sha256 = "8255bd3910ad0a34c4dce0523a18825fc6bf147a59fb7bd5789ff38b7dfa2f58";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."Flask"
      self."prettytable"
      self."pyserial"
      self."requests"
      self."stevedore"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = "";
      description = "GE Concord 4 RS232 Serial Interface Library and Server";
    };
  };



  "constantly" = python.mkDerivation {
    name = "constantly-15.1.0";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/95/f1/207a0a478c4bb34b1b49d5915e2db574cadc415c9ac3a7ef17e29b2e8951/constantly-15.1.0.tar.gz";
      sha256 = "586372eb92059873e29eba4f9dec8381541b4d3834660707faf8ba59146dfc35";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "Symbolic constants in Python";
    };
  };



  "construct" = python.mkDerivation {
    name = "construct-2.8.8";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/b6/2c/66bab4fef920ef8caa3e180ea601475b2cbbe196255b18f1c58215940607/construct-2.8.8.tar.gz";
      sha256 = "1b84b8147f6fd15bcf64b737c3e8ac5100811ad80c830cb4b2545140511c4157";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "A powerful declarative parser/builder for binary data";
    };
  };



  "cookies" = python.mkDerivation {
    name = "cookies-2.2.1";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/f3/95/b66a0ca09c5ec9509d8729e0510e4b078d2451c5e33f47bd6fc33c01517c/cookies-2.2.1.tar.gz";
      sha256 = "d6b698788cae4cfa4e62ef8643a9ca332b79bd96cb314294b864ae8d7eb3ee8e";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "Friendlier RFC 6265-compliant cookie parser/renderer";
    };
  };



  "crcmod" = python.mkDerivation {
    name = "crcmod-1.7";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/6b/b0/e595ce2a2527e169c3bcd6c33d2473c1918e0b7f6826a043ca1245dd4e5b/crcmod-1.7.tar.gz";
      sha256 = "dc7051a0db5f2bd48665a990d3ec1cc305a466a77358ca4492826f41f283601e";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "CRC Generator";
    };
  };



  "cryptography" = python.mkDerivation {
    name = "cryptography-1.6";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/d7/a2/b90736c37fd720db425c5e48d69da75a6eff6609b22d2123762f1ae8c5f5/cryptography-1.6.tar.gz";
      sha256 = "4d0d86d2c8d3fc89133c3fa0d164a688a458b6663ab6fa965c80d6c2cdaf9b3f";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."cffi"
      self."flake8"
      self."idna"
      self."pyasn1"
      self."pyasn1-modules"
      self."pytz"
      self."six"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.bsdOriginal;
      description = "cryptography is a package which provides cryptographic recipes and primitives to Python developers.";
    };
  };



  "directpy" = python.mkDerivation {
    name = "directpy-0.1";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/22/8e/1b056ccda2bf8baf110c2c04e07fc85ca80e773dce08939a27cd1b5c052e/directpy-0.1.zip";
      sha256 = "b42f25dff70fab8afa5b95e3697ece9f5c0650fabc5343e65603247840867b0d";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "A python library for interacting with DirecTV receivers";
    };
  };



  "distro" = python.mkDerivation {
    name = "distro-1.0.1";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/0d/c5/de784640f0b434799d6eecb63baea9c099e7fe6c0908b4036c3a5200c281/distro-1.0.1.tar.gz";
      sha256 = "b940995858ec63a29a272ddf7916818bb5cccb9297928fb8230fd37a146b1f26";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.asl20;
      description = "Linux Distribution - a Linux OS platform information API";
    };
  };



  "dnspython" = python.mkDerivation {
    name = "dnspython-1.15.0";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/e4/96/a598fa35f8a625bc39fed50cdbe3fd8a52ef215ef8475c17cabade6656cb/dnspython-1.15.0.zip";
      sha256 = "40f563e1f7a7b80dc5a4e76ad75c23da53d62f1e15e6e517293b04e1f84ead7c";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.bsdOriginal;
      description = "DNS toolkit";
    };
  };



  "dnspython3" = python.mkDerivation {
    name = "dnspython3-1.15.0";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/f0/bb/f41cbc8eaa807afb9d44418f092aa3e4acf0e4f42b439c49824348f1f45c/dnspython3-1.15.0.zip";
      sha256 = "6eb9504abafb91cb67ed9dc3d3289a3ccc438533b460eccbf77e36c5323100f4";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."dnspython"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.bsdOriginal;
      description = "DNS toolkit";
    };
  };



  "docopt" = python.mkDerivation {
    name = "docopt-0.6.2";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/a2/55/8f8cab2afd404cf578136ef2cc5dfb50baa1761b68c9da1fb1e4eed343c9/docopt-0.6.2.tar.gz";
      sha256 = "49b3a825280bd66b3aa83585ef59c4a8c82f2c8a522dbe754a8bc8d08c85c491";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "Pythonic argument parser, that will make you smile";
    };
  };



  "docutils" = python.mkDerivation {
    name = "docutils-0.12";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/37/38/ceda70135b9144d84884ae2fc5886c6baac4edea39550f28bcd144c1234d/docutils-0.12.tar.gz";
      sha256 = "c7db717810ab6965f66c8cf0398a98c9d8df982da39b4cd7f162911eb89596fa";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.publicDomain;
      description = "Docutils -- Python Documentation Utilities";
    };
  };



  "dovado" = python.mkDerivation {
    name = "dovado-0.1.15";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/25/24/7e607fd9643b74918e953bf66b3d7435970aea9e3bb3ef0f1e11acc07c99/dovado-0.1.15.tar.gz";
      sha256 = "cd5bc3a1ca8a4ef3e3f463f19d1bef310345f2f10cd720018c5f33dbae579ffc";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = "";
      description = "Communicate with Dovado router";
    };
  };



  "dweepy" = python.mkDerivation {
    name = "dweepy-0.2.0";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/e7/48/f6a10cf276f94f2b6fbc0665dfe7a855774511eaa3c4ea85c57ace9d933a/dweepy-0.2.0.tar.gz";
      sha256 = "a89730cb2e924cb4cd9bafb605874baf6f709cd42ce141407cda6e0f8815e5f3";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."requests"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "Dweepy is a Python client for dweet.io";
    };
  };



  "ecdsa" = python.mkDerivation {
    name = "ecdsa-0.13";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/f9/e5/99ebb176e47f150ac115ffeda5fedb6a3dbb3c00c74a59fd84ddf12f5857/ecdsa-0.13.tar.gz";
      sha256 = "64cf1ee26d1cde3c73c6d7d107f835fed7c6a2904aef9eac223d57ad800c43fa";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "ECDSA cryptographic signature library (pure python)";
    };
  };



  "eliqonline" = python.mkDerivation {
    name = "eliqonline-1.0.12";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/c5/12/1b3a442b73e91ed6622aead457cc8ca0b9bb8124d4c55455bdf7e25a1f41/eliqonline-1.0.12.tar.gz";
      sha256 = "09baaa4e1b8c487a73fc37d0a6c68c7769700597dc76122817ad9200b9560da6";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = "";
      description = "Eliq Online API Library";
    };
  };



  "enocean" = python.mkDerivation {
    name = "enocean-0.31";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/5e/e3/98c2906329b34fd696c9ccdd420bb81a61f5936de03ef44834fefcafc858/enocean-0.31.tar.gz";
      sha256 = "6badb78f4639555a01fc19adf42fccfc45b11cbe3d353eb4163e3b6b0b666929";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."beautifulsoup4"
      self."enum-compat"
      self."pyserial"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = "";
      description = "EnOcean serial protocol implementation";
    };
  };



  "enum-compat" = python.mkDerivation {
    name = "enum-compat-0.0.2";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/95/6e/26bdcba28b66126f66cf3e4cd03bcd63f7ae330d29ee68b1f6b623550bfa/enum-compat-0.0.2.tar.gz";
      sha256 = "939ceff18186a5762ae4db9fa7bfe017edbd03b66526b798dd8245394c8a4192";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "enum/enum34 compatibility package";
    };
  };



  "evohomeclient" = python.mkDerivation {
    name = "evohomeclient-0.2.5";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/04/58/01585fb3b63412f45b45fc7dad84c0e92cc4978b1be5b1986af3d4dba948/evohomeclient-0.2.5.zip";
      sha256 = "d572612bb82f2e98545ba8d8129878f7cc15c94eae2e345a69e6ca4864f22eaf";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."requests"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.asl20;
      description = "Python client for connecting to the Evohome webservice";
    };
  };



  "fastdotcom" = python.mkDerivation {
    name = "fastdotcom-0.0.1";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/8a/3d/7dd25e0c363d11a66714a988b8444e40416d15dcd7bd6e6c9c7d54fa9029/fastdotcom-0.0.1.tar.gz";
      sha256 = "53d34a7c833b99b3fc8afbf793642ad7ef02c65d0aeaf3f82f305aeaba178c6c";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."requests"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "Python API for testing internet speed on Fast.com";
    };
  };



  "feedparser" = python.mkDerivation {
    name = "feedparser-5.2.1";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/91/d8/7d37fec71ff7c9dbcdd80d2b48bcdd86d6af502156fc93846fb0102cb2c4/feedparser-5.2.1.tar.bz2";
      sha256 = "ce875495c90ebd74b179855449040003a1beb40cd13d5f037a0654251e260b02";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = "License :: OSI Approved";
      description = "Universal feed parser, handles RSS 0.9x, RSS 1.0, RSS 2.0, CDF, Atom 0.3, and Atom 1.0 feeds";
    };
  };



  "fitbit" = python.mkDerivation {
    name = "fitbit-0.2.3";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/f6/36/e07c84528027b3081d6916b02ecc9f9aa837faa046c31e9f19ff526700cd/fitbit-0.2.3.tar.gz";
      sha256 = "8c515a5c754d391d57f5688eb40b98dc0ac320f82bacf84096cbeb8f25b8a663";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."python-dateutil"
      self."requests-oauthlib"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.asl20;
      description = "Fitbit API Wrapper.";
    };
  };



  "fixerio" = python.mkDerivation {
    name = "fixerio-0.1.1";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/5b/32/1364f87f46545d5f7a7483c52bdb5c0af6e36d736f48255924a5c617341f/fixerio-0.1.1.tar.gz";
      sha256 = "b23ace77bf914474bc4b52c587568a391502831f7112b7335c8dc3b2fcfea67e";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."requests"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "A Python client for Fixer.io";
    };
  };



  "flake8" = python.mkDerivation {
    name = "flake8-3.2.1";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/51/70/af1b3130cd051f2f79854b14079b3bcbad84b8bac31a7dffc63ef57f8a7a/flake8-3.2.1.tar.gz";
      sha256 = "c7c460b5aff3a2063c798a77af18ec70af3941d35a22e2e76965e3c0e0b36055";
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



  "flux-led" = python.mkDerivation {
    name = "flux-led-0.9";
    src = pkgs.fetchurl {
      url = "https://github.com/Danielhiversen/flux_led/archive/0.9.zip";
      sha256 = "a2738d53c1cf11de0ed9126b672c76c2505b2496a9338909f4eeb848211fb1f4";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.lgpl3Plus;
      description = "a library to communicate with the flux_led";
    };
  };



  "freesms" = python.mkDerivation {
    name = "freesms-0.1.0";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/30/93/097affeb907cd9ce5c928b5c7fe497a8dd9a71ed6bce8d41ef559f70d078/freesms-0.1.0.tar.gz";
      sha256 = "31fdf3e84ec645092c319ef9c85bf6a543fd24ce094bebd70bb9f359fef6a40a";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = "Copyright © 2015 – Baptiste Fontaine";
      description = "Send SMS with Free Mobile";
    };
  };



  "future" = python.mkDerivation {
    name = "future-0.16.0";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/00/2b/8d082ddfed935f3608cc61140df6dcbf0edea1bc3ab52fb6c29ae3e81e85/future-0.16.0.tar.gz";
      sha256 = "e39ced1ab767b5936646cedba8bcce582398233d6a627067d4c6a454c90cfedb";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "Clean single-source support for Python 3 and 2";
    };
  };



  "fuzzywuzzy" = python.mkDerivation {
    name = "fuzzywuzzy-0.14.0";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/04/4d/1c9ae2b56fa1ad9a69999b9f82b05e44d3af97d042a5f8950745a44cd8f1/fuzzywuzzy-0.14.0.tar.gz";
      sha256 = "8f2308ae51556a5195e19f2bd7f3d72daebd23d0d53fa6bcbaf4d31c2a39a5b9";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = "
                    GNU GENERAL PUBLIC LICENSE
                       Version 2, June 1991";
      description = "Fuzzy string matching in python";
    };
  };



  "gntp" = python.mkDerivation {
    name = "gntp-1.0.3";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/c4/6c/fabf97b5260537065f32a85930eb62776e80ba8dcfed78d4247584fd9aa9/gntp-1.0.3.tar.gz";
      sha256 = "f4a4f2009ecb8bb41a1aaddd5fb7c03087b2a14cac2c03af029ba04b9166dae0";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "Growl Notification Transport Protocol for Python";
    };
  };



  "google-api-python-client" = python.mkDerivation {
    name = "google-api-python-client-1.5.5";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/a7/4e/1278995cd1e50b9cdb6b04981db91290b5aedca8fba48b9f83c7dba05f6d/google-api-python-client-1.5.5.tar.gz";
      sha256 = "c9f6bf15c76b05a3c2e301a5509e97f11c5902fb6b03dcb7faf5b5337c66f557";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."httplib2"
      self."oauth2client"
      self."six"
      self."uritemplate"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.asl20;
      description = "Google API Client Library for Python";
    };
  };



  "googlemaps" = python.mkDerivation {
    name = "googlemaps-2.4.4";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/0d/22/42c6595fd2faef13bc7aa64cb675a2634f5dc6a142927023dd311a137472/googlemaps-2.4.4.tar.gz";
      sha256 = "c186db17a7dc7c09550a6782dd93fc7b44a70677749744af062d283430a2be68";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."requests"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.asl20;
      description = "Python client library for Google Maps API Web Services";
    };
  };



  "gps3" = python.mkDerivation {
    name = "gps3-0.33.0";
    src = pkgs.fetchurl {
      url = "https://github.com/wadda/gps3/archive/b55a13a7984fc7f06a1ec4734549884be724a51e.zip";
      sha256 = "b462b694550dc1b6f89c790902df23e6e3546184f5c0d1ea2224f8fa7903eeb7";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "Python 2.7-3.5 clients for gpsd";
    };
  };



  "h2" = python.mkDerivation {
    name = "h2-2.5.0";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/d3/5d/5319f26a8db4bd273d539514bad2d1c0538cce94c7d52e5a48b34b13036f/h2-2.5.0.tar.gz";
      sha256 = "6c1512798f2ec2f178b5eed80be3c5239145d23989a1ff3c7cc635ee679cc241";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."hpack"
      self."hyperframe"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "HTTP/2 State-Machine based protocol implementation";
    };
  };



  "ha-alpr" = python.mkDerivation {
    name = "ha-alpr-0.3";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/8f/0e/3703ff8430446edba5ac75064797d7ec9504b84bc2717c22d1e8facd3c7d/ha-alpr-0.3.zip";
      sha256 = "b24837286fdc91020d28f3b6441564d29ca76dafb2bd4c92d4909af341f9975a";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "a Python module that provides an interface OpenAlpr command line tool for Home-Assistant.";
    };
  };



  "ha-ffmpeg" = python.mkDerivation {
    name = "ha-ffmpeg-0.15";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/00/c4/39e6136ec5805e839eb2266d682fd6021fca067a79eb45399d79304a89bf/ha-ffmpeg-0.15.zip";
      sha256 = "015c622f664f3b8bd37880038cd8210d9b5d9090844d7df1fbacf7e17ba6b4f3";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."async-timeout"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.bsdOriginal;
      description = "A library that handling with ffmpeg for home-assistant";
    };
  };



  "ha-philipsjs" = python.mkDerivation {
    name = "ha-philipsjs-0.0.1";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/0b/16/e2a6a18d9295835cdde9ff29fc3ebea49d8ff9b4de57c2410a6e1858b8be/ha-philipsjs-0.0.1.tar.gz";
      sha256 = "15c4d936df25e292a86ab0a2b2d5d007da7f6df777728a1d9b6f2ce5d0e028a6";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "jointSPACE API for Home-Assistant";
    };
  };



  "hbmqtt" = python.mkDerivation {
    name = "hbmqtt-0.7.1";
    src = pkgs.fetchurl {
      url = "https://github.com/beerfactory/hbmqtt/archive/0.7.1.zip";
      sha256 = "c4c81a596945244c6734fe514d619615ea8e045b60edb30f41279f85bc29b985";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."PyYAML"
      self."docopt"
      self."passlib"
      self."transitions"
      self."websockets"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "MQTT client/brocker using Python 3.4 asyncio library";
    };
  };



  "heatmiserV3" = python.mkDerivation {
    name = "heatmiserV3-0.9.1";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/15/97/2ee9aa726ae7175ab2018f0a8e4ad145ebf6954e6e34ba072a15db97bb77/heatmiserV3-0.9.1.tar.gz";
      sha256 = "2bc2d049c9212a635fe65d2bfd37e277235837ed1ed636362b37a6a5ab4ce4db";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."pyserial"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = "";
      description = "A library to interact with Heatmiser Themostats using the v3 protocol";
    };
  };



  "hikvision" = python.mkDerivation {
    name = "hikvision-0.4";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/5c/e6/e560aff7ff2fbba434357bca1de2ae9430d87285c6f809b4545eaa783925/hikvision-0.4.tar.gz";
      sha256 = "26730b16b0939c154f22a6f49e0054b9566bc24398738d1bf2645f2bd9092a2b";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "Provides a python interface to interact with a hikvision camera";
    };
  };



  "hpack" = python.mkDerivation {
    name = "hpack-2.3.0";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/7b/24/3e84d3650f719b9cabc5f125c270713c2239650cdf8296dfd77485051573/hpack-2.3.0.tar.gz";
      sha256 = "51bd9aa8151efd190d70fe87991b1e3b79be0f93f0e34088fba2a8d34877a0a9";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "Pure-Python HPACK header compression";
    };
  };



  "http-ece" = python.mkDerivation {
    name = "http-ece-0.5.0";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/8e/1a/4795e69a1dc9d4872fea10f9ed10cc20bd48f1260434653a321c396cf608/http_ece-0.5.0.tar.gz";
      sha256 = "c5bcc4e3026b00231a82206e451cf98ac2b5e1b2ba221cfee6416af27b99d924";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."cryptography"
      self."pyelliptic"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "Encrypted Content Encoding for HTTP";
    };
  };



  "httplib2" = python.mkDerivation {
    name = "httplib2-0.9.2";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/ff/a9/5751cdf17a70ea89f6dde23ceb1705bfb638fd8cee00f845308bf8d26397/httplib2-0.9.2.tar.gz";
      sha256 = "c3aba1c9539711551f4d83e857b316b5134a1c4ddce98a875b7027be7dd6d988";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "A comprehensive HTTP client library.";
    };
  };



  "hyper" = python.mkDerivation {
    name = "hyper-0.7.0";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/af/f7/f60d8032f331994f29ce2d79fb5d7fe1e3c1355cac0078c070cf4feb3b52/hyper-0.7.0.tar.gz";
      sha256 = "12c82eacd122a659673484c1ea0d34576430afbe5aa6b8f63fe37fcb06a2458c";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."cryptography"
      self."h2"
      self."hyperframe"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "HTTP/2 Client for Python";
    };
  };



  "hyperframe" = python.mkDerivation {
    name = "hyperframe-3.2.0";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/50/96/7080c938d2b06105365bae946c77c78a32d9e763eaa05d0e431b02d7bc12/hyperframe-3.2.0.tar.gz";
      sha256 = "05f0e063e117c16fcdd13c12c93a4424a2c40668abfac3bb419a10f57698204e";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "HTTP/2 framing layer for Python";
    };
  };



  "idna" = python.mkDerivation {
    name = "idna-2.1";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/fb/84/8c27516fbaa8147acd2e431086b473c453c428e24e8fb99a1d89ce381851/idna-2.1.tar.gz";
      sha256 = "ed36f281aebf3cd0797f163bb165d84c31507cedd15928b095b1675e2d04c676";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.bsdOriginal;
      description = "Internationalized Domain Names in Applications (IDNA)";
    };
  };



  "incremental" = python.mkDerivation {
    name = "incremental-16.10.1";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/da/b0/32233c9e84b0d44b39015fba8fec03e88053723c1b455925081dc6ccd9e7/incremental-16.10.1.tar.gz";
      sha256 = "14ad6b720ec47aad6c9caa83e47db1843e2b9b98742da5dda08e16a99f400342";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."Twisted"
      self."click"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "UNKNOWN";
    };
  };



  "inflection" = python.mkDerivation {
    name = "inflection-0.3.1";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/d5/35/a6eb45b4e2356fe688b21570864d4aa0d0a880ce387defe9c589112077f8/inflection-0.3.1.tar.gz";
      sha256 = "18ea7fb7a7d152853386523def08736aa8c32636b047ade55f7578c4edeb16ca";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "A port of Ruby on Rails inflector to Python";
    };
  };



  "influxdb" = python.mkDerivation {
    name = "influxdb-3.0.0";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/46/ed/a329b86d999ff7ded9205fa76c01343eb62643ed2577cd91097311820f22/influxdb-3.0.0.tar.gz";
      sha256 = "89ad6443dc89e4dda530827716afca5f488f98a406aab9f3699ffb984710da8d";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."python-dateutil"
      self."pytz"
      self."requests"
      self."six"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "InfluxDB client";
    };
  };



  "insteon-hub" = python.mkDerivation {
    name = "insteon-hub-0.4.5";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/2e/1a/f532728eee494d5da0d2ea85285160700659392a0be8cf2b83d6aaf92498/insteon-hub-0.4.5.tar.gz";
      sha256 = "8bb3c6834ccdd7a4f9bcfad7fe87831b1c4be129c7c89ee8319b0850a93372a9";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."PyYAML"
      self."requests"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "A python package that interacts with the Insteon Hub Cloud API";
    };
  };



  "intelhex" = python.mkDerivation {
    name = "intelhex-2.1";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/3d/0c/afd9df6e2c912571d25536da6139e458832192aedfc7041bda3abea3a70e/intelhex-2.1.tar.gz";
      sha256 = "7c1e136efe97672dcf90feed18fc291977d4f5eccf13d124583bec376c0db44c";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.bsdOriginal;
      description = "Python Intel Hex library";
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



  "jmespath" = python.mkDerivation {
    name = "jmespath-0.9.0";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/8f/d8/6e3e602a3e90c5e3961d3d159540df6b2ff32f5ab2ee8ee1d28235a425c1/jmespath-0.9.0.tar.gz";
      sha256 = "08dfaa06d4397f283a01e57089f3360e3b52b5b9da91a70e1fd91e9f0cdd3d3d";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "JSON Matching Expressions";
    };
  };



  "jsonrpc-requests" = python.mkDerivation {
    name = "jsonrpc-requests-0.3";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/d9/ec/13feece53ec28d32c85330d52db484a20e6411b15ad77e7f6ba67ac99d94/jsonrpc-requests-0.3.tar.gz";
      sha256 = "a14e5d29d048e51981eabcef584576d8d9afe7d7cf402a6972acecc50183c636";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."requests"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.bsdOriginal;
      description = "A JSON-RPC client library, backed by requests";
    };
  };



  "keyring" = python.mkDerivation {
    name = "keyring-9.3.1";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/7e/84/65816c2936cf7191bcb5b3e3dc4fb87def6f8a38be25b3a78131bbb08594/keyring-9.3.1.tar.gz";
      sha256 = "3be74f6568fcac1350b837d7e46bd3525e2e9fe2b78b3a3a87dc3b29f24a0c00";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."SecretStorage"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.psfl;
      description = "Store and access your passwords safely.";
    };
  };



  "keyrings.alt" = python.mkDerivation {
    name = "keyrings.alt-1.1.1";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/27/d0/9207bf58de11735fe2239deaecb9eae1084e2887077a700ac8aa27bd8159/keyrings.alt-1.1.1.tar.gz";
      sha256 = "2f1a55849504644795076291bcc66a7266e0388dea13fe23a89d25c99e355d22";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "Alternate keyring implementations";
    };
  };



  "knxip" = python.mkDerivation {
    name = "knxip-0.3.3";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/62/0b/e0bdb28af507af129d6d6309d717b2949cbd4e3f595f15078b87ba977da1/knxip-0.3.3.tar.gz";
      sha256 = "436d02275a7e12356384b470c45651d560085012d83220e6163342f3a7e469a7";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "A native Python KNX/IPNet implementation";
    };
  };



  "libnacl" = python.mkDerivation {
    name = "libnacl-1.5.0";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/b8/59/62b7f0952da7ce6d677c8cc78ef62defe48c99bdf5822ca407b5a5c7008f/libnacl-1.5.0.tar.gz";
      sha256 = "1af2bc9fab80bd264ed224d9c4cacb0514db2f202eca5a4d90da3b06ba2000de";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = "License :: OSI Approved :: Apache Software License";
      description = "Python bindings for libsodium based on ctypes";
    };
  };



  "liffylights" = python.mkDerivation {
    name = "liffylights-0.9.4";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/dd/be/4af3a1d356a3d94ed99dc2483457073d8cde6adab6279caa4661570cd9f1/liffylights-0.9.4.tar.gz";
      sha256 = "e7639c238ea83c6fcb34916c27c754911782798a6894a5e1eb0b409cb2c05da3";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "LIFX Python library";
    };
  };



  "lightify" = python.mkDerivation {
    name = "lightify-1.0.3";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/1d/fd/b70051fb6b727d6a8a8c6fc1cf9818a7d0b5ef953cde503cb8687b5d9ff6/lightify-1.0.3.tar.gz";
      sha256 = "a505b2653a26e3b8c423444ab9f2f3e1561c3490a7be6e1c1271cb52595d0fa1";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.bsdOriginal;
      description = "A library to work with OSRAM lightify.";
    };
  };



  "limitlessled" = python.mkDerivation {
    name = "limitlessled-1.0.2";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/69/ae/80e1faa026fc30a97a84f99a440f0fe999012bc745890172898032c4ab03/limitlessled-1.0.2.tar.gz";
      sha256 = "878dff07dd6a56e1e69ce18f343c1ef8869dc66288061ef804c7c444251fe98d";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "Control LimitlessLED products.";
    };
  };



  "lnetatmo" = python.mkDerivation {
    name = "lnetatmo-0.7.0";
    src = pkgs.fetchurl {
      url = "https://github.com/jabesq/netatmo-api-python/archive/v0.7.0.zip";
      sha256 = "b0acfebfe0f3e5391f1bf90ff886beb7d140e565ad1ffe159c5fe52e0b1eebcc";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = "Open Source";
      description = "Simple API to access Netatmo weather station data from any python script.";
    };
  };



  "matrix-client" = python.mkDerivation {
    name = "matrix-client-0.0.5";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/da/8b/823c24ccc0f30d5b88c7f7d5b2453d84e3e46dd7f6e48e46baf6cf1656e6/matrix-client-0.0.5.tar.gz";
      sha256 = "a3fc8817c87f1a9bf81c3f3d2a3d020db7aed56c4207d076312ab0f3380c686f";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."flake8"
      self."requests"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.asl20;
      description = "Client-Server SDK for Matrix";
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



  "messagebird" = python.mkDerivation {
    name = "messagebird-1.2.0";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/4d/9f/e52ed22f65c507a0cd15cbc66e5dde7148efbc2582a7aa6a3ac9a9433b43/messagebird-1.2.0.tar.gz";
      sha256 = "6af67edf85ea91e73db117d7d79fdffcc6e616431f6032bc37a4635c4ce8caa2";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."requests"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = "BSD-2-Clause";
      description = "MessageBird's REST API";
    };
  };



  "mficlient" = python.mkDerivation {
    name = "mficlient-0.3.0";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/25/05/7548e733c049bff3448fcce646ca28f33afe7bc28fce9d8f8ff430e2fe20/mficlient-0.3.0.tar.gz";
      sha256 = "aecb7f1eb6b8d8b62582c36496a055174c1038557d7a30d7ee8a144182e8ef9b";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."requests"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = "";
      description = "A remote control client for Ubiquiti's mFi system";
    };
  };



  "miflora" = python.mkDerivation {
    name = "miflora-0.1.12";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/02/e1/33c810a6433ecbdcca1b8b3ce398aaede8749627ea7802e2433bea24a260/miflora-0.1.12.tar.gz";
      sha256 = "7335baf8f3e3a571d568d1c981b7df3742b1c7f8ae0faa9a49ec8d9df48e3bb6";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "Library to read data from Mi Flora sensor";
    };
  };



  "multidict" = python.mkDerivation {
    name = "multidict-2.1.3";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/10/41/ef9b03ea23bc662d97a0301e57aa2c9b023437519a4988ab8ac79a47f470/multidict-2.1.3.tar.gz";
      sha256 = "6353221c765eed82599cd9c2f33c737e5cf067f1239c43dff36e0b1f0b2db6b6";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.asl20;
      description = "multidict implementation";
    };
  };



  "netaddr" = python.mkDerivation {
    name = "netaddr-0.7.18";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/7c/ec/104f193e985e0aa813ffb4ba5da78d6ae3200165bf583d522ac2dc40aab2/netaddr-0.7.18.tar.gz";
      sha256 = "a1f5c9fcf75ac2579b9995c843dade33009543c04f218ff7c007b3c81695bd19";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.bsdOriginal;
      description = "A network address manipulation library for Python";
    };
  };



  "netdisco" = python.mkDerivation {
    name = "netdisco-0.7.7";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/d2/5c/220997aba36946596570f8670b0d3b96a119f0f2b12aaac66a88b206f4eb/netdisco-0.7.7.tar.gz";
      sha256 = "ece9c994c16c59794bb1b80a7e33f5837529dd1757369df6dccf082a8178115c";
    };
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
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/a7/4c/8e0771a59fd6e55aac993a7cc1b6a0db993f299514c464ae6a1ecf83b31d/netifaces-0.10.5.tar.gz";
      sha256 = "59d8ad52dd3116fcb6635e175751b250dc783fb011adba539558bd764e5d628b";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "Portable network interface information.";
    };
  };



  "neurio" = python.mkDerivation {
    name = "neurio-0.2.10";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/53/b0/f3018840ac7663760834e6f5c5240f35c198167fd33dd26e2a45ec79e311/neurio-0.2.10.tar.gz";
      sha256 = "df654dd14013658b7b3e7e053d3a2fa7a6f129abdca0a0459f444609230ad8e0";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."requests"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = "";
      description = "Neurio energy sensor and appliance automation API library";
    };
  };



  "oauth2client" = python.mkDerivation {
    name = "oauth2client-3.0.0";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/c0/7b/bc893e35d6ca46a72faa4b9eaac25c687ce60e1fbe978993fe2de1b0ff0d/oauth2client-3.0.0.tar.gz";
      sha256 = "5b5b056ec6f2304e7920b632885bd157fa71d1a7f3ddd00a43b1541a8d1a2460";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."httplib2"
      self."pyasn1"
      self."pyasn1-modules"
      self."rsa"
      self."six"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.asl20;
      description = "OAuth 2.0 client library";
    };
  };



  "oauthlib" = python.mkDerivation {
    name = "oauthlib-2.0.1";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/d2/4c/5ac894a469e25ebd02f6b3c2adb9f55253e6d1ca1f16a7d247ae6d48b4c8/oauthlib-2.0.1.tar.gz";
      sha256 = "132ad46df25e53a84b33f1fd43f80e973cda2cb018cc0168d7d0c8c4d5cef9b5";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."PyJWT"
      self."cryptography"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.bsdOriginal;
      description = "A generic, spec-compliant, thorough implementation of the OAuth request-signing logic";
    };
  };



  "onkyo-eiscp" = python.mkDerivation {
    name = "onkyo-eiscp-0.9.2";
    src = pkgs.fetchurl {
      url = "https://github.com/danieljkemp/onkyo-eiscp/archive/python3.zip";
      sha256 = "6f9528939656b55e74ef7d06ad8d435095ea68f7ff02b0ad0e2b1c0f33ac6c88";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."docopt"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "Control Onkyo receivers over ethernet.";
    };
  };



  "openalpr-api" = python.mkDerivation {
    name = "openalpr-api-1.0.2";
    src = pkgs.fetchurl {
      url = "https://github.com/pvizeli/cloudapi/releases/download/1.0.2/python-1.0.2.zip";
      sha256 = "aa8dd37037670d22fdf7269d750296236688f42916767e47a2b3c6bbc20caef7";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."certifi"
      self."python-dateutil"
      self."six"
      self."urllib3"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = "";
      description = "OpenALPR Cloud API";
    };
  };



  "orvibo" = python.mkDerivation {
    name = "orvibo-1.1.1";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/b2/a5/f102cf4661900b4c25d497b935493fcf0883c8c468f898cd2df910016ef9/orvibo-1.1.1.tar.gz";
      sha256 = "ccf581acb313ea6d6e5f3d3cba1bfe0e03c96edb90c2195d003d378661f0a5f0";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "Control Orvibo products.";
    };
  };



  "paho-mqtt" = python.mkDerivation {
    name = "paho-mqtt-1.2";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/82/d9/7064d3a0a1d62756a1a809c85b99f864c641b66de84c15458f72193b7708/paho-mqtt-1.2.tar.gz";
      sha256 = "9100a6aa706ab699d414ec02705a21eb66f436184691d0bf1f2a85a6213c6c1f";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = "License :: OSI Approved";
      description = "MQTT version 3.1.1 client class";
    };
  };



  "panasonic-viera" = python.mkDerivation {
    name = "panasonic-viera-0.2";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/e8/26/47611922a091be3c3a81db062240aab7cd279012bcf3035135126b57451f/panasonic_viera-0.2.tar.gz";
      sha256 = "200052199dc3c7c907402b61fa09d326f3ac3fac821f78a4c744b32aa3efcae3";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = "";
      description = "Library to control Panasonic Viera TVs";
    };
  };



  "passlib" = python.mkDerivation {
    name = "passlib-1.7.0.post20161128030108";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/c7/9b/e09ca2fa46ad1503071a87a9398b424ceb38ec5fad689cbd235df1321d09/passlib-1.7.0.tar.gz";
      sha256 = "0be4f6053357c4ebba5578a065fbdad75a844501d4c6d91d4a3a0c1594c6abed";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."cryptography"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.bsdOriginal;
      description = "comprehensive password hashing framework supporting over 30 schemes";
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



  "pexpect" = python.mkDerivation {
    name = "pexpect-4.0.1";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/88/50/3aa199018e996bcf963a81160083fd30557c3d4dab72eb1e9cce3afb69e7/pexpect-4.0.1.tar.gz";
      sha256 = "232795ebcaaf2e120396dbbaa3a129eda51757eeaae1911558f4ef8ee414fc6c";
    };
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



  "phue" = python.mkDerivation {
    name = "phue-0.9";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/e6/b6/4392f863fcad4f3dbecec580ff8e7915b9a5cc28c1f7a51067e2cbdfa5f5/phue-0.9.tar.gz";
      sha256 = "58b75475fdd3267b2708549f4185f4eee2658e72728dcc4b239439c7918a2cd7";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "A Philips Hue Python library";
    };
  };



  "pilight" = python.mkDerivation {
    name = "pilight-0.1.1";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/be/24/bee3980c42d5f82f1cb86e7661fce1acbc19e506a6327f993e12fb98378a/pilight-0.1.1.tar.gz";
      sha256 = "a13b6a96439f2d4be632cd76442f45c418df25412b927bf43c997fb865adaa87";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "A pure python module to connect to a pilight daemon to send and receive commands.";
    };
  };



  "ply" = python.mkDerivation {
    name = "ply-3.9";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/a8/4d/487e12d0478ee0cbb15d6fe9b8916e98fe4e2fce4cc65e4de309209c0b24/ply-3.9.tar.gz";
      sha256 = "0d7e2940b9c57151392fceaa62b0865c45e06ce1e36687fd8d03f011a907f43e";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.bsdOriginal;
      description = "Python Lex & Yacc";
    };
  };



  "pmsensor" = python.mkDerivation {
    name = "pmsensor-0.3";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/a2/f3/5d657095026c5ec27a53b4df5489cd3d32218deb90925d42987be43ea4cc/pmsensor-0.3.tar.gz";
      sha256 = "12f91decc08aa4f592951816ee7be00b2c0a0629be6f4aff04ec079608818aba";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."pyserial"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "Library to read data from environment ensors";
    };
  };



  "powerviewApi" = python.mkDerivation {
    name = "powerviewApi-0.3.15";
    src = pkgs.fetchurl {
      url = "https://github.com/sander76/powerviewApi/archive/246e782d60d5c0addcc98d7899a0186f9d5640b0.zip";
      sha256 = "43af352aa8571bc90c5554ef1aa2e97eb4e44b8fc1655d82c6574f450ee16768";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = "";
      description = "UNKNOWN";
    };
  };



  "prettytable" = python.mkDerivation {
    name = "prettytable-0.7.2";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/ef/30/4b0746848746ed5941f052479e7c23d2b56d174b82f4fd34a25e389831f5/prettytable-0.7.2.tar.bz2";
      sha256 = "853c116513625c738dc3ce1aee148b5b5757a86727e67eff6502c7ca59d43c36";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.bsdOriginal;
      description = "A simple Python library for easily displaying tabular data in a visually appealing ASCII table format";
    };
  };



  "proliphix" = python.mkDerivation {
    name = "proliphix-0.4.1";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/b1/b5/d6785b6b2a1cd0c7a9c4fd7eb2fbb0ee0084fb9c080c1e9723994c9880a3/proliphix-0.4.1.tar.gz";
      sha256 = "2e915583f2bc32331c5d9043196728d0aa4a2a37854adec4965b72c399400b76";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."requests"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = "License :: OSI Approved :: Apache Software License";
      description = "API for Proliphix nt10e network thermostat.";
    };
  };



  "protobuf" = python.mkDerivation {
    name = "protobuf-3.0.0b2";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/21/e4/b27b31f5c8a650af6c9bb4f3626d411f855a5668d334d4c7419da58c0d9f/protobuf-3.0.0b2.tar.gz";
      sha256 = "d5b560bbc4b7d97cc2455c05cad9299d9db02d7bd11193b05684e3a86303c229";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."six"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = "New BSD License";
      description = "Protocol Buffers";
    };
  };



  "psutil" = python.mkDerivation {
    name = "psutil-5.0.0";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/93/7f/347309562d30c688299727e65f4d76ef34180c406dfb6f2c7b6c8d746e13/psutil-5.0.0.zip";
      sha256 = "5411e22c63168220f4b8cc42fd05ea96f5b5e65e08b93b675ca50653aea482f8";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.bsdOriginal;
      description = "psutil is a cross-platform library for retrieving information onrunning processes and system utilization (CPU, memory, disks, network)in Python.";
    };
  };



  "ptyprocess" = python.mkDerivation {
    name = "ptyprocess-0.5.1";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/db/d7/b465161910f3d1cef593c5e002bff67e0384898f597f1a7fdc8db4c02bf6/ptyprocess-0.5.1.tar.gz";
      sha256 = "0530ce63a9295bfae7bd06edc02b6aa935619f486f0f1dc0972f516265ee81a6";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = "";
      description = "Run a subprocess in a pseudo terminal";
    };
  };



  "pubnub" = python.mkDerivation {
    name = "pubnub-3.8.2";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/fe/20/73ec3facfa4d3585e37d6a3976f8362c9aaa35ba2b430e2acd42908327db/pubnub-3.8.2.tar.gz";
      sha256 = "247ec5ca3aa2bc9ab51294d509e4b83968e94a10d006e4d9a35a82f05a889ebc";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."pycryptodomex"
      self."requests"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "PubNub Real-time push service in the cloud";
    };
  };



  "pushbullet.py" = python.mkDerivation {
    name = "pushbullet.py-0.10.0";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/7d/a8/7fbed382824e84a51dfdc13315d9171fb6dc0670803ccb400931b9e3465b/pushbullet.py-0.10.0.tar.gz";
      sha256 = "537d3132e1dbc91e31ade4cccf4c7def6f9d48e904a67f341d35b8a54a9be74d";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."python-magic"
      self."requests"
      self."websocket-client"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "A simple python client for pushbullet.com";
    };
  };



  "pushetta" = python.mkDerivation {
    name = "pushetta-1.0.15";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/1b/af/f1d0d56f9e55a2f1270c324e174492454488663dbcd9a196a969cd81088f/pushetta-1.0.15.tar.gz";
      sha256 = "75d69d672f3cea8453a36f0ee638c64079d93c27f52f3b96d2bf7752ec034cf6";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."future"
      self."paho-mqtt"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "Client for Pushetta API";
    };
  };



  "py-cpuinfo" = python.mkDerivation {
    name = "py-cpuinfo-0.2.3";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/84/84/0a736376cedd59f9c6ca931debfbce75c6e5f8c90399d40bdc73a76107f7/py-cpuinfo-0.2.3.tar.gz";
      sha256 = "f6a016fdbc4e7fadf2d519090fcb4fa9d0831bad4e85245d938e5c2fe7623ca6";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "Get CPU info with pure Python 2 & 3";
    };
  };



  "pyEmby" = python.mkDerivation {
    name = "pyEmby-0.1";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/a1/9e/714046eafde2dbf9edad8932cd5b55f0efd0efb112fa2e6f82711a624846/pyEmby-0.1.tar.gz";
      sha256 = "8c77280cb7f7e30461c73a49619386a5fce55b8507607b258efc4fef4da6b889";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = "";
      description = "Provides a python interface to interact with a Emby media server.";
    };
  };



  "pyHS100" = python.mkDerivation {
    name = "pyHS100-0.2.0";
    src = pkgs.fetchurl {
      url = "https://github.com/GadgetReactor/pyHS100/archive/1f771b7d8090a91c6a58931532e42730b021cbde.zip";
      sha256 = "37e45a54a3df0f428ff450a044ba432cf11f365be41ada3c5620685e1266f184";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = "GPLv3";
      description = "Interface for TPLink HS100 Smart Plugs.";
    };
  };



  "pyRFXtrx" = python.mkDerivation {
    name = "pyRFXtrx-0.13.0";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/df/ad/73feeace48e2db207cd3c81dd219a31e877f41e3ccac19f3208a9affbe07/pyRFXtrx-0.13.0.tar.gz";
      sha256 = "0c62601670b9f1af7c6ef244b76c7ef04c43f8b1e577574300489386d509ebf4";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."pyserial"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.lgpl3Plus;
      description = "a library to communicate with the RFXtrx family of devices";
    };
  };



  "pyW215" = python.mkDerivation {
    name = "pyW215-0.3.6";
    src = pkgs.fetchurl {
      url = "https://github.com/LinuxChristian/pyW215/archive/v0.3.6.zip";
      sha256 = "73c137f08f0c77eaa25c965e29ea0b4c4ebc650cc0ea802258f5d64cba9fdea5";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "Interface for d-link W215 Smart Plugs.";
    };
  };



  "pyalarmdotcom" = python.mkDerivation {
    name = "pyalarmdotcom-0.0.7";
    src = pkgs.fetchurl {
      url = "https://github.com/Xorso/pyalarmdotcom/archive/0.1.1.zip";
      sha256 = "3d902d81cce4ebe565cdd208a2fe735eaa3cbf99514e144abe57351256f18dc3";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."selenium"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "Library to interface with alarm.com accounts";
    };
  };



  "pyasn1" = python.mkDerivation {
    name = "pyasn1-0.1.9";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/f7/83/377e3dd2e95f9020dbd0dfd3c47aaa7deebe3c68d3857a4e51917146ae8b/pyasn1-0.1.9.tar.gz";
      sha256 = "853cacd96d1f701ddd67aa03ecc05f51890135b7262e922710112f12a2ed2a7f";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.bsdOriginal;
      description = "ASN.1 types and codecs";
    };
  };



  "pyasn1-modules" = python.mkDerivation {
    name = "pyasn1-modules-0.0.8";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/60/32/7703bccdba05998e4ff04db5038a6695a93bedc45dcf491724b85b5db76a/pyasn1-modules-0.0.8.tar.gz";
      sha256 = "10561934f1829bcc455c7ecdcdacdb4be5ffd3696f26f468eb6eb41e107f3837";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."pyasn1"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.bsdOriginal;
      description = "A collection of ASN.1-based protocols modules.";
    };
  };



  "pybbox" = python.mkDerivation {
    name = "pybbox-0.0.5a0";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/35/bd/bc30d13b4bb44a18f9994537282c0794013cf3125683486bc9f875cf46fa/pybbox-0.0.5-alpha.zip";
      sha256 = "35bd556c38600127e9b2bd6872cbe2108478446a14704b5c32d012f4153c3a67";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."netaddr"
      self."requests"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = "";
      description = "a simple python3 library for the Bouygues BBox Routeur API";
    };
  };



  "pybotvac" = python.mkDerivation {
    name = "pybotvac-0.0.1";
    src = pkgs.fetchurl {
      url = "https://github.com/jabesq/pybotvac/archive/v0.0.1.zip";
      sha256 = "eb56d0fe728b9c3b1f416f812399d1279fd0bd0aa77ecefd43fccae8d5ed0785";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = "The MIT License (MIT)";
      description = "Python package for controlling Neato pybotvac Connected vacuum robot";
    };
  };



  "pycmus" = python.mkDerivation {
    name = "pycmus-0.1.0";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/51/b6/1acde8a61463ce35039fd2401884b9c6b2f03d34100c677c2e8378d5b833/pycmus-0.1.0.tar.gz";
      sha256 = "5a45e1d57d806a079ac85b8a858b4bc6ed5faa185e0b2a5381a62695a9fcff45";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."pbr"
      self."six"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.gpl3;
      description = "A python cmus remote library";
    };
  };



  "pycodestyle" = python.mkDerivation {
    name = "pycodestyle-2.2.0";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/43/9f/56e824b197398582b0c1aaaa2272560bc51f395fe3e45e1dd88de4bb24dc/pycodestyle-2.2.0.tar.gz";
      sha256 = "df81dc3293e0123e2e8d1f2aaf819600e4ae287d8b3af8b72181af50257e5d9a";
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



  "pycparser" = python.mkDerivation {
    name = "pycparser-2.17";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/be/64/1bb257ffb17d01f4a38d7ce686809a736837ad4371bcc5c42ba7a715c3ac/pycparser-2.17.tar.gz";
      sha256 = "0aac31e917c24cb3357f5a4d5566f2cc91a19ca41862f6c3c22dc60a629673b6";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.bsdOriginal;
      description = "C parser in Python";
    };
  };



  "pycrypto" = python.mkDerivation {
    name = "pycrypto-2.6.1";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/60/db/645aa9af249f059cc3a368b118de33889219e0362141e75d4eaf6f80f163/pycrypto-2.6.1.tar.gz";
      sha256 = "f2ce1e989b272cfcb677616763e0a2e7ec659effa67a88aa92b3a65528f60a3c";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.publicDomain;
      description = "Cryptographic modules for Python.";
    };
  };



  "pycryptodomex" = python.mkDerivation {
    name = "pycryptodomex-3.4.3";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/bf/73/7c7e75e640acce1428d1cd7ce596fb855bd9ab8df9d1be587a9b4172046a/pycryptodomex-3.4.3.tar.gz";
      sha256 = "70e3add1d871fafe6611e3058ad278d75e32c1a0863cc40829d10fd9098ac502";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.bsdOriginal;
      description = "Cryptographic library for Python";
    };
  };



  "pyedimax" = python.mkDerivation {
    name = "pyedimax-0.1";
    src = pkgs.fetchurl {
      url = "https://github.com/rkabadi/pyedimax/archive/365301ce3ff26129a7910c501ead09ea625f3700.zip";
      sha256 = "7360c9e78ac7883eebd607eabc683ee600059974558a7ea60c8f294ba7d909bc";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."requests"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "Interface with Edimax Smart Plugs";
    };
  };



  "pyelliptic" = python.mkDerivation {
    name = "pyelliptic-1.5.7";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/2d/60/6c054410a768533706de3d67ecb3255b476e07148da53cc4b6ff212283eb/pyelliptic-1.5.7.tar.gz";
      sha256 = "f7df4dd5b7a2e16dd69a64589e97c7a9eb5f061a9e93797170bab30e838c183c";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.bsdOriginal;
      description = "Python OpenSSL wrapper for modern cryptography with ECC, AES, HMAC, Blowfish, ...";
    };
  };



  "pyenvisalink" = python.mkDerivation {
    name = "pyenvisalink-1.9";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/fd/98/6e34482f16007997ddce3fc5aec40ddc5b71139067385679bb5f97e07ef8/pyenvisalink-1.9.tar.gz";
      sha256 = "1bc2dd3801794874bdf1055ac42eedf4490d8fcc85d9c445532c3b1654b2e500";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "A python3 library for running asynchronus communications with envisalink alarm control panel modules.";
    };
  };



  "pyflakes" = python.mkDerivation {
    name = "pyflakes-1.3.0";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/9f/48/927b1bf3e15d3dadfcfafb505177a62cdabcb78cf7eac4f31f180d5b1e26/pyflakes-1.3.0.tar.gz";
      sha256 = "a4f93317c97a9d9ed71d6ecfe08b68e3de9fea3f4d94dcd1d9d83ccbf929bc31";
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



  "pyfttt" = python.mkDerivation {
    name = "pyfttt-0.3";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/d3/31/33a96715acbbf64de9fcb8787b800f55cf97428c044f8613ca5e4a751136/pyfttt-0.3.tar.gz";
      sha256 = "2c2d5ebbdd883c63a08cfee6721ab1bf4dd60d2bae0d10f081ef2f650279e49b";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."requests"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.bsdOriginal;
      description = "Python tools for interacting with the IFTTT Maker Channel";
    };
  };



  "pygtfs" = python.mkDerivation {
    name = "pygtfs-0.1.3";
    src = pkgs.fetchurl {
      url = "https://github.com/robbiet480/pygtfs/archive/00546724e4bbcb3053110d844ca44e2246267dd8.zip";
      sha256 = "17b2b508a49ece314d1e22b86f529560d80c805d040cae647fa280bec363aef8";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."SQLAlchemy"
      self."docopt"
      self."pytz"
      self."six"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "Models GTFS data in a database.";
    };
  };



  "pyhomematic" = python.mkDerivation {
    name = "pyhomematic-0.1.16";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/fc/c4/8025719e9bb645969f7cb4164d6c19f0de3715e2a0afc7c726b6701d3613/pyhomematic-0.1.16.tar.gz";
      sha256 = "8c7c7ac8f6f7a5cdc4a19dc610c84b929691174afbc69ead0bb33be832c48c22";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "Homematic interface";
    };
  };



  #"pyicloud" = python.mkDerivation {
  #  name = "pyicloud-0.9.1";
  #  src = pkgs.fetchurl {
  #    url = "https://pypi.python.org/packages/c0/a8/30e78cce525a3bc7045735dccefdc257fe583748330b44a4bcfde38af342/pyicloud-0.9.1.tar.gz";
  #    sha256 = "580b52e95f67a41ed86c56a514aa2b362f53fbaf23f16c69fb24e0d19fd373ee";
  #  };
  #  doCheck = commonDoCheck;
  #  buildInputs = commonBuildInputs;
  #  propagatedBuildInputs = [
  #    self."bitstring"
  #    self."certifi"
  #    self."click"
  #    self."keyring"
  #    self."keyrings.alt"
  #    self."requests"
  #    self."six"
  #    self."tzlocal"
  #  ];
  #  meta = with pkgs.stdenv.lib; {
  #    homepage = "";
  #    license = licenses.mit;
  #    description = "PyiCloud is a module which allows pythonistas to interact with iCloud webservices.";
  #  };
  #};



  "pylast" = python.mkDerivation {
    name = "pylast-1.6.0";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/42/71/85c28b2d373eee3592d6f079e556df4a28d5c133c2ba484d7311dc9a746c/pylast-1.6.0.tar.gz";
      sha256 = "6bf325ee0fdeb35780554843cf64df99304abb98c5ce2e451c0df7e95e08b42e";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."six"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = "License :: OSI Approved :: Apache Software License";
      description = "A Python interface to Last.fm and Libre.fm";
    };
  };



  "pylgnetcast" = python.mkDerivation {
    name = "pylgnetcast-0.2.0";
    src = pkgs.fetchurl {
      url = "https://github.com/wokar/pylgnetcast/archive/v0.2.0.zip";
      sha256 = "4db39d7678af74e715eb59cc8702e2cf90312bbe446bdd37ef8caec508843215";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "Client for the LG Smart TV running NetCast 3 or 4.";
    };
  };



  "pylgtv" = python.mkDerivation {
    name = "pylgtv-0.1.2";
    src = pkgs.fetchurl {
      url = "https://github.com/TheRealLink/pylgtv/archive/v0.1.2.zip";
      sha256 = "0f1312961093e76b7d524729b2dcfab4e0b4710603a5fc9074e7905b2a829eeb";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."asyncio"
      self."websockets"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "Library to control webOS based LG Tv devices";
    };
  };



  "pylitejet" = python.mkDerivation {
    name = "pylitejet-0.1.0";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/50/a5/b24b6ad49f2efafd66d3c7379a877e656cef4ac5e22204eb9e2ac0ee4374/pylitejet-0.1.0.tar.gz";
      sha256 = "d960ba7b5e5e337ad203a82c29c40f0a7f54479aa3ee98fc280b60584daf3c85";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."pyserial"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "A library for controlling a LiteJet lighting system.";
    };
  };



  "pyloopenergy" = python.mkDerivation {
    name = "pyloopenergy-0.0.15";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/9a/6b/aa2c9ea66d64424fa2fa71035d867a49dc7a2c30290bbb65f697fc96a5ae/pyloopenergy-0.0.15.tar.gz";
      sha256 = "0bea2d9e0b7a1373a36a995ed31cdd5378db5c18847b71b8ed34c0fe02c22d16";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."socketIO-client"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "Access Loop Energy energy monitors via Socket.IO API";
    };
  };



  "pymochad" = python.mkDerivation {
    name = "pymochad-0.1.1";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/1d/9e/ac4b342e0ec7beae7cf7e9859fccafa4f946586710c322eb7c821669e5c2/pymochad-0.1.1.tar.gz";
      sha256 = "bc52c400e6d4a74e2fe5651192501b7cfba7a3c8356ebb69507431d46d589cca";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."pbr"
      self."six"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.gpl3;
      description = "A python library for interacting with moch";
    };
  };



  "pymodbus" = python.mkDerivation {
    name = "pymodbus-1.2.0";
    src = pkgs.fetchurl {
      url = "https://github.com/bashwork/pymodbus/archive/d7fc4f1cc975631e0a9011390e8017f64b612661.zip";
      sha256 = "4060b8541e166e35fe5106b7ed15c7e8f4394daf773b34229e44bb118c125925";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."Twisted"
      self."pyasn1"
      self."pycrypto"
      self."pyserial"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.bsdOriginal;
      description = "A fully featured modbus protocol stack in python";
    };
  };



  "pymysensors" = python.mkDerivation {
    name = "pymysensors-0.8";
    src = pkgs.fetchurl {
      url = "https://github.com/theolind/pymysensors/archive/0b705119389be58332f17753c53167f551254b6c.zip";
      sha256 = "7107ad878ea1e1083986a41725a3db1d6f025118318087b1e583968f34120569";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."crcmod"
      self."intelhex"
      self."pyserial"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "Python API for talking to a MySensors gateway";
    };
  };



  "pynetgear" = python.mkDerivation {
    name = "pynetgear-0.3.3";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/22/c4/8fc71f223686498bed2d0a1ec6bab72e6b3892ef826ef9b30dfda5103415/pynetgear-0.3.3.tar.gz";
      sha256 = "ad5c58888d168407681702ad72c57ad511ef9f88ea84ebf203c8d341f2b92005";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."requests"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "Access Netgear routers using their SOAP API";
    };
  };



  "pynetio" = python.mkDerivation {
    name = "pynetio-0.1.6";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/0f/65/e1ca1cd07f386030de84977db6d31c6380623dd68143301f250ccb3d9916/pynetio-0.1.6.tar.gz";
      sha256 = "926e62a8d940881a0d375a68daf19612f5696e2da854b720574f717baed58cdb";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "Binding library for Koukaam netio devices";
    };
  };



  "pynx584" = python.mkDerivation {
    name = "pynx584-0.2";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/94/78/97401360bebe5f3d95543a10d6259a3cde4710b7abb846c58bc21cae0a0e/pynx584-0.2.tar.gz";
      sha256 = "a775949320936ad69a6559c6991f87d7fa00d82291252972f621f1277d740aad";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."Flask"
      self."prettytable"
      self."pyserial"
      self."requests"
      self."stevedore"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = "";
      description = "NX584/NX8E Interface Library and Server";
    };
  };



  "pyowm" = python.mkDerivation {
    name = "pyowm-2.5.0";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/c3/77/d97858b301e047cb4cf861aa09f1634aa3d097c143a5500a5a181dc8273a/pyowm-2.5.0.zip";
      sha256 = "ec33b6c31c58b45f2e276404c495e6ff4381493b77746c1021208f04031ff24d";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "A Python wrapper around the OpenWeatherMap web API";
    };
  };



  "pyqwikswitch" = python.mkDerivation {
    name = "pyqwikswitch-0.4";
    src = pkgs.fetchurl {
      url = "https://github.com/kellerza/pyqwikswitch/archive/v0.4.zip";
      sha256 = "3ac626d652555208c3d9095a0388486770366e0752f5e0f006f7bd5014724155";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."requests"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "Library to interface Qwikswitch USB Hub";
    };
  };



  "pyserial" = python.mkDerivation {
    name = "pyserial-3.1.1";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/3c/d8/a9fa247ca60b02b3bebbd61766b4f321393b57b13c53b18f6f62cf172c08/pyserial-3.1.1.tar.gz";
      sha256 = "d657051249ce3cbd0446bcfb2be07a435e1029da4d63f53ed9b4cdde7373364c";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.bsdOriginal;
      description = "Python Serial Port Extension";
    };
  };



  "pysmi" = python.mkDerivation {
    name = "pysmi-0.0.7";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/76/ee/d90939908f5017cb7ea51c367bb7e232bf53669da0734826aa37cd9480b4/pysmi-0.0.7.tar.gz";
      sha256 = "999f6db9e16f4cc2804263d825553dbdd188c4313ca5c1244eeb20a3c4a60116";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."ply"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.bsdOriginal;
      description = "SNMP SMI/MIB Parser";
    };
  };



  "pysnmp" = python.mkDerivation {
    name = "pysnmp-4.3.2";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/9e/77/795fcc9d9a01adcb6175a3bf6532132addb8904922afd7877a9930d89f2f/pysnmp-4.3.2.tar.gz";
      sha256 = "7c2bd81df17aa7dca0057a68e7a32284a72231309a0237d66d5b803b5c118977";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."pyasn1"
      self."pycrypto"
      self."pysmi"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.bsdOriginal;
      description = "SNMP library for Python";
    };
  };



  "pythinkingcleaner" = python.mkDerivation {
    name = "pythinkingcleaner-0.0.2";
    src = pkgs.fetchurl {
      url = "https://github.com/TheRealLink/pythinkingcleaner/archive/v0.0.2.zip";
      sha256 = "95e050d017562f966aea90fe40205169e6ffb4007a1e6143930528dde017ac7a";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."requests"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "Library to interface with thinkingcleaner";
    };
  };



  "python-dateutil" = python.mkDerivation {
    name = "python-dateutil-2.4.2";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/b6/ff/5eaa688dd8ce78913f47438f9b40071a560126ac3e95f9b9be27dfe546a7/python-dateutil-2.4.2.tar.gz";
      sha256 = "3e95445c1db500a344079a47b171c45ef18f57d188dffdb0e4165c71bea8eb3d";
    };
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



  "python-digitalocean" = python.mkDerivation {
    name = "python-digitalocean-1.10.1";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/0a/4c/85ff7c732bf7f50caf81d31f71c4293153831705bdbd0fc29152abb567b6/python-digitalocean-1.10.1.tar.gz";
      sha256 = "d7e241e119a5689cea3b6d3155e3cf6f295af355379f7f35530850eba85b1e8b";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."requests"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = "LGPL v3";
      description = "digitalocean.com API to manage Droplets and Images";
    };
  };



  "python-ecobee" = python.mkDerivation {
    name = "python-ecobee-0.0.6";
    src = pkgs.fetchurl {
      url = "https://github.com/nkgilley/python-ecobee-api/archive/4856a704670c53afe1882178a89c209b5f98533d.zip";
      sha256 = "9310ee7e42d85cccd3b98f3cb06f7795ff7b507b73d91b60e5d3f210135b7b10";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."requests"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = "GPLv2";
      description = "Python API for talking to Ecobee thermostats";
    };
  };



  "python-forecastio" = python.mkDerivation {
    name = "python-forecastio-1.3.5";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/c4/ee/8db21a142548e4b67950068bd78034b67b04900efa79c44c3c2241a3450c/python-forecastio-1.3.5.tar.gz";
      sha256 = "15cfcaea91b6eda0a67041e874c9a0c346e593f7dc5be8a513a5f581c63a1ed7";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."requests"
      self."responses"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = "BSD 2-clause";
      description = "A thin Python Wrapper for the Dark Sky (formerly Forecast.io) weather API";
    };
  };



  "python-hpilo" = python.mkDerivation {
    name = "python-hpilo-3.8";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/57/71/bdea13e01b98aa1321d2472afeb1bcf0482e7696b35f0ae1db4937474d11/python-hpilo-3.8.tar.gz";
      sha256 = "307af41d2d9d08cdad044695a1a704d7a7ef5c21db082b7869a81e0c1917ddb4";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.gpl1;
      description = "iLO automation from python or shell";
    };
  };



  "python-http-client" = python.mkDerivation {
    name = "python-http-client-2.2.1";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/8c/14/0b8da61e21a4dc62ca11fca891bae8f06388e481d858bc42d35555ea6c2c/python_http_client-2.2.1.tar.gz";
      sha256 = "c9aedb0360c65ad769c0d083b664ab4e384f84f77a20726355c6f2ff540da7f9";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "HTTP REST client, simplified for Python";
    };
  };



  "python-join-api" = python.mkDerivation {
    name = "python-join-api-0.0.1";
    src = pkgs.fetchurl {
      url = "https://github.com/nkgilley/python-join-api/archive/3e1e849f1af0b4080f551b62270c6d244d5fbcbd.zip";
      sha256 = "5959fc137cf986bb0fad7fbd5aaa16c22cd2b748b0e58342f38476b74772e385";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."requests"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "Python API for viewing Plex activity";
    };
  };



  "python-jose" = python.mkDerivation {
    name = "python-jose-1.3.2";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/51/e6/2b912c22275955ee5051aff888b2c363d8339b5887878e52ce7721d66659/python-jose-1.3.2.tar.gz";
      sha256 = "35eca894ab91db1774251296949679396c46d6bc506ea03804b8f7a7d0204392";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."ecdsa"
      self."future"
      self."pycrypto"
      self."six"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "JOSE implementation in Python";
    };
  };



  "python-magic" = python.mkDerivation {
    name = "python-magic-0.4.12";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/d8/94/4b2930f2146c1318e6250c85d884c87720f3089085e4d4ba53fa0f8c620c/python-magic-0.4.12.tar.gz";
      sha256 = "a04b20900100884d4fce40a767182a16fcb9d10756c67cdc21f5fa610b7c9d3c";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "File type identification using libmagic";
    };
  };



  "python-mpd2" = python.mkDerivation {
    name = "python-mpd2-0.5.5";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/71/d2/9330c355344bd0ce1d82d25ae841642d91b70a0272a764c646f6b4ed4e8d/python-mpd2-0.5.5.tar.bz2";
      sha256 = "6a5006886951c07cf19e54696706380fc8c4cac3f627b3bee181d21e8eebd9bd";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.lgpl2;
      description = "A Python MPD client library";
    };
  };



  "python-mystrom" = python.mkDerivation {
    name = "python-mystrom-0.3.6";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/4c/0d/be83accf6308bdc1cee96b3ab592ec166c3d16fdca7f7aa313b80b11b2e3/python-mystrom-0.3.6.tar.gz";
      sha256 = "01b732d222779a0f39e45720d4e757143952979c5a2d71ce00ed3bf72a8ec32d";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."requests"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "Python API for controlling myStrom switches";
    };
  };



  "python-nest" = python.mkDerivation {
    name = "python-nest-2.11.0";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/e8/aa/ade2e1a16a2a2fcf9f9166c0ff0b9b5d911d2c84b6057cb5343176a12112/python-nest-2.11.0.tar.gz";
      sha256 = "cb2492a0701cbb6048d46c4f25931a7f6adf1e4e6faae1f1a8ca625d9577ce15";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."requests"
      self."six"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = "";
      description = "Python API and command line tool for talking to the Nest™ Thermostat";
    };
  };



  "python-nmap" = python.mkDerivation {
    name = "python-nmap-0.6.1";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/dc/f2/9e1a2953d4d824e183ac033e3d223055e40e695fa6db2cb3e94a864eaa84/python-nmap-0.6.1.tar.gz";
      sha256 = "80ba0eb10a52283a54a633f40b5baa9c2ff08675d6621dd089ead942852f5bd3";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.gpl1;
      description = "This is a python class to use nmap and access scan results from python3";
    };
  };



  "python-pushover" = python.mkDerivation {
    name = "python-pushover-0.2";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/bd/fc/10dd8dde361f970b35177ae6c9a0cf5922cb8635ce80b0b42c589635febc/python-pushover-0.2.tar.gz";
      sha256 = "39eefdcfa2335a4ad98bd321a25b56936abed4ea5922ba3fc372d091273e0775";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."requests"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = "GNU GPLv3";
      description = "Comprehensive bindings and command line utility for the Pushover notification service";
    };
  };



  "python-sabnzbd" = python.mkDerivation {
    name = "python-sabnzbd-0.1";
    src = pkgs.fetchurl {
      url = "https://github.com/jamespcole/home-assistant-nzb-clients/archive/616cad59154092599278661af17e2a9f2cf5e2a9.zip";
      sha256 = "57b45de855a57b3c27b7a6cb7645210250b7276e02999cf21f948c5b2353c582";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."requests"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = "GPLv2";
      description = "Python API for talking to SABnzbd";
    };
  };



  "python-synology" = python.mkDerivation {
    name = "python-synology-0.1.0";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/cf/3e/632fb7dad299d072d7a045e626113b3d5c9a2214a199b3894928e1e31c67/python-synology-0.1.0.tar.gz";
      sha256 = "350266aa1279539da82ee9195e299ae1a8ded3061df21a23f6816e45de094ed4";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."requests"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = "";
      description = "Python API for communication with Synology DSM";
    };
  };



  "python-telegram-bot" = python.mkDerivation {
    name = "python-telegram-bot-5.2.0";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/75/cf/c3db52af702792bc341a0e2f0006f905c3776101b47638739600912357c8/python-telegram-bot-5.2.0.tar.gz";
      sha256 = "92c57965ed5b0320ed3a3a9153acd804b99cd0fa6bbe992adcd8c694588dac35";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."certifi"
      self."future"
      self."urllib3"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.lgpl3;
      description = "Not just a Python wrapper around the Telegram Bot API";
    };
  };



  "python-twitch" = python.mkDerivation {
    name = "python-twitch-1.3.0";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/ef/26/947be2c5c3e5aae1dcb15a93ba7a722c1d23ff6b6ad866defd12739f3b2e/python-twitch-1.3.0.tar.gz";
      sha256 = "1e3f2bb0e3dd8aa2241aa4f0456d412dce1b78d2af7a212a3d28dcfede2af65d";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."six"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = "GPLv3";
      description = "Library for interaction with the videogame streaming platform twitch";
    };
  };



  "python-wink" = python.mkDerivation {
    name = "python-wink-0.10.0";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/30/d1/7ccf299f6f5c370d3938ee5c921c7247499f0a61f31c519de4d8939f1452/python-wink-0.10.0.tar.gz";
      sha256 = "4fe50e0bfcd462c988575e909cf6a2be4a29e8e9c0b2df2a32060e4eaaf00077";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."requests"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "Access Wink devices via the Wink API";
    };
  };



  "pytz" = python.mkDerivation {
    name = "pytz-2016.7";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/53/35/6376f58fb82ce69e2c113ca0ebe5c0f69b20f006e184bcc238a6007f4bdb/pytz-2016.7.tar.bz2";
      sha256 = "6eab31709e3a4aea748457707da45e805b650cbb352583805d2417de2a1dd71e";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "World timezone definitions, modern and historical";
    };
  };



  "pyusb" = python.mkDerivation {
    name = "pyusb-1.0.0b1";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/03/13/01e122238db02c7fb55538d75b03dbc8d50344b8b83c3c4b8b27e382b289/pyusb-1.0.0b1.tar.gz";
      sha256 = "6fa787840baa8c6a041e370bf381127aae5fb44c820ba655f966b7da4de6279f";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.bsdOriginal;
      description = "Python USB access module";
    };
  };



  "pyvera" = python.mkDerivation {
    name = "pyvera-0.2.20";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/0d/86/397bd4322d209574cc8884837af5e0028d9887944ec2a2bec1795393789d/pyvera-0.2.20.tar.gz";
      sha256 = "474d993393dde42aa62eb8f12fd64d4e4213e928e6b78e7cf038c37f71be917e";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."requests"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "Python API for talking to Vera Z-Wave controllers";
    };
  };



  "pywebpush" = python.mkDerivation {
    name = "pywebpush-0.6.1";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/1e/aa/51c1a32212d929cd637c2ed020a52ff1979d1bf0e62560f36d3c9103ac51/pywebpush-0.6.1.tar.gz";
      sha256 = "d2551ad3ad1cbd63d815f728b580249ace9f421ed6f9b0b22a66267423be0451";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."flake8"
      self."http-ece"
      self."python-jose"
      self."requests"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = "MPL2";
      description = "WebPush publication library";
    };
  };



  "pywemo" = python.mkDerivation {
    name = "pywemo-0.4.7";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/7c/cf/b4b02c59986886f9bb4dc9c395244195af79a7e6364700718f7a2250fcd7/pywemo-0.4.7.tar.gz";
      sha256 = "7124236b3e701ca9e0b0583aaf4d4fe5cc4123df9f8a410f84fb835306718b03";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."netifaces"
      self."requests"
      self."six"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "Access WeMo switches using their SOAP API";
    };
  };



  "pyyeelight" = python.mkDerivation {
    name = "pyyeelight-1.0b0";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/1a/4e/7d18b9d789b730f8b1e4bacf929c941dd903868b38863e5e6010bfeb5aa7/pyyeelight-1.0-beta.tar.gz";
      sha256 = "06cd5c999b606de7bf10fb75d909f50d3d3c851d7da7bf60fa5947a17af6d8ac";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."voluptuous"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = "";
      description = "a simple python3 library for Yeelight Wifi Bulbs";
    };
  };



  "radiotherm" = python.mkDerivation {
    name = "radiotherm-1.2";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/f3/72/22d9f179d4f4cc387196cac1adbab495215ec33420175d412ad3d69a59bb/radiotherm-1.2.tar.gz";
      sha256 = "e8a70e0cf38f21170a3a43d5de62954aa38032dfff20adcdf79dd6c39734b8cc";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.bsdOriginal;
      description = "client library for wifi thermostats sold by radiothermostat.com";
    };
  };



  "requests" = python.mkDerivation {
    name = "requests-2.12.1";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/6e/40/7434b2d9fe24107ada25ec90a1fc646e97f346130a2c51aa6a2b1aba28de/requests-2.12.1.tar.gz";
      sha256 = "2109ecea94df90980be040490ff1d879971b024861539abb00054062388b612e";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."PySocks"
      self."cryptography"
      self."idna"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.asl20;
      description = "Python HTTP for Humans.";
    };
  };



  "requests-oauthlib" = python.mkDerivation {
    name = "requests-oauthlib-0.7.0";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/46/9b/c28061cc63298bc29ff7d668e18c5293bb522e946aaeb98e4c552d2c0f7b/requests-oauthlib-0.7.0.tar.gz";
      sha256 = "198807c592b75438485c890f0403b1a8e363c86be1a87da687be18991a6850b0";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."oauthlib"
      self."requests"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.bsdOriginal;
      description = "OAuthlib authentication support for Requests.";
    };
  };



  "responses" = python.mkDerivation {
    name = "responses-0.5.1";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/09/e4/ae639e37d9d35903fdeda416d7f9c9e3a0331895d574b4fe6632a27c9190/responses-0.5.1.tar.gz";
      sha256 = "8cad64c45959a651ceaf0023484bd26180c927fea64a81e63d334ddf6377ecea";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."cookies"
      self."flake8"
      self."requests"
      self."six"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.asl20;
      description = "A utility library for mocking out the `requests` Python library.";
    };
  };



  "roku" = python.mkDerivation {
    name = "roku-3.1.2";
    src = pkgs.fetchurl {
      url = "https://github.com/bah2830/python-roku/archive/3.1.2.zip";
      sha256 = "3a32be1bc4741e0bcf4736389de652fa1c1a125ba99fd276fb856e741bc219ba";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."requests"
      self."six"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.bsdOriginal;
      description = "Client for the Roku media player";
    };
  };



  "rsa" = python.mkDerivation {
    name = "rsa-3.4.2";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/14/89/adf8b72371e37f3ca69c6cb8ab6319d009c4a24b04a31399e5bd77d9bb57/rsa-3.4.2.tar.gz";
      sha256 = "25df4e10c263fb88b5ace923dd84bf9aa7f5019687b5e55382ffcdb8bede9db5";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."pyasn1"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = "License :: OSI Approved :: Apache Software License";
      description = "Pure-Python RSA implementation";
    };
  };



  "russound" = python.mkDerivation {
    name = "russound-0.1.6";
    src = pkgs.fetchurl {
      url = "https://github.com/laf/russound/archive/0.1.6.zip";
      sha256 = "f01c88387ea0a516e428b0b32692d2b1c208710cda60274f24021b26c99367db";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."requests"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = "";
      description = "# russound";
    };
  };



  "rxv" = python.mkDerivation {
    name = "rxv-0.4.0";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/44/bf/0f65ba571c6ba6d6754885a8028d9476bf96aa9d52c1863e417bcfe627f4/rxv-0.4.0.tar.gz";
      sha256 = "6747c162dbdbd41752ec3e56a0e7d62e09634a8ec02ba9cfba923e2e8ab38c77";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."requests"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.bsdOriginal;
      description = "Automation Library for Yamaha RX-V473, RX-V573, RX-V673, RX-V773 receivers";
    };
  };



  "samsungctl" = python.mkDerivation {
    name = "samsungctl-0.5.1";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/88/ad/7e0e701cc46b0caef4d361a4d9524d2268b4bccc0ea71967a2473c2ade89/samsungctl-0.5.1.tar.gz";
      sha256 = "1448cb203ed037e624b5bc31942d9b449670d9f88c849c08d866f76d52f4117f";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "Remote control Samsung televisions via TCP/IP connection";
    };
  };



  "schiene" = python.mkDerivation {
    name = "schiene-0.18";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/29/a2/8225f5461e98ecd6ecc6aa3ca52c121581cc06e64b230215299bd4b8e9e1/schiene-0.18.tar.gz";
      sha256 = "05e691f23cfa07f7bd56a9aa93578340818117f0b8b65f0dd1f1cbedf727c41a";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."beautifulsoup4"
      self."requests"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "schiene is a Python library for interacting with Bahn.de";
    };
  };



  "scsgate" = python.mkDerivation {
    name = "scsgate-0.1.0";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/55/c9/05c8eaae6ca0145bf0462e2716ca63834702c0390660bc42b38c0a4fdc17/scsgate-0.1.0.tar.gz";
      sha256 = "70cbd27d74bae3135efa0d3a27f6ede3a45e83359f67577c4a144c220de69f26";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."PyYAML"
      self."pyserial"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "A Python module to interact with SCSGate";
    };
  };



  "selenium" = python.mkDerivation {
    name = "selenium-3.0.1";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/3a/a3/e4ab60a0229a85f468a36367bc0672a4bca2720f24391eda33704a5f0ad5/selenium-3.0.1.tar.gz";
      sha256 = "0705803349964c7a2a144f1796a5d29905fe2a09931b2bb945ee0cb4deab75d7";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = "License :: OSI Approved :: Apache Software License";
      description = "Python bindings for Selenium";
    };
  };



  "sendgrid" = python.mkDerivation {
    name = "sendgrid-3.6.2";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/7d/7f/6cad97f0afb02eb46fba4e316f9aa05e333da6f0e5b09cd5c6ed32368cde/sendgrid-3.6.2.tar.gz";
      sha256 = "c16ac0b1dedcc77ca007086b5b1de5c86541f9b3a9a40b6673eeeee5ef90f61a";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."python-http-client"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "SendGrid library for Python";
    };
  };



  "simplejson" = python.mkDerivation {
    name = "simplejson-3.10.0";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/40/ad/52c1f3a562df3b210e8f165e1aa243a178c454ead65476a39fa3ce1847b6/simplejson-3.10.0.tar.gz";
      sha256 = "953be622e88323c6f43fad61ffd05bebe73b9fd9863a46d68b052d2aa7d71ce2";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "Simple, fast, extensible JSON encoder/decoder for Python";
    };
  };



  "simplisafe-python" = python.mkDerivation {
    name = "simplisafe-python-0.0.1";
    src = pkgs.fetchurl {
      url = "https://github.com/w1ll1am23/simplisafe-python/archive/586fede0e85fd69e56e516aaa8e97eb644ca8866.zip";
      sha256 = "c67e1b136d408967ef403a5efc46e914b61f5e33096e7db567978fe339057911";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "Python 3 support for SimpliSafe alarm";
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



  "slacker" = python.mkDerivation {
    name = "slacker-0.9.29";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/33/21/99bdf1289c52ab1199d69c3ef25ce3eaf146d8c42897debda2e6e616f382/slacker-0.9.29.tar.gz";
      sha256 = "62f3078fb58855854437e14d5c52a7d440a11d258eaf21d018fa00a1630900bc";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."requests"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = "License :: OSI Approved :: Apache Software License";
      description = "Slack API client";
    };
  };



  "sleekxmpp" = python.mkDerivation {
    name = "sleekxmpp-1.3.1";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/2e/33/7adcc8d6b35cb72f9cc56785a3d9c63d540200c476b0cb3a0926f5b51102/sleekxmpp-1.3.1.tar.gz";
      sha256 = "394f43d7be504125f98ed18a8e5aaaacf5f47280c7d12e9851857724f78433cf";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "SleekXMPP is an elegant Python library for XMPP (aka Jabber, Google Talk, etc).";
    };
  };



  "sleepyq" = python.mkDerivation {
    name = "sleepyq-0.6";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/65/b0/d61fe8f76f6ee7c20c06322878234adacf8085c20d0ab4b0f75e0386ac91/sleepyq-0.6.tar.gz";
      sha256 = "cd988c95c76b0b48647ccd068de86299e840083f702428386e5fd64b9d0d8701";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."inflection"
      self."requests"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "SleepIQ API for Python";
    };
  };



  "snapcast" = python.mkDerivation {
    name = "snapcast-1.2.2";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/fa/c0/adeecda809e23b41793bbf07070b51b771e9f2fb073c658c720f85338cd1/snapcast-1.2.2.tar.gz";
      sha256 = "fa9cd9ee44d84aef6d247d5461f4b0a2146165fa6f987649de2288803f56cde9";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."construct"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "Control Snapcast.";
    };
  };



  "socketIO-client" = python.mkDerivation {
    name = "socketIO-client-0.5.6";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/6e/26/a9483358b9f266a21ae9bfe9012f168c58c1ba34f99dfab26e681bcc061e/socketIO-client-0.5.6.tar.gz";
      sha256 = "540d8ab209154d1d9cdb97c170c589a14f7d7f17e19c14e2f59f0307e6175485";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."requests"
      self."six"
      self."websocket-client"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "A socket.io client library";
    };
  };



  "soco" = python.mkDerivation {
    name = "soco-0.12";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/81/e0/5eb96ecc55dc95cec45d59702837eca957373c8cef7a245b1906fd6fb6ec/soco-0.12.tar.gz";
      sha256 = "17fc9a6ce747b8fc1811e67450533c3393e63dd6ffe38cff703d9bfc276836f6";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."requests"
      self."xmltodict"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "SoCo (Sonos Controller) is a simple library to control Sonos speakers.";
    };
  };



  "somecomfort" = python.mkDerivation {
    name = "somecomfort-0.3.2";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/5d/8d/6cb54af594939ef27701524a0a4ba5da16884c1cff17e31b087f395b5489/somecomfort-0.3.2.tar.gz";
      sha256 = "4fc81107ffa97e95ab0a5d4ca97b122599020121b5f8e944999e7f2579563874";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."prettytable"
      self."requests"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = "";
      description = "A client for Honeywell's US-based cloud devices";
    };
  };



  "speedtest-cli" = python.mkDerivation {
    name = "speedtest-cli-0.3.4";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/d5/ce/64ccca9fa583822ddc1585e98acdec278aa81de6acf2fe3869d755529fb8/speedtest-cli-0.3.4.tar.gz";
      sha256 = "cd60a0f5cc3a745fd13322e563ffe49fea91880255c0d3c166ae04d4583826a6";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.asl20;
      description = "Command line interface for testing internet bandwidth using speedtest.net";
    };
  };



  "statsd" = python.mkDerivation {
    name = "statsd-3.2.1";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/89/1e/365c87f21df573198a6e889e243fddb66755087987000a07177e80bfffea/statsd-3.2.1.tar.gz";
      sha256 = "3fa92bf0192af926f7a0d9be031fe3fd0fbaa1992d42cf2f07e68f76ac18288e";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "A simple statsd client.";
    };
  };



  "steamodd" = python.mkDerivation {
    name = "steamodd-4.21";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/e1/29/2514ef8c4c470c139ea73fa622204f66a63f360dd9c5563757a9078d7ec6/steamodd-4.21.tar.gz";
      sha256 = "1bcc9eda230a1439a52a599dbbd13558378fbefda6138faecd12acc896be1863";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.isc;
      description = "High level Steam API implementation with low level reusable core";
    };
  };



  "stevedore" = python.mkDerivation {
    name = "stevedore-1.18.0";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/d4/19/59008484543224f5ae9ca3940f6245b204102bc1080e9a5455066d3aabec/stevedore-1.18.0.tar.gz";
      sha256 = "992f5d3c77a17ac283dc62626ff7bb24042e9c54bec2977395b45539f5d2aeb9";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."pbr"
      self."six"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = "License :: OSI Approved :: Apache Software License";
      description = "Manage dynamic plugins for Python applications";
    };
  };



  "tabulate" = python.mkDerivation {
    name = "tabulate-0.7.7";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/1c/a1/3367581782ce79b727954f7aa5d29e6a439dc2490a9ac0e7ea0a7115435d/tabulate-0.7.7.tar.gz";
      sha256 = "83a0b8e17c09f012090a50e1e97ae897300a72b35e0c86c0b53d3bd2ae86d8c6";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = "Copyright (c) 2011-2016 Sergey Astanin";
      description = "Pretty-print tabular data";
    };
  };



  "tellcore-py" = python.mkDerivation {
    name = "tellcore-py-1.1.2";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/f4/e1/d3b72948f6b5a3b6394c4e42e07709dda90ab71314c18f73e7b45cd9aeaa/tellcore-py-1.1.2.tar.gz";
      sha256 = "06caf49f6922c36f5138db782a4c50c2be8ade135e58b5ba6aade1130b4a0cda";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.gpl3Plus;
      description = "Python wrapper for Telldus' home automation library";
    };
  };



  "tellive-py" = python.mkDerivation {
    name = "tellive-py-0.5.2";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/9f/55/961e82a5fbdff6d3803f8221d7ff12d790c9d4b57dce0464b70adf49067d/tellive-py-0.5.2.tar.gz";
      sha256 = "c656d06a384d815d6468c4015601f67a1624fa4883df50ad34a7c3f14143651b";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."oauthlib"
      self."tellcore-py"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.gpl3Plus;
      description = "Python wrapper for connecting to Telldus Live";
    };
  };



  "thingspeak" = python.mkDerivation {
    name = "thingspeak-0.4.0";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/41/16/c7ae3836137069e4c8205eb5c8857b44ab79d38a4a45f37c3abacc963cb6/thingspeak-0.4.0.tar.gz";
      sha256 = "a546f7a2f2999acc1cce0561b9a4a4ad85f202aeb296e391d44f84db7521ad37";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."docopt"
      self."requests"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.lgpl3;
      description = "Client library for the thingspeak.com API";
    };
  };



  "transitions" = python.mkDerivation {
    name = "transitions-0.2.5";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/f0/bc/2ad6d672f905ead21833ec23ddfa5b7174936304c06b931f6e3e1bacd44b/transitions-0.2.5.tar.gz";
      sha256 = "c9f882c352f7db772796aedcb182dd84f3487c1fad81677829f04239b1c76bc1";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = "";
      description = "A lightweight, object-oriented Python state machine implementation.";
    };
  };



  "transmissionrpc" = python.mkDerivation {
    name = "transmissionrpc-0.11";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/f5/f8/96a979b669a7219cb4299ea5512e1678ba7f59d91bd8a952c51405131768/transmissionrpc-0.11.tar.gz";
      sha256 = "ec43b460f9fde2faedbfa6d663ef495b3fd69df855a135eebe8f8a741c0dde60";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."six"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "Python module that implements the Transmission bittorent client RPC protocol.";
    };
  };



  "twilio" = python.mkDerivation {
    name = "twilio-5.4.0";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/77/18/e26498b21bdf5887f450fb071470ed55b5e9eb405263551e0c43b0de91a4/twilio-5.4.0.tar.gz";
      sha256 = "d856d821f151e0d71e3b1d799e8577efa7807b0f44b68ee0563ae9d914e43986";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."PySocks"
      self."httplib2"
      self."pytz"
      self."six"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "Twilio API client and TwiML generator";
    };
  };



  "typing" = python.mkDerivation {
    name = "typing-3.5.2.2";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/19/2f/b1090ace275335a9c0dde9a4623b109b7960a2b5370ae59d1eb1539afd8a/typing-3.5.2.2.tar.gz";
      sha256 = "2bce34292653af712963c877f3085250a336738e64f99048d1b8509bebc4772f";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.psfl;
      description = "Type Hints for Python";
    };
  };



  "tzlocal" = python.mkDerivation {
    name = "tzlocal-1.3";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/d3/64/e4b18738496213f82b88b31c431a0e4ece143801fb6771dddd1c2bf0101b/tzlocal-1.3.tar.gz";
      sha256 = "d160c2ce4f8b1831dabfe766bd844cf9012f766539cf84139c2faac5201882ce";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."pytz"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = "License :: CC0 1.0 Universal (CC0 1.0) Public Domain Dedication";
      description = "tzinfo object for the local timezone";
    };
  };



  "uber-rides" = python.mkDerivation {
    name = "uber-rides-0.2.7";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/b9/6c/ff28139d9e71e906ecd9339b80843ef5f8b668901b8616d503a22be12265/uber_rides-0.2.7.tar.gz";
      sha256 = "a354b100be7766fc5fb1ce3d5a3e9676cd252faeed3b4334b76e13d57665519d";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."PyYAML"
      self."future"
      self."requests"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "Official Uber Rides API Python SDK";
    };
  };



  "unifi" = python.mkDerivation {
    name = "unifi-1.2.5";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/00/d8/b8e250a10f85be46448fbeda301d7d77f35378087b5640f4dd7a8ce679c9/unifi-1.2.5.tar.gz";
      sha256 = "48b7aff429e9067da0a8d800c84ef11fef78aa8db9bfaf72be89e80f03e82f5f";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "API towards Ubiquity Networks UniFi controller";
    };
  };



  "uritemplate" = python.mkDerivation {
    name = "uritemplate-3.0.0";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/cd/db/f7b98cdc3f81513fb25d3cbe2501d621882ee81150b745cdd1363278c10a/uritemplate-3.0.0.tar.gz";
      sha256 = "c02643cebe23fc8adb5e6becffe201185bf06c40bda5c0b4028a93f1527d011d";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.bsdOriginal;
      description = "URI templates";
    };
  };



  "urllib3" = python.mkDerivation {
    name = "urllib3-1.19.1";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/b4/cb/0f195aa96fd63a4ef8b3578c67f56eb0804e394d9789080a8862c06c2f68/urllib3-1.19.1.tar.gz";
      sha256 = "53bc34c8ee268c3bd83ecf5e9c80fa783f3148484579bd4e20f4a7c1bb2dd6a0";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."PySocks"
      self."certifi"
      self."cryptography"
      self."idna"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "HTTP library with thread-safe connection pooling, file post, and more.";
    };
  };



  "uvcclient" = python.mkDerivation {
    name = "uvcclient-0.9.0";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/ac/86/87cee6f946787aa49c407f5b057c2a119eb8f482566411a9dcbd8ef4b7f4/uvcclient-0.9.0.tar.gz";
      sha256 = "5b846356a4c43a3db7fe79f39c59b8a52c89b61b5378c5089435a199a0dbf2c3";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = "";
      description = "A remote control client for Ubiquiti's UVC NVR";
    };
  };



  "voluptuous" = python.mkDerivation {
    name = "voluptuous-0.9.2";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/4a/f8/82762db7c28d36800052a61ce26a9c8d362d765aff1c5ce8cb6a01418b7a/voluptuous-0.9.2.tar.gz";
      sha256 = "01f21a3168a911551cbf89373763273189cb84196f0c7a5c0b86bd48c01f8d8b";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.bsdOriginal;
      description = "# Voluptuous is a Python data validation library";
    };
  };



  "volvooncall" = python.mkDerivation {
    name = "volvooncall-0.1.1";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/bf/e1/6e1d3fc0e6d8b70551ddc3f1e81f6d68ee535552382fbfea355c8884f4e0/volvooncall-0.1.1.tar.gz";
      sha256 = "0ccc83945deb81955693ab4ad81487d1accb9319137725f5936103b58bc07687";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = "";
      description = "Communicate with VOC";
    };
  };



  "vsure" = python.mkDerivation {
    name = "vsure-0.11.1";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/ee/22/e54de6e6a01adf4168692a9244f6cbf5e8315fe07221605bb2b13266b1d2/vsure-0.11.1.tar.gz";
      sha256 = "b7709f41ec536a479ef153a6b04bdc53b97ead1dafebbbfed1daed16672287b3";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."requests"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "Read and change status of verisure devices through mypages.";
    };
  };



  "vtjp" = python.mkDerivation {
    name = "vtjp-0.1.11";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/18/aa/92e11801d404d72c87c8d9f89b85e5386e0ee0225c053a01e7d18677c637/vtjp-0.1.11.tar.gz";
      sha256 = "aaeff9e1af7be5f197be25bc50c0818a96286ce6312aae4c342c17e03372429a";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."requests"
      self."tabulate"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "Västtrafik API.";
    };
  };



  "wakeonlan" = python.mkDerivation {
    name = "wakeonlan-0.2.2";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/26/87/4164f76446fb372ce9ff10f9458ac00dade098ef054772ab3333139e8cfa/wakeonlan-0.2.2.tar.gz";
      sha256 = "860f38e4fe06366cec71cead3d4071763e9ae1265d43227d866a2ab30932a1ac";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = "WTFPL";
      description = "A small python module for wake on lan.";
    };
  };



  "websocket-client" = python.mkDerivation {
    name = "websocket-client-0.37.0";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/a3/1e/b717151e29a70e8f212edae9aebb7812a8cae8477b52d9fe990dcaec9bbd/websocket_client-0.37.0.tar.gz";
      sha256 = "678b246d816b94018af5297e72915160e2feb042e0cde1a9397f502ac3a52f41";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."six"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.lgpl2;
      description = "WebSocket client for python. hybi13 is supported.";
    };
  };



  "websockets" = python.mkDerivation {
    name = "websockets-3.2";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/c5/5c/fd5cbe294146421596459ba7ae55f39972d722e77da4c791fdc25be5c8e8/websockets-3.2.tar.gz";
      sha256 = "b536827d433a79e85108becdac0b0909e7ce02c3613df53da6d96aee950b50b5";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."asyncio"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.bsdOriginal;
      description = "An implementation of the WebSocket Protocol (RFC 6455)";
    };
  };



  "xbee-helper" = python.mkDerivation {
    name = "xbee-helper-0.0.7";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/4c/5e/92696bbabb4c4eab4ecafae24cd3a8145d1c68d8fc05cfd11e77642dc8f4/xbee-helper-0.0.7.tar.gz";
      sha256 = "067b065395cc3d34abb7dc5f089f1c6028e16b864c0abcf4ab0cea23ba01ef67";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."XBee"
      self."pyserial"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = "";
      description = "This project offers a high level API to an XBee device running an up-";
    };
  };



  "xboxapi" = python.mkDerivation {
    name = "xboxapi-0.1.1";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/ce/c0/631f69d137877412297383e9b24bb92c8cb4b72c2d4a4823a25710d395e1/xboxapi-0.1.1.zip";
      sha256 = "f735e58607e91cbd311ec6a4de6f59eac9fe48b25d41c92009ec3cafa4b0623d";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = "";
      description = "A wrapper library for XboxAPI.com";
    };
  };



  "xmltodict" = python.mkDerivation {
    name = "xmltodict-0.10.2";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/4a/5e/cd36c16c9eca47162fbbea9aa723b9ab3010f9ae9d4be5c9f6cb2bc147ab/xmltodict-0.10.2.tar.gz";
      sha256 = "fc518ccf9adbbb917a2ddcb386be852ae6dd36935e1e8b9a3e760201abfdbf77";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "Makes working with XML feel like you are working with JSON";
    };
  };



  "yahoo-finance" = python.mkDerivation {
    name = "yahoo-finance-1.3.2";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/d3/70/b3eae9456d40b5a8d751df73062675f303cf2f1f18a45431f2b2b4c67176/yahoo-finance-1.3.2.tar.gz";
      sha256 = "82d1411c12d93ac4c7e769fd67f2218f464a901842fa91b64fee4d85895c7579";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."pytz"
      self."simplejson"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "Python module to get stock data from Yahoo! Finance";
    };
  };



  "yahooweather" = python.mkDerivation {
    name = "yahooweather-0.8";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/40/f5/2810a8fbb65571e7d81fd7a1015c6da9e2a498f89aae31fb6cfb09480f87/yahooweather-0.8.zip";
      sha256 = "c531ade76d6f090784480ac468f0e27fc397a455b2f629bd519d7a3c21a19bf9";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.bsdOriginal;
      description = "a Python module that provides an interface to the Yahoo! Weather RSS feed.";
    };
  };



  "zeroconf" = python.mkDerivation {
    name = "zeroconf-0.17.6";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/b8/15/d4b1773e91f8ff54681c3a0d45baec553ffa850f42beb62353156ab4a64c/zeroconf-0.17.6.tar.gz";
      sha256 = "b614baa73833bdfc8ae64f2a9f5d19b014ad3164fbbc8513ef27a7bbe1e6c5e3";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."enum-compat"
      self."netifaces"
      self."six"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.lgpk2;
      description = "Pure Python Multicast DNS Service Discovery Library (Bonjour/Avahi compatible)";
    };
  };



  "zope.interface" = python.mkDerivation {
    name = "zope.interface-4.3.2";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/38/1b/d55c39f2cf442bd9fb2c59760ed058c84b57d25c680819c25f3aff741e1f/zope.interface-4.3.2.tar.gz";
      sha256 = "6a0e224a052e3ce27b3a7b1300a24747513f7a507217fcc2a4cb02eb92945cee";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.zpt21;
      description = "Interfaces for Python";
    };
  };

}

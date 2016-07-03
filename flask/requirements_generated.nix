# generated using pypi2nix tool (version: 1.1.1)
#
# COMMAND:
#   pypi2nix -r flask/requirements.txt -E openssl libffi
#

{ pkgs, python, commonBuildInputs ? [], commonDoCheck ? false }:

self: {

  "Babel" = python.mkDerivation {
    name = "Babel-2.3.4";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/6e/96/ba2a2462ed25ca0e651fb7b66e7080f5315f91425a07ea5b34d7c870c114/Babel-2.3.4.tar.gz";
      md5= "afa20bc55b0e991833030129ad498f35";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
    self."pytz"
  ];
    meta = {
      homepage = "";
      license = "BSD";
      description = "Internationalization utilities";
    };
  };



  "Flask" = python.mkDerivation {
    name = "Flask-0.11.1";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/55/8a/78e165d30f0c8bb5d57c429a30ee5749825ed461ad6c959688872643ffb3/Flask-0.11.1.tar.gz";
      md5= "d2af95d8fe79cf7da099f062dd122a08";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
    self."Jinja2"
    self."Werkzeug"
    self."click"
    self."itsdangerous"
  ];
    meta = {
      homepage = "";
      license = "BSD";
      description = "A microframework based on Werkzeug, Jinja2 and good intentions";
    };
  };



  "Flask-Admin" = python.mkDerivation {
    name = "Flask-Admin-1.4.2";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/74/23/a411ce6bca79f30698fbe1d1a59c4789919bdb93fb5385bb24ea07ea7674/Flask-Admin-1.4.2.tar.gz";
      md5= "b12158ee16c92a447aa3da89e41eeae9";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
    self."Flask"
    self."WTForms"
  ];
    meta = {
      homepage = "";
      license = "BSD";
      description = "Simple and extensible admin interface framework for Flask";
    };
  };



  "Flask-Babel" = python.mkDerivation {
    name = "Flask-Babel-0.11.1";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/47/96/6013d4091fb4238e27e918aec4929f082942fa8c9489ae3aad2f18de4b5b/Flask-Babel-0.11.1.tar.gz";
      md5= "658e84a20ddc545a7612144fe2c758d3";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
    self."Babel"
    self."Flask"
    self."Jinja2"
  ];
    meta = {
      homepage = "";
      license = "BSD";
      description = "Adds i18n/l10n support to Flask applications";
    };
  };



  "Flask-Cache" = python.mkDerivation {
    name = "Flask-Cache-0.13.1";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/91/c4/f71095437bd4b691c63f240e72a20c57e2c216085cbc271f79665885d3da/Flask-Cache-0.13.1.tar.gz";
      md5= "ab82a9cd0844891ccdb54fbb93fd6c59";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
    self."Flask"
  ];
    meta = {
      homepage = "";
      license = "BSD";
      description = "Adds cache support to your Flask application";
    };
  };



  "Flask-ErrorHandler" = python.mkDerivation {
    name = "Flask-ErrorHandler-0.1.0";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/74/b8/f29522645605908c9ef28b8371c2a71a23a573f9b24bcb83ec44f213d71f/Flask-ErrorHandler-0.1.0.tar.gz";
      md5= "f463b6ed8a7839163dcde2d225c549c3";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = {
      homepage = "";
      license = "BSD";
      description = "Generic error handlers for Flask blueprints.";
    };
  };



  "Flask-FormEncode" = python.mkDerivation {
    name = "Flask-FormEncode-0.10.1";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/51/a0/dc822bdbd1c4c064241a0d0abc5b0680f201a81f520df453a065d54b11b1/Flask-FormEncode-0.10.1.tar.gz";
      md5= "bd2b19e8b39e0873707f7af48cdff240";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
    self."Flask"
    self."FormEncode"
  ];
    meta = {
      homepage = "";
      license = "lib.mit";
      description = "A form validation extension for Flask using the FormEncode package.";
    };
  };



  "Flask-GraphQL" = python.mkDerivation {
    name = "Flask-GraphQL-1.3.0";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/49/fa/f80ce6bd731612054c76e49c59d1571262a8287fea01fdb836f65a37fce1/Flask-GraphQL-1.3.0.tar.gz";
      md5= "7f5a3e0d340e6ec8e9555adfdba04312";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
    self."Flask"
    self."graphql-core"
  ];
    meta = {
      homepage = "";
      license = "lib.mit";
      description = "Adds GraphQL support to your Flask application";
    };
  };



  "Flask-Hookserver" = python.mkDerivation {
    name = "Flask-Hookserver-1.1.0";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/83/be/b555f8a4dc84bab9b9b49517a6a0eec687eb6af1218d6227464d32c88ca8/Flask-Hookserver-1.1.0.tar.gz";
      md5= "77599e7d611a5b3ad7ca754e23b2cd1f";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
    self."Flask"
    self."Werkzeug"
    self."ipaddress"
    self."requests"
  ];
    meta = {
      homepage = "";
      license = "lib.mit";
      description = "Server for GitHub webhooks using Flask";
    };
  };



  "Flask-Login" = python.mkDerivation {
    name = "Flask-Login-0.3.2";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/06/e6/61ed90ed8ce6752b745ed13fac3ba407dc9db95dfa2906edc8dd55dde454/Flask-Login-0.3.2.tar.gz";
      md5= "d95c2275d3e1c755145910077366dc45";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
    self."Flask"
  ];
    meta = {
      homepage = "";
      license = "lib.mit";
      description = "User session management for Flask";
    };
  };



  "Flask-MIME-Encoders" = python.mkDerivation {
    name = "Flask-MIME-Encoders-0.1.3";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/4b/38/7ea1ff426ef0a92a1d0b4071a41385ba4b705e03dd20e86fadddc8a7432a/Flask-MIME-Encoders-0.1.3.zip";
      md5= "726fdb6810f02b308a2ccddb731cb438";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
    self."Flask"
  ];
    meta = {
      homepage = "";
      license = "lib.mit";
      description = "Extensible Flask MIME encoders and decoders";
    };
  };



  "Flask-Mail" = python.mkDerivation {
    name = "Flask-Mail-0.9.1";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/05/2f/6a545452040c2556559779db87148d2a85e78a26f90326647b51dc5e81e9/Flask-Mail-0.9.1.tar.gz";
      md5= "04b35a42a44ec7aa724ec8ce55e2e08e";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
    self."Flask"
    self."blinker"
  ];
    meta = {
      homepage = "";
      license = "BSD";
      description = "Flask extension for sending email";
    };
  };



  "Flask-Mailer" = python.mkDerivation {
    name = "Flask-Mailer-0.4.0";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/8b/7f/7dcf9d0da6ea6fa29c426b7bdbf87ee166cab3f361470ada4c0fedbd3d03/Flask-Mailer-0.4.0.tar.gz";
      md5= "ebb5138747a65f15431eb2c32d1662ac";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
    self."Flask"
  ];
    meta = {
      homepage = "";
      license = "BSD";
      description = "A Flask extension for sending emails with pluggable backends.";
    };
  };



  "Flask-Principal" = python.mkDerivation {
    name = "Flask-Principal-0.4.0";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/14/c7/2531aca6ab7baa3774fde2dfc9c9dd6d5a42576a1013a93701bfdc402fdd/Flask-Principal-0.4.0.tar.gz";
      md5= "462d1345c9ddaddbec33a743e5821e2c";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
    self."Flask"
    self."blinker"
  ];
    meta = {
      homepage = "";
      license = "lib.mit";
      description = "Identity management for flask";
    };
  };



  "Flask-SQLAlchemy" = python.mkDerivation {
    name = "Flask-SQLAlchemy-2.1";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/b3/52/227aaf4e8cebb153e239c518a9e916590b2fe0e4350e6b02d92b546b69b7/Flask-SQLAlchemy-2.1.tar.gz";
      md5= "dc15fe08b07b434d3d2c4063b4674b72";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
    self."Flask"
    self."SQLAlchemy"
  ];
    meta = {
      homepage = "";
      license = "BSD";
      description = "Adds SQLAlchemy support to your Flask application";
    };
  };



  "Flask-Security" = python.mkDerivation {
    name = "Flask-Security-1.7.5";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/5c/c2/7c2311e599690b6b4a55346900523e33ce61e81be4d01fa231d2fc8ea12a/Flask-Security-1.7.5.tar.gz";
      md5= "98a0237a04d39a951e9129311d6dc4e0";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
    self."Flask"
    self."Flask-Login"
    self."Flask-Mail"
    self."Flask-Principal"
    self."Flask-WTF"
    self."itsdangerous"
    self."passlib"
  ];
    meta = {
      homepage = "";
      license = "lib.mit";
      description = "Simple security for Flask apps";
    };
  };



  "Flask-WTF" = python.mkDerivation {
    name = "Flask-WTF-0.12";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/f6/fe/9fe6a8a4edcc39f8ec365dc16d292d659f7a77a0ed596947f29c0c5c9dc1/Flask-WTF-0.12.tar.gz";
      md5= "c53a74e8ba481bf53405fd5efdf0339e";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
    self."Flask"
    self."WTForms"
    self."Werkzeug"
  ];
    meta = {
      homepage = "";
      license = "BSD";
      description = "Simple integration of Flask and WTForms";
    };
  };



  "FormEncode" = python.mkDerivation {
    name = "FormEncode-1.3.0";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/99/5b/f71f36b81b42291a70f61104d0eeb1a30be856a052ebe032c37b45db840c/FormEncode-1.3.0.zip";
      md5= "6df12d60bf3179402f2c2efd1129eb74";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = {
      homepage = "";
      license = "PSF";
      description = "HTML form validation, generation, and conversion package";
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
    self."Babel"
    self."MarkupSafe"
  ];
    meta = {
      homepage = "";
      license = "BSD";
      description = "A small but fast and easy to use stand-alone template engine written in pure python.";
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



  "WTForms" = python.mkDerivation {
    name = "WTForms-2.1";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/bf/91/2e553b86c55e9cf2f33265de50e052441fb753af46f5f20477fe9c61280e/WTForms-2.1.zip";
      md5= "6938a541fafd1a1ae2f6b9b88588eef2";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
    self."Babel"
  ];
    meta = {
      homepage = "";
      license = "BSD";
      description = "A flexible forms validation and rendering library for python web development.";
    };
  };



  "Werkzeug" = python.mkDerivation {
    name = "Werkzeug-0.11.10";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/b7/7f/44d3cfe5a12ba002b253f6985a4477edfa66da53787a2a838a40f6415263/Werkzeug-0.11.10.tar.gz";
      md5= "780967186f9157e88f2bfbfa6f07a893";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = {
      homepage = "";
      license = "BSD";
      description = "The Swiss Army knife of Python web development";
    };
  };



  "blinker" = python.mkDerivation {
    name = "blinker-1.4";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/1b/51/e2a9f3b757eb802f61dc1f2b09c8c99f6eb01cf06416c0671253536517b6/blinker-1.4.tar.gz";
      md5= "8b3722381f83c2813c52de3016b68d33";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = {
      homepage = "";
      license = "MIT License";
      description = "Fast, simple object-to-object and broadcast signaling";
    };
  };



  "cffi" = python.mkDerivation {
    name = "cffi-1.7.0";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/83/3c/00b553fd05ae32f27b3637f705c413c4ce71290aa9b4c4764df694e906d9/cffi-1.7.0.tar.gz";
      md5= "34122a545060cee58bab88feab57006d";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
    self."pycparser"
  ];
    meta = {
      homepage = "";
      license = "lib.mit";
      description = "Foreign Function Interface for Python calling C code.";
    };
  };



  "click" = python.mkDerivation {
    name = "click-6.6";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/7a/00/c14926d8232b36b08218067bcd5853caefb4737cda3f0a47437151344792/click-6.6.tar.gz";
      md5= "d0b09582123605220ad6977175f3e51d";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = {
      homepage = "";
      license = "";
      description = "A simple wrapper around optparse for powerful command line utilities.";
    };
  };



  "cryptography" = python.mkDerivation {
    name = "cryptography-1.4";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/a9/5b/a383b3a778609fe8177bd51307b5ebeee369b353550675353f46cb99c6f0/cryptography-1.4.tar.gz";
      md5= "a9763e3831cc7cdb402c028fac1ceb39";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
    self."cffi"
    self."enum34"
    self."idna"
    self."ipaddress"
    self."pyasn1"
    self."six"
  ];
    meta = {
      homepage = "";
      license = "BSD or Apache License, Version 2.0";
      description = "cryptography is a package which provides cryptographic recipes and primitives to Python developers.";
    };
  };



  "enum34" = python.mkDerivation {
    name = "enum34-1.1.6";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/bf/3e/31d502c25302814a7c2f1d3959d2a3b3f78e509002ba91aea64993936876/enum34-1.1.6.tar.gz";
      md5= "5f13a0841a61f7fc295c514490d120d0";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = {
      homepage = "";
      license = "BSD License";
      description = "Python 3.4 Enum backported to 3.3, 3.2, 3.1, 2.7, 2.6, 2.5, and 2.4";
    };
  };



  "graphql-core" = python.mkDerivation {
    name = "graphql-core-0.5.3";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/53/74/7f71377be0d0fc9dbf47701853e6608b3da53ecd0e0c57f750d394455345/graphql-core-0.5.3.tar.gz";
      md5= "1f0f35e290dce62bb9b21948e1309e8f";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
    self."promise"
    self."six"
  ];
    meta = {
      homepage = "";
      license = "lib.mit";
      description = "GraphQL implementation for Python";
    };
  };



  "idna" = python.mkDerivation {
    name = "idna-2.1";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/fb/84/8c27516fbaa8147acd2e431086b473c453c428e24e8fb99a1d89ce381851/idna-2.1.tar.gz";
      md5= "f6473caa9c5e0cc1ad3fd5d04c3c114b";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = {
      homepage = "";
      license = "BSD-like";
      description = "Internationalized Domain Names in Applications (IDNA)";
    };
  };



  "ipaddress" = python.mkDerivation {
    name = "ipaddress-1.0.16";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/cd/c5/bd44885274379121507870d4abfe7ba908326cf7bfd50a48d9d6ae091c0d/ipaddress-1.0.16.tar.gz";
      md5= "1e27b62aa20f5b6fc200b2bdbf0d0847";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = {
      homepage = "";
      license = "Python Software Foundation License";
      description = "IPv4/IPv6 manipulation library";
    };
  };



  "itsdangerous" = python.mkDerivation {
    name = "itsdangerous-0.24";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/dc/b4/a60bcdba945c00f6d608d8975131ab3f25b22f2bcfe1dab221165194b2d4/itsdangerous-0.24.tar.gz";
      md5= "a3d55aa79369aef5345c036a8a26307f";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = {
      homepage = "";
      license = "";
      description = "Various helpers to pass trusted data to untrusted environments and back.";
    };
  };



  "ndg-httpsclient" = python.mkDerivation {
    name = "ndg-httpsclient-0.4.1";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/08/92/6318c6c71566778782065736d73c62e621a7a190f9bb472a23857d97f823/ndg_httpsclient-0.4.1.tar.gz";
      md5= "133255e6ef9cf694b5620b1bf73a99f7";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
    self."pyOpenSSL"
    self."pyasn1"
  ];
    meta = {
      homepage = "";
      license = "BSD - See ndg/httpsclient/LICENCE file for details";
      description = "Provides enhanced HTTPS support for httplib and urllib2 using PyOpenSSL";
    };
  };



  "passlib" = python.mkDerivation {
    name = "passlib-1.6.5";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/1e/59/d1a50836b29c87a1bde9442e1846aa11e1548491cbee719e51b45a623e75/passlib-1.6.5.tar.gz";
      md5= "d2edd6c42cde136a538b48d90a06ad67";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = {
      homepage = "";
      license = "BSD";
      description = "comprehensive password hashing framework supporting over 30 schemes";
    };
  };



  "promise" = python.mkDerivation {
    name = "promise-0.4.2";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/8b/e0/7da87005df50169833697637c1e8192f7a7ff72ffc39978833fde18c93da/promise-0.4.2.tar.gz";
      md5= "8bd927abe12ebce1718b12c29345149d";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = {
      homepage = "";
      license = "lib.mit";
      description = "Promises/A+ implementation for Python";
    };
  };



  "pyOpenSSL" = python.mkDerivation {
    name = "pyOpenSSL-16.0.0";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/77/f2/bccec75ca4280a9fa762a90a1b8b152a22eac5d9c726d7da1fcbfe0a20e6/pyOpenSSL-16.0.0.tar.gz";
      md5= "9587d813dcf656e9f2760e41a3682dc3";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
    self."cryptography"
    self."six"
  ];
    meta = {
      homepage = "";
      license = "Apache License, Version 2.0";
      description = "Python wrapper module around the OpenSSL library";
    };
  };



  "pyasn1" = python.mkDerivation {
    name = "pyasn1-0.1.9";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/f7/83/377e3dd2e95f9020dbd0dfd3c47aaa7deebe3c68d3857a4e51917146ae8b/pyasn1-0.1.9.tar.gz";
      md5= "f00a02a631d4016818659d1cc38d229a";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = {
      homepage = "";
      license = "BSD";
      description = "ASN.1 types and codecs";
    };
  };



  "pycparser" = python.mkDerivation {
    name = "pycparser-2.14";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/6d/31/666614af3db0acf377876d48688c5d334b6e493b96d21aa7d332169bee50/pycparser-2.14.tar.gz";
      md5= "a2bc8d28c923b4fe2b2c3b4b51a4f935";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = {
      homepage = "";
      license = "BSD";
      description = "C parser in Python";
    };
  };



  "pytz" = python.mkDerivation {
    name = "pytz-2016.4";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/6c/4a/eb896a5629813b56f5a79cc6b7f5551598f27f1eea6c00c68b47541c1501/pytz-2016.4.zip";
      md5= "eeb649e63d56fac3566a3fefaa35c7fa";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = {
      homepage = "";
      license = "lib.mit";
      description = "World timezone definitions, modern and historical";
    };
  };



  "requests" = python.mkDerivation {
    name = "requests-2.10.0";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/49/6f/183063f01aae1e025cf0130772b55848750a2f3a89bfa11b385b35d7329d/requests-2.10.0.tar.gz";
      md5= "a36f7a64600f1bfec4d55ae021d232ae";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
    self."ndg-httpsclient"
    self."pyOpenSSL"
    self."pyasn1"
  ];
    meta = {
      homepage = "";
      license = "lib.asl20";
      description = "Python HTTP for Humans.";
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

}
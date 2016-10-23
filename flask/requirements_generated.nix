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

}
# generated using pypi2nix tool (version: 1.6.0)
#
# COMMAND:
#   pypi2nix -v -V 3.5 --setup-requires six packaging appdirs -r requirements.txt
#

{ pkgs, python, commonBuildInputs ? [], commonDoCheck ? false }:

self: {

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



  "WebOb" = python.mkDerivation {
    name = "WebOb-1.7.1";
    src = pkgs.fetchurl { url = "https://pypi.python.org/packages/c3/6f/fc168ab701ab8f3741ed0b1377edda676c3e7db61858cef1f72969413968/WebOb-1.7.1.tar.gz"; sha256 = "3b2e3e4a46ce92614fb7d85081a63d03fa0c714dbe0195d5d91ec0205526c83f"; };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "WSGI request and response object";
    };
  };



  "appdirs" = python.mkDerivation {
    name = "appdirs-1.4.0";
    src = pkgs.fetchurl { url = "https://pypi.python.org/packages/bd/66/0a7f48a0f3fb1d3a4072bceb5bbd78b1a6de4d801fb7135578e7c7b1f563/appdirs-1.4.0.tar.gz"; sha256 = "8fc245efb4387a4e3e0ac8ebcc704582df7d72ff6a42a53f5600bbb18fdaadc5"; };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "A small Python module for determining appropriate \" +         \"platform-specific dirs, e.g. a \"user data dir\".";
    };
  };



  "hupper" = python.mkDerivation {
    name = "hupper-0.4.2";
    src = pkgs.fetchurl { url = "https://pypi.python.org/packages/58/72/3fa084a9b68cfb0442b100431533af1c3ff189a33406e9dad066062eb5fc/hupper-0.4.2.tar.gz"; sha256 = "c638b88b1a1505522870219a68272d2f1ae5778cf046c267925edec97678b0fb"; };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "Integrated process monitor for developing servers.";
    };
  };



  "packaging" = python.mkDerivation {
    name = "packaging-16.8";
    src = pkgs.fetchurl { url = "https://pypi.python.org/packages/c6/70/bb32913de251017e266c5114d0a645f262fb10ebc9bf6de894966d124e35/packaging-16.8.tar.gz"; sha256 = "5d50835fdf0a7edf0b55e311b7c887786504efea1177abd7e69329a8e5ea619e"; };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."pyparsing"
      self."six"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.bsdOriginal;
      description = "Core utilities for Python packages";
    };
  };



  "pyparsing" = python.mkDerivation {
    name = "pyparsing-2.1.10";
    src = pkgs.fetchurl { url = "https://pypi.python.org/packages/38/bb/bf325351dd8ab6eb3c3b7c07c3978f38b2103e2ab48d59726916907cd6fb/pyparsing-2.1.10.tar.gz"; sha256 = "811c3e7b0031021137fc83e051795025fcb98674d07eb8fe922ba4de53d39188"; };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "Python parsing module";
    };
  };



  "pyramid" = python.mkDerivation {
    name = "pyramid-1.8.1";
    src = pkgs.fetchurl { url = "https://pypi.python.org/packages/d5/ed/501974a3bcb034af9e5c582e3d5e096ac3a2842620098f85862f10bf8e17/pyramid-1.8.1.tar.gz"; sha256 = "359782ed643d923411595d84b3fde2f0caf790ce9eb33b0f019c25436c4c30ec"; };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."PasteDeploy"
      self."WebOb"
      self."hupper"
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



  "zope.interface" = python.mkDerivation {
    name = "zope.interface-4.3.3";
    src = pkgs.fetchurl { url = "https://pypi.python.org/packages/44/af/cea1e18bc0d3be0e0824762d3236f0e61088eeed75287e7b854d65ec9916/zope.interface-4.3.3.tar.gz"; sha256 = "8780ef68ca8c3fe1abb30c058a59015129d6e04a6b02c2e56b9c7de6078dfa88"; };
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
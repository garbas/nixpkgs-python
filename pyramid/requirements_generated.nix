# generated using pypi2nix tool (version: 1.6.0)
#
# COMMAND:
#   pypi2nix -v -V 3.5 -r requirements.txt
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



  "pyramid" = python.mkDerivation {
    name = "pyramid-1.7.3";
    src = pkgs.fetchurl { url = "https://pypi.python.org/packages/9c/6d/9b9f9acf22c5d221f25cf6756645bce9ea54ee741466197674fe77f2eee3/pyramid-1.7.3.tar.gz"; sha256 = "74b8eedf2b0a1a658ab79ae4b0ecf68fa8cdd5debcfec579c8b40bec83d1864e"; };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."PasteDeploy"
      self."WebOb"
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
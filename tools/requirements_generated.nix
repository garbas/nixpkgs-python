# generated using pypi2nix tool (version: 1.3.0dev)
#
# COMMAND:
#   pypi2nix -r tools/requirements.txt -V 3.5 -E groff less
#

{ pkgs, python, commonBuildInputs ? [], commonDoCheck ? false }:

self: {

  "PyYAML" = python.mkDerivation {
    name = "PyYAML-3.11";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/75/5e/b84feba55e20f8da46ead76f14a3943c8cb722d40360702b2365b91dec00/PyYAML-3.11.tar.gz";
      sha256= "c36c938a872e5ff494938b33b14aaa156cb439ec67548fcab3535bb78b0846e8";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "YAML parser and emitter for Python";
    };
    passthru.top_level = false;
  };



  "awscli" = python.mkDerivation {
    name = "awscli-1.10.47";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/49/63/ad95ceb876bd289ecf7df301d73f310dcd7972444045b0bbbb3a6aeb1509/awscli-1.10.47.tar.gz";
      sha256= "176ec3e5783ed3e9291da5e9b6fc100cb4550b843bb0bb7201e780e4174cbf70";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."botocore"
      self."colorama"
      self."docutils"
      self."rsa"
      self."s3transfer"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.asl20;
      description = "Universal Command Line Environment for AWS.";
    };
    passthru.top_level = false;
  };



  "botocore" = python.mkDerivation {
    name = "botocore-1.4.37";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/82/a2/15499d05a2c9a2e7b89904d2ff6906589eeaa4533f99a4aa478400a06fcd/botocore-1.4.37.tar.gz";
      sha256= "20dc1a0bf37019cac33e0f76d04a2831f2786cbee17f54da0e32a93caf86ef49";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."docutils"
      self."jmespath"
      self."python-dateutil"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.asl20;
      description = "Low-level, data-driven core of boto 3.";
    };
    passthru.top_level = false;
  };



  "cached-property" = python.mkDerivation {
    name = "cached-property-1.3.0";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/ae/02/09b905981aefb99c97ad53ac1cc0a90f02c1457a549eae98d87e8e6f2d7e/cached-property-1.3.0.tar.gz";
      sha256= "458e78b1c7286ece887d92c9bee829da85717994c5e3ddd253a40467f488bc81";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.bsdOriginal;
      description = "A decorator for caching properties in classes.";
    };
    passthru.top_level = false;
  };



  "colorama" = python.mkDerivation {
    name = "colorama-0.3.7";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/f0/d0/21c6449df0ca9da74859edc40208b3a57df9aca7323118c913e58d442030/colorama-0.3.7.tar.gz";
      sha256= "e043c8d32527607223652021ff648fbb394d5e19cba9f1a698670b338c9d782b";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.bsdOriginal;
      description = "Cross-platform colored terminal text.";
    };
    passthru.top_level = false;
  };



  "docker-compose" = python.mkDerivation {
    name = "docker-compose-1.7.1";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/b6/20/0a65e13ac06c4693f28ded22b87882ca1750239bdc0a05d4a4df4e3a9faa/docker-compose-1.7.1.tar.gz";
      sha256= "97460873bfa9228afee543881ff6f6f7e4c12ac81974a2fcfa40fce272b2934e";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."PyYAML"
      self."cached-property"
      self."docker-py"
      self."dockerpty"
      self."docopt"
      self."jsonschema"
      self."requests"
      self."six"
      self."texttable"
      self."websocket-client"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.asl20;
      description = "Multi-container orchestration for Docker";
    };
    passthru.top_level = false;
  };



  "docker-py" = python.mkDerivation {
    name = "docker-py-1.8.1";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/d9/af/4c4edd438a1d132a30c7877d929841a6b8e843ee281f41d91500ad7fac65/docker-py-1.8.1.tar.gz";
      sha256= "4f47a05e677472b5e022be1ab1dfd91b473ab3fc14a6b71337042ac2caaafa0b";
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
      license = "";
      description = "Python client for Docker.";
    };
    passthru.top_level = false;
  };



  "dockerpty" = python.mkDerivation {
    name = "dockerpty-0.4.1";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/8d/ee/e9ecce4c32204a6738e0a5d5883d3413794d7498fe8b06f44becc028d3ba/dockerpty-0.4.1.tar.gz";
      sha256= "69a9d69d573a0daa31bcd1c0774eeed5c15c295fe719c61aca550ed1393156ce";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."six"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.asl20;
      description = "Python library to use the pseudo-tty of a docker container";
    };
    passthru.top_level = false;
  };



  "docopt" = python.mkDerivation {
    name = "docopt-0.6.2";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/a2/55/8f8cab2afd404cf578136ef2cc5dfb50baa1761b68c9da1fb1e4eed343c9/docopt-0.6.2.tar.gz";
      sha256= "49b3a825280bd66b3aa83585ef59c4a8c82f2c8a522dbe754a8bc8d08c85c491";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "Pythonic argument parser, that will make you smile";
    };
    passthru.top_level = false;
  };



  "docutils" = python.mkDerivation {
    name = "docutils-0.12";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/37/38/ceda70135b9144d84884ae2fc5886c6baac4edea39550f28bcd144c1234d/docutils-0.12.tar.gz";
      sha256= "c7db717810ab6965f66c8cf0398a98c9d8df982da39b4cd7f162911eb89596fa";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = "public domain, Python, 2-Clause BSD, GPL 3 (see COPYING.txt)";
      description = "Docutils -- Python Documentation Utilities";
    };
    passthru.top_level = false;
  };



  "jmespath" = python.mkDerivation {
    name = "jmespath-0.9.0";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/8f/d8/6e3e602a3e90c5e3961d3d159540df6b2ff32f5ab2ee8ee1d28235a425c1/jmespath-0.9.0.tar.gz";
      sha256= "08dfaa06d4397f283a01e57089f3360e3b52b5b9da91a70e1fd91e9f0cdd3d3d";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = "";
      description = "JSON Matching Expressions";
    };
    passthru.top_level = false;
  };



  "jsonschema" = python.mkDerivation {
    name = "jsonschema-2.5.1";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/58/0d/c816f5ea5adaf1293a1d81d32e4cdfdaf8496973aa5049786d7fdb14e7e7/jsonschema-2.5.1.tar.gz";
      sha256= "36673ac378feed3daa5956276a829699056523d7961027911f064b52255ead41";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "An implementation of JSON Schema validation for Python";
    };
    passthru.top_level = false;
  };



  "pyasn1" = python.mkDerivation {
    name = "pyasn1-0.1.9";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/f7/83/377e3dd2e95f9020dbd0dfd3c47aaa7deebe3c68d3857a4e51917146ae8b/pyasn1-0.1.9.tar.gz";
      sha256= "853cacd96d1f701ddd67aa03ecc05f51890135b7262e922710112f12a2ed2a7f";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.bsdOriginal;
      description = "ASN.1 types and codecs";
    };
    passthru.top_level = false;
  };



  "python-dateutil" = python.mkDerivation {
    name = "python-dateutil-2.5.3";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/3e/f5/aad82824b369332a676a90a8c0d1e608b17e740bbb6aeeebca726f17b902/python-dateutil-2.5.3.tar.gz";
      sha256= "1408fdb07c6a1fa9997567ce3fcee6a337b39a503d80699e0f213de4aa4b32ed";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."six"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = "Simplified BSD";
      description = "Extensions to the standard Python datetime module";
    };
    passthru.top_level = false;
  };



  "requests" = python.mkDerivation {
    name = "requests-2.7.0";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/0a/00/8cc925deac3a87046a4148d7846b571cf433515872b5430de4cd9dea83cb/requests-2.7.0.tar.gz";
      sha256= "398a3db6d61899d25fd4a06c6ca12051b0ce171d705decd7ed5511517b4bb93d";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."pyasn1"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.asl20;
      description = "Python HTTP for Humans.";
    };
    passthru.top_level = false;
  };



  "rsa" = python.mkDerivation {
    name = "rsa-3.4.2";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/14/89/adf8b72371e37f3ca69c6cb8ab6319d009c4a24b04a31399e5bd77d9bb57/rsa-3.4.2.tar.gz";
      sha256= "25df4e10c263fb88b5ace923dd84bf9aa7f5019687b5e55382ffcdb8bede9db5";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."pyasn1"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = "ASL 2";
      description = "Pure-Python RSA implementation";
    };
    passthru.top_level = false;
  };



  "s3transfer" = python.mkDerivation {
    name = "s3transfer-0.0.1";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/6e/12/5d0ea478e6d261857a461af921b78f3bc6f92c479ffe57076f4fc9a362ab/s3transfer-0.0.1.tar.gz";
      sha256= "2bb9ed8db58af94dfa78f75f554d646dfe4b4741fc87f63a20c2bfb3f70f4355";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."botocore"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.asl20;
      description = "An Amazon S3 Transfer Manager";
    };
    passthru.top_level = false;
  };



  "six" = python.mkDerivation {
    name = "six-1.10.0";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/b3/b2/238e2590826bfdd113244a40d9d3eb26918bd798fc187e2360a8367068db/six-1.10.0.tar.gz";
      sha256= "105f8d68616f8248e24bf0e9372ef04d3cc10104f1980f54d57b2ce73a5ad56a";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "Python 2 and 3 compatibility utilities";
    };
    passthru.top_level = false;
  };



  "texttable" = python.mkDerivation {
    name = "texttable-0.8.4";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/f5/5e/47cbc50187ca719a39ce4838182c6126487ca62ddd299bc34cafb94260fe/texttable-0.8.4.tar.gz";
      sha256= "8587b61cb6c6022d0eb79e56e59825df4353f0f33099b4ae3bcfe8d41bd1702e";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = "LGPL";
      description = "module for creating simple ASCII tables";
    };
    passthru.top_level = false;
  };



  "websocket-client" = python.mkDerivation {
    name = "websocket-client-0.37.0";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/a3/1e/b717151e29a70e8f212edae9aebb7812a8cae8477b52d9fe990dcaec9bbd/websocket_client-0.37.0.tar.gz";
      sha256= "678b246d816b94018af5297e72915160e2feb042e0cde1a9397f502ac3a52f41";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."six"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = "LGPL";
      description = "WebSocket client for python. hybi13 is supported.";
    };
    passthru.top_level = false;
  };

}
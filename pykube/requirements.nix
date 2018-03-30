# generated using pypi2nix tool (version: 1.8.1)
# See more at: https://github.com/garbas/pypi2nix
#
# COMMAND:
#   pypi2nix -W https://travis.garbas.si/wheels_cache/ -v -V 3.5 -r requirements.txt -O ../overrides.nix
#

{ pkgs ? import <nixpkgs> {}
}:

let

  inherit (pkgs) makeWrapper;
  inherit (pkgs.stdenv.lib) fix' extends inNixShell;

  pythonPackages =
  import "${toString pkgs.path}/pkgs/top-level/python-packages.nix" {
    inherit pkgs;
    inherit (pkgs) stdenv;
    python = pkgs.python35;
    # patching pip so it does not try to remove files when running nix-shell
    overrides =
      self: super: {
        bootstrapped-pip = super.bootstrapped-pip.overrideDerivation (old: {
          patchPhase = old.patchPhase + ''
            sed -i \
              -e "s|paths_to_remove.remove(auto_confirm)|#paths_to_remove.remove(auto_confirm)|"  \
              -e "s|self.uninstalled = paths_to_remove|#self.uninstalled = paths_to_remove|"  \
                $out/${pkgs.python35.sitePackages}/pip/req/req_install.py
          '';
        });
      };
  };

  commonBuildInputs = [];
  commonDoCheck = false;

  withPackages = pkgs':
    let
      pkgs = builtins.removeAttrs pkgs' ["__unfix__"];
      interpreter = pythonPackages.buildPythonPackage {
        name = "python35-interpreter";
        buildInputs = [ makeWrapper ] ++ (builtins.attrValues pkgs);
        buildCommand = ''
          mkdir -p $out/bin
          ln -s ${pythonPackages.python.interpreter} \
              $out/bin/${pythonPackages.python.executable}
          for dep in ${builtins.concatStringsSep " "
              (builtins.attrValues pkgs)}; do
            if [ -d "$dep/bin" ]; then
              for prog in "$dep/bin/"*; do
                if [ -x "$prog" ] && [ -f "$prog" ]; then
                  ln -s $prog $out/bin/`basename $prog`
                fi
              done
            fi
          done
          for prog in "$out/bin/"*; do
            wrapProgram "$prog" --prefix PYTHONPATH : "$PYTHONPATH"
          done
          pushd $out/bin
          ln -s ${pythonPackages.python.executable} python
          ln -s ${pythonPackages.python.executable} \
              python3
          popd
        '';
        passthru.interpreter = pythonPackages.python;
      };
    in {
      __old = pythonPackages;
      inherit interpreter;
      mkDerivation = pythonPackages.buildPythonPackage;
      packages = pkgs;
      overrideDerivation = drv: f:
        pythonPackages.buildPythonPackage (
          drv.drvAttrs // f drv.drvAttrs // { meta = drv.meta; }
        );
      withPackages = pkgs'':
        withPackages (pkgs // pkgs'');
    };

  python = withPackages {};

  generated = self: {
    "PyYAML" = python.mkDerivation {
      name = "PyYAML-3.12";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/4a/85/db5a2df477072b2902b0eb892feb37d88ac635d36245a72a6a69b23b383a/PyYAML-3.12.tar.gz"; sha256 = "592766c6303207a20efc445587778322d7f73b161bd994f227adaa341ba212ab"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://pyyaml.org/wiki/PyYAML";
        license = licenses.mit;
        description = "YAML parser and emitter for Python";
      };
    };

    "certifi" = python.mkDerivation {
      name = "certifi-2018.1.18";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/15/d4/2f888fc463d516ff7bf2379a4e9a552fef7f22a94147655d9b1097108248/certifi-2018.1.18.tar.gz"; sha256 = "edbc3f203427eef571f79a7692bb160a2b0f7ccaa31953e99bd17e307cf63f7d"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://certifi.io/";
        license = licenses.mpl20;
        description = "Python package for providing Mozilla's CA Bundle.";
      };
    };

    "chardet" = python.mkDerivation {
      name = "chardet-3.0.4";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/fc/bb/a5768c230f9ddb03acc9ef3f0d4a3cf93462473795d18e9535498c8f929d/chardet-3.0.4.tar.gz"; sha256 = "84ab92ed1c4d4f16916e05906b6b75a6c0fb5db821cc65e70cbd64a3e2a5eaae"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/chardet/chardet";
        license = licenses.lgpl2;
        description = "Universal encoding detector for Python 2 and 3";
      };
    };

    "httplib2" = python.mkDerivation {
      name = "httplib2-0.11.3";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/fd/ce/aa4a385e3e9fd351737fd2b07edaa56e7a730448465aceda6b35086a0d9b/httplib2-0.11.3.tar.gz"; sha256 = "e71daed9a0e6373642db61166fa70beecc9bf04383477f84671348c02a04cbdf"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/httplib2/httplib2";
        license = licenses.mit;
        description = "A comprehensive HTTP client library.";
      };
    };

    "idna" = python.mkDerivation {
      name = "idna-2.6";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/f4/bd/0467d62790828c23c47fc1dfa1b1f052b24efdf5290f071c7a91d0d82fd3/idna-2.6.tar.gz"; sha256 = "2c6a5de3089009e3da7c5dde64a141dbc8551d5b7f6cf4ed7c2568d0cc520a8f"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/kjd/idna";
        license = licenses.bsdOriginal;
        description = "Internationalized Domain Names in Applications (IDNA)";
      };
    };

    "oauth2client" = python.mkDerivation {
      name = "oauth2client-4.1.2";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/50/30/f89a4fc014a03e180840d432e73ffb96da422f2a8094ff3539f0f0c46661/oauth2client-4.1.2.tar.gz"; sha256 = "bd3062c06f8b10c6ef7a890b22c2740e5f87d61b6e1f4b1c90d069cdfc9dadb5"; };
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
        homepage = "http://github.com/google/oauth2client/";
        license = licenses.asl20;
        description = "OAuth 2.0 client library";
      };
    };

    "oauthlib" = python.mkDerivation {
      name = "oauthlib-2.0.7";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/47/b9/66278631430fe688b2e6c84df16619f1d1e27c9c6ebca28371f7c6fbb346/oauthlib-2.0.7.tar.gz"; sha256 = "909665297635fa11fe9914c146d875f2ed41c8c2d78e21a529dd71c0ba756508"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/oauthlib/oauthlib";
        license = licenses.bsdOriginal;
        description = "A generic, spec-compliant, thorough implementation of the OAuth request-signing logic";
      };
    };

    "pyasn1" = python.mkDerivation {
      name = "pyasn1-0.4.2";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/eb/3d/b7d0fdf4a882e26674c68c20f40682491377c4db1439870f5b6f862f76ed/pyasn1-0.4.2.tar.gz"; sha256 = "d258b0a71994f7770599835249cece1caef3c70def868c4915e6e5ca49b67d15"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/etingof/pyasn1";
        license = licenses.bsdOriginal;
        description = "ASN.1 types and codecs";
      };
    };

    "pyasn1-modules" = python.mkDerivation {
      name = "pyasn1-modules-0.2.1";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/ab/76/36ab0e099e6bd27ed95b70c2c86c326d3affa59b9b535c63a2f892ac9f45/pyasn1-modules-0.2.1.tar.gz"; sha256 = "af00ea8f2022b6287dc375b2c70f31ab5af83989fc6fe9eacd4976ce26cd7ccc"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."pyasn1"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/etingof/pyasn1-modules";
        license = licenses.bsdOriginal;
        description = "A collection of ASN.1-based protocols modules.";
      };
    };

    "pykube" = python.mkDerivation {
      name = "pykube-0.15.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/a2/40/59fe3425a3d4ac4a41f8d99e71f4862b1c3aaaa99f61afd50ff37f39dae2/pykube-0.15.0.tar.gz"; sha256 = "e53800d0d45f13911aa4ebca8463ae5cc82afad461f6575a0a217d2fce5f088b"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."PyYAML"
      self."oauth2client"
      self."requests"
      self."requests-oauthlib"
      self."six"
      self."tzlocal"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/kelproject/pykube";
        license = "License :: OSI Approved :: Apache Software License";
        description = "Python client library for Kubernetes";
      };
    };

    "pytz" = python.mkDerivation {
      name = "pytz-2018.3";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/1b/50/4cdc62fc0753595fc16c8f722a89740f487c6e5670c644eb8983946777be/pytz-2018.3.tar.gz"; sha256 = "410bcd1d6409026fbaa65d9ed33bf6dd8b1e94a499e32168acfc7b332e4095c0"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://pythonhosted.org/pytz";
        license = licenses.mit;
        description = "World timezone definitions, modern and historical";
      };
    };

    "requests" = python.mkDerivation {
      name = "requests-2.18.4";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/b0/e1/eab4fc3752e3d240468a8c0b284607899d2fbfb236a56b7377a329aa8d09/requests-2.18.4.tar.gz"; sha256 = "9c443e7324ba5b85070c4a818ade28bfabedf16ea10206da1132edaa6dda237e"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."certifi"
      self."chardet"
      self."idna"
      self."urllib3"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://python-requests.org";
        license = licenses.asl20;
        description = "Python HTTP for Humans.";
      };
    };

    "requests-oauthlib" = python.mkDerivation {
      name = "requests-oauthlib-0.8.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/80/14/ad120c720f86c547ba8988010d5186102030591f71f7099f23921ca47fe5/requests-oauthlib-0.8.0.tar.gz"; sha256 = "883ac416757eada6d3d07054ec7092ac21c7f35cb1d2cf82faf205637081f468"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."oauthlib"
      self."requests"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/requests/requests-oauthlib";
        license = licenses.bsdOriginal;
        description = "OAuthlib authentication support for Requests.";
      };
    };

    "rsa" = python.mkDerivation {
      name = "rsa-3.4.2";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/14/89/adf8b72371e37f3ca69c6cb8ab6319d009c4a24b04a31399e5bd77d9bb57/rsa-3.4.2.tar.gz"; sha256 = "25df4e10c263fb88b5ace923dd84bf9aa7f5019687b5e55382ffcdb8bede9db5"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."pyasn1"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://stuvel.eu/rsa";
        license = "License :: OSI Approved :: Apache Software License";
        description = "Pure-Python RSA implementation";
      };
    };

    "six" = python.mkDerivation {
      name = "six-1.11.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/16/d8/bc6316cf98419719bd59c91742194c111b6f2e85abac88e496adefaf7afe/six-1.11.0.tar.gz"; sha256 = "70e8a77beed4562e7f14fe23a786b54f6296e34344c23bc42f07b15018ff98e9"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://pypi.python.org/pypi/six/";
        license = licenses.mit;
        description = "Python 2 and 3 compatibility utilities";
      };
    };

    "tzlocal" = python.mkDerivation {
      name = "tzlocal-1.5.1";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/cb/89/e3687d3ed99bc882793f82634e9824e62499fdfdc4b1ae39e211c5b05017/tzlocal-1.5.1.tar.gz"; sha256 = "4ebeb848845ac898da6519b9b31879cf13b6626f7184c496037b818e238f2c4e"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."pytz"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/regebro/tzlocal";
        license = licenses.mit;
        description = "tzinfo object for the local timezone";
      };
    };

    "urllib3" = python.mkDerivation {
      name = "urllib3-1.22";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/ee/11/7c59620aceedcc1ef65e156cc5ce5a24ef87be4107c2b74458464e437a5d/urllib3-1.22.tar.gz"; sha256 = "cc44da8e1145637334317feebd728bd869a35285b93cbb4cca2577da7e62db4f"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."certifi"
      self."idna"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://urllib3.readthedocs.io/";
        license = licenses.mit;
        description = "HTTP library with thread-safe connection pooling, file post, and more.";
      };
    };
  };
  localOverridesFile = ./requirements_override.nix;
  overrides = import localOverridesFile { inherit pkgs python; };
  commonOverrides = [
        (import ../overrides.nix { inherit pkgs python ; })
  ];
  allOverrides =
    (if (builtins.pathExists localOverridesFile)
     then [overrides] else [] ) ++ commonOverrides;

in python.withPackages
   (fix' (pkgs.lib.fold
            extends
            generated
            allOverrides
         )
   )
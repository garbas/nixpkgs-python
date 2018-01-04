# generated using pypi2nix tool (version: 1.8.1)
# See more at: https://github.com/garbas/pypi2nix
#
# COMMAND:
#   pypi2nix -v -V 3.5 -r requirements.txt -O ../overrides.nix
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
    "Jinja2" = python.mkDerivation {
      name = "Jinja2-2.10";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/56/e6/332789f295cf22308386cf5bbd1f4e00ed11484299c5d7383378cf48ba47/Jinja2-2.10.tar.gz"; sha256 = "f84be1bb0040caca4cea721fcbbbbd61f9be9464ca236387158b0feea01914a4"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."MarkupSafe"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://jinja.pocoo.org/";
        license = licenses.bsdOriginal;
        description = "A small but fast and easy to use stand-alone template engine written in pure python.";
      };
    };

    "MarkupSafe" = python.mkDerivation {
      name = "MarkupSafe-1.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/4d/de/32d741db316d8fdb7680822dd37001ef7a448255de9699ab4bfcbdf4172b/MarkupSafe-1.0.tar.gz"; sha256 = "a6be69091dac236ea9c6bc7d012beab42010fa914c459791d627dad4910eb665"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://github.com/pallets/markupsafe";
        license = licenses.bsdOriginal;
        description = "Implements a XML/HTML/XHTML Markup safe string for Python";
      };
    };

    "Pygments" = python.mkDerivation {
      name = "Pygments-2.2.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/71/2a/2e4e77803a8bd6408a2903340ac498cb0a2181811af7c9ec92cb70b0308a/Pygments-2.2.0.tar.gz"; sha256 = "dbae1046def0efb574852fab9e90209b23f556367b5a320c0bcb871c77c3e8cc"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://pygments.org/";
        license = licenses.bsdOriginal;
        description = "Pygments is a syntax highlighting package written in Python.";
      };
    };

    "Rx" = python.mkDerivation {
      name = "Rx-1.6.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/4c/04/c2e960b121d40994dd6cd87fd710968f3cbfc0c85d65f47ca2af11c2d011/Rx-1.6.0.tar.gz"; sha256 = "84ac6e140f2129266fd4c77a3d0903bbff0a761386079ea0cb99c8524695cac1"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://reactivex.io";
        license = "License :: OSI Approved :: Apache Software License";
        description = "Reactive Extensions (Rx) for Python";
      };
    };

    "argparse" = python.mkDerivation {
      name = "argparse-1.4.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/18/dd/e617cfc3f6210ae183374cd9f6a26b20514bbb5a792af97949c5aacddf0f/argparse-1.4.0.tar.gz"; sha256 = "62b089a55be1d8949cd2bc7e0df0bddb9e028faefc8c32038cc84862aefdd6e4"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/ThomasWaldmann/argparse/";
        license = licenses.psfl;
        description = "Python command-line parsing library";
      };
    };

    "attrs" = python.mkDerivation {
      name = "attrs-17.4.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/8b/0b/a06cfcb69d0cb004fde8bc6f0fd192d96d565d1b8aa2829f0f20adb796e5/attrs-17.4.0.tar.gz"; sha256 = "1c7960ccfd6a005cd9f7ba884e6316b5e430a3f1a6c37c5f87d8b43f83b54ec9"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."six"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://www.attrs.org/";
        license = licenses.mit;
        description = "Classes Without Boilerplate";
      };
    };

    "blessings" = python.mkDerivation {
      name = "blessings-1.6.1";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/4e/a7/b4937f0843a5c034408265551127993b3b67a8450ecce259da16bb9c5c7d/blessings-1.6.1.tar.gz"; sha256 = "74919575885552e14bc24a68f8b539690bd1b5629180faa830b1a25b8c7fb6ea"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/erikrose/blessings";
        license = licenses.mit;
        description = "A thin, practical wrapper around terminal coloring, styling, and positioning";
      };
    };

    "click" = python.mkDerivation {
      name = "click-6.7";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/95/d9/c3336b6b5711c3ab9d1d3a80f1a3e2afeb9d8c02a7166462f6cc96570897/click-6.7.tar.gz"; sha256 = "f15516df478d5a56180fbf80e68f206010e6d160fc39fa508b65e035fd75130b"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://github.com/mitsuhiko/click";
        license = licenses.bsdOriginal;
        description = "A simple wrapper around optparse for powerful command line utilities.";
      };
    };

    "docutils" = python.mkDerivation {
      name = "docutils-0.14";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/84/f4/5771e41fdf52aabebbadecc9381d11dea0fa34e4759b4071244fa094804c/docutils-0.14.tar.gz"; sha256 = "51e64ef2ebfb29cae1faa133b3710143496eca21c530f3f71424d77687764274"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://docutils.sourceforge.net/";
        license = licenses.publicDomain;
        description = "Docutils -- Python Documentation Utilities";
      };
    };

    "enum-compat" = python.mkDerivation {
      name = "enum-compat-0.0.2";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/95/6e/26bdcba28b66126f66cf3e4cd03bcd63f7ae330d29ee68b1f6b623550bfa/enum-compat-0.0.2.tar.gz"; sha256 = "939ceff18186a5762ae4db9fa7bfe017edbd03b66526b798dd8245394c8a4192"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/jstasiak/enum-compat";
        license = licenses.mit;
        description = "enum/enum34 compatibility package";
      };
    };

    "flake8" = python.mkDerivation {
      name = "flake8-3.5.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/1e/ab/7730f6d6cdf73a3b7f98a2fe3b2cdf68e9e760a4a133e083607497d4c3a6/flake8-3.5.0.tar.gz"; sha256 = "7253265f7abd8b313e3892944044a365e3f4ac3fcdcfb4298f55ee9ddf188ba0"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."mccabe"
      self."pycodestyle"
      self."pyflakes"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://gitlab.com/pycqa/flake8";
        license = licenses.mit;
        description = "the modular source code checker: pep8, pyflakes and co";
      };
    };

    "flake8-SQL" = python.mkDerivation {
      name = "flake8-SQL-0.2.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/48/da/0ff11f1e3460aa586981316ac388101f2dc979acbba46cf168ceed4852ee/flake8-SQL-0.2.0.tar.gz"; sha256 = "e6e970516b0c07932f291edfc9e8b0e4c66c88258370084c1beb10280b62dd85"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."flake8"
      self."sqlparse"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/pgjones/flake8-sql";
        license = licenses.mit;
        description = "Flake8 plugin that checks SQL code against opinionated style rules";
      };
    };

    "flake8-author" = python.mkDerivation {
      name = "flake8-author-1.1.4";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/c2/f6/df6eb452ef0123513100a6629e7e334c964029d4bcbc8d3a57ff8d1e34dc/flake8-author-1.1.4.tar.gz"; sha256 = "843b78805d60c9b2e9ba17f3950ff44b734967fbcffa25c0a1db0940a3ecedc4"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."flake8"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/jparise/flake8-author";
        license = licenses.mit;
        description = "Flake8 __author__ checker";
      };
    };

    "flake8-blind-except" = python.mkDerivation {
      name = "flake8-blind-except-0.1.1";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/ff/f2/ab635e6e420e78c94eab50cd3f53abd3ec27e411793e50b14f29edbb9f0b/flake8-blind-except-0.1.1.tar.gz"; sha256 = "aca3356633825544cec51997260fe31a8f24a1a2795ce8e81696b9916745e599"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/elijahandrews/flake8-blind-except";
        license = licenses.mit;
        description = "A flake8 extension that checks for blind except: statements";
      };
    };

    "flake8-bugbear" = python.mkDerivation {
      name = "flake8-bugbear-17.12.0";
      src = pkgs.fetchurl { url = "https://github.com/garbas/flake8-bugbear/archive/ebeb142d225ba9476dd22b7c4a6b9b186b5a5fa9.zip"; sha256 = "9a3188dfc9831e54645dd715e0d94eb763e33ba2c38de8fc355e3b88861b6097"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."attrs"
      self."flake8"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/PyCQA/flake8-bugbear";
        license = licenses.mit;
        description = "A plugin for flake8 finding likely bugs and design problems in your program. Contains warnings that don't belong in pyflakes and pycodestyle.";
      };
    };

    "flake8-builtins" = python.mkDerivation {
      name = "flake8-builtins-1.0.post0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/42/7b/432102cff8ad6601a9f66d9a4529262a2d892c7a95d53dcddf318a5d6231/flake8-builtins-1.0.post0.tar.gz"; sha256 = "a48ac06ae46ddd4a8b510c862c263f923f250866e06ff235a8c72603170914d3"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."flake8"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/gforcada/flake8-builtins";
        license = licenses.gpl2;
        description = "Check for python builtins being used as variables or parameters.";
      };
    };

    "flake8-chart" = python.mkDerivation {
      name = "flake8-chart-0.1.5";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/32/5e/4098414a885b9986743c1d4536a6a3f2f2b657d3aa2fae345a313d4784e8/flake8-chart-0.1.5.tar.gz"; sha256 = "d2cac8ead63212d76a3d8530c9277649e1225f75adc6727e53a4c7888a774855"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."click"
      self."pygal"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/microamp/flake8-chart";
        license = licenses.mit;
        description = "flake8 stats visualised";
      };
    };

    "flake8-codeclimate" = python.mkDerivation {
      name = "flake8-codeclimate-0.1.3";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/f6/83/fbe2cd6f33fc2f9e5512002c93b214bd4a69fec225ae0dcaa7677863f9d3/flake8_codeclimate-0.1.3.tar.gz"; sha256 = "fd4edbfbebd307547517d9b76362a2fef7fdd20f8b86e7f9853ba537cdd4f203"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."flake8"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/bennylope/flake8-codeclimate";
        license = licenses.mit;
        description = "Code Climate reporting formatter plugin for Flake8";
      };
    };

    "flake8-coding" = python.mkDerivation {
      name = "flake8-coding-1.3.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/ae/26/3c6304d646f8ee27d6c40bfcd9874fea870098c3ef3cf60e284ea9db29ef/flake8-coding-1.3.0.tar.gz"; sha256 = "ba01e96f879377766a3d71f3499a832b19386ce4831270bfe671ab57d0fe50be"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."flake8"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/tk0miya/flake8-coding";
        license = licenses.asl20;
        description = "Adds coding magic comment checks to flake8";
      };
    };

    "flake8-colors" = python.mkDerivation {
      name = "flake8-colors-0.1.6";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/04/62/1afebe73ea28b363c80aab892298c83f510c65ae079c2c8129f0ea50db46/flake8-colors-0.1.6.tar.gz"; sha256 = "508fcf6efc15826f2146b42172ab41999555e07af43fcfb3e6a28ad596189560"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."flake8"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/and3rson/flake8-colors";
        license = licenses.mit;
        description = "Error highlight plugin for Flake8.";
      };
    };

    "flake8-commas" = python.mkDerivation {
      name = "flake8-commas-1.0.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/38/e5/b6857cef9ad8eef19143c944bec6262ba182b0325d23c81dd02ee434624a/flake8-commas-1.0.0.tar.gz"; sha256 = "d7665140e18fd0325e7f22e6e0c909c7420efca53600b6c579dbddd329a7ff72"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."flake8"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/flake8-commas/flake8-commas/";
        license = licenses.mit;
        description = "Flake8 lint for trailing commas.";
      };
    };

    "flake8-comprehensions" = python.mkDerivation {
      name = "flake8-comprehensions-1.4.1";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/34/07/cd53c9ae3275f5f52c5ec196b36b3cd5a71e943b199cef18ffaaf4761338/flake8-comprehensions-1.4.1.tar.gz"; sha256 = "b83891fec0e680b07aa1fd92e53eb6993be29a0f3673a09badbe8da307c445e0"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."flake8"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/adamchainz/flake8-comprehensions";
        license = licenses.isc;
        description = "A flake8 plugin to help you write better list/set/dict comprehensions.";
      };
    };

    "flake8-config-4catalyzer" = python.mkDerivation {
      name = "flake8-config-4catalyzer-0.2.1";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/4c/89/1ecac58d3dd70cafb2ea6d5d8253cfffc353ed075762ae3ab846952b73e8/flake8-config-4catalyzer-0.2.1.tar.gz"; sha256 = "477a1ab793cfdfd01a0572793e50c125966c6426ee948c7f34c5a6cc6de0b6c7"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."flake8"
      self."flake8-bugbear"
      self."flake8-commas"
      self."flake8-import-order"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/4Catalyzer/python/tree/packages/flake8-config-4catalyzer";
        license = licenses.mit;
        description = "UNKNOWN";
      };
    };

    "flake8-copyright" = python.mkDerivation {
      name = "flake8-copyright-0.2.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/3a/22/2973cbdfd5c2df98bbd1b187c19c438653ffa75ea2ed1b0e610b344d70b6/flake8-copyright-0.2.0.tar.gz"; sha256 = "aeef26eb4d5223c9cd5b101e68175fcef6d2b353bf36da688fdde62fccfe2b73"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/savoirfairelinux/flake8-copyright";
        license = "";
        description = "Adds copyright checks to flake8";
      };
    };

    "flake8-debugger" = python.mkDerivation {
      name = "flake8-debugger-3.0.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/2c/a7/45823a26ef0c5fa7a0c099b772a5b6aa2d8e686284490ef738fc8691ffc0/flake8-debugger-3.0.0.tar.gz"; sha256 = "e5c8ac980d819db2f3fbb89fe0e43a2fe6c127edd6ce4984a3f7e0bbdac3d2d4"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."flake8"
      self."pycodestyle"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/jbkahn/flake8-debugger";
        license = licenses.mit;
        description = "ipdb/pdb statement checker plugin for flake8";
      };
    };

    "flake8-deprecated" = python.mkDerivation {
      name = "flake8-deprecated-1.3";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/28/28/d39539c84cfb432d7431255ed16f93125342ced4a137d653b50b621fae36/flake8-deprecated-1.3.tar.gz"; sha256 = "9fa5a0c5c81fb3b34c53a0e4f16cd3f0a3395078cfd4988011cbab5fb0afa7f7"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."flake8"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/gforcada/flake8-deprecated";
        license = licenses.gpl2;
        description = "Warns about deprecated method calls.";
      };
    };

    "flake8-diff" = python.mkDerivation {
      name = "flake8-diff-0.2.2";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/cc/88/2d9e5d91c4ea3ba39c82b4c28a63d1fd7afeed8e5db414d7d3f2bc21f83a/flake8-diff-0.2.2.tar.gz"; sha256 = "85ad05ea1de0f57955241f19a86c71f36ee4b53f91efc8a089c38f3838c4d073"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."argparse"
      self."blessings"
      self."flake8"
      self."six"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://dealertrack.github.io";
        license = "";
        description = "Run flake8 across a set of changed files and filter out violations occurring only on the lines that were changed.";
      };
    };

    "flake8-docstrings" = python.mkDerivation {
      name = "flake8-docstrings-1.3.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/a5/8c/93d397e26d732ff4978b0c1568bd9ef02f0ef7aac5763ec5c9b25ed252f5/flake8-docstrings-1.3.0.tar.gz"; sha256 = "4e0ce1476b64e6291520e5570cf12b05016dd4e8ae454b8a8a9a48bc5f84e1cd"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."flake8"
      self."flake8-polyfill"
      self."pydocstyle"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://gitlab.com/pycqa/flake8-docstrings";
        license = licenses.mit;
        description = "Extension for flake8 which uses pydocstyle to check docstrings";
      };
    };

    "flake8-double-quotes" = python.mkDerivation {
      name = "flake8-double-quotes-0.0.1";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/8a/2d/12e74c3505cea190cade9bd8b553fb1b684e4dcd47402afa3e727df050b7/flake8-double-quotes-0.0.1.tar.gz"; sha256 = "529e1d01a732f3db9666c59b11a49ed03709d5d20b92f2b8006aae5fa58a18bc"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://github.com/yandex-sysmon/flake8-double-quotes/";
        license = licenses.mit;
        description = "Flake8 lint to forbide single quotes.";
      };
    };

    "flake8-doubles" = python.mkDerivation {
      name = "flake8-doubles-0.3";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/72/20/aa8446c26644e895e237a82c37977ba3d207d4c324a6584476dbc519a527/flake8_doubles-0.3.tar.gz"; sha256 = "bcd5b060ba98617cdad5e26d5bd203c619415ce96402b1c89b066ea36c6e701f"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/jiazou/flake8-doubles";
        license = licenses.mit;
        description = "flake8 doubles checker, ensures mock.patch is not used";
      };
    };

    "flake8-exact-pin" = python.mkDerivation {
      name = "flake8-exact-pin-0.0.1";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/bd/bb/1a86841c7cc990f0fb3ae7adddbca84d7f02b1e8ec48dc03ba97c72f7c43/flake8-exact-pin-0.0.1.tar.gz"; sha256 = "535efe39271408d745e9a54ac45c2449746419c44199f3507e84b6ac3f2d217d"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/msabramo/flake8-exact-pin";
        license = licenses.mit;
        description = "A flake8 extension that checks for exact pins (e.q.: `foo==1.5.6`) in setup.py";
      };
    };

    "flake8-format-ansi" = python.mkDerivation {
      name = "flake8-format-ansi-0.1.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/c9/c4/4f4685d4de9018515415ef01eea42ab7f8ec636b346f70cae7b28aba6c63/flake8-format-ansi-0.1.0.tar.gz"; sha256 = "2bac754c96ddd6b7c9229ae39c940b8259229294df4f7b32b7320133b96de6b3"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."flake8"
      self."pep8"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/jayvdb/flake8-format-ansi";
        license = licenses.mit;
        description = "ANSI error format plugin for flake8.";
      };
    };

    "flake8-formatter-abspath" = python.mkDerivation {
      name = "flake8-formatter-abspath-1.0.1";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/f1/8a/5e8820f3f7c7dc93a81e384538e42a6a6ec2a2248548ba37e2ea3169fd01/flake8_formatter_abspath-1.0.1.tar.gz"; sha256 = "694d0874d5d047ed57c82a10213f75604475e4525ee8bbaad53417a7d6f8442c"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."flake8"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/jarshwah/flake8_formatter_abspath";
        license = licenses.mit;
        description = "A flake8 formatter plugin that shows the absolute path of files with warnings";
      };
    };

    "flake8-future" = python.mkDerivation {
      name = "flake8-future-0.2";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/32/73/ae5de8c5baa0b3a71b70a5b7ff073eabeddb674513fa8892f26648a5849c/flake8-future-0.2.tar.gz"; sha256 = "e9d8cf06cc821e12c2ac4a732ed21981f722b96a44ae8adc7bb23d566f6a01b0"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/kmaglione/flake8-future";
        license = licenses.mit;
        description = "A flake8 plugin to warn when any file is missing certain __future__ imports.";
      };
    };

    "flake8-future-import" = python.mkDerivation {
      name = "flake8-future-import-0.4.3";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/08/53/48d40982c17f0b97013c2525f99f68844969d57322d3693b113e720daf98/flake8-future-import-0.4.3.tar.gz"; sha256 = "a477335324172a0de9c4f91a00d2fcba2fe4063ef65fea2101025a878b3ff404"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."flake8"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/xZise/flake8-future-import";
        license = licenses.mit;
        description = "__future__ import checker, plugin for flake8";
      };
    };

    "flake8-graphql" = python.mkDerivation {
      name = "flake8-graphql-0.2.5";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/76/ba/e995fadadc62e9903b45a55370d6600c28a27a98c0222e462d9d8ec44653/flake8-graphql-0.2.5.tar.gz"; sha256 = "cf6ec34469e2dd596cf271aae713de88ea43b88f5ab4defaabdfde7fcaf18af4"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."flake8"
      self."graphql-core"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/michaelaquilina/flake8-graphql";
        license = licenses.agpl3Plus;
        description = "A flake8 plugin to lint your graphql queries";
      };
    };

    "flake8-html" = python.mkDerivation {
      name = "flake8-html-0.4.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/17/39/fcf915953a274a8c977300178b0ad9fb9f227b49b4a5fc94fc53d9f0e6de/flake8-html-0.4.0.tar.gz"; sha256 = "44bec37f142e97c4a5b2cf10efe24ed253617a9736878851a594d4763011e742"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Jinja2"
      self."Pygments"
      self."flake8"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/lordmauve/flake8-html";
        license = "License :: OSI Approved :: Apache Software License";
        description = "Generate HTML reports of flake8 violations";
      };
    };

    "flake8-immediate" = python.mkDerivation {
      name = "flake8-immediate-0.2";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/cd/19/04735022577f4356d038cabd4b669915e7ce0a651f6312fbf78d616488e9/flake8-immediate-0.2.zip"; sha256 = "edfaae46f0254fb87f6bf247fafde4379ecade0d8efc6a6fb5dbc6371fcbb7bc"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/schlamar/flake8-todo";
        license = licenses.mit;
        description = "Enables immediate output for flake8.";
      };
    };

    "flake8-import-order" = python.mkDerivation {
      name = "flake8-import-order-0.16";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/48/6b/9ba22d22571c7115f263db97b4bcc07ffd147013678b63c35e16236a0c58/flake8-import-order-0.16.tar.gz"; sha256 = "9699e8cf71a0e082a08bc2b08782575abf08292220f1f5ddb4a8bf25674135a7"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."pycodestyle"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/PyCQA/flake8-import-order";
        license = licenses.mit;
        description = "Flake8 and pylama plugin that checks the ordering of import statements.";
      };
    };

    "flake8-import-order-fuzeman" = python.mkDerivation {
      name = "flake8-import-order-fuzeman-1.6.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/35/9c/295dfe77a24f6bf92cce0975760dfaf098944f696891c483e2c0dc848adb/flake8-import-order-fuzeman-1.6.0.tar.gz"; sha256 = "cab84e72b66bfd27f6419cedd3c7a953891b68cae59bd21fecf118409c44d23a"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."flake8-import-order"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/fuzeman/flake8-import-order-fuzeman";
        license = licenses.gpl3Plus;
        description = "@fuzeman's import order style for flake8-import-order";
      };
    };

    "flake8-import-order-spoqa" = python.mkDerivation {
      name = "flake8-import-order-spoqa-1.2.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/14/72/1252b9f9cfb8517b680664eb61e2bbad928065c614176f93b625cb35221e/flake8-import-order-spoqa-1.2.0.tar.gz"; sha256 = "fc6d0d721c08281d76cb08759c78feb7dc0602fbf740badf71dcd77381443c8c"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."flake8-import-order"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/spoqa/flake8-import-order-spoqa";
        license = licenses.gpl3Plus;
        description = "Spoqa's import order style for flake8-import-order";
      };
    };

    "flake8-imports" = python.mkDerivation {
      name = "flake8-imports-0.1.1";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/13/af/146bd05248c1d0f0f5fb3e7070c651c4e1d970cd4eff6a71f43e9b09698b/flake8_imports-0.1.1.tar.gz"; sha256 = "d310f1bd3165aff08c565013e5c24aa4f4d50600280cec95e8eb8feb8e3c6bd4"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."flake8"
      self."isort"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://gitlab.com/mvantellingen/flake8-imports";
        license = licenses.mit;
        description = "isort extension flake8";
      };
    };

    "flake8-isort" = python.mkDerivation {
      name = "flake8-isort-2.3";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/6e/30/b00b68f34c9b9b22b89e2c1a82f8aab75e0f16f12ae2770912f52ab71624/flake8-isort-2.3.tar.gz"; sha256 = "6a5716ddf5575b5623f3e124f5662982d33fc9f4f5abda97d490cbcc8936ce33"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."flake8"
      self."flake8-polyfill"
      self."isort"
      self."testfixtures"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/gforcada/flake8-isort";
        license = licenses.gpl2;
        description = "flake8 plugin that integrates isort .";
      };
    };

    "flake8-junit-report" = python.mkDerivation {
      name = "flake8-junit-report-2.1.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/e4/66/582e8622db2bdff48d1236963ac66b2b3ab510b133a2213f4a9c19a19f2c/flake8-junit-report-2.1.0.tar.gz"; sha256 = "f8890c1ebe0acb516fefacddec4b802bca9f89bb07db933e4ee3cd11ceaa1e8b"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/initios/flake8-junit-report";
        license = licenses.bsdOriginal;
        description = "Simple tool that converts a flake8 file to junit format";
      };
    };

    "flake8-libfaketime" = python.mkDerivation {
      name = "flake8-libfaketime-1.1";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/33/ce/37e294a6e3ef637a21afba905e2cb999bd78c0c54e0b716a5e13d4cb422b/flake8-libfaketime-1.1.tar.gz"; sha256 = "e0658bfbee0fb7b559cfab1fdc976ded5d09ccdd07473fcd907f809ac9953c12"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."flake8"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/vikingco/flake8-libfaketime";
        license = licenses.mit;
        description = "libfaketime checker plugin for flake8";
      };
    };

    "flake8-logging-format" = python.mkDerivation {
      name = "flake8-logging-format-0.3.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/56/7d/b7229ddd1c0222edbe8f05e8f3a407b5e942b186ba36b382bf078fcfc59a/flake8-logging-format-0.3.0.tar.gz"; sha256 = "6ef2273a22b2b7ae088ab6bf7dfdc12e91688472aa965ab29af80d0d26787a36"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/globality-corp/flake8-logging-format";
        license = "";
        description = "Flake8 extension to validate (lack of) logging format strings";
      };
    };

    "flake8-meiqia" = python.mkDerivation {
      name = "flake8-meiqia-0.2.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/6c/37/e4d1047f1c607e98fa3c355fbb72e0806725e07396d1f5d969341ce3ff4c/flake8-meiqia-0.2.0.tar.gz"; sha256 = "9b344acb50f04f22a87ebaa0e54b18361056effaf2fc87f6bd9dfb6de84b65f8"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."flake8"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/Meiqia/flake8-meiqia";
        license = licenses.asl20;
        description = "Python style guideline in Meiqia";
      };
    };

    "flake8-mock" = python.mkDerivation {
      name = "flake8-mock-0.3";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/00/b8/af88a8c6e37858d28700e6e51dc93d10f5deaca317f135b77f6db3bdb6b8/flake8-mock-0.3.tar.gz"; sha256 = "2fa775e7589f4e1ad74f35d60953eb20937f5d7355235e54bf852c6837f2bede"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/aleGpereira/flake8-mock";
        license = licenses.gpl2;
        description = "Provides checking for non-existent mock methods";
      };
    };

    "flake8-module-imports" = python.mkDerivation {
      name = "flake8-module-imports-1.1";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/d0/6d/e6565d7c5732b00f40f6d055e9d84d311dcea677710b49f4a125e9d15fb2/flake8-module-imports-1.1.tar.gz"; sha256 = "984088d74ffc8a2b56751ddb74f5185c5eddfaf3ae6224c2382be8c890b15f99"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."flake8"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/unleashed/flake8-module-imports";
        license = licenses.mit;
        description = "module-level import checker plugin for flake8";
      };
    };

    "flake8-mutable" = python.mkDerivation {
      name = "flake8-mutable-1.2.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/97/6a/0fd1d903848fe043c7b6e5283d9def56425754098e69d7683a3ccbbea345/flake8-mutable-1.2.0.tar.gz"; sha256 = "ee9b77111b867d845177bbc289d87d541445ffcc6029a0c5c65865b42b18c6a6"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."flake8"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/ebeweber/flake8-mutable";
        license = licenses.mit;
        description = "mutable defaults flake8 extension";
      };
    };

    "flake8-mypy" = python.mkDerivation {
      name = "flake8-mypy-17.8.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/97/9a/cddd1363d7314bb4eb452089c6fb3092ed9fda9f3350683d1978522a30ec/flake8-mypy-17.8.0.tar.gz"; sha256 = "47120db63aff631ee1f84bac6fe8e64731dc66da3efc1c51f85e15ade4a3ba18"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."attrs"
      self."flake8"
      self."mypy"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/ambv/flake8-mypy";
        license = licenses.mit;
        description = "A plugin for flake8 integrating mypy.";
      };
    };

    "flake8-network-timeout" = python.mkDerivation {
      name = "flake8-network-timeout-0.2.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/0d/42/f32f58e9360eae1bb6167e9a0e2c3ab518abf4bfe190064bef3d5d86da59/flake8-network-timeout-0.2.0.tar.gz"; sha256 = "9e9bc65a35131b0342ee900157ec8676a227be079fef6323896e7e2bac24f9c1"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."flake8"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://gitlab.com/messense/flake8-network-timeout";
        license = licenses.mit;
        description = "our extension to flake8";
      };
    };

    "flake8-ownership" = python.mkDerivation {
      name = "flake8-ownership-1.1.1";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/bf/28/dfa5aeffd57856e81f59169eb36d426b41322ae4e4d5e40b34a3cdc50423/flake8-ownership-1.1.1.tar.gz"; sha256 = "608db36fb4395afed91ddb5d358b5a1fabcb0fe55ac9214c30808374aece1d88"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."flake8"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://flake8-ownership.readthedocs.io";
        license = licenses.bsdOriginal;
        description = "A flake8 checker for assuring that author, copyright, and license are specified in source files.";
      };
    };

    "flake8-pep257" = python.mkDerivation {
      name = "flake8-pep257-1.0.5";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/9d/2b/098f28b14f8280b0be30aabb51762e71429c348c76aa50c24244aa2f7260/flake8-pep257-1.0.5.tar.gz"; sha256 = "18622f1f2f3d19e878d3fa46e0204aabee084abdbc07cd14fcc0f98974505191"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."flake8"
      self."pep257"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/Robpol86/flake8-pep257";
        license = licenses.mit;
        description = "Flake8 plugin for the pep257 Python utility.";
      };
    };

    "flake8-pep3101" = python.mkDerivation {
      name = "flake8-pep3101-1.2";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/e0/33/81b41107d839745df4e10576e1273d8f112f2990dccaebd2ea5e88e43561/flake8-pep3101-1.2.tar.gz"; sha256 = "1ba98a8a6d89ce54645d967fa831503f4b020558736563178a2ea48b72e000d8"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."flake8"
      self."testfixtures"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/gforcada/flake8-pep3101";
        license = licenses.gpl2;
        description = "Checks for old string formatting.";
      };
    };

    "flake8-plone-api" = python.mkDerivation {
      name = "flake8-plone-api-1.4";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/69/63/2855e8ec58991c49b8211ce6d4d4d8df969c93698ed914dbd27d6a5a1d46/flake8-plone-api-1.4.tar.gz"; sha256 = "cadba99badb6e07d8a0e623f0c53d5e8500b5a30cea63822fbebf68153c2dcf6"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."flake8"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/gforcada/flake8-plone-api";
        license = licenses.gpl2;
        description = "Checks for code usages that can be replaced with Plone API method calls.";
      };
    };

    "flake8-plone-hasattr" = python.mkDerivation {
      name = "flake8-plone-hasattr-0.2.post0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/db/d4/63e659daf3b6d08854b7a6cd1d90743fe610cf33c4302ab0484d88ce2c49/flake8-plone-hasattr-0.2.post0.tar.gz"; sha256 = "f72ef91a47de847f80749a3668aad89fb23f0e6dcf93a1100b0e909b9e378ec6"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."flake8"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/gforcada/flake8-plone-hasattr";
        license = licenses.gpl2;
        description = "Checks for hasattr, which is considered harmful in Plone projects.";
      };
    };

    "flake8-polyfill" = python.mkDerivation {
      name = "flake8-polyfill-1.0.2";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/e6/67/1c26634a770db5c442e361311bee73cb3a177adb2eb3f7af8953cfd9f553/flake8-polyfill-1.0.2.tar.gz"; sha256 = "e44b087597f6da52ec6393a709e7108b2905317d0c0b744cdca6208e670d8eda"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."flake8"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://gitlab.com/pycqa/flake8-polyfill";
        license = licenses.mit;
        description = "Polyfill package for Flake8 plugins";
      };
    };

    "flake8-print" = python.mkDerivation {
      name = "flake8-print-3.0.1";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/e6/78/2fe5d8aec4feed46957a043fe7eb9b08af39db597674494c80ed164720bf/flake8-print-3.0.1.tar.gz"; sha256 = "255b01f0932f65fb8ce70a65f0f2abb4a05faf25f9fe53275cd13cacdc0179f5"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."flake8"
      self."pycodestyle"
      self."six"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/jbkahn/flake8-print";
        license = licenses.mit;
        description = "print statement checker plugin for flake8";
      };
    };

    "flake8-pyi" = python.mkDerivation {
      name = "flake8-pyi-17.3.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/6e/a6/fef6c08c62c90438a92b2ec64669d72d19f55414518c12f6b5936c011cd7/flake8-pyi-17.3.0.tar.gz"; sha256 = "cf00cb3168711c61f7cbaddd9ec03e4f51a9bf206edcb5cb4e45bb0105237890"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."attrs"
      self."flake8"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/ambv/flake8-pyi";
        license = licenses.mit;
        description = "A plugin for flake8 to enable linting .pyi files.";
      };
    };

    "flake8-pytest" = python.mkDerivation {
      name = "flake8-pytest-1.3";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/8b/2a/f60e143ebdce0475969c5834cc29e6452e2c31e6d57ee75722d6d8594886/flake8-pytest-1.3.tar.gz"; sha256 = "b4d6703f7d7b646af1e2660809e795886dd349df11843613dbe6515efa82c0f3"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."flake8"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/vikingco/flake8-pytest";
        license = licenses.mit;
        description = "pytest assert checker plugin for flake8";
      };
    };

    "flake8-quotes" = python.mkDerivation {
      name = "flake8-quotes-0.13.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/46/c7/43f042f47b65bf1006fee98fb21938d55cee720d43c7373e063c3664fae2/flake8-quotes-0.13.0.tar.gz"; sha256 = "2a1998616c6a962793b24f05b6bd45528c771a167bc402110231c3fbee64454b"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."flake8"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://github.com/zheller/flake8-quotes/";
        license = licenses.mit;
        description = "Flake8 lint for quotes.";
      };
    };

    "flake8-quotes2" = python.mkDerivation {
      name = "flake8-quotes2-0.0.1";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/65/e3/acb7cebe98dafe5e51838067032e077bace66701bffa402516a5afde4cc4/flake8-quotes2-0.0.1.tar.gz"; sha256 = "a8310d05bb3f3afa4479833cb4405af8b227f977c85702e787b366753d9e12fb"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/txomon/flake8-quotes";
        license = licenses.mit;
        description = "flake8 plugin for string quotes checking";
      };
    };

    "flake8-regex" = python.mkDerivation {
      name = "flake8-regex-0.3";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/6a/9f/77394c31f7c51f07c78b0a2b2fad5b348775ce49d95e2e531d201d26d732/flake8-regex-0.3.tar.gz"; sha256 = "812e6f9cfc66f3b8ad2bbb93ec0dede2043a16b5f5d04dc1c8f8e3590c7e67bd"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/aristiden7o/flake8-regex";
        license = licenses.gpl2;
        description = "Arbitrary regex checker, extension for flake8";
      };
    };

    "flake8-respect-noqa" = python.mkDerivation {
      name = "flake8-respect-noqa-0.3";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/ba/9f/54dabf385b001efa474eef5cbdf074ae4dcc75eeb878b68f7edf3a386489/flake8-respect-noqa-0.3.tar.gz"; sha256 = "ab4acba81f02a1147ce1b3d51c27ad86a5e313667b56bcaa720c801118d00b58"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."flake8"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/spookylukey/flake8-respect-noqa";
        license = licenses.mit;
        description = "Always ignore #noqa lines with flake8.";
      };
    };

    "flake8-rst-docstrings" = python.mkDerivation {
      name = "flake8-rst-docstrings-0.0.8";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/99/2f/38b97b21dc9efc9540620a7d9e76eceeb9f09953dbf05e4caa7d2f721fcb/flake8-rst-docstrings-0.0.8.tar.gz"; sha256 = "3a5b92b40e87006f8e95bfc5082577414cd387ca24def37ecf1fcd9b3ce7273c"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."flake8"
      self."restructuredtext-lint"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/peterjc/flake8-rst-docstrings";
        license = licenses.mit;
        description = "Python docstring reStructuredText (RST) validator";
      };
    };

    "flake8-snippets" = python.mkDerivation {
      name = "flake8-snippets-0.2";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/c1/0c/bc119ffe4bce7d98fc9ff6e716f29af862235cf3450c345fc51127199eef/flake8-snippets-0.2.tar.gz"; sha256 = "6b9c3e041045b0c22f65fbeb92b9dff31d523797279eada6183cdc9928de6b3f"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."flake8"
      self."flake8-polyfill"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/bitmazk/flake8-snippets";
        license = licenses.mit;
        description = "A flake8 extension to find any code snippets you don't like";
      };
    };

    "flake8-sorted-keys" = python.mkDerivation {
      name = "flake8-sorted-keys-0.2.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/54/a3/f1c5b92be4c41be1d2edd445b47e8ed94c4619cf20519fdff7b8b76618d7/flake8_sorted_keys-0.2.0.tar.gz"; sha256 = "ea61bbd84acca2d86c344eec7700e58e3057a4ccdbb5fab670fbecae2386c3a2"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."flake8"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://gitlab.com/yevhen-m/flake8-sorted-keys";
        license = licenses.mit;
        description = "check keys are sorted in dict literals";
      };
    };

    "flake8-strict" = python.mkDerivation {
      name = "flake8-strict-0.1.9";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/88/fd/070c73bec6eb9a58579e932974a6dacc68e613aedeae46c954d4419c1edd/flake8_strict-0.1.9.tar.gz"; sha256 = "b9a87603e9e5afaee5ceb4d53638f74c87a46e581377dd49552c1666abe78fda"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."enum-compat"
      self."flake8"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/smarkets/flake8-strict";
        license = licenses.mit;
        description = "Flake8 plugin that checks Python code against a set of opinionated style rules";
      };
    };

    "flake8-string-format" = python.mkDerivation {
      name = "flake8-string-format-0.2.3";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/df/1f/a16f1a1a0b3abf067c56ac7261fd167820bc612f3345eea20a9d57d60e6f/flake8-string-format-0.2.3.tar.gz"; sha256 = "774d56103d9242ed968897455ef49b7d6de272000cfa83de5814273a868832f1"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."flake8"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/xZise/flake8-string-format";
        license = licenses.mit;
        description = "string format checker, plugin for flake8";
      };
    };

    "flake8-tidy-imports" = python.mkDerivation {
      name = "flake8-tidy-imports-1.1.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/ff/02/5590270951676129a71088250b357f74acb72c939233e43099b472923a79/flake8-tidy-imports-1.1.0.tar.gz"; sha256 = "5fc28c82bba16abb4f1154dc59a90487f5491fbdb27e658cbee241e8fddc1b91"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."flake8"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/adamchainz/flake8-tidy-imports";
        license = licenses.isc;
        description = "A flake8 plugin that helps you write tidier imports.";
      };
    };

    "flake8-todo" = python.mkDerivation {
      name = "flake8-todo-0.7";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/97/44/4ddfdb3cf642d51858d81472b71e77fd4fb409699f4e9072faf5ae3b4cf9/flake8-todo-0.7.tar.gz"; sha256 = "6e4c5491ff838c06fe5a771b0e95ee15fc005ca57196011011280fc834a85915"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."pycodestyle"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/schlamar/flake8-todo";
        license = licenses.mit;
        description = "TODO notes checker, plugin for flake8";
      };
    };

    "flake8-trailing-commas" = python.mkDerivation {
      name = "flake8-trailing-commas-0.1.3";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/20/3e/af3a36218ac26e0c34d620a59b852a4fbd2897c87ec8c87a56c0f692d534/flake8-trailing-commas-0.1.3.tar.gz"; sha256 = "e49119adf9b62a1a123a9b4b16ca56544df449998667c6c71db65c00d6c37493"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."pep8"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/graingert/flake8-trailing-commas/";
        license = licenses.mit;
        description = "Flake8 lint for trailing commas.";
      };
    };

    "flake8-translation-activate" = python.mkDerivation {
      name = "flake8-translation-activate-1.0.2";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/92/2f/7ca179815e0bb40d38938d9e7d5d8cba03145ebea4675fef2a6610379f3a/flake8-translation-activate-1.0.2.tar.gz"; sha256 = "0b3cbfc3efe83a431415f05b4db64ffee142805a6c7b2dc2d3ccab5b01850407"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."flake8"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/unleashed/flake8-translation-activate";
        license = licenses.mit;
        description = "translation activate plugin for flake8";
      };
    };

    "flake8-truveris" = python.mkDerivation {
      name = "flake8-truveris-0.3.4";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/5b/dd/6e998806c2faa4e122ff61200228dc11161a8f1825ea12a5fc3b64f80731/flake8_truveris-0.3.4.tar.gz"; sha256 = "6a597f05bac40eff41db328be802d3a8cb64a85f0bc40302e0f808a50003b887"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."flake8"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://github.com/truveris/flake8-truveris";
        license = licenses.mit;
        description = "Flake8 extension for checking Python code against Truveris's code style guide";
      };
    };

    "flake8-tuple" = python.mkDerivation {
      name = "flake8-tuple-0.2.13";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/02/da/1e8d79f2d60d25e0f3f4d62cfe6c570ade30aab7d6b164a2c2b972228915/flake8_tuple-0.2.13.tar.gz"; sha256 = "152f8f750b64e83f8ebd204e02e603028ac30447b19cd9e3b46d344c2c172ca1"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."flake8"
      self."six"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/ar4s/flake8_tuple";
        license = licenses.bsdOriginal;
        description = "Check code for 1 element tuple.";
      };
    };

    "flake8-ugettext-alias" = python.mkDerivation {
      name = "flake8-ugettext-alias-1.1";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/19/91/ffeeac42a8d69e0d25ff3cbfd4811e849e75ac6b7c13e10da56f38945503/flake8-ugettext-alias-1.1.tar.gz"; sha256 = "b0c8d1454fb6f769ce98bae2ff9b9117831e04bccfa6d8405c327000727b5db0"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."flake8"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/unleashed/flake8-ugettext-alias";
        license = licenses.mit;
        description = "ugettext alias checker plugin for flake8";
      };
    };

    "flake8-user-model" = python.mkDerivation {
      name = "flake8-user-model-1.1";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/1b/84/7c7fe0c90c56a2c29d8963ed9984eff3bdf2beb414968a227c8c02ce677f/flake8-user-model-1.1.tar.gz"; sha256 = "5bb6ca76ba9a068a17dd7f196343d064f094e02da17f54044e61d94cf92e9be9"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."flake8"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/unleashed/flake8-user-model";
        license = licenses.mit;
        description = "user model import checker plugin for flake8";
      };
    };

    "graphql-core" = python.mkDerivation {
      name = "graphql-core-2.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/fb/0a/f4a542c11802a309ad70481d260d3610d1af35b97349a138897c6a27dce0/graphql-core-2.0.tar.gz"; sha256 = "4830699be53f9154273fa15726fc8b0c90bc22bbb8fc7c932586503b3cb9330e"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Rx"
      self."promise"
      self."six"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/graphql-python/graphql-core";
        license = licenses.mit;
        description = "GraphQL implementation for Python";
      };
    };

    "isort" = python.mkDerivation {
      name = "isort-4.2.15";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/4d/d5/7c8657126a43bcd3b0173e880407f48be4ac91b4957b51303eab744824cf/isort-4.2.15.tar.gz"; sha256 = "79f46172d3a4e2e53e7016e663cc7a8b538bec525c36675fcfd2767df30b3983"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/timothycrosley/isort";
        license = licenses.mit;
        description = "A Python utility / library to sort Python imports.";
      };
    };

    "mccabe" = python.mkDerivation {
      name = "mccabe-0.6.1";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/06/18/fa675aa501e11d6d6ca0ae73a101b2f3571a565e0f7d38e062eec18a91ee/mccabe-0.6.1.tar.gz"; sha256 = "dd8d182285a0fe56bace7f45b5e7d1a6ebcbf524e8f3bd87eb0f125271b8831f"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/pycqa/mccabe";
        license = licenses.mit;
        description = "McCabe checker, plugin for flake8";
      };
    };

    "mypy" = python.mkDerivation {
      name = "mypy-0.560";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/57/0f/fae85c5463af67bb6384af2747f2441090b1ff886cd29b68080f60e7a8ea/mypy-0.560.tar.gz"; sha256 = "bd0c9a2fcf0c4f7a54a2b625f466fcc000d415f371298d96fa5d2acc69074aca"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."psutil"
      self."typed-ast"
      self."typing"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://www.mypy-lang.org/";
        license = licenses.mit;
        description = "Optional static typing for Python";
      };
    };

    "pep257" = python.mkDerivation {
      name = "pep257-0.7.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/03/37/872af099c9864f7584bad9a561f6493d5d5eca9fc2b14c7d32407c90c639/pep257-0.7.0.tar.gz"; sha256 = "f3d67547f5617a9cfeb4b8097ed94a954888315defaf6e9b518ff1719363bf03"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/GreenSteam/pep257/";
        license = licenses.mit;
        description = "Python docstring style checker";
      };
    };

    "pep8" = python.mkDerivation {
      name = "pep8-1.7.1";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/01/a0/64ba19519db49e4094d82599412a9660dee8c26a7addbbb1bf17927ceefe/pep8-1.7.1.tar.gz"; sha256 = "fe249b52e20498e59e0b5c5256aa52ee99fc295b26ec9eaa85776ffdb9fe6374"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://pep8.readthedocs.org/";
        license = licenses.mit;
        description = "Python style guide checker";
      };
    };

    "promise" = python.mkDerivation {
      name = "promise-2.1";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/e2/23/ff9e53fb9a00f89573646729e04a2c0933e845dcca758113f0281c396cdf/promise-2.1.tar.gz"; sha256 = "95506bac89df7a495e0b8c813fd782dd1ae590decb52f95248e316c6659ca49b"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."six"
      self."typing"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/syrusakbary/promise";
        license = licenses.mit;
        description = "Promises/A+ implementation for Python";
      };
    };

    "psutil" = python.mkDerivation {
      name = "psutil-5.4.3";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/e2/e1/600326635f97fee89bf8426fef14c5c29f4849c79f68fd79f433d8c1bd96/psutil-5.4.3.tar.gz"; sha256 = "e2467e9312c2fa191687b89ff4bc2ad8843be4af6fb4dc95a7cc5f7d7a327b18"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/giampaolo/psutil";
        license = licenses.bsdOriginal;
        description = "Cross-platform lib for process and system monitoring in Python.";
      };
    };

    "pycodestyle" = python.mkDerivation {
      name = "pycodestyle-2.3.1";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/e1/88/0e2cbf412bd849ea6f1af1f97882add46a374f4ba1d2aea39353609150ad/pycodestyle-2.3.1.tar.gz"; sha256 = "682256a5b318149ca0d2a9185d365d8864a768a28db66a84a2ea946bcc426766"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://pycodestyle.readthedocs.io/";
        license = licenses.mit;
        description = "Python style guide checker";
      };
    };

    "pydocstyle" = python.mkDerivation {
      name = "pydocstyle-2.1.1";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/ca/af/dbd99adec5704de451ae56d08024d7416dead997dedbd6be72cbc86efb08/pydocstyle-2.1.1.tar.gz"; sha256 = "4d5bcde961107873bae621f3d580c3e35a426d3687ffc6f8fb356f6628da5a97"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."six"
      self."snowballstemmer"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/PyCQA/pydocstyle/";
        license = licenses.mit;
        description = "Python docstring style checker";
      };
    };

    "pyflakes" = python.mkDerivation {
      name = "pyflakes-1.6.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/26/85/f6a315cd3c1aa597fb3a04cc7d7dbea5b3cc66ea6bd13dfa0478bf4876e6/pyflakes-1.6.0.tar.gz"; sha256 = "8d616a382f243dbf19b54743f280b80198be0bca3a5396f1d2e1fca6223e8805"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/PyCQA/pyflakes";
        license = licenses.mit;
        description = "passive checker of Python programs";
      };
    };

    "pygal" = python.mkDerivation {
      name = "pygal-2.4.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/14/52/2394f0f8444db3af299f2700aaff22f8cc3741fbd5ed644f782327d356b3/pygal-2.4.0.tar.gz"; sha256 = "9204f05380b02a8a32f9bf99d310b51aa2a932cba5b369f7a4dc3705f0a4ce83"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://pygal.org/";
        license = licenses.lgpl3Plus;
        description = "A python svg graph plotting library";
      };
    };

    "restructuredtext-lint" = python.mkDerivation {
      name = "restructuredtext-lint-1.1.2";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/8e/1e/e7825a6fb88807ccc4fffda3a1805100ae372951af88fd40e3027f0eb1c9/restructuredtext_lint-1.1.2.tar.gz"; sha256 = "9201d354e22c27be61cf6d8212da6e10c875eec7ec8d1bdb1067b2a5ba931637"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."docutils"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/twolfson/restructuredtext-lint";
        license = licenses.publicDomain;
        description = "reStructuredText linter";
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

    "snowballstemmer" = python.mkDerivation {
      name = "snowballstemmer-1.2.1";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/20/6b/d2a7cb176d4d664d94a6debf52cd8dbae1f7203c8e42426daa077051d59c/snowballstemmer-1.2.1.tar.gz"; sha256 = "919f26a68b2c17a7634da993d91339e288964f93c274f1343e3bbbe2096e1128"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/shibukawa/snowball_py";
        license = licenses.bsdOriginal;
        description = "This package provides 16 stemmer algorithms (15 + Poerter English stemmer) generated from Snowball algorithms.";
      };
    };

    "sqlparse" = python.mkDerivation {
      name = "sqlparse-0.2.4";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/79/3c/2ad76ba49f9e3d88d2b58e135b7821d93741856d1fe49970171f73529303/sqlparse-0.2.4.tar.gz"; sha256 = "ce028444cfab83be538752a2ffdb56bc417b7784ff35bb9a3062413717807dec"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/andialbrecht/sqlparse";
        license = licenses.bsdOriginal;
        description = "Non-validating SQL parser";
      };
    };

    "testfixtures" = python.mkDerivation {
      name = "testfixtures-5.3.1";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/0b/15/6042f84f278fceab333bf97cc93c3c5bcb01fb3776e4268ec4c97d6dd0c3/testfixtures-5.3.1.tar.gz"; sha256 = "670ade9410b7132278209e6a2e893caf098b040c4ba4d5ea848367a9c5588728"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/Simplistix/testfixtures";
        license = licenses.mit;
        description = "A collection of helpers and mock objects for unit tests and doc tests.";
      };
    };

    "typed-ast" = python.mkDerivation {
      name = "typed-ast-1.1.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/52/cf/2ebc7d282f026e21eed4987e42e10964a077c13cfc168b42f3573a7f178c/typed-ast-1.1.0.tar.gz"; sha256 = "57fe287f0cdd9ceaf69e7b71a2e94a24b5d268b35df251a88fef5cc241bf73aa"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/python/typed_ast";
        license = licenses.asl20;
        description = "a fork of Python 2 and 3 ast modules with type comment support";
      };
    };

    "typing" = python.mkDerivation {
      name = "typing-3.6.2";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/ca/38/16ba8d542e609997fdcd0214628421c971f8c395084085354b11ff4ac9c3/typing-3.6.2.tar.gz"; sha256 = "d514bd84b284dd3e844f0305ac07511f097e325171f6cc4a20878d11ad771849"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://docs.python.org/3/library/typing.html";
        license = licenses.psfl;
        description = "Type Hints for Python";
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
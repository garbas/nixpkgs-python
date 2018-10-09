# generated using pypi2nix tool (version: 1.8.1)
# See more at: https://github.com/garbas/pypi2nix
#
# COMMAND:
#   pypi2nix -W https://travis.garbas.si/wheels_cache/ -v -V 3 -r requirements.txt -O ../overrides.nix
#

{ pkgs ? import <nixpkgs> {},
  overrides ? ({ pkgs, python }: self: super: {})
}:

let

  inherit (pkgs) makeWrapper;
  inherit (pkgs.stdenv.lib) fix' extends inNixShell;

  pythonPackages =
  import "${toString pkgs.path}/pkgs/top-level/python-packages.nix" {
    inherit pkgs;
    inherit (pkgs) stdenv;
    python = pkgs.python3;
    # patching pip so it does not try to remove files when running nix-shell
    overrides =
      self: super: {
        bootstrapped-pip = super.bootstrapped-pip.overrideDerivation (old: {
          patchPhase = old.patchPhase + ''
            if [ -e $out/${pkgs.python3.sitePackages}/pip/req/req_install.py ]; then
              sed -i \
                -e "s|paths_to_remove.remove(auto_confirm)|#paths_to_remove.remove(auto_confirm)|"  \
                -e "s|self.uninstalled = paths_to_remove|#self.uninstalled = paths_to_remove|"  \
                $out/${pkgs.python3.sitePackages}/pip/req/req_install.py
            fi
          '';
        });
      };
  };

  commonBuildInputs = [];
  commonDoCheck = false;

  withPackages = pkgs':
    let
      pkgs = builtins.removeAttrs pkgs' ["__unfix__"];
      interpreterWithPackages = selectPkgsFn: pythonPackages.buildPythonPackage {
        name = "python3-interpreter";
        buildInputs = [ makeWrapper ] ++ (selectPkgsFn pkgs);
        buildCommand = ''
          mkdir -p $out/bin
          ln -s ${pythonPackages.python.interpreter} \
              $out/bin/${pythonPackages.python.executable}
          for dep in ${builtins.concatStringsSep " "
              (selectPkgsFn pkgs)}; do
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

      interpreter = interpreterWithPackages builtins.attrValues;
    in {
      __old = pythonPackages;
      inherit interpreter;
      inherit interpreterWithPackages;
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
    "Click" = python.mkDerivation {
      name = "Click-7.0";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/f8/5c/f60e9d8a1e77005f664b76ff8aeaee5bc05d0a91798afd7f53fc998dbc47/Click-7.0.tar.gz"; sha256 = "5b94b49521f6456670fdb30cd82a4eca9412788a93fa6dd6df72c94d5a8ff2d7"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://palletsprojects.com/p/click/";
        license = licenses.bsdOriginal;
        description = "Composable command line interface toolkit";
      };
    };

    "Jinja2" = python.mkDerivation {
      name = "Jinja2-2.10";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/56/e6/332789f295cf22308386cf5bbd1f4e00ed11484299c5d7383378cf48ba47/Jinja2-2.10.tar.gz"; sha256 = "f84be1bb0040caca4cea721fcbbbbd61f9be9464ca236387158b0feea01914a4"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
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
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/4d/de/32d741db316d8fdb7680822dd37001ef7a448255de9699ab4bfcbdf4172b/MarkupSafe-1.0.tar.gz"; sha256 = "a6be69091dac236ea9c6bc7d012beab42010fa914c459791d627dad4910eb665"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
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
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/71/2a/2e4e77803a8bd6408a2903340ac498cb0a2181811af7c9ec92cb70b0308a/Pygments-2.2.0.tar.gz"; sha256 = "dbae1046def0efb574852fab9e90209b23f556367b5a320c0bcb871c77c3e8cc"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://pygments.org/";
        license = licenses.bsdOriginal;
        description = "Pygments is a syntax highlighting package written in Python.";
      };
    };

    "Rx" = python.mkDerivation {
      name = "Rx-1.6.1";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/25/d7/9bc30242d9af6a9e9bf65b007c56e17b7dc9c13f86e440b885969b3bbdcf/Rx-1.6.1.tar.gz"; sha256 = "13a1d8d9e252625c173dc795471e614eadfe1cf40ffc684e08b8fff0d9748c23"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://reactivex.io";
        license = "License :: OSI Approved :: Apache Software License";
        description = "Reactive Extensions (Rx) for Python";
      };
    };

    "appdirs" = python.mkDerivation {
      name = "appdirs-1.4.3";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/48/69/d87c60746b393309ca30761f8e2b49473d43450b150cb08f3c6df5c11be5/appdirs-1.4.3.tar.gz"; sha256 = "9e5896d1372858f8dd3344faf4e5014d21849c756c8d5701f78f8a103b372d92"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://github.com/ActiveState/appdirs";
        license = licenses.mit;
        description = "A small Python module for determining appropriate platform-specific dirs, e.g. a \"user data dir\".";
      };
    };

    "argparse" = python.mkDerivation {
      name = "argparse-1.4.0";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/18/dd/e617cfc3f6210ae183374cd9f6a26b20514bbb5a792af97949c5aacddf0f/argparse-1.4.0.tar.gz"; sha256 = "62b089a55be1d8949cd2bc7e0df0bddb9e028faefc8c32038cc84862aefdd6e4"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/ThomasWaldmann/argparse/";
        license = licenses.psfl;
        description = "Python command-line parsing library";
      };
    };

    "attrs" = python.mkDerivation {
      name = "attrs-18.2.0";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/0f/9e/26b1d194aab960063b266170e53c39f73ea0d0d3f5ce23313e0ec8ee9bdf/attrs-18.2.0.tar.gz"; sha256 = "10cbf6e27dbce8c30807caf056c8eb50917e0eaafe86347671b57254006c3e69"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."six"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://www.attrs.org/";
        license = licenses.mit;
        description = "Classes Without Boilerplate";
      };
    };

    "black" = python.mkDerivation {
      name = "black-18.9b0";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/e8/5f/0f79fcd943ba465cbd4bf303c9794970c13a95e5456630de9f72e7f37ad4/black-18.9b0.tar.gz"; sha256 = "e030a9a28f542debc08acceb273f228ac422798e5215ba2a791a6ddeaaca22a5"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Click"
      self."appdirs"
      self."attrs"
      self."toml"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/ambv/black";
        license = licenses.mit;
        description = "The uncompromising code formatter.";
      };
    };

    "blessings" = python.mkDerivation {
      name = "blessings-1.7";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/5c/f8/9f5e69a63a9243448350b44c87fae74588aa634979e6c0c501f26a4f6df7/blessings-1.7.tar.gz"; sha256 = "98e5854d805f50a5b58ac2333411b0482516a8210f23f43308baeb58d77c157d"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."six"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/erikrose/blessings";
        license = licenses.mit;
        description = "A thin, practical wrapper around terminal coloring, styling, and positioning";
      };
    };

    "docutils" = python.mkDerivation {
      name = "docutils-0.14";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/84/f4/5771e41fdf52aabebbadecc9381d11dea0fa34e4759b4071244fa094804c/docutils-0.14.tar.gz"; sha256 = "51e64ef2ebfb29cae1faa133b3710143496eca21c530f3f71424d77687764274"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
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
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/95/6e/26bdcba28b66126f66cf3e4cd03bcd63f7ae330d29ee68b1f6b623550bfa/enum-compat-0.0.2.tar.gz"; sha256 = "939ceff18186a5762ae4db9fa7bfe017edbd03b66526b798dd8245394c8a4192"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/jstasiak/enum-compat";
        license = licenses.mit;
        description = "enum/enum34 compatibility package";
      };
    };

    "filelock" = python.mkDerivation {
      name = "filelock-3.0.9";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/8d/f0/cf5b0a7fbaab64f48667e48f93a56ce3b746d63da276f5efa97ad5d7d822/filelock-3.0.9.tar.gz"; sha256 = "97694f181bdf58f213cca0a7cb556dc7bf90e2f8eb9aa3151260adac56701afb"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/benediktschmitt/py-filelock";
        license = "License";
        description = "A platform independent file lock.";
      };
    };

    "flake8" = python.mkDerivation {
      name = "flake8-3.5.0";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/1e/ab/7730f6d6cdf73a3b7f98a2fe3b2cdf68e9e760a4a133e083607497d4c3a6/flake8-3.5.0.tar.gz"; sha256 = "7253265f7abd8b313e3892944044a365e3f4ac3fcdcfb4298f55ee9ddf188ba0"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
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
      name = "flake8-SQL-0.3.0";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/41/7d/1d9cc003f2d9043802ecfb0d5142c260e4e2396cfcc28070f628c935d169/flake8-SQL-0.3.0.tar.gz"; sha256 = "5c2ff2c45333a104ec52a05f64668839be9484c081ea8a9b4abe215b383cad2c"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
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
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/c2/f6/df6eb452ef0123513100a6629e7e334c964029d4bcbc8d3a57ff8d1e34dc/flake8-author-1.1.4.tar.gz"; sha256 = "843b78805d60c9b2e9ba17f3950ff44b734967fbcffa25c0a1db0940a3ecedc4"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
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
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/ff/f2/ab635e6e420e78c94eab50cd3f53abd3ec27e411793e50b14f29edbb9f0b/flake8-blind-except-0.1.1.tar.gz"; sha256 = "aca3356633825544cec51997260fe31a8f24a1a2795ce8e81696b9916745e599"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
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
      checkPhase = "";
      installCheckPhase = "";
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
      name = "flake8-builtins-1.4.1";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/8e/dd/9b7a1d5e8b455c5029998ae6ad2fba1351b71e635b9cac2f4d86cb2ab629/flake8-builtins-1.4.1.tar.gz"; sha256 = "cd7b1b7fec4905386a3643b59f9ca8e305768da14a49a7efb31fe9364f33cd04"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
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
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/32/5e/4098414a885b9986743c1d4536a6a3f2f2b657d3aa2fae345a313d4784e8/flake8-chart-0.1.5.tar.gz"; sha256 = "d2cac8ead63212d76a3d8530c9277649e1225f75adc6727e53a4c7888a774855"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Click"
      self."pygal"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/microamp/flake8-chart";
        license = licenses.mit;
        description = "flake8 stats visualised";
      };
    };

    "flake8-codeclimate" = python.mkDerivation {
      name = "flake8-codeclimate-0.2.0";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/76/3f/801b948f66467a4525d18f841736847eacc5f559891403bd56e932ed3aad/flake8_codeclimate-0.2.0.tar.gz"; sha256 = "72150e87da241201c70a159341945d3e937b17bed526ce92186031e310f54bf3"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
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
      name = "flake8-coding-1.3.1";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/f9/d7/889f7961ed549f15a280fa36edfc9b9016df38cd25cd0a8a7e4edc06efcf/flake8-coding-1.3.1.tar.gz"; sha256 = "549c2b22c08711feda11795fb49f147a626305b602c547837bab405e7981f844"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
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
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/04/62/1afebe73ea28b363c80aab892298c83f510c65ae079c2c8129f0ea50db46/flake8-colors-0.1.6.tar.gz"; sha256 = "508fcf6efc15826f2146b42172ab41999555e07af43fcfb3e6a28ad596189560"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
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
      name = "flake8-commas-2.0.0";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/85/6b/a64cb3469543ec48f55287c4736c5430801e49ca4810c3e2124755bd9e5c/flake8-commas-2.0.0.tar.gz"; sha256 = "d3005899466f51380387df7151fb59afec666a0f4f4a2c6a8995b975de0f44b7"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."flake8"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/PyCQA/flake8-commas/";
        license = licenses.mit;
        description = "Flake8 lint for trailing commas.";
      };
    };

    "flake8-comprehensions" = python.mkDerivation {
      name = "flake8-comprehensions-1.4.1";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/34/07/cd53c9ae3275f5f52c5ec196b36b3cd5a71e943b199cef18ffaaf4761338/flake8-comprehensions-1.4.1.tar.gz"; sha256 = "b83891fec0e680b07aa1fd92e53eb6993be29a0f3673a09badbe8da307c445e0"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
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
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/4c/89/1ecac58d3dd70cafb2ea6d5d8253cfffc353ed075762ae3ab846952b73e8/flake8-config-4catalyzer-0.2.1.tar.gz"; sha256 = "477a1ab793cfdfd01a0572793e50c125966c6426ee948c7f34c5a6cc6de0b6c7"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
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
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/3a/22/2973cbdfd5c2df98bbd1b187c19c438653ffa75ea2ed1b0e610b344d70b6/flake8-copyright-0.2.0.tar.gz"; sha256 = "aeef26eb4d5223c9cd5b101e68175fcef6d2b353bf36da688fdde62fccfe2b73"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/savoirfairelinux/flake8-copyright";
        license = "";
        description = "Adds copyright checks to flake8";
      };
    };

    "flake8-debugger" = python.mkDerivation {
      name = "flake8-debugger-3.1.0";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/39/4b/90548607282483dd15f9ce1f4434d735ae756e16e1faf60621b0f8877fcc/flake8-debugger-3.1.0.tar.gz"; sha256 = "be4fb88de3ee8f6dd5053a2d347e2c0a2b54bab6733a2280bb20ebd3c4ca1d97"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
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
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/28/28/d39539c84cfb432d7431255ed16f93125342ced4a137d653b50b621fae36/flake8-deprecated-1.3.tar.gz"; sha256 = "9fa5a0c5c81fb3b34c53a0e4f16cd3f0a3395078cfd4988011cbab5fb0afa7f7"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
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
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/cc/88/2d9e5d91c4ea3ba39c82b4c28a63d1fd7afeed8e5db414d7d3f2bc21f83a/flake8-diff-0.2.2.tar.gz"; sha256 = "85ad05ea1de0f57955241f19a86c71f36ee4b53f91efc8a089c38f3838c4d073"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
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
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/a5/8c/93d397e26d732ff4978b0c1568bd9ef02f0ef7aac5763ec5c9b25ed252f5/flake8-docstrings-1.3.0.tar.gz"; sha256 = "4e0ce1476b64e6291520e5570cf12b05016dd4e8ae454b8a8a9a48bc5f84e1cd"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
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
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/8a/2d/12e74c3505cea190cade9bd8b553fb1b684e4dcd47402afa3e727df050b7/flake8-double-quotes-0.0.1.tar.gz"; sha256 = "529e1d01a732f3db9666c59b11a49ed03709d5d20b92f2b8006aae5fa58a18bc"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
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
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/72/20/aa8446c26644e895e237a82c37977ba3d207d4c324a6584476dbc519a527/flake8_doubles-0.3.tar.gz"; sha256 = "bcd5b060ba98617cdad5e26d5bd203c619415ce96402b1c89b066ea36c6e701f"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
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
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/bd/bb/1a86841c7cc990f0fb3ae7adddbca84d7f02b1e8ec48dc03ba97c72f7c43/flake8-exact-pin-0.0.1.tar.gz"; sha256 = "535efe39271408d745e9a54ac45c2449746419c44199f3507e84b6ac3f2d217d"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
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
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/c9/c4/4f4685d4de9018515415ef01eea42ab7f8ec636b346f70cae7b28aba6c63/flake8-format-ansi-0.1.0.tar.gz"; sha256 = "2bac754c96ddd6b7c9229ae39c940b8259229294df4f7b32b7320133b96de6b3"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
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
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/f1/8a/5e8820f3f7c7dc93a81e384538e42a6a6ec2a2248548ba37e2ea3169fd01/flake8_formatter_abspath-1.0.1.tar.gz"; sha256 = "694d0874d5d047ed57c82a10213f75604475e4525ee8bbaad53417a7d6f8442c"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
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
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/32/73/ae5de8c5baa0b3a71b70a5b7ff073eabeddb674513fa8892f26648a5849c/flake8-future-0.2.tar.gz"; sha256 = "e9d8cf06cc821e12c2ac4a732ed21981f722b96a44ae8adc7bb23d566f6a01b0"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/kmaglione/flake8-future";
        license = licenses.mit;
        description = "A flake8 plugin to warn when any file is missing certain __future__ imports.";
      };
    };

    "flake8-future-import" = python.mkDerivation {
      name = "flake8-future-import-0.4.5";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/9c/75/80e560bf12565baa3a56d52fe2034fa2dd8712575ad2079a89f7d57afe43/flake8-future-import-0.4.5.tar.gz"; sha256 = "0c89030fd59912b5f0ac32e55df2461455c1d459e4317df616ce8d3d25646cc0"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
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
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/76/ba/e995fadadc62e9903b45a55370d6600c28a27a98c0222e462d9d8ec44653/flake8-graphql-0.2.5.tar.gz"; sha256 = "cf6ec34469e2dd596cf271aae713de88ea43b88f5ab4defaabdfde7fcaf18af4"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
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
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/17/39/fcf915953a274a8c977300178b0ad9fb9f227b49b4a5fc94fc53d9f0e6de/flake8-html-0.4.0.tar.gz"; sha256 = "44bec37f142e97c4a5b2cf10efe24ed253617a9736878851a594d4763011e742"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
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
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/cd/19/04735022577f4356d038cabd4b669915e7ce0a651f6312fbf78d616488e9/flake8-immediate-0.2.zip"; sha256 = "edfaae46f0254fb87f6bf247fafde4379ecade0d8efc6a6fb5dbc6371fcbb7bc"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/schlamar/flake8-todo";
        license = licenses.mit;
        description = "Enables immediate output for flake8.";
      };
    };

    "flake8-import-order" = python.mkDerivation {
      name = "flake8-import-order-0.18";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/5b/5b/fd248ea91880a7b5e4754f396f4598e8244f28df0d0f8790453acbafc7c4/flake8-import-order-0.18.tar.gz"; sha256 = "9be5ca10d791d458eaa833dd6890ab2db37be80384707b0f76286ddd13c16cbf"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
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
      name = "flake8-import-order-fuzeman-1.7.0";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/db/76/905dcfdc1d411418f2764ecf2c12a773336c9ea7e74c7eb82d1b3286c4c9/flake8-import-order-fuzeman-1.7.0.tar.gz"; sha256 = "069305fa593090850be1fd4e38fba7a544ee9da8aa601d2c20a7752eefc81363"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
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

    "flake8-imports" = python.mkDerivation {
      name = "flake8-imports-0.1.1";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/13/af/146bd05248c1d0f0f5fb3e7070c651c4e1d970cd4eff6a71f43e9b09698b/flake8_imports-0.1.1.tar.gz"; sha256 = "d310f1bd3165aff08c565013e5c24aa4f4d50600280cec95e8eb8feb8e3c6bd4"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
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
      name = "flake8-isort-2.5";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/07/ad/d8d87f1dc4f2ab398ba9e9ad603367d14ba7d614dad7dece66ae0148541b/flake8-isort-2.5.tar.gz"; sha256 = "298d7904ac3a46274edf4ce66fd7e272c2a60c34c3cc999dea000608d64e5e6e"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."flake8"
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
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/e4/66/582e8622db2bdff48d1236963ac66b2b3ab510b133a2213f4a9c19a19f2c/flake8-junit-report-2.1.0.tar.gz"; sha256 = "f8890c1ebe0acb516fefacddec4b802bca9f89bb07db933e4ee3cd11ceaa1e8b"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
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
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/33/ce/37e294a6e3ef637a21afba905e2cb999bd78c0c54e0b716a5e13d4cb422b/flake8-libfaketime-1.1.tar.gz"; sha256 = "e0658bfbee0fb7b559cfab1fdc976ded5d09ccdd07473fcd907f809ac9953c12"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
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
      name = "flake8-logging-format-0.5.0";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/a1/00/e5d3827a9c1a35baf0b084bad3a09dc070b4c35e9c4a31f2b34a380b4a2b/flake8-logging-format-0.5.0.tar.gz"; sha256 = "464b68b602fb034335b91a21b8968560f29f10e0e0f2618f2a8e2bb0ea01232f"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
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
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/6c/37/e4d1047f1c607e98fa3c355fbb72e0806725e07396d1f5d969341ce3ff4c/flake8-meiqia-0.2.0.tar.gz"; sha256 = "9b344acb50f04f22a87ebaa0e54b18361056effaf2fc87f6bd9dfb6de84b65f8"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
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
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/00/b8/af88a8c6e37858d28700e6e51dc93d10f5deaca317f135b77f6db3bdb6b8/flake8-mock-0.3.tar.gz"; sha256 = "2fa775e7589f4e1ad74f35d60953eb20937f5d7355235e54bf852c6837f2bede"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
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
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/d0/6d/e6565d7c5732b00f40f6d055e9d84d311dcea677710b49f4a125e9d15fb2/flake8-module-imports-1.1.tar.gz"; sha256 = "984088d74ffc8a2b56751ddb74f5185c5eddfaf3ae6224c2382be8c890b15f99"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
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
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/97/6a/0fd1d903848fe043c7b6e5283d9def56425754098e69d7683a3ccbbea345/flake8-mutable-1.2.0.tar.gz"; sha256 = "ee9b77111b867d845177bbc289d87d541445ffcc6029a0c5c65865b42b18c6a6"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
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
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/97/9a/cddd1363d7314bb4eb452089c6fb3092ed9fda9f3350683d1978522a30ec/flake8-mypy-17.8.0.tar.gz"; sha256 = "47120db63aff631ee1f84bac6fe8e64731dc66da3efc1c51f85e15ade4a3ba18"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
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
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/0d/42/f32f58e9360eae1bb6167e9a0e2c3ab518abf4bfe190064bef3d5d86da59/flake8-network-timeout-0.2.0.tar.gz"; sha256 = "9e9bc65a35131b0342ee900157ec8676a227be079fef6323896e7e2bac24f9c1"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
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
      name = "flake8-ownership-2.0.0";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/03/f5/d3a233e9e0483f15c0a24fec45de0e351a32e7869e3486a2502e03a1c0ee/flake8-ownership-2.0.0.tar.gz"; sha256 = "1181f1d6bcf225bdfc68c168ea1d3a832224e16146f0d3f376c84385900c7670"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."flake8"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://flake8-ownership.readthedocs.io";
        license = licenses.bsdOriginal;
        description = "A flake8 checker for assuring that author, copyright, and license are specified in source files.";
      };
    };

    "flake8-pep257" = python.mkDerivation {
      name = "flake8-pep257-1.0.5";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/9d/2b/098f28b14f8280b0be30aabb51762e71429c348c76aa50c24244aa2f7260/flake8-pep257-1.0.5.tar.gz"; sha256 = "18622f1f2f3d19e878d3fa46e0204aabee084abdbc07cd14fcc0f98974505191"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
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
      name = "flake8-pep3101-1.2.1";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/e1/ac/72ff428f624278e5f12119a624a85bc82de9a5b5fdd056e2e955bb67c24a/flake8-pep3101-1.2.1.tar.gz"; sha256 = "493821d6bdd083794eb0691ebe5b68e5c520b622b269d60e54308fb97440e21a"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
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
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/69/63/2855e8ec58991c49b8211ce6d4d4d8df969c93698ed914dbd27d6a5a1d46/flake8-plone-api-1.4.tar.gz"; sha256 = "cadba99badb6e07d8a0e623f0c53d5e8500b5a30cea63822fbebf68153c2dcf6"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
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
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/db/d4/63e659daf3b6d08854b7a6cd1d90743fe610cf33c4302ab0484d88ce2c49/flake8-plone-hasattr-0.2.post0.tar.gz"; sha256 = "f72ef91a47de847f80749a3668aad89fb23f0e6dcf93a1100b0e909b9e378ec6"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
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
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/e6/67/1c26634a770db5c442e361311bee73cb3a177adb2eb3f7af8953cfd9f553/flake8-polyfill-1.0.2.tar.gz"; sha256 = "e44b087597f6da52ec6393a709e7108b2905317d0c0b744cdca6208e670d8eda"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
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
      name = "flake8-print-3.1.0";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/f2/06/c6a4916f14e8ae526b27f921d953b1e64adecf63ab479322edba2d361263/flake8-print-3.1.0.tar.gz"; sha256 = "5010e6c138b63b62400da4b06afa33becc5e08bd1fcce9af3752445cf3342f54"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
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
      name = "flake8-pyi-18.3.1";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/03/22/0fa6fd83033faf8010e9cd40c6fcd50f5b729ec49f0b7eca65b3b0551ef5/flake8-pyi-18.3.1.tar.gz"; sha256 = "3e67e2441118a3b889bcec1a6bce5f0594de2abe1f502ec18201c777bd7d9a54"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
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
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/8b/2a/f60e143ebdce0475969c5834cc29e6452e2c31e6d57ee75722d6d8594886/flake8-pytest-1.3.tar.gz"; sha256 = "b4d6703f7d7b646af1e2660809e795886dd349df11843613dbe6515efa82c0f3"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
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
      name = "flake8-quotes-1.0.0";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/83/ff/0461010959158bb7d197691c696f1a85b20f2d3eea7aa23f73a8d07f30f3/flake8-quotes-1.0.0.tar.gz"; sha256 = "fd9127ad8bbcf3b546fa7871a5266fd8623ce765ebe3d5aa5eabb80c01212b26"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
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
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/65/e3/acb7cebe98dafe5e51838067032e077bace66701bffa402516a5afde4cc4/flake8-quotes2-0.0.1.tar.gz"; sha256 = "a8310d05bb3f3afa4479833cb4405af8b227f977c85702e787b366753d9e12fb"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
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
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/6a/9f/77394c31f7c51f07c78b0a2b2fad5b348775ce49d95e2e531d201d26d732/flake8-regex-0.3.tar.gz"; sha256 = "812e6f9cfc66f3b8ad2bbb93ec0dede2043a16b5f5d04dc1c8f8e3590c7e67bd"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
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
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/ba/9f/54dabf385b001efa474eef5cbdf074ae4dcc75eeb878b68f7edf3a386489/flake8-respect-noqa-0.3.tar.gz"; sha256 = "ab4acba81f02a1147ce1b3d51c27ad86a5e313667b56bcaa720c801118d00b58"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
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
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/99/2f/38b97b21dc9efc9540620a7d9e76eceeb9f09953dbf05e4caa7d2f721fcb/flake8-rst-docstrings-0.0.8.tar.gz"; sha256 = "3a5b92b40e87006f8e95bfc5082577414cd387ca24def37ecf1fcd9b3ce7273c"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
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
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/c1/0c/bc119ffe4bce7d98fc9ff6e716f29af862235cf3450c345fc51127199eef/flake8-snippets-0.2.tar.gz"; sha256 = "6b9c3e041045b0c22f65fbeb92b9dff31d523797279eada6183cdc9928de6b3f"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
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
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/54/a3/f1c5b92be4c41be1d2edd445b47e8ed94c4619cf20519fdff7b8b76618d7/flake8_sorted_keys-0.2.0.tar.gz"; sha256 = "ea61bbd84acca2d86c344eec7700e58e3057a4ccdbb5fab670fbecae2386c3a2"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
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
      name = "flake8-strict-0.2.1";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/cb/e7/d1e2fd6d3e1991b0ac7cf7db777847a1ed299c45235d19595c275783d38c/flake8_strict-0.2.1.tar.gz"; sha256 = "75d5c11babe3f3b2bc5349e645112571a1d80d6183bda99afe5ffdfc70192d10"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."black"
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
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/df/1f/a16f1a1a0b3abf067c56ac7261fd167820bc612f3345eea20a9d57d60e6f/flake8-string-format-0.2.3.tar.gz"; sha256 = "774d56103d9242ed968897455ef49b7d6de272000cfa83de5814273a868832f1"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
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
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/ff/02/5590270951676129a71088250b357f74acb72c939233e43099b472923a79/flake8-tidy-imports-1.1.0.tar.gz"; sha256 = "5fc28c82bba16abb4f1154dc59a90487f5491fbdb27e658cbee241e8fddc1b91"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
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
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/97/44/4ddfdb3cf642d51858d81472b71e77fd4fb409699f4e9072faf5ae3b4cf9/flake8-todo-0.7.tar.gz"; sha256 = "6e4c5491ff838c06fe5a771b0e95ee15fc005ca57196011011280fc834a85915"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
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
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/20/3e/af3a36218ac26e0c34d620a59b852a4fbd2897c87ec8c87a56c0f692d534/flake8-trailing-commas-0.1.3.tar.gz"; sha256 = "e49119adf9b62a1a123a9b4b16ca56544df449998667c6c71db65c00d6c37493"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
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
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/92/2f/7ca179815e0bb40d38938d9e7d5d8cba03145ebea4675fef2a6610379f3a/flake8-translation-activate-1.0.2.tar.gz"; sha256 = "0b3cbfc3efe83a431415f05b4db64ffee142805a6c7b2dc2d3ccab5b01850407"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
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
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/5b/dd/6e998806c2faa4e122ff61200228dc11161a8f1825ea12a5fc3b64f80731/flake8_truveris-0.3.4.tar.gz"; sha256 = "6a597f05bac40eff41db328be802d3a8cb64a85f0bc40302e0f808a50003b887"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
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
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/02/da/1e8d79f2d60d25e0f3f4d62cfe6c570ade30aab7d6b164a2c2b972228915/flake8_tuple-0.2.13.tar.gz"; sha256 = "152f8f750b64e83f8ebd204e02e603028ac30447b19cd9e3b46d344c2c172ca1"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
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
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/19/91/ffeeac42a8d69e0d25ff3cbfd4811e849e75ac6b7c13e10da56f38945503/flake8-ugettext-alias-1.1.tar.gz"; sha256 = "b0c8d1454fb6f769ce98bae2ff9b9117831e04bccfa6d8405c327000727b5db0"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
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
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/1b/84/7c7fe0c90c56a2c29d8963ed9984eff3bdf2beb414968a227c8c02ce677f/flake8-user-model-1.1.tar.gz"; sha256 = "5bb6ca76ba9a068a17dd7f196343d064f094e02da17f54044e61d94cf92e9be9"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
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
      name = "graphql-core-2.1";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/d8/b7/7b16d70ca5f12c3877b098a2b6024813fb7a168b4c163fc425b123f5d48a/graphql-core-2.1.tar.gz"; sha256 = "889e869be5574d02af77baf1f30b5db9ca2959f1c9f5be7b2863ead5a3ec6181"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
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
      name = "isort-4.3.4";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/b1/de/a628d16fdba0d38cafb3d7e34d4830f2c9cb3881384ce5c08c44762e1846/isort-4.3.4.tar.gz"; sha256 = "b9c40e9750f3d77e6e4d441d8b0266cf555e7cdabdcff33c4fd06366ca761ef8"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
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
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/06/18/fa675aa501e11d6d6ca0ae73a101b2f3571a565e0f7d38e062eec18a91ee/mccabe-0.6.1.tar.gz"; sha256 = "dd8d182285a0fe56bace7f45b5e7d1a6ebcbf524e8f3bd87eb0f125271b8831f"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/pycqa/mccabe";
        license = licenses.mit;
        description = "McCabe checker, plugin for flake8";
      };
    };

    "mypy" = python.mkDerivation {
      name = "mypy-0.630";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/32/67/82af7c35be233b3a74fe3fe423607fe89830518d3f7727fd41c519273bd1/mypy-0.630.tar.gz"; sha256 = "6704586b4c2bf7dfa5e87a422be9ca57db622bab65008245759f3d4baeb219dd"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."mypy-extensions"
      self."typed-ast"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://www.mypy-lang.org/";
        license = licenses.mit;
        description = "Optional static typing for Python";
      };
    };

    "mypy-extensions" = python.mkDerivation {
      name = "mypy-extensions-0.4.1";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/c2/92/3cc05d1206237d54db7b2565a58080a909445330b4f90a6436302a49f0f8/mypy_extensions-0.4.1.tar.gz"; sha256 = "37e0e956f41369209a3d5f34580150bcacfabaa57b33a15c0b25f4b5725e0812"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://www.mypy-lang.org/";
        license = licenses.mit;
        description = "Experimental type system extensions for programs checked with the mypy typechecker.";
      };
    };

    "pep257" = python.mkDerivation {
      name = "pep257-0.7.0";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/03/37/872af099c9864f7584bad9a561f6493d5d5eca9fc2b14c7d32407c90c639/pep257-0.7.0.tar.gz"; sha256 = "f3d67547f5617a9cfeb4b8097ed94a954888315defaf6e9b518ff1719363bf03"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
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
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/01/a0/64ba19519db49e4094d82599412a9660dee8c26a7addbbb1bf17927ceefe/pep8-1.7.1.tar.gz"; sha256 = "fe249b52e20498e59e0b5c5256aa52ee99fc295b26ec9eaa85776ffdb9fe6374"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://pep8.readthedocs.org/";
        license = licenses.mit;
        description = "Python style guide checker";
      };
    };

    "pluggy" = python.mkDerivation {
      name = "pluggy-0.7.1";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/a1/83/ef7d976c12d67a5c7a5bc2a47f0501c926cabae9d9fcfdc26d72abc9ba15/pluggy-0.7.1.tar.gz"; sha256 = "95eb8364a4708392bae89035f45341871286a333f749c3141c20573d2b3876e1"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/pytest-dev/pluggy";
        license = licenses.mit;
        description = "plugin and hook calling mechanisms for python";
      };
    };

    "promise" = python.mkDerivation {
      name = "promise-2.2.1";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/5a/81/221d09d90176fd90aed4b530e31b8fedf207385767c06d1d46c550c5e418/promise-2.2.1.tar.gz"; sha256 = "348f5f6c3edd4fd47c9cd65aed03ac1b31136d375aa63871a57d3e444c85655c"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."six"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/syrusakbary/promise";
        license = licenses.mit;
        description = "Promises/A+ implementation for Python";
      };
    };

    "py" = python.mkDerivation {
      name = "py-1.6.0";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/4f/38/5f427d1eedae73063ce4da680d2bae72014995f9fdeaa57809df61c968cd/py-1.6.0.tar.gz"; sha256 = "06a30435d058473046be836d3fc4f27167fd84c45b99704f2fb5509ef61f9af1"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://py.readthedocs.io/";
        license = licenses.mit;
        description = "library with cross-python path, ini-parsing, io, code, log facilities";
      };
    };

    "pycodestyle" = python.mkDerivation {
      name = "pycodestyle-2.3.1";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/e1/88/0e2cbf412bd849ea6f1af1f97882add46a374f4ba1d2aea39353609150ad/pycodestyle-2.3.1.tar.gz"; sha256 = "682256a5b318149ca0d2a9185d365d8864a768a28db66a84a2ea946bcc426766"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
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
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/ca/af/dbd99adec5704de451ae56d08024d7416dead997dedbd6be72cbc86efb08/pydocstyle-2.1.1.tar.gz"; sha256 = "4d5bcde961107873bae621f3d580c3e35a426d3687ffc6f8fb356f6628da5a97"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
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
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/26/85/f6a315cd3c1aa597fb3a04cc7d7dbea5b3cc66ea6bd13dfa0478bf4876e6/pyflakes-1.6.0.tar.gz"; sha256 = "8d616a382f243dbf19b54743f280b80198be0bca3a5396f1d2e1fca6223e8805"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
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
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/14/52/2394f0f8444db3af299f2700aaff22f8cc3741fbd5ed644f782327d356b3/pygal-2.4.0.tar.gz"; sha256 = "9204f05380b02a8a32f9bf99d310b51aa2a932cba5b369f7a4dc3705f0a4ce83"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://pygal.org/";
        license = licenses.lgpl3Plus;
        description = "A python svg graph plotting library";
      };
    };

    "restructuredtext-lint" = python.mkDerivation {
      name = "restructuredtext-lint-1.1.3";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/7e/b5/d28da439210e7f35e4f58f743e2d1fa9c7f34fb5ab9a0532e0bb3a77274a/restructuredtext_lint-1.1.3.tar.gz"; sha256 = "c48ca9a84c312b262809f041fe47dcfaedc9ee4879b3e1f9532f745c182b4037"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
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

    "setuptools-scm" = python.mkDerivation {
      name = "setuptools-scm-3.1.0";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/09/b4/d148a70543b42ff3d81d57381f33104f32b91f970ad7873f463e75bf7453/setuptools_scm-3.1.0.tar.gz"; sha256 = "1191f2a136b5e86f7ca8ab00a97ef7aef997131f1f6d4971be69a1ef387d8b40"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/pypa/setuptools_scm/";
        license = licenses.mit;
        description = "the blessed package to manage your versions by scm tags";
      };
    };

    "six" = python.mkDerivation {
      name = "six-1.11.0";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/16/d8/bc6316cf98419719bd59c91742194c111b6f2e85abac88e496adefaf7afe/six-1.11.0.tar.gz"; sha256 = "70e8a77beed4562e7f14fe23a786b54f6296e34344c23bc42f07b15018ff98e9"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
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
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/20/6b/d2a7cb176d4d664d94a6debf52cd8dbae1f7203c8e42426daa077051d59c/snowballstemmer-1.2.1.tar.gz"; sha256 = "919f26a68b2c17a7634da993d91339e288964f93c274f1343e3bbbe2096e1128"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
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
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/79/3c/2ad76ba49f9e3d88d2b58e135b7821d93741856d1fe49970171f73529303/sqlparse-0.2.4.tar.gz"; sha256 = "ce028444cfab83be538752a2ffdb56bc417b7784ff35bb9a3062413717807dec"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/andialbrecht/sqlparse";
        license = licenses.bsdOriginal;
        description = "Non-validating SQL parser";
      };
    };

    "testfixtures" = python.mkDerivation {
      name = "testfixtures-6.3.0";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/72/4c/846148761c1d3432fefb432d746b3e8441272113d25207e0437a60e9834e/testfixtures-6.3.0.tar.gz"; sha256 = "53c06c1feb0bf378d63c54d1d96858978422d5a34793b39f0dcb0e44f8ec26f4"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/Simplistix/testfixtures";
        license = licenses.mit;
        description = "A collection of helpers and mock objects for unit tests and doc tests.";
      };
    };

    "toml" = python.mkDerivation {
      name = "toml-0.10.0";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/b9/19/5cbd78eac8b1783671c40e34bb0fa83133a06d340a38b55c645076d40094/toml-0.10.0.tar.gz"; sha256 = "229f81c57791a41d65e399fc06bf0848bab550a9dfd5ed66df18ce5f05e73d5c"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/uiri/toml";
        license = licenses.mit;
        description = "Python Library for Tom's Obvious, Minimal Language";
      };
    };

    "tox" = python.mkDerivation {
      name = "tox-3.5.2";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/38/ab/3674069bb1dadcd23e2e76c133cfa806026e68c97510224b3726562a8c44/tox-3.5.2.tar.gz"; sha256 = "4baeb3d8ebdcd9f43afce38aa67d06f1165a87d221d5bb21e8b39a0d4880c134"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."filelock"
      self."pluggy"
      self."py"
      self."six"
      self."toml"
      self."virtualenv"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://tox.readthedocs.org/";
        license = licenses.mit;
        description = "virtualenv-based automation of test activities";
      };
    };

    "typed-ast" = python.mkDerivation {
      name = "typed-ast-1.1.0";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/52/cf/2ebc7d282f026e21eed4987e42e10964a077c13cfc168b42f3573a7f178c/typed-ast-1.1.0.tar.gz"; sha256 = "57fe287f0cdd9ceaf69e7b71a2e94a24b5d268b35df251a88fef5cc241bf73aa"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/python/typed_ast";
        license = licenses.asl20;
        description = "a fork of Python 2 and 3 ast modules with type comment support";
      };
    };

    "virtualenv" = python.mkDerivation {
      name = "virtualenv-16.0.0";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/33/bc/fa0b5347139cd9564f0d44ebd2b147ac97c36b2403943dbee8a25fd74012/virtualenv-16.0.0.tar.gz"; sha256 = "ca07b4c0b54e14a91af9f34d0919790b016923d157afda5efdde55c96718f752"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://virtualenv.pypa.io/";
        license = licenses.mit;
        description = "Virtual Python Environment builder";
      };
    };
  };
  localOverridesFile = ./requirements_override.nix;
  localOverrides = import localOverridesFile { inherit pkgs python; };
  commonOverrides = [
        (import ../overrides.nix { inherit pkgs python ; })
  ];
  paramOverrides = [
    (overrides { inherit pkgs python; })
  ];
  allOverrides =
    (if (builtins.pathExists localOverridesFile)
     then [localOverrides] else [] ) ++ commonOverrides ++ paramOverrides;

in python.withPackages
   (fix' (pkgs.lib.fold
            extends
            generated
            allOverrides
         )
   )
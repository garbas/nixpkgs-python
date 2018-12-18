# generated using pypi2nix tool (version: 2.0.0)
# See more at: https://github.com/garbas/pypi2nix
#
# COMMAND:
#   pypi2nix -W https://travis.garbas.si/wheels_cache/ -v -V 3.7 -O ../overrides.nix -E gfortran -E blas -E pkgconfig -E freetype.dev -E libpng -E agg -s numpy -s setuptools-scm -r requirements.txt
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
    python = pkgs.python37;
    # patching pip so it does not try to remove files when running nix-shell
    overrides =
      self: super: {
        bootstrapped-pip = super.bootstrapped-pip.overrideDerivation (old: {
          patchPhase = old.patchPhase + ''
            if [ -e $out/${pkgs.python37.sitePackages}/pip/req/req_install.py ]; then
              sed -i \
                -e "s|paths_to_remove.remove(auto_confirm)|#paths_to_remove.remove(auto_confirm)|"  \
                -e "s|self.uninstalled = paths_to_remove|#self.uninstalled = paths_to_remove|"  \
                $out/${pkgs.python37.sitePackages}/pip/req/req_install.py
            fi
          '';
        });
      };
  };

  commonBuildInputs = with pkgs; [ gfortran blas pkgconfig freetype.dev libpng agg ];
  commonDoCheck = false;

  withPackages = pkgs':
    let
      pkgs = builtins.removeAttrs pkgs' ["__unfix__"];
      interpreterWithPackages = selectPkgsFn: pythonPackages.buildPythonPackage {
        name = "python37-interpreter";
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
    "cycler" = python.mkDerivation {
      name = "cycler-0.10.0";
      src = pkgs.fetchurl {
        url = "https://files.pythonhosted.org/packages/c2/4b/137dea450d6e1e3d474e1d873cd1d4f7d3beed7e0dc973b06e8e10d32488/cycler-0.10.0.tar.gz";
        sha256 = "cd7b2d1018258d7247a71425e9f26463dfb444d411c39569972f4ce586b0c9d8";
      };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs ++ [ ];
      propagatedBuildInputs = [
        self."six"
      ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://github.com/matplotlib/cycler";
        license = licenses.bsdOriginal;
        description = "Composable style cycles";
      };
    };

    "kiwisolver" = python.mkDerivation {
      name = "kiwisolver-1.0.1";
      src = pkgs.fetchurl {
        url = "https://files.pythonhosted.org/packages/31/60/494fcce70d60a598c32ee00e71542e52e27c978e5f8219fae0d4ac6e2864/kiwisolver-1.0.1.tar.gz";
        sha256 = "ce3be5d520b4d2c3e5eeb4cd2ef62b9b9ab8ac6b6fedbaa0e39cdb6f50644278";
      };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs ++ [ ];
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/nucleic/kiwi";
        license = "UNKNOWN";
        description = "A fast implementation of the Cassowary constraint solver";
      };
    };

    "matplotlib" = python.mkDerivation {
      name = "matplotlib-3.0.2";
      src = pkgs.fetchurl {
        url = "https://files.pythonhosted.org/packages/89/0c/653aec68e9cfb775c4fbae8f71011206e5e7fe4d60fcf01ea1a9d3bc957f/matplotlib-3.0.2.tar.gz";
        sha256 = "c94b792af431f6adb6859eb218137acd9a35f4f7442cea57e4a59c54751c36af";
      };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs ++ [
        self."numpy"
      ];
      propagatedBuildInputs = [
        self."cycler"
        self."kiwisolver"
        self."numpy"
        self."pyparsing"
        self."python-dateutil"
      ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://matplotlib.org";
        license = licenses.bsdOriginal;
        description = "Python plotting package";
      };
    };

    "numpy" = python.mkDerivation {
      name = "numpy-1.15.4";
      src = pkgs.fetchurl {
        url = "https://files.pythonhosted.org/packages/2d/80/1809de155bad674b494248bcfca0e49eb4c5d8bee58f26fe7a0dd45029e2/numpy-1.15.4.zip";
        sha256 = "3d734559db35aa3697dadcea492a423118c5c55d176da2f3be9c98d4803fc2a7";
      };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs ++ [ ];
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://www.numpy.org";
        license = licenses.bsdOriginal;
        description = "NumPy: array processing for numbers, strings, records, and objects.";
      };
    };

    "pyparsing" = python.mkDerivation {
      name = "pyparsing-2.3.0";
      src = pkgs.fetchurl {
        url = "https://files.pythonhosted.org/packages/d0/09/3e6a5eeb6e04467b737d55f8bba15247ac0876f98fae659e58cd744430c6/pyparsing-2.3.0.tar.gz";
        sha256 = "f353aab21fd474459d97b709e527b5571314ee5f067441dc9f88e33eecd96592";
      };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs ++ [ ];
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/pyparsing/pyparsing/";
        license = licenses.mit;
        description = "Python parsing module";
      };
    };

    "python-dateutil" = python.mkDerivation {
      name = "python-dateutil-2.7.5";
      src = pkgs.fetchurl {
        url = "https://files.pythonhosted.org/packages/0e/01/68747933e8d12263d41ce08119620d9a7e5eb72c876a3442257f74490da0/python-dateutil-2.7.5.tar.gz";
        sha256 = "88f9287c0174266bb0d8cedd395cfba9c58e87e5ad86b2ce58859bc11be3cf02";
      };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs ++ [ ];
      propagatedBuildInputs = [
        self."six"
      ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://dateutil.readthedocs.io";
        license = "Dual License";
        description = "Extensions to the standard Python datetime module";
      };
    };

    "scipy" = python.mkDerivation {
      name = "scipy-1.2.0";
      src = pkgs.fetchurl {
        url = "https://files.pythonhosted.org/packages/ea/c8/c296904f2c852c5c129962e6ca4ba467116b08cd5b54b7180b2e77fe06b2/scipy-1.2.0.tar.gz";
        sha256 = "51a2424c8ed80e60bdb9a896806e7adaf24a58253b326fbad10f80a6d06f2214";
      };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs ++ [
        self."numpy"
      ];
      propagatedBuildInputs = [
        self."numpy"
      ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://www.scipy.org";
        license = licenses.bsdOriginal;
        description = "SciPy: Scientific Library for Python";
      };
    };

    "setuptools-scm" = python.mkDerivation {
      name = "setuptools-scm-3.1.0";
      src = pkgs.fetchurl {
        url = "https://files.pythonhosted.org/packages/09/b4/d148a70543b42ff3d81d57381f33104f32b91f970ad7873f463e75bf7453/setuptools_scm-3.1.0.tar.gz";
        sha256 = "1191f2a136b5e86f7ca8ab00a97ef7aef997131f1f6d4971be69a1ef387d8b40";
      };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs ++ [ ];
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/pypa/setuptools_scm/";
        license = licenses.mit;
        description = "the blessed package to manage your versions by scm tags";
      };
    };

    "six" = python.mkDerivation {
      name = "six-1.12.0";
      src = pkgs.fetchurl {
        url = "https://files.pythonhosted.org/packages/dd/bf/4138e7bfb757de47d1f4b6994648ec67a51efe58fa907c1e11e350cddfca/six-1.12.0.tar.gz";
        sha256 = "d16a0141ec1a18405cd4ce8b4613101da75da0e9a7aec5bdd4fa804d0e0eba73";
      };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs ++ [ ];
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/benjaminp/six";
        license = licenses.mit;
        description = "Python 2 and 3 compatibility utilities";
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
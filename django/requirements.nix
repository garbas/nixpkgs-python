# generated using pypi2nix tool (version: 1.8.0)
# See more at: https://github.com/garbas/pypi2nix
#
# COMMAND:
#   pypi2nix -v -V 3.5 -O ../overrides.nix -r requirements.txt
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
          ln -s ${pythonPackages.python.interpreter}               $out/bin/${pythonPackages.python.executable}
          for dep in ${builtins.concatStringsSep " "               (builtins.attrValues pkgs)}; do
            if [ -d "$dep/bin" ]; then
              for prog in "$dep/bin/"*; do
                if [ -f $prog ]; then
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
        pythonPackages.buildPythonPackage (drv.drvAttrs // f drv.drvAttrs);
      withPackages = pkgs'':
        withPackages (pkgs // pkgs'');
    };

  python = withPackages {};

  generated = self: {

    "Django" = python.mkDerivation {
      name = "Django-1.11.1";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/22/68/24fd855343f218e016bbb04b1a5a2dc1be191a4cbd4d3cdabb13d1c2a371/Django-1.11.1.tar.gz"; sha256 = "bbcefdf822eeef2cd04718ebcc24dd2ecf47407258cfcde2b4f95df57ce33a8c"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."pytz"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://www.djangoproject.com/";
        license = licenses.bsdOriginal;
        description = "A high-level Python Web framework that encourages rapid development and clean, pragmatic design.";
      };
    };



    "pytz" = python.mkDerivation {
      name = "pytz-2017.2";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/a4/09/c47e57fc9c7062b4e83b075d418800d322caa87ec0ac21e6308bd3a2d519/pytz-2017.2.zip"; sha256 = "f5c056e8f62d45ba8215e5cb8f50dfccb198b4b9fbea8500674f3443e4689589"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://pythonhosted.org/pytz";
        license = licenses.mit;
        description = "World timezone definitions, modern and historical";
      };
    };

  };
  overrides = import ./requirements_override.nix { inherit pkgs python; };
  commonOverrides = [
    (import ../overrides.nix { inherit pkgs python ; })
  ];

in python.withPackages
   (fix' (pkgs.lib.fold
            extends
            generated
            ([overrides] ++ commonOverrides)
         )
   )
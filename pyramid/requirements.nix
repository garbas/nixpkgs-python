# generated using pypi2nix tool (version: 1.8.1)
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
    "PasteDeploy" = python.mkDerivation {
      name = "PasteDeploy-1.5.2";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/0f/90/8e20cdae206c543ea10793cbf4136eb9a8b3f417e04e40a29d72d9922cbd/PasteDeploy-1.5.2.tar.gz"; sha256 = "d5858f89a255e6294e63ed46b73613c56e3b9a2d82a42f1df4d06c8421a9e3cb"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://pythonpaste.org/deploy/";
        license = licenses.mit;
        description = "Load, configure, and compose WSGI applications and servers";
      };
    };

    "WebOb" = python.mkDerivation {
      name = "WebOb-1.7.4";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/75/34/731e23f52371852dfe7490a61644826ba7fe70fd52a377aaca0f4956ba7f/WebOb-1.7.4.tar.gz"; sha256 = "8d10af182fda4b92193113ee1edeb687ab9dc44336b37d6804e413f0240d40d9"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://webob.org/";
        license = licenses.mit;
        description = "WSGI request and response object";
      };
    };

    "hupper" = python.mkDerivation {
      name = "hupper-1.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/2e/07/df892c564dc09bb3cf6f6deb976c26adf9117db75ba218cb4353dbc9d826/hupper-1.0.tar.gz"; sha256 = "afb9584fc387c962824627bb243d7d92c276df608a771b17c8b727a7de34920a"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/Pylons/hupper";
        license = licenses.mit;
        description = "Integrated process monitor for developing and reloading daemons.";
      };
    };

    "plaster" = python.mkDerivation {
      name = "plaster-1.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/37/e1/56d04382d718d32751017d32f351214384e529b794084eee20bb52405563/plaster-1.0.tar.gz"; sha256 = "8351c7c7efdf33084c1de88dd0f422cbe7342534537b553c49b857b12d98c8c3"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://docs.pylonsproject.org/projects/plaster/en/latest/";
        license = licenses.mit;
        description = "A loader interface around multiple config file formats.";
      };
    };

    "plaster-pastedeploy" = python.mkDerivation {
      name = "plaster-pastedeploy-0.4.2";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/2c/62/0daf9c0be958e785023e583e51baac15863699e956bfb3d448898d80edd8/plaster_pastedeploy-0.4.2.tar.gz"; sha256 = "2a401228c7cfbe38f728249e75af7a666f91c61d642cbb8fcb78a71df69d2754"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."PasteDeploy"
      self."plaster"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/Pylons/plaster_pastedeploy";
        license = licenses.mit;
        description = "A loader implementing the PasteDeploy syntax to be used by plaster.";
      };
    };

    "pyramid" = python.mkDerivation {
      name = "pyramid-1.9.1";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/9a/57/73447be9e7d0512d601e3f0a1fb9d7d1efb941911f49efdfe036d2826507/pyramid-1.9.1.tar.gz"; sha256 = "840f4bbd5994609340de35079da0d1dd94f79942e27818d5d8566f8009fb0b36"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."PasteDeploy"
      self."WebOb"
      self."hupper"
      self."plaster"
      self."plaster-pastedeploy"
      self."repoze.lru"
      self."translationstring"
      self."venusian"
      self."zope.deprecation"
      self."zope.interface"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://trypyramid.com";
        license = "License :: Repoze Public License";
        description = "The Pyramid Web Framework, a Pylons project";
      };
    };

    "repoze.lru" = python.mkDerivation {
      name = "repoze.lru-0.7";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/12/bc/595a77c4b5e204847fdf19268314ef59c85193a9dc9f83630fc459c0fee5/repoze.lru-0.7.tar.gz"; sha256 = "0429a75e19380e4ed50c0694e26ac8819b4ea7851ee1fc7583c8572db80aff77"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://www.repoze.org";
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
        homepage = "http://pylonsproject.org";
        license = "BSD-like (http://repoze.org/license.html)";
        description = "Utility library for i18n relied on by various Repoze and Pyramid packages";
      };
    };

    "venusian" = python.mkDerivation {
      name = "venusian-1.1.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/38/24/b4b470ab9e0a2e2e9b9030c7735828c8934b4c6b45befd1bb713ec2aeb2d/venusian-1.1.0.tar.gz"; sha256 = "9902e492c71a89a241a18b2f9950bea7e41d025cc8f3af1ea8d8201346f8577d"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://pylonsproject.org";
        license = "BSD-derived (http://www.repoze.org/LICENSE.txt)";
        description = "A library for deferring decorator actions";
      };
    };

    "zope.deprecation" = python.mkDerivation {
      name = "zope.deprecation-4.3.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/a1/18/2dc5e6bfe64fdc3b79411b67464c55bb0b43b127051a20f7f492ab767758/zope.deprecation-4.3.0.tar.gz"; sha256 = "7d52e134bbaaa0d72e1e2bc90f0587f1adc116c4bdf15912afaf2f1e8856b224"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://github.com/zopefoundation/zope.deprecation";
        license = licenses.zpl21;
        description = "Zope Deprecation Infrastructure";
      };
    };

    "zope.interface" = python.mkDerivation {
      name = "zope.interface-4.4.3";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/bd/d2/25349ed41f9dcff7b3baf87bd88a4c82396cf6e02f1f42bb68657a3132af/zope.interface-4.4.3.tar.gz"; sha256 = "d6d26d5dfbfd60c65152938fcb82f949e8dada37c041f72916fef6621ba5c5ce"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/zopefoundation/zope.interface";
        license = licenses.zpl21;
        description = "Interfaces for Python";
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
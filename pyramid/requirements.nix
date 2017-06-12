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
    # patching pip so it does not try to remove files when running nix-shell
    overrides =
      self: super: {
        bootstrapped-pip = super.bootstrapped-pip.overrideDerivation (old: {
          patchPhase = old.patchPhase + ''
            sed -i               -e "s|paths_to_remove.remove(auto_confirm)|#paths_to_remove.remove(auto_confirm)|"                -e "s|self.uninstalled = paths_to_remove|#self.uninstalled = paths_to_remove|"                  $out/${pkgs.python35.sitePackages}/pip/req/req_install.py
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
        pythonPackages.buildPythonPackage (drv.drvAttrs // f drv.drvAttrs //                                            { meta = drv.meta; });
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
      name = "WebOb-1.7.2";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/1a/2b/322d6e01ba19c1e28349efe46dab1bd480c81a55af0658d63dc48ed62ee6/WebOb-1.7.2.tar.gz"; sha256 = "0dc8b30bdbf15d8fd1a967e30ece3357f2f468206354f69213e57b30a63f0039"; };
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



    "pyramid" = python.mkDerivation {
      name = "pyramid-1.8.4";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/76/68/c09673596871b23a3f24f08988b181c8bd8b31c871560c75eeed5c563449/pyramid-1.8.4.tar.gz"; sha256 = "2f02b800922eedfaff73e17ac15ae5614ff9d3f651dbea4c5d0fd221d72511c8"; };
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
        homepage = "https://trypyramid.com";
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
      name = "zope.deprecation-4.2.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/51/85/b9d2fdcaf38ce3271ad759c7e8f0e9a28f6d900c1ad495085e4ab1de3795/zope.deprecation-4.2.0.tar.gz"; sha256 = "ff32c5bb5388b77b22c83ed1f1aa01cdbb076d9f2cfa2b825450ce9e2ecfd738"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://pypi.python.org/pypi/zope.deprecation";
        license = licenses.zpt21;
        description = "Zope Deprecation Infrastructure";
      };
    };



    "zope.interface" = python.mkDerivation {
      name = "zope.interface-4.4.1";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/90/1c/942298a4f5ef7db8c885ae687c59d397127f5a8cff7a473b0d7475a2c6e7/zope.interface-4.4.1.tar.gz"; sha256 = "350e3615d70a96678c3170eb5c96d4f72b8e7738861afbf030967d52c05722fe"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/zopefoundation/zope.interface";
        license = licenses.zpt21;
        description = "Interfaces for Python";
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
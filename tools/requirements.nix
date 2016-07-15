# generated using pypi2nix tool (version: 1.3.0dev)
# See more at: https://github.com/garbas/pypi2nix
#
# COMMAND:
#   pypi2nix -r tools/requirements.txt -V 3.5 -E groff less
#

{ pkgs ? import <nixpkgs> {}
}:

let

  inherit (pkgs.stdenv.lib) fix' extends inNixShell;

  pythonPackages = pkgs.python35Packages;
  commonBuildInputs = with pkgs; [ groff less ];
  commonDoCheck = false;

  buildEnv = { pkgs ? {}, modules ? {} }:
    let
      interpreter = pythonPackages.python.buildEnv.override {
        extraLibs = (builtins.attrValues pkgs) ++ (builtins.attrValues modules);
      };
    in {
      mkDerivation = pythonPackages.buildPythonPackage;
      interpreter = if inNixShell then interpreter.env else interpreter;
      overrideDerivation = drv: f: pythonPackages.buildPythonPackage (drv.drvAttrs // f drv.drvAttrs);
      pkgs_top_level = builtins.filter (x: !(builtins.hasAttr "top_level" x.passthru)) (
          builtins.attrValues (builtins.removeAttrs pkgs ["__unfix__"]));
      inherit buildEnv pkgs modules;
    };

  generated = import ./requirements_generated.nix { inherit pkgs python commonBuildInputs commonDoCheck; };
  overrides = import ./requirements_override.nix { inherit pkgs python; };

  python = buildEnv {
    pkgs = fix' (extends overrides generated);
  };

in python
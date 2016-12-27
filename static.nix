{ pkgs ? import <nixpkgs> {}
}:

let

  nixpkgs_python = import ./default.nix { inherit pkgs; };

  getMeta = set:
      { name: name };

  getMetaPkgs = set:
  self = pkgs.stdenv.mkDerivation {
    name = "pypi-nixpkgs-python";
    buildCommand = ''
      mkdir $out
    '';
    meta =
      map (x: getMeta (builtins.getAttr x nixpkgs_python))
          (builtins.attrNames nixpkgs_python);
  };

in self

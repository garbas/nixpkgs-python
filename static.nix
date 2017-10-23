{ pkgs ? import <nixpkgs> {}
}:

let

  nixpkgs_python = import ./default.nix { inherit pkgs; };

  excludePackages = [ "science" ];

  pkg_meta = set: pkg:
    let
      drv = builtins.parseDrvName (pkgs.lib.removePrefix "${set.__old.python.libPrefix}-" pkg.name);
    in
      { inherit (drv) name version;
        inherit (pkg.meta) maintainers license homepage description;
      };

  self_meta =
    map
      (name:
        let
          set = builtins.getAttr name nixpkgs_python;
        in
          { inherit (set.__meta__) name maintainers description;
            packages = map (x: pkg_meta set x) (builtins.attrValues set.packages);
          }
      )
      ( builtins.filter
        (name: ! (builtins.elem name excludePackages))
        (builtins.attrNames nixpkgs_python)
      );

  self_meta_file = pkgs.writeText "nixpkgs-python-meta" (builtins.toJSON self_meta);

  self = pkgs.stdenv.mkDerivation {
    name = "pypi-nixpkgs-python";
    buildCommand = ''
      mkdir $out
      cp ${self_meta_file} $out/all.json
    '';
  };

in self

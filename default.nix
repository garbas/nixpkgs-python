{ pkgs ? import <nixpkgs> {}
}:

{

  flask = import ./flask/requirements.nix { inherit pkgs; };
  pyramid = import ./pyramid/requirements.nix { inherit pkgs; };
  django = import ./django/requirements.nix { inherit pkgs; };
  scipy = import ./scipy/requirements.nix { inherit pkgs; };

}

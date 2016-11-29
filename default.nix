{ pkgs ? import <nixpkgs> {}
}:

{

  # maintainers: garbas
  flask = import ./flask/requirements.nix { inherit pkgs; };

  # maintainers: garbas
  homeassistant = import ./homeassistant/requirements.nix { inherit pkgs; };

  # maintainers: ???
  pyramid = import ./pyramid/requirements.nix { inherit pkgs; };

  # XXX: currently looking maintainers
  #pyramid = import ./pyramid/requirements.nix { inherit pkgs; };
  #django = import ./django/requirements.nix { inherit pkgs; };
  #science= import ./science/requirements.nix { inherit pkgs; };

}

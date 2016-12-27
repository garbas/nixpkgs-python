{ pkgs ? import <nixpkgs> {}
}:

{

  django = import ./django/requirements.nix { inherit pkgs; };
  flask = import ./flask/requirements.nix { inherit pkgs; };
  homeassistant = import ./homeassistant/requirements.nix { inherit pkgs; };
  pelican = import ./pelican/requirements.nix { inherit pkgs; };
  pyramid = import ./pyramid/requirements.nix { inherit pkgs; };
  science= import ./science/requirements.nix { inherit pkgs; };

}

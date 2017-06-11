self: super: {
  pythonNEXT = import ./default.nix { pkgs = super; };
}

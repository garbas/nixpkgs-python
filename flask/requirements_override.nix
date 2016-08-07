{ pkgs, python }:

self: super: {

  #"click" = python.overrideDerivation super."click" (old: {
  #  buildInputs = old.buildInputs ++ [ self."pytest" ];
  #  checkPhase = ''
  #    py.test tests
  #  '';
  #});

  "Werkzeug" = python.overrideDerivation super."Werkzeug" (old: {
    buildInputs = old.buildInputs ++ [ self."pytest" ];
  });

  "click" = python.overrideDerivation super."click" (old: {
    pathPhase = ''
     rm click/_winconsole.py
    '';
  });

  "py" = python.overrideDerivation super."py" (old: {
    # circular dependency with pytest
    #buildInputs = old.buildInputs ++ [ self."pytest" ];
    doCheck = false;
  });

  "pytest" = python.overrideDerivation super."pytest" (old: {
    doCheck = true;
    patchPhase = ''
      rm testing/test_argcomplete.py
    '';
  });
}

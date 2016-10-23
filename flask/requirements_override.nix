{ pkgs, python }:

self: super: {

  "Werkzeug" = python.overrideDerivation super."Werkzeug" (old: {
    doCheck = true;
    buildInputs = old.buildInputs ++ [ self."pytest" ];
  });

  "click" = python.overrideDerivation super."click" (old: {
    doCheck = true;
    patchPhase = ''
     rm click/_winconsole.py
    '';
  });

  "py" = python.overrideDerivation super."py" (old: {
    # circular dependency with pytest
    #buildInputs = old.buildInputs ++ [ self."pytest" ];
    doCheck = false;
  });

  "pytest" = python.overrideDerivation super."pytest" (old: {
    # circular dependency with hypothesis
    #buildInputs = old.buildInputs ++ [ self."mock" self."nose" self."hypothesis" ];
    doCheck = false;
    patchPhase = ''
      rm testing/test_argcomplete.py
    '';
  });

  "six" = python.overrideDerivation super."six" (old: {
    doCheck = true;
    buildInputs = old.buildInputs ++ [ self."pytest" ];
  });

  "Flask-Login" = python.overrideDerivation super."Flask-Login" (old: {
    doCheck = false;
    #buildInputs = old.buildInputs ++ [ self."nose" ];
    #checkPhase = ''
    #  nosetests
    #'';
  });

}

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

  "execnet" = python.overrideDerivation super."execnet" (old: {
    doCheck = true;
    buildInputs = old.buildInputs ++ [ self."pytest" self."setuptools-scm" ];
    patchPhase = ''
      rm -v testing/test_termination.py
      rm -v testing/test_channel.py
      rm -v testing/test_xspec.py
      rm -v testing/test_gateway.py
    '';
    checkPhase = ''
      pytest testing/
    '';
  });

  "Flask-Cors" = python.overrideDerivation super."Flask-Cors" (old: {
    doCheck = true;
    buildInputs = old.buildInputs ++ [ self."nose" ];
  });

  "pytest-xdist" = python.overrideDerivation super."pytest-xdist" (old: {
    doCheck = true;
    buildInputs = old.buildInputs ++ [ self."setuptools-scm" ];
  });

  "apipkg" = python.overrideDerivation super."apipkg" (old: {
    doCheck = true;
    buildInputs = old.buildInputs ++ [ self."pytest" ];
  });

  "nose" = python.overrideDerivation super."nose" (old: {
    doCheck = false;
  });

  "Flask-Login" = python.overrideDerivation super."Flask-Login" (old: {
    doCheck = false;
    #buildInputs = old.buildInputs ++ [ self."nose" ];
    #checkPhase = ''
    #  nosetests
    #'';
  });

}

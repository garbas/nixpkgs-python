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

  "mock" = python.overrideDerivation super."mock" (old: {
    doCheck = true;
    buildInputs = old.buildInputs ++ [ self."unittest2py3k" ];
    checkPhase = ''
      ${python.__old.python.interpreter} -m unittest discover
    '';
  });

  "mccabe" = python.overrideDerivation super."mccabe" (old: {
    doCheck = true;
    buildInputs = old.buildInputs ++ [ self."pytest" self."pytest-runner" ];
  });

  "pytest-runner" = python.overrideDerivation super."pytest-runner" (old: {
    doCheck = false;
    buildInputs = old.buildInputs ++ [ self."setuptools-scm" ];
  });

  "clickclick" = python.overrideDerivation super."clickclick" (old: {
    doCheck = false;
    buildInputs = old.buildInputs ++ [ self."flake8" self."six" self."pytest" self."pytest-cov" ];
  });

  "flake8" = python.overrideDerivation super."flake8" (old: {
    doCheck = true;
    buildInputs = old.buildInputs ++ [ self."pytest" self."mock" self."pytest-runner" ];
    patchPhase = ''
      sed -i -e "/^norecursedirs/d" setup.cfg
      rm tests/unit/test_config_file_finder.py
    '';
  });

  "requests" = python.overrideDerivation super."requests" (old: {
    doCheck = false;
  });

  "apipkg" = python.overrideDerivation super."apipkg" (old: {
    doCheck = true;
    buildInputs = old.buildInputs ++ [ self."pytest" ];
  });

  "jsonschema" = python.overrideDerivation super."jsonschema" (old: {
    doCheck = false;
    buildInputs = old.buildInputs ++ [ self."vcversioner" ];
  });

  "connexion" = python.overrideDerivation super."connexion" (old: {
    doCheck = false;
    buildInputs = old.buildInputs ++ [ self."flake8" self."decorator" self."mock" self."pytest" self."pytest-cov" ];
  });

  "SQLAlchemy" = python.overrideDerivation super."SQLAlchemy" (old: {
    doCheck = true;
    buildInputs = old.buildInputs ++ [ self."pytest" self."mock" self."pytest-xdist" ];
  });

  "nose" = python.overrideDerivation super."nose" (old: {
    doCheck = false;
  });

  "unittest2py3k" = python.overrideDerivation super."unittest2py3k" (old: {
    doCheck = false;
  });

  "pbr" = python.overrideDerivation super."pbr" (old: {
    doCheck = false;
  });

  "coverage" = python.overrideDerivation super."coverage" (old: {
    doCheck = false;
  });

  "Flask-Login" = python.overrideDerivation super."Flask-Login" (old: {
    doCheck = false;
  });

}

{ pkgs, python }:

let

  skipOverrides = overrides: self: super:
    let
      overridesNames = builtins.attrNames overrides;
      superNames = builtins.attrNames super;
    in
      builtins.listToAttrs
        (builtins.map
          (name: { inherit name;
                   value = python.overrideDerivation super."${name}" (overrides."${name}" self);
                 }
          )
          (builtins.filter
            (name: builtins.elem name superNames)
            overridesNames
          )
        );

in skipOverrides {

  "Flask" = self: old: {
    doCheck = true;
    LANG = "en_US.UTF-8";
    buildInputs = old.buildInputs ++ [ self."pytest" pkgs.glibcLocales ];
    patchPhase = ''
      rm -rf examples/
    '';
    checkPhase = ''
      pytest
    '';
  };

  "Flask-Cors" = self: old: {
    doCheck = true;
    buildInputs = old.buildInputs ++ [ self."nose" ];
  };

  "Flask-Login" = self: old: {
    # no tests available
    doCheck = false;
    buildInputs = old.buildInputs ++ [ self."pep8" self."pyflakes" self."nose" ];
  };

  "SQLAlchemy" = self: old: {
    doCheck = true;
    buildInputs = old.buildInputs ++ [ self."pytest" self."mock" self."pytest-xdist" ];
  };

  "Werkzeug" = self: old: {
    doCheck = true;
    LANG = "en_US.UTF-8";
    buildInputs = old.buildInputs ++ [ self."pytest" self."requests" pkgs.glibcLocales ];
  };

  "apipkg" = self: old: {
    doCheck = true;
    buildInputs = old.buildInputs ++ [ self."pytest" self."py" ];
  };

  "async-timeout" = self: old: {
    buildInputs = [ self."pytest-runner" ];
  };

  "click" = self: old: {
    doCheck = true;
    patchPhase = ''
     rm click/_winconsole.py
    '';
  };

  "clickclick" = self: old: {
    doCheck = false;
    buildInputs = old.buildInputs ++ [ self."flake8" self."six" self."pytest" self."pytest-cov" ];
  };

  "connexion" = self: old: {
    doCheck = false;
    buildInputs = old.buildInputs ++ [ self."flake8" self."decorator" self."mock" self."pytest" self."pytest-cov" ];
  };

  "coverage" = self: old: {
    doCheck = false;
  };

  "execnet" = self: old: {
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
  };

  "flake8" = self: old: {
    doCheck = true;
    buildInputs = old.buildInputs ++ [ self."pytest" self."mock" self."pytest-runner" ];
    patchPhase = ''
      sed -i -e "/^norecursedirs/d" setup.cfg
      rm tests/unit/test_config_file_finder.py
    '';
  };

  "jsonschema" = self: old: {
    doCheck = false;
    buildInputs = old.buildInputs ++ [ self."vcversioner" ];
  };

  "mccabe" = self: old: {
    doCheck = true;
    buildInputs = old.buildInputs ++ [ self."pytest" self."pytest-runner" ];
  };

  "mock" = self: old: {
    doCheck = true;
    buildInputs = old.buildInputs ++ [ self."unittest2py3k" ];
    checkPhase = ''
      ${python.__old.python.interpreter} -m unittest discover
    '';
  };

  "nose" = self: old: {
    doCheck = false;
  };

  "pelican" = self: old: {
    LANG = "en_US.UTF-8";
    buildInputs = old.buildInputs ++ [ pkgs.glibcLocales ];
  };

  "pbr" = self: old: {
    doCheck = false;
  };

  "py" = self: old: {
    # circular dependency with pytest
    #buildInputs = old.buildInputs ++ [ self."pytest" ];
    doCheck = false;
  };

  "pytest" = self: old: {
    # circular dependency with hypothesis
    #buildInputs = old.buildInputs ++ [ self."mock" self."nose" self."hypothesis" ];
    doCheck = false;
    patchPhase = ''
      rm testing/test_argcomplete.py
    '';
  };

  "pytest-runner" = self: old: {
    doCheck = false;
    buildInputs = old.buildInputs ++ [ self."setuptools-scm" ];
  };

  "six" = self: old: {
    doCheck = true;
    buildInputs = old.buildInputs ++ [ self."pytest" ];
  };

  "pytest-xdist" = self: old: {
    doCheck = true;
    buildInputs = old.buildInputs ++ [ self."setuptools-scm" ];
  };

  "requests" = self: old: {
    doCheck = false;
  };

  "unittest2py3k" = self: old: {
    doCheck = false;
  };

}

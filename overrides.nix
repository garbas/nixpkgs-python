{ pkgs, python }:

let

  skipOverrides = overrides: self: super:
    let
      overridesNames = builtins.attrNames overrides;
      superNames = builtins.attrNames super;
      filteredNames =
        builtins.filter
        (name: builtins.elem name superNames)
        overridesNames;
      packagesWithoutOverrides =
        builtins.filter
        (name: ! builtins.elem name filteredNames)
        superNames;
      addLANG = old: { LANG = "en_US.UTF-8"; };
    in
      builtins.listToAttrs
      (builtins.map
        (name: { inherit name;
                 value = python.overrideDerivation super."${name}" addLANG;
               }
        )
        packagesWithoutOverrides
      )
      //
      builtins.listToAttrs
        (builtins.map
          (name: { inherit name;
                   value = python.overrideDerivation
                           super."${name}"
                           (old: (addLANG old // overrides."${name}" self old));
                 }
          )
          filteredNames
        );

in skipOverrides {

  "async-timeout" = self: old: {
    patchPhase = ''
      sed -i -e "s|setup_requires=\['pytest-runner'\],||" setup.py
    '';
  };

  "clickclick" = self: old: {
    patchPhase = ''
      sed -i -e "s|setup_requires=\['six', 'flake8'\],||" setup.py
      sed -i -e "s|command_options=command_options,||" setup.py
    '';
  };

  "connexion" = self: old: {
    patchPhase = ''
      sed -i -e "s|setup_requires=\['flake8'\],||" setup.py
      sed -i -e "s|jsonschema>=2.5.1|jsonschema|" setup.py
      sed -i -e "s|.*python_version <.*||" setup.py
    '';
  };

  "execnet" = self: old:
  let
    version = with builtins; (parseDrvName old.name).version;
  in
  {
    patchPhase = ''
      sed -i -e "s|.*setup_requires=.*,.*||" setup.py
      sed -i -e "s|setup(|setup(version=\"${version}\",|" setup.py
    '';
  };

  "flake8" = self: old: {
    patchPhase = ''
      sed -i -e "s|setup_requires=\['pytest-runner'\],||" setup.py
    '';
  };

  "flake8-logging-format" = self: old: {
    patchPhase = ''
      sed -i -e "s|\"nose>=[0-9\.]*\"|\"\"|" setup.py
    '';
  };

  "flake8-mutable" = self: old: {
    patchPhase = ''
      sed -i -e "s|'pytest-runner'|'''|" setup.py
    '';
  };

  "jsonschema" = self: old: {
    patchPhase = ''
      sed -i -e 's|setup_requires=\["vcversioner[><=0-9\.]*"\],||' setup.py
    '';
  };

  "mccabe" = self: old: {
    patchPhase = ''
      sed -i -e "s|setup_requires=\['pytest-runner'\],||" setup.py
    '';
  };

  "pelican" = self: old: {
    # TODO: add this to every package
    LANG = "en_US.UTF-8";
    buildInputs = old.buildInputs ++ [ pkgs.glibcLocales ];
  };

  "pygal" = self: old: {
    patchPhase = ''
      sed -i -e "s|setup_requires=\['pytest-runner'\],||" setup.py
    '';
  };

  "pypiserver" = self: old: {
    patchPhase = ''
      sed -i -e "s|setup_requires *= \[.*|setup_requires=\[\]|" setup.py
    '';
  };

  "pytest" = self: old:
  let
    version = with builtins; (parseDrvName old.name).version;
  in
  {
    patchPhase = ''
      sed -i -e "s|.*setup_requires.*=.*,||" setup.py
      sed -i -e "s|setup(|setup(version=\"${version}\",|" setup.py
    '';
  };

  "pytest-django" = self: old:
  {
    patchPhase = ''
      sed -i -e "s|.*setup_requires.*=.*,||" setup.py
    '';
  };
  "pytest-forked" = self: old:
  {
    patchPhase = ''
      sed -i -e "s|setup_requires=\['setuptools_scm'\],||" setup.py
    '';
  };
  "pytest-xdist" = self: old:
  {
    patchPhase = ''
      sed -i -e "s|setup_requires=\['setuptools_scm'\],||" setup.py
    '';
  };

}

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
  removeDependencies = names: deps:
    with builtins; with pkgs.lib;
      filter
      (drv: all
        (suf:
          ! hasSuffix ("-" + suf)
          (parseDrvName drv.name).name
        )
        names
      )
      deps;

  combineCorrections = corrections: self: old:
    builtins.foldl'
    (updatedDerivation: correction: correction self updatedDerivation)
    old
    corrections;

  addBuildInputs = names: self: old: {
    buildInputs = old.buildInputs ++ builtins.map (name: self."${name}") names;
  };

in skipOverrides {

  "apipkg" = addBuildInputs ["setuptools-scm"];

  "clickclick" = addBuildInputs ["six" "flake8"];

  "connexion" = addBuildInputs ["flake8"];

  "execnet" = addBuildInputs ["setuptools-scm"];

  "flake8-codeclimate" = addBuildInputs ["setuptools-scm"];

  "flake8-logging-format" = addBuildInputs ["nose"];

  "flake8-mutable" = addBuildInputs ["pytest-runner"];

  "flake8-print" = addBuildInputs ["pytest-runner"];

  "gevent-socketio" = addBuildInputs ["versiontools"];

  "jsonschema" = addBuildInputs ["vcversioner"];

  "PasteDeploy" = addBuildInputs ["pytest-runner"];

  "pluggy" = addBuildInputs ["setuptools-scm"];

  "py" = addBuildInputs ["setuptools-scm"];

  "pygal" = addBuildInputs ["pytest-runner"];

  "pypiserver" = addBuildInputs ["setuptools-git"];

  "pytest" = addBuildInputs ["setuptools-scm"];

  "pytest-forked" = addBuildInputs ["setuptools-scm"];

  "pytest-xdist" = addBuildInputs ["setuptools-scm"];

  "python-dateutil" = addBuildInputs ["setuptools-scm"];

  "requestsexceptions" = addBuildInputs ["pbr"];

  "scipy" = self: old: {
     prePatch = ''
       rm scipy/linalg/tests/test_lapack.py
     '';
     preConfigure = ''
       sed -i '0,/from numpy.distutils.core/s//import setuptools;from numpy.distutils.core/' setup.py
     '';
     preBuild = ''
       echo "Creating site.cfg file..."
       cat << EOF > site.cfg
       [openblas]
       include_dirs = ${pkgs.openblasCompat}/include
       library_dirs = ${pkgs.openblasCompat}/lib
       EOF
     '';
     setupPyBuildFlags = [ "--fcompiler='gnu95'" ];
     passthru = {
       blas = pkgs.openblasCompat;
     };
  };

  "numpy" = self: old: {
      preConfigure = ''
        sed -i 's/-faltivec//' numpy/distutils/system_info.py
      '';
      preBuild = ''
        echo "Creating site.cfg file..."
        cat << EOF > site.cfg
        [openblas]
        include_dirs = ${pkgs.openblasCompat}/include
        library_dirs = ${pkgs.openblasCompat}/lib
        EOF
      '';
      passthru = {
        blas = pkgs.openblasCompat;
      };
  };

  "tox" = addBuildInputs ["setuptools-scm"];

}

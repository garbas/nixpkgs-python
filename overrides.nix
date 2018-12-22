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

in skipOverrides {

  "apipkg" = self: old: {
    buildInputs = old.buildInputs ++ [ self."setuptools-scm" ];
  };

  "clickclick" = self: old: {
    buildInputs = old.buildInputs ++ [ self."six" self."flake8" ];
  };

  "connexion" = self: old: {
    buildInputs = old.buildInputs ++ [ self."flake8" ];
  };

  "execnet" = self: old: {
    buildInputs = old.buildInputs ++ [ self."setuptools-scm" ];
  };

  "flake8-codeclimate" = self: old: {
    buildInputs = old.buildInputs ++ [ self."setuptools-scm" ];
  };

  "flake8-logging-format" = self: old: {
    buildInputs = old.buildInputs ++ [ self."nose" ];
  };

  "flake8-mutable" = self: old: {
    buildInputs = old.buildInputs ++ [ self."pytest-runner" ];
  };

  "flake8-print" = self: old: {
    buildInputs = old.buildInputs ++ [ self."pytest-runner" ];
  };

  "gevent-socketio" = self: old: {
    buildInputs = old.buildInputs ++ [ self."versiontools" ];
  };

  "jsonschema" = self: old: {
    buildInputs = old.buildInputs ++ [ self."vcversioner" ];
  };

  "PasteDeploy" = self: old: {
    buildInputs = old.buildInputs ++ [ self."pytest-runner" ];
  };

  "pluggy" = self: old: {
    buildInputs = old.buildInputs ++ [ self."setuptools-scm" ];
  };

  "pygal" = self: old: {
    buildInputs = old.buildInputs ++ [ self."pytest-runner" ];
  };

  "pypiserver" = self: old: {
    buildInputs = old.buildInputs ++ [ self."setuptools-git" ];
  };

  "pytest" = self: old: {
    buildInputs = old.buildInputs ++ [ self."setuptools-scm" ];
  };

  "pytest-forked" = self: old: {
    buildInputs = old.buildInputs ++ [ self."setuptools-scm" ];
  };

  "pytest-xdist" = self: old: {
    buildInputs = old.buildInputs ++ [ self."setuptools-scm" ];
  };

  "python-dateutil" = self: old: {
    buildInputs = old.buildInputs ++ [ self."setuptools-scm" ];
  };

  "requestsexceptions" = self: old: {
    buildInputs = old.buildInputs ++ [ self."pbr" ];
  };

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

  "tox" = self: old: {
    buildInputs = old.buildInputs ++ [ self."setuptools-scm" ];
  };

}

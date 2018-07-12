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

  "attrs" = self: old: {
    propagatedBuildInputs =
      removeDependencies [ "pytest" "Sphinx" ] old.propagatedBuildInputs;
  };

  "cryptography" = self: old: {
    propagatedBuildInputs =
      removeDependencies [ "Sphinx" ] old.propagatedBuildInputs;
  };

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

  "flake8-codeclimate" = self: old: {
    patchPhase = ''
      sed -i -e "s|'setuptools_scm',||" setup.py
    '';
  };

  "flake8-debugger" = self: old: {
    patchPhase = ''
      sed -i -e "s|'pytest-runner'|'''|" setup.py
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

  "flake8-print" = self: old: {
    patchPhase = ''
      sed -i -e "s|'pytest-runner'|'''|" setup.py
    '';
  };

  "gevent-socketio" = self: old: {
    patchPhase = ''
      sed -i -e "s|setup_requires=('versiontools >= 1.7'),||" setup.py
    '';
  };

  "hpack" = self: old: {
    patchPhase = ''
      rm -f README.rst HISTORY.rst
      touch README.rst
      touch HISTORY.rst
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
      postInstall = ''
        ln -s $out/bin/f2py* $out/bin/f2py
      '';
      passthru = {
        blas = pkgs.openblasCompat;
      };
   };

  "pelican" = self: old: {
    # TODO: add this to every package
    LANG = "en_US.UTF-8";
    buildInputs = old.buildInputs ++ [ pkgs.glibcLocales ];
  };

  "py" = self: old: {
    patchPhase = ''
      sed -i -e 's|setup_requires=\["setuptools-scm"\],||' setup.py
    '';
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

  "pyramid-who" = self: old: {
    patchPhase = ''
      rm -f CHANGES.txt
      touch CHANGES.txt
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

  "python-dateutil" = self: old:
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

  "python-magic" = self: old: {
    patchPhase = ''
      substituteInPlace magic.py --replace "ctypes.util.find_library('magic')" "'${pkgs.file}/lib/libmagic${pkgs.stdenv.hostPlatform.extensions.sharedLibrary}'"
    '';
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

  "tox" = self: old: {
    buildInputs = old.buildInputs ++ [self."setuptools-scm"];
    patchPhase = ''
      sed -i 's|"py >= 1.4.17, <2",|"py <2",|' setup.py
    '';
  };
}

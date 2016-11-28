{ pkgs, python }:

self: super: {

  "XBee" = python.overrideDerivation super."XBee" (old: {
    patchPhase = ''
      rm README.rst
      touch README.rst
    '';
  });

  "dweepy" = python.overrideDerivation super."dweepy" (old: {
    patchPhase = ''
      rm README.rst
      touch README.rst
    '';
  });

  "uber-rides" = python.overrideDerivation super."uber-rides" (old: {
    patchPhase = ''
      rm README.rst
      touch README.rst
    '';
  });

  "socketIO-client" = python.overrideDerivation super."socketIO-client" (old: {
    patchPhase = ''
      rm README.rst
      touch README.rst
    '';
  });

  "freesms" = python.overrideDerivation super."freesms" (old: {
    patchPhase = ''
      rm LICENSE
      touch LICENSE
    '';
  });

  "astral" = python.overrideDerivation super."astral" (old: {
    patchPhase = ''
      rm setup.cfg
    '';
  });

  "thingspeak" = python.overrideDerivation super."thingspeak" (old: {
    patchPhase = ''
      sed -i -e "s|fd.read()|'__version__ = \"${(builtins.parseDrvName old.name).version}\"'|" setup.py
    '';
  });

  "PyMata" = python.overrideDerivation super."PyMata" (old: {
    # XXX: we probably shouldn't do this
    patchPhase = ''
      sed -i -e "s|pyserial==2.7|pyserial|" setup.py
    '';
  });

  "fixerio" = python.overrideDerivation super."fixerio" (old: {
    # XXX: we probably shouldn't do this
    patchPhase = ''
      sed -i -e "s|requests==2.10.0|requests|" setup.py
    '';
  });

  "googlemaps" = python.overrideDerivation super."googlemaps" (old: {
    # XXX: we probably shouldn't do this
    patchPhase = ''
      sed -i -e "s|requests<=2.10.0|requests|" setup.py
    '';
  });

  "apcaccess" = python.overrideDerivation super."apcaccess" (old: {
    buildInputs = [ self."pytest-runner" ];
  });

  "async-timeout" = python.overrideDerivation super."async-timeout" (old: {
    buildInputs = [ self."pytest-runner" ];
  });

  "xbee-helper" = python.overrideDerivation super."xbee-helper" (old: {
    buildInputs = [ self."pytest-runner" ];
  });

  "mccabe" = python.overrideDerivation super."mccabe" (old: {
    buildInputs = [ self."pytest-runner" ];
  });

  "flake8" = python.overrideDerivation super."flake8" (old: {
    buildInputs = [ self."pytest-runner" ];
  });

  "keyrings.alt" = python.overrideDerivation super."keyrings.alt" (old: {
    buildInputs = [ self."setuptools-scm" ];
  });

  "keyring" = python.overrideDerivation super."keyring" (old: {
    buildInputs = [ self."setuptools-scm" ];
  });

  "pytest-runner" = python.overrideDerivation super."pytest-runner" (old: {
    buildInputs = [ self."setuptools-scm" ];
  });

  "incremental" = python.overrideDerivation super."incremental" (old: {
    propagatedNativeBuildInputs = [ self."click" ];
  });

  "anel-pwrctrl" = python.overrideDerivation super."anel-pwrctrl" (old: {
    propagatedNativeBuildInputs = [];
  });

}

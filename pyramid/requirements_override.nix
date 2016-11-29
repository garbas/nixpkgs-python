{ pkgs, python }:

self: super: {

  "marshmallow-validators" = python.overrideDerivation super."marshmallow-validators" (old: {
    patchPhase = ''
      rm README.rst
      touch README.rst
    '';
  });

  "pyramid-who" = python.overrideDerivation super."pyramid-who" (old: {
    patchPhase = ''
      rm CHANGES.txt
      touch CHANGES.txt
    '';
  });

  "pytest-mock" = python.overrideDerivation super."pytest-mock" (old: {
    buildInputs = old.buildInputs ++ [ self."setuptools-scm" ];
  });

  "gevent-socketio" = python.overrideDerivation super."gevent-socketio" (old: {
    buildInputs = old.buildInputs ++ [ self."versiontools" ];
  });

}

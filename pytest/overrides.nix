{ pkgs, python }:

self: super: {

  "parse-type" = python.overrideDerivation super."parse-type" (old: {
    patchPhase = ''
      sed -i \
        -e "s|\"enum34; python_version < '3.4'\",||" \
        -e "s|\"ordereddict; python_version < '2.7'\",||" \
          setup.py
    '';
  });

}

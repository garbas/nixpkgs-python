{ pkgs, python }:

self: super: {

  "attrs" = python.overrideDerivation super."attrs" (old: {
    propagatedNativeBuildInputs =
      builtins.filter
        (x: (builtins.parseDrvName x.name).name != "${python.__old.python.libPrefix}-${python.__old.python.libPrefix}-pytest")
        old.propagatedNativeBuildInputs;
  });

  "parse-type" = python.overrideDerivation super."parse-type" (old: {
    patchPhase = ''
      sed -i \
        -e "s|\"enum34; python_version < '3.4'\",||" \
        -e "s|\"ordereddict; python_version < '2.7'\",||" \
          setup.py
    '';
  });

}

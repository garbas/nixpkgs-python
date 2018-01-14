{ pkgs, python }:

self: super: {

  "attrs" = python.overrideDerivation super."attrs" (old: {
    propagatedNativeBuildInputs =
      builtins.filter
        (x: (builtins.parseDrvName x.name).name != "${python.__old.python.libPrefix}-${python.__old.python.libPrefix}-pytest")
        old.propagatedNativeBuildInputs;
  });

}

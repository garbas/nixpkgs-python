# generated using pypi2nix tool (version: 1.1.1)
#
# COMMAND:
#   pypi2nix -r django/requirements.txt
#

{ pkgs, python, commonBuildInputs ? [], commonDoCheck ? false }:

self: {

  "Django" = python.mkDerivation {
    name = "Django-1.9.7";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/50/76/aeb1bdde528b23e76df5964003e3e4e734c57c74e7358c3b2224987617dd/Django-1.9.7.tar.gz";
      md5= "7de9ba83bfe01f4b7d45645c1b259c83";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = {
      homepage = "";
      license = "BSD";
      description = "A high-level Python Web framework that encourages rapid development and clean, pragmatic design.";
    };
  };

}
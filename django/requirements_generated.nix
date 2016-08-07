# generated using pypi2nix tool (version: 1.4.0.dev0)
#
# COMMAND:
#   pypi2nix -v -V 3.5 -r requirements.txt
#

{ pkgs, python, commonBuildInputs ? [], commonDoCheck ? false }:

self: {

  "Django" = python.mkDerivation {
    name = "Django-1.10";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/18/5c/3cd8989b2226c55a1faf66f1a110e76cba6e6ca5d9dd15fb469fb636f378/Django-1.10.tar.gz";
      sha256= "46b868d68e5fd69dd9e05a0a7900df91786097e30b2aa6f065dd7fa3b22f7005";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.bsdOriginal;
      description = "A high-level Python Web framework that encourages rapid development and clean, pragmatic design.";
    };
  };

}
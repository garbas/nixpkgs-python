# generated using pypi2nix tool (version: 1.6.0)
#
# COMMAND:
#   pypi2nix -v -V 3.5 -r requirements.txt
#

{ pkgs, python, commonBuildInputs ? [], commonDoCheck ? false }:

self: {

  "Django" = python.mkDerivation {
    name = "Django-1.10.5";
    src = pkgs.fetchurl { url = "https://pypi.python.org/packages/c3/c2/6096bf5d0caa4e3d5b985ac72e3a0c795e37fa7407d6c85460b2a105b467/Django-1.10.5.tar.gz"; sha256 = "0db89374b691b9c8b057632a6cd64b18d08db2f4d63b4d4af6024267ab965f8b"; };
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
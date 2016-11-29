# generated using pypi2nix tool (version: 1.6.0)
#
# COMMAND:
#   pypi2nix -v -V 3.5 -r requirements.txt -s numpy -E gfortran -E blas
#

{ pkgs, python, commonBuildInputs ? [], commonDoCheck ? false }:

self: {

  "numpy" = python.mkDerivation {
    name = "numpy-1.11.2";
    src = pkgs.fetchurl { url = "https://pypi.python.org/packages/16/f5/b432f028134dd30cfbf6f21b8264a9938e5e0f75204e72453af08d67eb0b/numpy-1.11.2.tar.gz"; sha256 = "04db2fbd64e2e7c68e740b14402b25af51418fc43a59d9e54172b38b906b0f69"; };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.bsdOriginal;
      description = "NumPy: array processing for numbers, strings, records, and objects.";
    };
  };



  "scipy" = python.mkDerivation {
    name = "scipy-0.18.1";
    src = pkgs.fetchurl { url = "https://pypi.python.org/packages/22/41/b1538a75309ae4913cdbbdc8d1cc54cae6d37981d2759532c1aa37a41121/scipy-0.18.1.tar.gz"; sha256 = "8ab6e9c808bf2fb3e8576cd8cf07226d9cdc18b012c06d9708429a821ac6634e"; };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.bsdOriginal;
      description = "SciPy: Scientific Library for Python";
    };
  };

}
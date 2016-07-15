# generated using pypi2nix tool (version: 1.3.0dev)
#
# COMMAND:
#   pypi2nix -r science/requirements.txt -V 3.5 -E freetype libpng pkgconfig
#

{ pkgs, python, commonBuildInputs ? [], commonDoCheck ? false }:

self: {

  "Jinja2" = python.mkDerivation {
    name = "Jinja2-2.8";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/f2/2f/0b98b06a345a761bec91a079ccae392d282690c2d8272e708f4d10829e22/Jinja2-2.8.tar.gz";
      sha256= "bc1ff2ff88dbfacefde4ddde471d1417d3b304e8df103a7a9437d47269201bf4";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."MarkupSafe"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.bsdOriginal;
      description = "A small but fast and easy to use stand-alone template engine written in pure python.";
    };
    passthru.top_level = false;
  };



  "MarkupSafe" = python.mkDerivation {
    name = "MarkupSafe-0.23";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/c0/41/bae1254e0396c0cc8cf1751cb7d9afc90a602353695af5952530482c963f/MarkupSafe-0.23.tar.gz";
      sha256= "a4ec1aff59b95a14b45eb2e23761a0179e98319da5a7eb76b56ea8cdc7b871c3";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.bsdOriginal;
      description = "Implements a XML/HTML/XHTML Markup safe string for Python";
    };
    passthru.top_level = false;
  };



  "PyYAML" = python.mkDerivation {
    name = "PyYAML-3.11";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/75/5e/b84feba55e20f8da46ead76f14a3943c8cb722d40360702b2365b91dec00/PyYAML-3.11.tar.gz";
      sha256= "c36c938a872e5ff494938b33b14aaa156cb439ec67548fcab3535bb78b0846e8";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "YAML parser and emitter for Python";
    };
    passthru.top_level = false;
  };



  "Pygments" = python.mkDerivation {
    name = "Pygments-2.1.3";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/b8/67/ab177979be1c81bc99c8d0592ef22d547e70bb4c6815c383286ed5dec504/Pygments-2.1.3.tar.gz";
      sha256= "88e4c8a91b2af5962bfa5ea2447ec6dd357018e86e94c7d14bd8cacbc5b55d81";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.bsdOriginal;
      description = "Pygments is a syntax highlighting package written in Python.";
    };
    passthru.top_level = false;
  };



  "bokeh" = python.mkDerivation {
    name = "bokeh-0.12.0";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/45/c7/c0738637a16e4174ab7ec5f7f487786b9217846f1f2245358e368633682e/bokeh-0.12.0.tar.gz";
      sha256= "b8ec2f18929dc637c3e3b8971e5ebfdc472c19c7e323327557cdb28ddc5e61cf";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."Jinja2"
      self."PyYAML"
      self."numpy"
      self."python-dateutil"
      self."requests"
      self."six"
      self."tornado"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = "New BSD";
      description = "Statistical and novel interactive HTML plots for Python";
    };
    passthru.top_level = false;
  };



  "cycler" = python.mkDerivation {
    name = "cycler-0.10.0";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/c2/4b/137dea450d6e1e3d474e1d873cd1d4f7d3beed7e0dc973b06e8e10d32488/cycler-0.10.0.tar.gz";
      sha256= "cd7b2d1018258d7247a71425e9f26463dfb444d411c39569972f4ce586b0c9d8";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."six"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.bsdOriginal;
      description = "Composable style cycles";
    };
    passthru.top_level = false;
  };



  "decorator" = python.mkDerivation {
    name = "decorator-4.0.10";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/13/8a/4eed41e338e8dcc13ca41c94b142d4d20c0de684ee5065523fee406ce76f/decorator-4.0.10.tar.gz";
      sha256= "9c6e98edcb33499881b86ede07d9968c81ab7c769e28e9af24075f0a5379f070";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = "new BSD License";
      description = "Better living through Python with decorators";
    };
    passthru.top_level = false;
  };



  "ipython" = python.mkDerivation {
    name = "ipython-5.0.0";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/09/2e/870d1058768f5240062beb0bd2ff789ac689923501b0dd6b480fb83314fc/ipython-5.0.0.tar.gz";
      sha256= "7ec0737169c74056c7fc8298246db5478a2d6c90cfd19c3253222112357545df";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."Pygments"
      self."decorator"
      self."numpy"
      self."pexpect"
      self."pickleshare"
      self."prompt-toolkit"
      self."requests"
      self."simplegeneric"
      self."traitlets"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.bsdOriginal;
      description = "IPython: Productive Interactive Computing";
    };
    passthru.top_level = false;
  };



  "ipython-genutils" = python.mkDerivation {
    name = "ipython-genutils-0.1.0";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/71/b7/a64c71578521606edbbce15151358598f3dfb72a3431763edc2baf19e71f/ipython_genutils-0.1.0.tar.gz";
      sha256= "3a0624a251a26463c9dfa0ffa635ec51c4265380980d9a50d65611c3c2bd82a6";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.bsdOriginal;
      description = "Vestigial utilities from IPython";
    };
    passthru.top_level = false;
  };



  "mpmath" = python.mkDerivation {
    name = "mpmath-0.19";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/74/39/08b1b5c9848b498f922c7c92d31bb6edf00fe5a3bd87b04ebe1cc1d63948/mpmath-0.19.tar.gz";
      sha256= "68ddf6426dcda445323467d89892d2cffbbd1ae0b31ac1241b1b671749d63222";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.bsdOriginal;
      description = "Python library for arbitrary-precision floating-point arithmetic";
    };
    passthru.top_level = false;
  };



  "numpy" = python.mkDerivation {
    name = "numpy-1.11.1";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/e0/4c/515d7c4ac424ff38cc919f7099bf293dd064ba9a600e1e3835b3edefdb18/numpy-1.11.1.tar.gz";
      sha256= "dc4082c43979cc856a2bf352a8297ea109ccb3244d783ae067eb2ee5b0d577cd";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.bsdOriginal;
      description = "NumPy: array processing for numbers, strings, records, and objects.";
    };
    passthru.top_level = false;
  };



  "pandas" = python.mkDerivation {
    name = "pandas-0.18.1";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/11/09/e66eb844daba8680ddff26335d5b4fead77f60f957678243549a8dd4830d/pandas-0.18.1.tar.gz";
      sha256= "d2e483692c7915916dffd1b83256ea9761b4224c8d45646ceddf48b977ee77b2";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."numpy"
      self."python-dateutil"
      self."pytz"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.bsdOriginal;
      description = "Powerful data structures for data analysis, time series,and statistics";
    };
    passthru.top_level = false;
  };



  "pexpect" = python.mkDerivation {
    name = "pexpect-4.2.0";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/b3/7b/7b3659b9d7059d6d21e23b2464c5c84bffd4a34450cbf0ed19c9a8a4a52f/pexpect-4.2.0.tar.gz";
      sha256= "bf6816b8cc8d301a499e7adf338828b39bc7548eb64dbed4dd410ed93d95f853";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."ptyprocess"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = "ISC license";
      description = "Pexpect allows easy control of interactive console applications.";
    };
    passthru.top_level = false;
  };



  "pickleshare" = python.mkDerivation {
    name = "pickleshare-0.7.3";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/5d/29/5f3eb419067a98fe98d78a7e309fef03abceb2dc3e3587c88e2ca704ba20/pickleshare-0.7.3.tar.gz";
      sha256= "b9710d01f777b1bf3b69c8f889b1d05a5145668f79e980cbd0f849e059edd274";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "Tiny 'shelve'-like database with concurrency support";
    };
    passthru.top_level = false;
  };



  "prompt-toolkit" = python.mkDerivation {
    name = "prompt-toolkit-1.0.3";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/8d/de/412f23919929c01e6b55183e124623f705e4b91796d3d2dce2cb53d595ad/prompt_toolkit-1.0.3.tar.gz";
      sha256= "805e026f0cbad27467e93f9dd3e3777718d401a62788c1e84ca038e967ad8ba2";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."six"
      self."wcwidth"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = "";
      description = "Library for building powerful interactive command lines in Python";
    };
    passthru.top_level = false;
  };



  "ptyprocess" = python.mkDerivation {
    name = "ptyprocess-0.5.1";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/db/d7/b465161910f3d1cef593c5e002bff67e0384898f597f1a7fdc8db4c02bf6/ptyprocess-0.5.1.tar.gz";
      sha256= "0530ce63a9295bfae7bd06edc02b6aa935619f486f0f1dc0972f516265ee81a6";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = "";
      description = "Run a subprocess in a pseudo terminal";
    };
    passthru.top_level = false;
  };



  "pyparsing" = python.mkDerivation {
    name = "pyparsing-2.1.5";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/30/c3/a424fb888af373b54df495a0582379df374322caabd4f3a549bcca72aeeb/pyparsing-2.1.5.tar.gz";
      sha256= "b9ace99b581174d7ca98891a7bc57fd08892b94f17922645d90835f7b9b54a56";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "Python parsing module";
    };
    passthru.top_level = false;
  };



  "python-dateutil" = python.mkDerivation {
    name = "python-dateutil-2.5.3";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/3e/f5/aad82824b369332a676a90a8c0d1e608b17e740bbb6aeeebca726f17b902/python-dateutil-2.5.3.tar.gz";
      sha256= "1408fdb07c6a1fa9997567ce3fcee6a337b39a503d80699e0f213de4aa4b32ed";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."six"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = "Simplified BSD";
      description = "Extensions to the standard Python datetime module";
    };
    passthru.top_level = false;
  };



  "pytz" = python.mkDerivation {
    name = "pytz-2016.6.1";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/f7/c7/08e54702c74baf9d8f92d0bc331ecabf6d66a56f6d36370f0a672fc6a535/pytz-2016.6.1.tar.bz2";
      sha256= "b5aff44126cf828537581e534cc94299b223b945a2bb3b5434d37bf8c7f3a10c";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "World timezone definitions, modern and historical";
    };
    passthru.top_level = false;
  };



  "requests" = python.mkDerivation {
    name = "requests-2.10.0";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/49/6f/183063f01aae1e025cf0130772b55848750a2f3a89bfa11b385b35d7329d/requests-2.10.0.tar.gz";
      sha256= "63f1815788157130cee16a933b2ee184038e975f0017306d723ac326b5525b54";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.asl20;
      description = "Python HTTP for Humans.";
    };
    passthru.top_level = false;
  };



  "simplegeneric" = python.mkDerivation {
    name = "simplegeneric-0.8.1";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/3d/57/4d9c9e3ae9a255cd4e1106bb57e24056d3d0709fc01b2e3e345898e49d5b/simplegeneric-0.8.1.zip";
      sha256= "dc972e06094b9af5b855b3df4a646395e43d1c9d0d39ed345b7393560d0b9173";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.zpt21;
      description = "Simple generic functions (similar to Python's own len(), pickle.dump(), etc.)";
    };
    passthru.top_level = false;
  };



  "six" = python.mkDerivation {
    name = "six-1.10.0";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/b3/b2/238e2590826bfdd113244a40d9d3eb26918bd798fc187e2360a8367068db/six-1.10.0.tar.gz";
      sha256= "105f8d68616f8248e24bf0e9372ef04d3cc10104f1980f54d57b2ce73a5ad56a";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "Python 2 and 3 compatibility utilities";
    };
    passthru.top_level = false;
  };



  "sympy" = python.mkDerivation {
    name = "sympy-1.0";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/f3/ae/585ca7545c7e8d3a8130cc3d0cf53cfa489c137f8257e743fd3e18d7c401/sympy-1.0.tar.gz";
      sha256= "3eacd210d839e4db911d216a9258a3ac6f936992f66db211e22767983297ffae";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."mpmath"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.bsdOriginal;
      description = "Computer algebra system (CAS) in Python";
    };
    passthru.top_level = false;
  };



  "tornado" = python.mkDerivation {
    name = "tornado-4.4";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/8b/01/e7b4bcee946b356060639582fa71946130b5fe5ab0d0557c4340275f2dff/tornado-4.4.tar.gz";
      sha256= "3176545b6cb2966870db4def4f646da6ab7a0c19400576969c57279a7561ab02";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = "http://www.apache.org/licenses/LICENSE-2.0";
      description = "Tornado is a Python web framework and asynchronous networking library, originally developed at FriendFeed.";
    };
    passthru.top_level = false;
  };



  "traitlets" = python.mkDerivation {
    name = "traitlets-4.2.2";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/a4/07/9b7636322c152ab1dacae9d38131067523d6ce5ca926a656586f6f947e77/traitlets-4.2.2.tar.gz";
      sha256= "7d7e3070484b2fe490fa55e0acf7023afc5ed9ddabec57405f25c355158e152a";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
      self."decorator"
      self."ipython-genutils"
    ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.bsdOriginal;
      description = "Traitlets Python config system";
    };
    passthru.top_level = false;
  };



  "wcwidth" = python.mkDerivation {
    name = "wcwidth-0.1.7";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/55/11/e4a2bb08bb450fdbd42cc709dd40de4ed2c472cf0ccb9e64af22279c5495/wcwidth-0.1.7.tar.gz";
      sha256= "3df37372226d6e63e1b1e1eda15c594bca98a22d33a23832a90998faa96bc65e";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = with pkgs.stdenv.lib; {
      homepage = "";
      license = licenses.mit;
      description = "Measures number of Terminal column cells of wide-character codes";
    };
    passthru.top_level = false;
  };

}
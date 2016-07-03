# generated using pypi2nix tool (version: 1.1.1)
#
# COMMAND:
#   pypi2nix -r scipy/requirements.txt -E freetype libpng pkgconfig
#

{ pkgs, python, commonBuildInputs ? [], commonDoCheck ? false }:

self: {

  "Jinja2" = python.mkDerivation {
    name = "Jinja2-2.8";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/f2/2f/0b98b06a345a761bec91a079ccae392d282690c2d8272e708f4d10829e22/Jinja2-2.8.tar.gz";
      md5= "edb51693fe22c53cee5403775c71a99e";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
    self."MarkupSafe"
  ];
    meta = {
      homepage = "";
      license = "BSD";
      description = "A small but fast and easy to use stand-alone template engine written in pure python.";
    };
  };



  "MarkupSafe" = python.mkDerivation {
    name = "MarkupSafe-0.23";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/c0/41/bae1254e0396c0cc8cf1751cb7d9afc90a602353695af5952530482c963f/MarkupSafe-0.23.tar.gz";
      md5= "f5ab3deee4c37cd6a922fb81e730da6e";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = {
      homepage = "";
      license = "BSD";
      description = "Implements a XML/HTML/XHTML Markup safe string for Python";
    };
  };



  "PyYAML" = python.mkDerivation {
    name = "PyYAML-3.11";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/04/60/abfb3a665ee0569b60c89148b7187ddd8a36cb65e254fba945ae1315645d/PyYAML-3.11.zip";
      md5= "89cbc92cda979042533b640b76e6e055";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = {
      homepage = "";
      license = "lib.mit";
      description = "YAML parser and emitter for Python";
    };
  };



  "backports-abc" = python.mkDerivation {
    name = "backports-abc-0.4";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/f5/d0/1d02695c0dd4f0cf01a35c03087c22338a4f72e24e2865791ebdb7a45eac/backports_abc-0.4.tar.gz";
      md5= "0b65a216ce9dc9c1a7e20a729dd7c05b";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = {
      homepage = "";
      license = "";
      description = "A backport of recent additions to the 'collections.abc' module.";
    };
  };



  "backports.shutil-get-terminal-size" = python.mkDerivation {
    name = "backports.shutil-get-terminal-size-1.0.0";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/ec/9c/368086faa9c016efce5da3e0e13ba392c9db79e3ab740b763fe28620b18b/backports.shutil_get_terminal_size-1.0.0.tar.gz";
      md5= "03267762480bd86b50580dc19dff3c66";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = {
      homepage = "";
      license = "lib.mit";
      description = "A backport of the get_terminal_size function from Python 3.3's shutil.";
    };
  };



  "backports.ssl-match-hostname" = python.mkDerivation {
    name = "backports.ssl-match-hostname-3.5.0.1";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/76/21/2dc61178a2038a5cb35d14b61467c6ac632791ed05131dda72c20e7b9e23/backports.ssl_match_hostname-3.5.0.1.tar.gz";
      md5= "c03fc5e2c7b3da46b81acf5cbacfe1e6";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = {
      homepage = "";
      license = "Python Software Foundation License";
      description = "The ssl.match_hostname() function from Python 3.5";
    };
  };



  "bokeh" = python.mkDerivation {
    name = "bokeh-0.12.0";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/45/c7/c0738637a16e4174ab7ec5f7f487786b9217846f1f2245358e368633682e/bokeh-0.12.0.tar.gz";
      md5= "7c50e4a4afc42c240a04184587344078";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
    self."Jinja2"
    self."PyYAML"
    self."futures"
    self."numpy"
    self."python-dateutil"
    self."requests"
    self."six"
    self."tornado"
  ];
    meta = {
      homepage = "";
      license = "New BSD";
      description = "Statistical and novel interactive HTML plots for Python";
    };
  };



  "certifi" = python.mkDerivation {
    name = "certifi-2016.2.28";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/5c/f8/f6c54727c74579c6bbe5926f5deb9677c5810a33e11da58d1a4e2d09d041/certifi-2016.2.28.tar.gz";
      md5= "5d672aa766e1f773c75cfeccd02d3650";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = {
      homepage = "";
      license = "ISC";
      description = "Python package for providing Mozilla's CA Bundle.";
    };
  };



  "cycler" = python.mkDerivation {
    name = "cycler-0.10.0";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/c2/4b/137dea450d6e1e3d474e1d873cd1d4f7d3beed7e0dc973b06e8e10d32488/cycler-0.10.0.tar.gz";
      md5= "4cb42917ac5007d1cdff6cccfe2d016b";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
    self."six"
  ];
    meta = {
      homepage = "";
      license = "BSD";
      description = "Composable style cycles";
    };
  };



  "decorator" = python.mkDerivation {
    name = "decorator-4.0.10";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/13/8a/4eed41e338e8dcc13ca41c94b142d4d20c0de684ee5065523fee406ce76f/decorator-4.0.10.tar.gz";
      md5= "434b57fdc3230c500716c5aff8896100";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = {
      homepage = "";
      license = "new BSD License";
      description = "Better living through Python with decorators";
    };
  };



  "futures" = python.mkDerivation {
    name = "futures-3.0.5";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/55/db/97c1ca37edab586a1ae03d6892b6633d8eaa23b23ac40c7e5bbc55423c78/futures-3.0.5.tar.gz";
      md5= "ced2c365e518242512d7a398b515ff95";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = {
      homepage = "";
      license = "BSD";
      description = "Backport of the concurrent.futures package from Python 3.2";
    };
  };



  "ipython" = python.mkDerivation {
    name = "ipython-4.2.1";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/24/94/a38aebdeb696e03dc4b8a4d3243c8ae4a5ab232a00ed590c74ad063412f2/ipython-4.2.1.tar.gz";
      md5= "f86f4fe7a80997704294383ea775627d";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
    self."backports.shutil-get-terminal-size"
    self."decorator"
    self."pexpect"
    self."pickleshare"
    self."requests"
    self."simplegeneric"
    self."traitlets"
  ];
    meta = {
      homepage = "";
      license = "BSD";
      description = "IPython: Productive Interactive Computing";
    };
  };



  "ipython-genutils" = python.mkDerivation {
    name = "ipython-genutils-0.1.0";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/71/b7/a64c71578521606edbbce15151358598f3dfb72a3431763edc2baf19e71f/ipython_genutils-0.1.0.tar.gz";
      md5= "9a8afbe0978adbcbfcb3b35b2d015a56";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = {
      homepage = "";
      license = "BSD";
      description = "Vestigial utilities from IPython";
    };
  };



  "matplotlib" = python.mkDerivation {
    name = "matplotlib-1.5.1";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/8f/f4/c0c7e81f64d5f4d36e52e393af687f28882c53dcd924419d684dc9859f40/matplotlib-1.5.1.tar.gz";
      md5= "f51847d8692cb63df64cd0bd0304fd20";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
    self."cycler"
    self."numpy"
    self."pyparsing"
    self."python-dateutil"
    self."pytz"
  ];
    meta = {
      homepage = "";
      license = "BSD";
      description = "Python plotting package";
    };
  };



  "mpmath" = python.mkDerivation {
    name = "mpmath-0.19";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/74/39/08b1b5c9848b498f922c7c92d31bb6edf00fe5a3bd87b04ebe1cc1d63948/mpmath-0.19.tar.gz";
      md5= "af5cc956b2673b33a25c3e57299bae7b";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = {
      homepage = "";
      license = "BSD";
      description = "Python library for arbitrary-precision floating-point arithmetic";
    };
  };



  "numpy" = python.mkDerivation {
    name = "numpy-1.11.1";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/dd/9f/cd0ec9c50e4ed8650901ad4afde164e5252b6182a9e0c7bff5f8b4441960/numpy-1.11.1.zip";
      md5= "5caa3428b24aaa07e72c79d115140e46";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = {
      homepage = "";
      license = "BSD";
      description = "NumPy: array processing for numbers, strings, records, and objects.";
    };
  };



  "pathlib2" = python.mkDerivation {
    name = "pathlib2-2.1.0";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/c9/27/8448b10d8440c08efeff0794adf7d0ed27adb98372c70c7b38f3947d4749/pathlib2-2.1.0.tar.gz";
      md5= "38e4f58b4d69dfcb9edb49a54a8b28d2";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
    self."six"
  ];
    meta = {
      homepage = "";
      license = "lib.mit";
      description = "Object-oriented filesystem paths";
    };
  };



  "pexpect" = python.mkDerivation {
    name = "pexpect-4.1.0";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/56/2b/9c9c113fb88082950067a42cc99e3c61f1df72035f89bb0bdf0a60308ca0/pexpect-4.1.0.tar.gz";
      md5= "562a1a21f2a60b36dfd5d906dbf0943e";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
    self."ptyprocess"
  ];
    meta = {
      homepage = "";
      license = "ISC license";
      description = "Pexpect allows easy control of interactive console applications.";
    };
  };



  "pickleshare" = python.mkDerivation {
    name = "pickleshare-0.7.2";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/ad/69/bcf0c55ded3779e6e1c9460c69854678d4b78f08482449caaf8e82d5f8eb/pickleshare-0.7.2.tar.gz";
      md5= "29d74cde0255546b6b2e1b48a0b31a54";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
    self."pathlib2"
  ];
    meta = {
      homepage = "";
      license = "lib.mit";
      description = "Tiny 'shelve'-like database with concurrency support";
    };
  };



  "ptyprocess" = python.mkDerivation {
    name = "ptyprocess-0.5.1";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/db/d7/b465161910f3d1cef593c5e002bff67e0384898f597f1a7fdc8db4c02bf6/ptyprocess-0.5.1.tar.gz";
      md5= "94e537122914cc9ec9c1eadcd36e73a1";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = {
      homepage = "";
      license = "";
      description = "Run a subprocess in a pseudo terminal";
    };
  };



  "pyparsing" = python.mkDerivation {
    name = "pyparsing-2.1.5";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/30/c3/a424fb888af373b54df495a0582379df374322caabd4f3a549bcca72aeeb/pyparsing-2.1.5.tar.gz";
      md5= "28d0c3cf39ee5859d408d2b4d311a9c2";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = {
      homepage = "";
      license = "MIT License";
      description = "Python parsing module";
    };
  };



  "python-dateutil" = python.mkDerivation {
    name = "python-dateutil-2.5.3";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/3e/f5/aad82824b369332a676a90a8c0d1e608b17e740bbb6aeeebca726f17b902/python-dateutil-2.5.3.tar.gz";
      md5= "05ffc6d2cc85a7fd93bb245807f715ef";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
    self."six"
  ];
    meta = {
      homepage = "";
      license = "Simplified BSD";
      description = "Extensions to the standard Python datetime module";
    };
  };



  "pytz" = python.mkDerivation {
    name = "pytz-2016.4";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/6c/4a/eb896a5629813b56f5a79cc6b7f5551598f27f1eea6c00c68b47541c1501/pytz-2016.4.zip";
      md5= "eeb649e63d56fac3566a3fefaa35c7fa";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = {
      homepage = "";
      license = "lib.mit";
      description = "World timezone definitions, modern and historical";
    };
  };



  "requests" = python.mkDerivation {
    name = "requests-2.10.0";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/49/6f/183063f01aae1e025cf0130772b55848750a2f3a89bfa11b385b35d7329d/requests-2.10.0.tar.gz";
      md5= "a36f7a64600f1bfec4d55ae021d232ae";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = {
      homepage = "";
      license = "lib.asl20";
      description = "Python HTTP for Humans.";
    };
  };



  "simplegeneric" = python.mkDerivation {
    name = "simplegeneric-0.8.1";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/3d/57/4d9c9e3ae9a255cd4e1106bb57e24056d3d0709fc01b2e3e345898e49d5b/simplegeneric-0.8.1.zip";
      md5= "f9c1fab00fd981be588fc32759f474e3";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = {
      homepage = "";
      license = "lib.zpt21";
      description = "Simple generic functions (similar to Python's own len(), pickle.dump(), etc.)";
    };
  };



  "singledispatch" = python.mkDerivation {
    name = "singledispatch-3.4.0.3";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/d9/e9/513ad8dc17210db12cb14f2d4d190d618fb87dd38814203ea71c87ba5b68/singledispatch-3.4.0.3.tar.gz";
      md5= "af2fc6a3d6cc5a02d0bf54d909785fcb";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
    self."six"
  ];
    meta = {
      homepage = "";
      license = "lib.mit";
      description = "This library brings functools.singledispatch from Python 3.4 to Python 2.6-3.3.";
    };
  };



  "six" = python.mkDerivation {
    name = "six-1.10.0";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/b3/b2/238e2590826bfdd113244a40d9d3eb26918bd798fc187e2360a8367068db/six-1.10.0.tar.gz";
      md5= "34eed507548117b2ab523ab14b2f8b55";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [ ];
    meta = {
      homepage = "";
      license = "lib.mit";
      description = "Python 2 and 3 compatibility utilities";
    };
  };



  "sympy" = python.mkDerivation {
    name = "sympy-1.0";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/f3/ae/585ca7545c7e8d3a8130cc3d0cf53cfa489c137f8257e743fd3e18d7c401/sympy-1.0.tar.gz";
      md5= "43e797de799f00f9e8fd2307dba9fab1";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
    self."mpmath"
  ];
    meta = {
      homepage = "";
      license = "BSD";
      description = "Computer algebra system (CAS) in Python";
    };
  };



  "tornado" = python.mkDerivation {
    name = "tornado-4.3";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/21/29/e64c97013e97d42d93b3d5997234a6f17455f3744847a7c16289289f8fa6/tornado-4.3.tar.gz";
      md5= "d13a99dc0b60ba69f5f8ec1235e5b232";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
    self."backports-abc"
    self."backports.ssl-match-hostname"
    self."certifi"
    self."singledispatch"
  ];
    meta = {
      homepage = "";
      license = "http://www.apache.org/licenses/LICENSE-2.0";
      description = "Tornado is a Python web framework and asynchronous networking library, originally developed at FriendFeed.";
    };
  };



  "traitlets" = python.mkDerivation {
    name = "traitlets-4.2.2";
    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/27/62/c6906577a9a87e576941fa3c089c4254e92190c7524327af0e72b8ee165f/traitlets-4.2.2.zip";
      md5= "b0da7131d974ab487f5eb5750d15338e";
    };
    doCheck = commonDoCheck;
    buildInputs = commonBuildInputs;
    propagatedBuildInputs = [
    self."decorator"
    self."ipython-genutils"
  ];
    meta = {
      homepage = "";
      license = "BSD";
      description = "Traitlets Python config system";
    };
  };

}
# generated using pypi2nix tool (version: 1.8.0)
# See more at: https://github.com/garbas/pypi2nix
#
# COMMAND:
#   pypi2nix -v -V 3.5 --setup-requires six packaging appdirs -r requirements.txt -O ../overrides.nix
#

{ pkgs ? import <nixpkgs> {}
}:

let

  inherit (pkgs) makeWrapper;
  inherit (pkgs.stdenv.lib) fix' extends inNixShell;

  pythonPackages =
  import "${toString pkgs.path}/pkgs/top-level/python-packages.nix" {
    inherit pkgs;
    inherit (pkgs) stdenv;
    python = pkgs.python35;
    # patching pip so it does not try to remove files when running nix-shell
    overrides =
      self: super: {
        bootstrapped-pip = super.bootstrapped-pip.overrideDerivation (old: {
          patchPhase = old.patchPhase + ''
            sed -i               -e "s|paths_to_remove.remove(auto_confirm)|#paths_to_remove.remove(auto_confirm)|"                -e "s|self.uninstalled = paths_to_remove|#self.uninstalled = paths_to_remove|"                  $out/${pkgs.python35.sitePackages}/pip/req/req_install.py
          '';
        });
      };
  };

  commonBuildInputs = [];
  commonDoCheck = false;

  withPackages = pkgs':
    let
      pkgs = builtins.removeAttrs pkgs' ["__unfix__"];
      interpreter = pythonPackages.buildPythonPackage {
        name = "python35-interpreter";
        buildInputs = [ makeWrapper ] ++ (builtins.attrValues pkgs);
        buildCommand = ''
          mkdir -p $out/bin
          ln -s ${pythonPackages.python.interpreter}               $out/bin/${pythonPackages.python.executable}
          for dep in ${builtins.concatStringsSep " "               (builtins.attrValues pkgs)}; do
            if [ -d "$dep/bin" ]; then
              for prog in "$dep/bin/"*; do
                if [ -f $prog ]; then
                  ln -s $prog $out/bin/`basename $prog`
                fi
              done
            fi
          done
          for prog in "$out/bin/"*; do
            wrapProgram "$prog" --prefix PYTHONPATH : "$PYTHONPATH"
          done
          pushd $out/bin
          ln -s ${pythonPackages.python.executable} python
          popd
        '';
        passthru.interpreter = pythonPackages.python;
      };
    in {
      __old = pythonPackages;
      inherit interpreter;
      mkDerivation = pythonPackages.buildPythonPackage;
      packages = pkgs;
      overrideDerivation = drv: f:
        pythonPackages.buildPythonPackage (drv.drvAttrs // f drv.drvAttrs);
      withPackages = pkgs'':
        withPackages (pkgs // pkgs'');
    };

  python = withPackages {};

  generated = self: {

    "Flask" = python.mkDerivation {
      name = "Flask-0.12.2";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/eb/12/1c7bd06fcbd08ba544f25bf2c6612e305a70ea51ca0eda8007344ec3f123/Flask-0.12.2.tar.gz"; sha256 = "49f44461237b69ecd901cc7ce66feea0319b9158743dd27a2899962ab214dac1"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Jinja2"
      self."Werkzeug"
      self."click"
      self."itsdangerous"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://github.com/pallets/flask/";
        license = licenses.bsdOriginal;
        description = "A microframework based on Werkzeug, Jinja2 and good intentions";
      };
    };



    "Flask-Cache" = python.mkDerivation {
      name = "Flask-Cache-0.13.1";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/91/c4/f71095437bd4b691c63f240e72a20c57e2c216085cbc271f79665885d3da/Flask-Cache-0.13.1.tar.gz"; sha256 = "90126ca9bc063854ef8ee276e95d38b2b4ec8e45fd77d5751d37971ee27c7ef4"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Flask"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://github.com/thadeusb/flask-cache";
        license = licenses.bsdOriginal;
        description = "Adds cache support to your Flask application";
      };
    };



    "Flask-Cors" = python.mkDerivation {
      name = "Flask-Cors-3.0.2";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/1d/ea/86765a4ae667b4517dc16ef0fc8dd632ca3ea56ef419c4a6de31e715324e/Flask-Cors-3.0.2.tar.gz"; sha256 = "0a09f3559ded4759387dfa2a355de59bc161f67269a1f4b7b0712a64b1f7dad6"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Flask"
      self."six"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/corydolphin/flask-cors";
        license = licenses.mit;
        description = "A Flask extension adding a decorator for CORS support";
      };
    };



    "Flask-Login" = python.mkDerivation {
      name = "Flask-Login-0.4.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/70/96/20cae731ef27084dcb183f3a6e3073d0232f10c1fd7be76729bd7bd4b994/Flask-Login-0.4.0.tar.gz"; sha256 = "d25e356b14a59f52da0ab30c31c2ad285fa23a840f0f6971df7ed247c77082a7"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Flask"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/maxcountryman/flask-login";
        license = licenses.mit;
        description = "User session management for Flask";
      };
    };



    "Flask-SQLAlchemy" = python.mkDerivation {
      name = "Flask-SQLAlchemy-2.2";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/15/f0/0c90391352db8244321e22604d93cb6a4e3c538e9ab512b35ee5359b8d74/Flask-SQLAlchemy-2.2.tar.gz"; sha256 = "f0d8241efba723d7b878f73550f5d3c0fbb042416123b52b36640b7491fa208b"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Flask"
      self."SQLAlchemy"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://github.com/mitsuhiko/flask-sqlalchemy";
        license = licenses.bsdOriginal;
        description = "Adds SQLAlchemy support to your Flask application";
      };
    };



    "Jinja2" = python.mkDerivation {
      name = "Jinja2-2.9.6";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/90/61/f820ff0076a2599dd39406dcb858ecb239438c02ce706c8e91131ab9c7f1/Jinja2-2.9.6.tar.gz"; sha256 = "ddaa01a212cd6d641401cb01b605f4a4d9f37bfc93043d7f760ec70fb99ff9ff"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."MarkupSafe"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://jinja.pocoo.org/";
        license = licenses.bsdOriginal;
        description = "A small but fast and easy to use stand-alone template engine written in pure python.";
      };
    };



    "MarkupSafe" = python.mkDerivation {
      name = "MarkupSafe-1.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/4d/de/32d741db316d8fdb7680822dd37001ef7a448255de9699ab4bfcbdf4172b/MarkupSafe-1.0.tar.gz"; sha256 = "a6be69091dac236ea9c6bc7d012beab42010fa914c459791d627dad4910eb665"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://github.com/pallets/markupsafe";
        license = licenses.bsdOriginal;
        description = "Implements a XML/HTML/XHTML Markup safe string for Python";
      };
    };



    "PyYAML" = python.mkDerivation {
      name = "PyYAML-3.12";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/4a/85/db5a2df477072b2902b0eb892feb37d88ac635d36245a72a6a69b23b383a/PyYAML-3.12.tar.gz"; sha256 = "592766c6303207a20efc445587778322d7f73b161bd994f227adaa341ba212ab"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://pyyaml.org/wiki/PyYAML";
        license = licenses.mit;
        description = "YAML parser and emitter for Python";
      };
    };



    "SQLAlchemy" = python.mkDerivation {
      name = "SQLAlchemy-1.1.10";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/a7/8c/cc24b9794ffa87506aedf528ba3a236e11cc537f81a1e3b52193e5e948cd/SQLAlchemy-1.1.10.tar.gz"; sha256 = "dbd92b8af2306d600efa98ed36262d73aad227440a758c8dc3a067ca30096bd3"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://www.sqlalchemy.org";
        license = licenses.mit;
        description = "Database Abstraction Library";
      };
    };



    "Werkzeug" = python.mkDerivation {
      name = "Werkzeug-0.12.2";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/56/41/c095a77eb2dd69bf278dd664a97d3416af04e9ba1a00b8c138f772741d31/Werkzeug-0.12.2.tar.gz"; sha256 = "903a7b87b74635244548b30d30db4c8947fe64c5198f58899ddcd3a13c23bb26"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://werkzeug.pocoo.org/";
        license = licenses.bsdOriginal;
        description = "The Swiss Army knife of Python web development";
      };
    };



    "certifi" = python.mkDerivation {
      name = "certifi-2017.4.17";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/dd/0e/1e3b58c861d40a9ca2d7ea4ccf47271d4456ae4294c5998ad817bd1b4396/certifi-2017.4.17.tar.gz"; sha256 = "f7527ebf7461582ce95f7a9e03dd141ce810d40590834f4ec20cddd54234c10a"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://certifi.io/";
        license = "ISC";
        description = "Python package for providing Mozilla's CA Bundle.";
      };
    };



    "chardet" = python.mkDerivation {
      name = "chardet-3.0.3";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/fc/f9/3963ae8e196ceb4a09e0d7906f511fdf62a631f05d9288dc4905a93a1f52/chardet-3.0.3.tar.gz"; sha256 = "77df6d712a6037ed6f247ad1dd67faca506f64bc1295d43533e9212a101f28cb"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/chardet/chardet";
        license = licenses.lgpl2;
        description = "Universal encoding detector for Python 2 and 3";
      };
    };



    "click" = python.mkDerivation {
      name = "click-6.7";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/95/d9/c3336b6b5711c3ab9d1d3a80f1a3e2afeb9d8c02a7166462f6cc96570897/click-6.7.tar.gz"; sha256 = "f15516df478d5a56180fbf80e68f206010e6d160fc39fa508b65e035fd75130b"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://github.com/mitsuhiko/click";
        license = licenses.bsdOriginal;
        description = "A simple wrapper around optparse for powerful command line utilities.";
      };
    };



    "clickclick" = python.mkDerivation {
      name = "clickclick-1.2.1";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/6f/46/28462eb039bbce3651084d5260c50ab83dc3af0724626e6a81c93d950b2c/clickclick-1.2.1.tar.gz"; sha256 = "22eedfce2499d7a8c5b8c868fc93a495eb74bf7b753a6cb9ed2aa6a32a3ddd05"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."PyYAML"
      self."click"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/zalando/python-clickclick";
        license = licenses.asl20;
        description = "Click utility functions";
      };
    };



    "connexion" = python.mkDerivation {
      name = "connexion-1.1.10";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/07/91/69f9478fd12bf13cc959f5d8e040c024d10259ba0d340ff67080117c4836/connexion-1.1.10.tar.gz"; sha256 = "78f8bf54b95ec302003aa53955e783d14af6f22dd25f86b5e8a7dec05fd99af3"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Flask"
      self."PyYAML"
      self."clickclick"
      self."inflection"
      self."jsonschema"
      self."requests"
      self."six"
      self."swagger-spec-validator"
      self."typing"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/zalando/connexion";
        license = licenses.asl20;
        description = "Connexion - API first applications with OpenAPI/Swagger and Flask";
      };
    };



    "idna" = python.mkDerivation {
      name = "idna-2.5";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/d8/82/28a51052215014efc07feac7330ed758702fc0581347098a81699b5281cb/idna-2.5.tar.gz"; sha256 = "3cb5ce08046c4e3a560fc02f138d0ac63e00f8ce5901a56b32ec8b7994082aab"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/kjd/idna";
        license = licenses.bsdOriginal;
        description = "Internationalized Domain Names in Applications (IDNA)";
      };
    };



    "inflection" = python.mkDerivation {
      name = "inflection-0.3.1";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/d5/35/a6eb45b4e2356fe688b21570864d4aa0d0a880ce387defe9c589112077f8/inflection-0.3.1.tar.gz"; sha256 = "18ea7fb7a7d152853386523def08736aa8c32636b047ade55f7578c4edeb16ca"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://github.com/jpvanhal/inflection";
        license = licenses.mit;
        description = "A port of Ruby on Rails inflector to Python";
      };
    };



    "itsdangerous" = python.mkDerivation {
      name = "itsdangerous-0.24";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/dc/b4/a60bcdba945c00f6d608d8975131ab3f25b22f2bcfe1dab221165194b2d4/itsdangerous-0.24.tar.gz"; sha256 = "cbb3fcf8d3e33df861709ecaf89d9e6629cff0a217bc2848f1b41cd30d360519"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://github.com/mitsuhiko/itsdangerous";
        license = licenses.bsdOriginal;
        description = "Various helpers to pass trusted data to untrusted environments and back.";
      };
    };



    "jsonschema" = python.mkDerivation {
      name = "jsonschema-2.6.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/58/b9/171dbb07e18c6346090a37f03c7e74410a1a56123f847efed59af260a298/jsonschema-2.6.0.tar.gz"; sha256 = "6ff5f3180870836cae40f06fa10419f557208175f13ad7bc26caa77beb1f6e02"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://github.com/Julian/jsonschema";
        license = licenses.mit;
        description = "An implementation of JSON Schema validation for Python";
      };
    };



    "requests" = python.mkDerivation {
      name = "requests-2.16.5";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/de/4c/7c36954d002030c82df31d000338d40fd91b4a993941a8f3c2dbe523c749/requests-2.16.5.tar.gz"; sha256 = "f717303ebff661099cc5b73ce723ae1246f19ac39faa4c8005be56744d1a1006"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."certifi"
      self."chardet"
      self."idna"
      self."urllib3"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://python-requests.org";
        license = licenses.asl20;
        description = "Python HTTP for Humans.";
      };
    };



    "six" = python.mkDerivation {
      name = "six-1.10.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/b3/b2/238e2590826bfdd113244a40d9d3eb26918bd798fc187e2360a8367068db/six-1.10.0.tar.gz"; sha256 = "105f8d68616f8248e24bf0e9372ef04d3cc10104f1980f54d57b2ce73a5ad56a"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://pypi.python.org/pypi/six/";
        license = licenses.mit;
        description = "Python 2 and 3 compatibility utilities";
      };
    };



    "swagger-spec-validator" = python.mkDerivation {
      name = "swagger-spec-validator-2.1.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/e3/2f/3767da696617ee72190361805dff4bca68a611d4673de848857654789534/swagger-spec-validator-2.1.0.tar.gz"; sha256 = "dc9219c6572ce0def6e1c160ca253c0e7fcde75812628f0c0199334f85bd138e"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."jsonschema"
      self."six"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://github.com/Yelp/swagger_spec_validator";
        license = licenses.asl20;
        description = "Validation of Swagger specifications";
      };
    };



    "typing" = python.mkDerivation {
      name = "typing-3.6.1";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/17/75/3698d7992a828ad6d7be99c0a888b75ed173a9280e53dbae67326029b60e/typing-3.6.1.tar.gz"; sha256 = "c36dec260238e7464213dcd50d4b5ef63a507972f5780652e835d0228d0edace"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://docs.python.org/3/library/typing.html";
        license = licenses.psfl;
        description = "Type Hints for Python";
      };
    };



    "urllib3" = python.mkDerivation {
      name = "urllib3-1.21.1";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/96/d9/40e4e515d3e17ed0adbbde1078e8518f8c4e3628496b56eb8f026a02b9e4/urllib3-1.21.1.tar.gz"; sha256 = "b14486978518ca0901a76ba973d7821047409d7f726f22156b24e83fd71382a5"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."certifi"
      self."idna"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://urllib3.readthedocs.io/";
        license = licenses.mit;
        description = "HTTP library with thread-safe connection pooling, file post, and more.";
      };
    };

  };
  overrides = import ./requirements_override.nix { inherit pkgs python; };
  commonOverrides = [
    (import ../overrides.nix { inherit pkgs python ; })
  ];

in python.withPackages
   (fix' (pkgs.lib.fold
            extends
            generated
            ([overrides] ++ commonOverrides)
         )
   )
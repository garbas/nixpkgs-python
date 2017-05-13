# generated using pypi2nix tool (version: 1.8.0)
# See more at: https://github.com/garbas/pypi2nix
#
# COMMAND:
#   pypi2nix -v -V 3.5 --setup-requires six packaging appdirs -O ../overrides.nix -r requirements.txt
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



    "aiohttp" = python.mkDerivation {
      name = "aiohttp-2.0.7";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/f1/1a/e6090179b3c272c6e437cc6e0d78be6220727a7bdc9ee74bef214144c5d3/aiohttp-2.0.7.tar.gz"; sha256 = "76bfd47ee7fbda115cff486c3944fcb237ecbf6195bf2943fae74052fb40c4fe"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."async-timeout"
      self."chardet"
      self."multidict"
      self."yarl"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/aio-libs/aiohttp/";
        license = licenses.asl20;
        description = "Async http client/server framework (asyncio)";
      };
    };



    "async-timeout" = python.mkDerivation {
      name = "async-timeout-1.2.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/55/67/3870ef0811ee3e40b67d776b3144743f34a2a2d094690af83a1c5390806e/async-timeout-1.2.0.tar.gz"; sha256 = "0652d108c0156ae5ac94d99f53a6bdd039b0c076346ff8f58c9a1551fac17a19"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/aio-libs/async_timeout/";
        license = licenses.asl20;
        description = "Timeout context manager for asyncio programs";
      };
    };



    "chardet" = python.mkDerivation {
      name = "chardet-3.0.2";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/91/05/28f23094cdf1410fb03533f0d71e6b4aad3c504100e83b8cea6fc899552c/chardet-3.0.2.tar.gz"; sha256 = "4f7832e7c583348a9eddd927ee8514b3bf717c061f57b21dbe7697211454d9bb"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/chardet/chardet";
        license = licenses.lgpl2;
        description = "Universal encoding detector for Python 2 and 3";
      };
    };



    "enum-compat" = python.mkDerivation {
      name = "enum-compat-0.0.2";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/95/6e/26bdcba28b66126f66cf3e4cd03bcd63f7ae330d29ee68b1f6b623550bfa/enum-compat-0.0.2.tar.gz"; sha256 = "939ceff18186a5762ae4db9fa7bfe017edbd03b66526b798dd8245394c8a4192"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/jstasiak/enum-compat";
        license = licenses.mit;
        description = "enum/enum34 compatibility package";
      };
    };



    "homeassistant" = python.mkDerivation {
      name = "homeassistant-0.44.1";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/17/73/0e5a5baf7bfeb96839a98a2a6ba4da4fb100b3fa0773276c9aded707856e/homeassistant-0.44.1.tar.gz"; sha256 = "7975e0027686f13fa1aac8af8e547b5c49d4bae4bffc6cc776dfdafb48ba38af"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Jinja2"
      self."PyYAML"
      self."aiohttp"
      self."async-timeout"
      self."chardet"
      self."pytz"
      self."requests"
      self."typing"
      self."voluptuous"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://home-assistant.io/";
        license = licenses.asl20;
        description = "Open-source home automation platform running on Python 3.";
      };
    };



    "multidict" = python.mkDerivation {
      name = "multidict-2.1.4";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/2a/df/eaea73e46a58fd780c35ecc304ca42364fa3c1f4cd03568ed33b9d2c7547/multidict-2.1.4.tar.gz"; sha256 = "a77aa8c9f68846c3b5db43ff8ed2a7a884dbe845d01f55113a3fba78518c4cd7"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/aio-libs/multidict/";
        license = licenses.asl20;
        description = "multidict implementation";
      };
    };



    "netdisco" = python.mkDerivation {
      name = "netdisco-0.7.7";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/d2/5c/220997aba36946596570f8670b0d3b96a119f0f2b12aaac66a88b206f4eb/netdisco-0.7.7.tar.gz"; sha256 = "ece9c994c16c59794bb1b80a7e33f5837529dd1757369df6dccf082a8178115c"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."netifaces"
      self."requests"
      self."zeroconf"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/home-assistant/netdisco";
        license = licenses.mit;
        description = "Discover devices on your local network";
      };
    };



    "netifaces" = python.mkDerivation {
      name = "netifaces-0.10.5";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/a7/4c/8e0771a59fd6e55aac993a7cc1b6a0db993f299514c464ae6a1ecf83b31d/netifaces-0.10.5.tar.gz"; sha256 = "59d8ad52dd3116fcb6635e175751b250dc783fb011adba539558bd764e5d628b"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://bitbucket.org/al45tair/netifaces";
        license = licenses.mit;
        description = "Portable network interface information.";
      };
    };



    "pytz" = python.mkDerivation {
      name = "pytz-2017.2";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/a4/09/c47e57fc9c7062b4e83b075d418800d322caa87ec0ac21e6308bd3a2d519/pytz-2017.2.zip"; sha256 = "f5c056e8f62d45ba8215e5cb8f50dfccb198b4b9fbea8500674f3443e4689589"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://pythonhosted.org/pytz";
        license = licenses.mit;
        description = "World timezone definitions, modern and historical";
      };
    };



    "requests" = python.mkDerivation {
      name = "requests-2.14.2";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/72/46/4abc3f5aaf7bf16a52206bb0c68677a26c216c1e6625c78c5aef695b5359/requests-2.14.2.tar.gz"; sha256 = "a274abba399a23e8713ffd2b5706535ae280ebe2b8069ee6a941cb089440d153"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
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



    "voluptuous" = python.mkDerivation {
      name = "voluptuous-0.10.5";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/c3/81/c84f8a3e723b760fdd1c41fc80201cb80cd29c1bce5159d8918c58df7d2a/voluptuous-0.10.5.tar.gz"; sha256 = "7a7466f8dc3666a292d186d1d871a47bf2120836ccb900d5ba904674957a2396"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/alecthomas/voluptuous";
        license = licenses.bsdOriginal;
        description = "# Voluptuous is a Python data validation library";
      };
    };



    "yarl" = python.mkDerivation {
      name = "yarl-0.10.2";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/83/cd/c9d2c92f12de6bbb8ab025a6a9488d64e75f8650e52232b4718124d28279/yarl-0.10.2.tar.gz"; sha256 = "a042c5b3584531cd09cd5ca647f71553df7caaa3359b9b3f7eb34c3b1045b38d"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."multidict"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/aio-libs/yarl/";
        license = licenses.asl20;
        description = "Yet another URL library";
      };
    };



    "zeroconf" = python.mkDerivation {
      name = "zeroconf-0.17.6";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/b8/15/d4b1773e91f8ff54681c3a0d45baec553ffa850f42beb62353156ab4a64c/zeroconf-0.17.6.tar.gz"; sha256 = "b614baa73833bdfc8ae64f2a9f5d19b014ad3164fbbc8513ef27a7bbe1e6c5e3"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."enum-compat"
      self."netifaces"
      self."six"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/jstasiak/python-zeroconf";
        license = licenses.lgpl2;
        description = "Pure Python Multicast DNS Service Discovery Library (Bonjour/Avahi compatible)";
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
# generated using pypi2nix tool (version: 1.8.0)
# See more at: https://github.com/garbas/pypi2nix
#
# COMMAND:
#   pypi2nix -v -V 3.5 -O ../overrides.nix -r requirements.txt
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
        homepage = "";
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
        homepage = "";
        license = licenses.bsdOriginal;
        description = "Implements a XML/HTML/XHTML Markup safe string for Python";
      };
    };



    "Pygments" = python.mkDerivation {
      name = "Pygments-2.2.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/71/2a/2e4e77803a8bd6408a2903340ac498cb0a2181811af7c9ec92cb70b0308a/Pygments-2.2.0.tar.gz"; sha256 = "dbae1046def0efb574852fab9e90209b23f556367b5a320c0bcb871c77c3e8cc"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.bsdOriginal;
        description = "Pygments is a syntax highlighting package written in Python.";
      };
    };



    "Unidecode" = python.mkDerivation {
      name = "Unidecode-0.4.20";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/ba/64/410af95d27f2a8824112d17ed41ea7ce6d2cbc8a4832c2e548d3408fad0a/Unidecode-0.04.20.tar.gz"; sha256 = "ed4418b4b1b190487753f1cca6299e8076079258647284414e6d607d1f8a00e0"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.gpl2Plus;
        description = "ASCII transliterations of Unicode text";
      };
    };



    "blinker" = python.mkDerivation {
      name = "blinker-1.4";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/1b/51/e2a9f3b757eb802f61dc1f2b09c8c99f6eb01cf06416c0671253536517b6/blinker-1.4.tar.gz"; sha256 = "471aee25f3992bd325afa3772f1063dbdbbca947a041b8b89466dc00d606f8b6"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.mit;
        description = "Fast, simple object-to-object and broadcast signaling";
      };
    };



    "docutils" = python.mkDerivation {
      name = "docutils-0.13.1";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/05/25/7b5484aca5d46915493f1fd4ecb63c38c333bd32aa9ad6e19da8d08895ae/docutils-0.13.1.tar.gz"; sha256 = "718c0f5fb677be0f34b781e04241c4067cbd9327b66bdd8e763201130f5175be"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.publicDomain;
        description = "Docutils -- Python Documentation Utilities";
      };
    };



    "feedgenerator" = python.mkDerivation {
      name = "feedgenerator-1.9";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/eb/02/7069b3dbc6ea92f034e07f9f9adc2193cd02d1aedf2cf9ec71150102a964/feedgenerator-1.9.tar.gz"; sha256 = "5ae05daa9cfa47fa406ee4744d0b7fa1c8a05a7a47ee0ad328ddf55327cfb106"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."pytz"
      self."six"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.bsdOriginal;
        description = "Standalone version of django.utils.feedgenerator";
      };
    };



    "ghp-import" = python.mkDerivation {
      name = "ghp-import-0.5.5";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/bd/95/27cb11b5d09643c2756f04a1412b0d62aadeb0b909564f85122270c4097c/ghp-import-0.5.5.tar.gz"; sha256 = "3e924ea720e4e1f82d56753db2154bfb86067472c5830732159c3a4c4fbc75d7"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = "Tumbolia Public License";
        description = "Copy your docs directly to the gh-pages branch.";
      };
    };



    "livereload" = python.mkDerivation {
      name = "livereload-2.5.1";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/e9/2e/c4972828cf526a2e5f5571d647fb2740df68f17e8084a9a1092f4d209f4c/livereload-2.5.1.tar.gz"; sha256 = "422de10d7ea9467a1ba27cbaffa84c74b809d96fb1598d9de4b9b676adf35e2c"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."six"
      self."tornado"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.bsdOriginal;
        description = "Python LiveReload is an awesome tool for web developers";
      };
    };



    "pelican" = python.mkDerivation {
      name = "pelican-3.7.1";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/d0/9e/c5cf3f7e98b84ac666422d7f6707cc415d4c96247c266377c0ed5a489f49/pelican-3.7.1.tar.gz"; sha256 = "2a5347fe47464ee743bff99b6e81d1b5823f2e70e7be5bd6ed66a5bdd5f3578b"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Jinja2"
      self."Pygments"
      self."Unidecode"
      self."blinker"
      self."docutils"
      self."feedgenerator"
      self."python-dateutil"
      self."pytz"
      self."six"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.agpl3;
        description = "Static site generator supporting reStructuredText and Markdown source content.";
      };
    };



    "python-dateutil" = python.mkDerivation {
      name = "python-dateutil-2.6.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/51/fc/39a3fbde6864942e8bb24c93663734b74e281b984d1b8c4f95d64b0c21f6/python-dateutil-2.6.0.tar.gz"; sha256 = "62a2f8df3d66f878373fd0072eacf4ee52194ba302e00082828e0d263b0418d2"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."six"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.bsdOriginal;
        description = "Extensions to the standard Python datetime module";
      };
    };



    "pytz" = python.mkDerivation {
      name = "pytz-2017.2";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/a4/09/c47e57fc9c7062b4e83b075d418800d322caa87ec0ac21e6308bd3a2d519/pytz-2017.2.zip"; sha256 = "f5c056e8f62d45ba8215e5cb8f50dfccb198b4b9fbea8500674f3443e4689589"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.mit;
        description = "World timezone definitions, modern and historical";
      };
    };



    "six" = python.mkDerivation {
      name = "six-1.10.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/b3/b2/238e2590826bfdd113244a40d9d3eb26918bd798fc187e2360a8367068db/six-1.10.0.tar.gz"; sha256 = "105f8d68616f8248e24bf0e9372ef04d3cc10104f1980f54d57b2ce73a5ad56a"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.mit;
        description = "Python 2 and 3 compatibility utilities";
      };
    };



    "smartypants" = python.mkDerivation {
      name = "smartypants-2.0.0";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/09/dd/08848ea21422a585ecd2dd32c032fd8f75f0f8345225b455f3bf9e5a0feb/smartypants-2.0.0.tar.gz"; sha256 = "7812353a32022699a1aa8cd5626e01c94a946dcaeedaee2d0b382bae4c4cbf36"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.bsdOriginal;
        description = "Python with the SmartyPants";
      };
    };



    "tornado" = python.mkDerivation {
      name = "tornado-4.4.3";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/5c/0b/2e5cef0d30811532b27ece726fb66a41f63344af8b693c90cec9474d9022/tornado-4.4.3.tar.gz"; sha256 = "f267acc96d5cf3df0fd8a7bfb5a91c2eb4ec81d5962d1a7386ceb34c655634a8"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = "License :: OSI Approved :: Apache Software License";
        description = "Tornado is a Python web framework and asynchronous networking library, originally developed at FriendFeed.";
      };
    };



    "typogrify" = python.mkDerivation {
      name = "typogrify-2.0.7";
      src = pkgs.fetchurl { url = "https://pypi.python.org/packages/8a/bf/64959d6187d42472acb846bcf462347c9124952c05bd57e5769d5f28f9a6/typogrify-2.0.7.tar.gz"; sha256 = "8be4668cda434163ce229d87ca273a11922cb1614cb359970b7dc96eed13cb38"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."smartypants"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "";
        license = licenses.bsdOriginal;
        description = "Filters to enhance web typography, including support for Django & Jinja templates";
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
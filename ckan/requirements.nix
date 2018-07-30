# generated using pypi2nix tool (version: 1.8.1)
# See more at: https://github.com/garbas/pypi2nix
#
# COMMAND:
#   pypi2nix -W https://travis.garbas.si/wheels_cache/ -v -V 2.7 -O ../overrides.nix -r requirements.txt -E postgresql -E gcc -E openssl -E libffi
#

{ pkgs ? import <nixpkgs> {},
  overrides ? ({ pkgs, python }: self: super: {})
}:

let

  inherit (pkgs) makeWrapper;
  inherit (pkgs.stdenv.lib) fix' extends inNixShell;

  pythonPackages =
  import "${toString pkgs.path}/pkgs/top-level/python-packages.nix" {
    inherit pkgs;
    inherit (pkgs) stdenv;
    python = pkgs.python27Full;
    # patching pip so it does not try to remove files when running nix-shell
    overrides =
      self: super: {
        bootstrapped-pip = super.bootstrapped-pip.overrideDerivation (old: {
          patchPhase = old.patchPhase + ''
            if [ -e $out/${pkgs.python27Full.sitePackages}/pip/req/req_install.py ]; then
              sed -i \
                -e "s|paths_to_remove.remove(auto_confirm)|#paths_to_remove.remove(auto_confirm)|"  \
                -e "s|self.uninstalled = paths_to_remove|#self.uninstalled = paths_to_remove|"  \
                $out/${pkgs.python27Full.sitePackages}/pip/req/req_install.py
            fi
          '';
        });
      };
  };

  commonBuildInputs = with pkgs; [ postgresql gcc openssl libffi ];
  commonDoCheck = false;

  withPackages = pkgs':
    let
      pkgs = builtins.removeAttrs pkgs' ["__unfix__"];
      interpreterWithPackages = selectPkgsFn: pythonPackages.buildPythonPackage {
        name = "python27Full-interpreter";
        buildInputs = [ makeWrapper ] ++ (selectPkgsFn pkgs);
        buildCommand = ''
          mkdir -p $out/bin
          ln -s ${pythonPackages.python.interpreter} \
              $out/bin/${pythonPackages.python.executable}
          for dep in ${builtins.concatStringsSep " "
              (selectPkgsFn pkgs)}; do
            if [ -d "$dep/bin" ]; then
              for prog in "$dep/bin/"*; do
                if [ -x "$prog" ] && [ -f "$prog" ]; then
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
          ln -s ${pythonPackages.python.executable} \
              python2
          popd
        '';
        passthru.interpreter = pythonPackages.python;
      };

      interpreter = interpreterWithPackages builtins.attrValues;
    in {
      __old = pythonPackages;
      inherit interpreter;
      inherit interpreterWithPackages;
      mkDerivation = pythonPackages.buildPythonPackage;
      packages = pkgs;
      overrideDerivation = drv: f:
        pythonPackages.buildPythonPackage (
          drv.drvAttrs // f drv.drvAttrs // { meta = drv.meta; }
        );
      withPackages = pkgs'':
        withPackages (pkgs // pkgs'');
    };

  python = withPackages {};

  generated = self: {
    "Babel" = python.mkDerivation {
      name = "Babel-2.3.4";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/6e/96/ba2a2462ed25ca0e651fb7b66e7080f5315f91425a07ea5b34d7c870c114/Babel-2.3.4.tar.gz"; sha256 = "c535c4403802f6eb38173cd4863e419e2274921a01a8aad8a5b497c131c62875"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."pytz"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://babel.pocoo.org/";
        license = licenses.bsdOriginal;
        description = "Internationalization utilities";
      };
    };

    "Beaker" = python.mkDerivation {
      name = "Beaker-1.9.0";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/93/b2/12de6937b06e9615dbb3cb3a1c9af17f133f435bdef59f4ad42032b6eb49/Beaker-1.9.0.tar.gz"; sha256 = "317d0f9a3618364a4ce447d227b698bd7cdcad57301326ce8013d200abd695bf"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."SQLAlchemy"
      self."WebTest"
      self."funcsigs"
      self."nose"
      self."redis"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://beaker.readthedocs.io/";
        license = licenses.bsdOriginal;
        description = "A Session and Caching library with WSGI Middleware";
      };
    };

    "Flask" = python.mkDerivation {
      name = "Flask-0.12.2";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/eb/12/1c7bd06fcbd08ba544f25bf2c6612e305a70ea51ca0eda8007344ec3f123/Flask-0.12.2.tar.gz"; sha256 = "49f44461237b69ecd901cc7ce66feea0319b9158743dd27a2899962ab214dac1"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
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

    "Flask-Babel" = python.mkDerivation {
      name = "Flask-Babel-0.11.2";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/38/9e/75ee8da2217c985f1bfe823d3f0935e3a5379265cd6a9db057000a8b0d11/Flask-Babel-0.11.2.tar.gz"; sha256 = "c0d75710bd4b0fe866f9f2347de6e19208712f9cec006436b4c1c15d4cb0c939"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Babel"
      self."Flask"
      self."Jinja2"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://github.com/python-babel/flask-babel";
        license = licenses.bsdOriginal;
        description = "Adds i18n/l10n support to Flask applications";
      };
    };

    "FormEncode" = python.mkDerivation {
      name = "FormEncode-1.3.1";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/2f/53/707c2b9b65ea6bedde67c21cbf7c71394f4a198620d4e9c1771214b91dcc/FormEncode-1.3.1.tar.gz"; sha256 = "ada2f51792b1b484e5bb7b6cc14acfc1bc11fafc967cf015cd57e856053ca7f6"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."nose"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://formencode.org";
        license = licenses.psfl;
        description = "HTML form validation, generation, and conversion package";
      };
    };

    "Jinja2" = python.mkDerivation {
      name = "Jinja2-2.8";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/f2/2f/0b98b06a345a761bec91a079ccae392d282690c2d8272e708f4d10829e22/Jinja2-2.8.tar.gz"; sha256 = "bc1ff2ff88dbfacefde4ddde471d1417d3b304e8df103a7a9437d47269201bf4"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Babel"
      self."MarkupSafe"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://jinja.pocoo.org/";
        license = licenses.bsdOriginal;
        description = "A small but fast and easy to use stand-alone template engine written in pure python.";
      };
    };

    "Mako" = python.mkDerivation {
      name = "Mako-1.0.7";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/eb/f3/67579bb486517c0d49547f9697e36582cd19dafb5df9e687ed8e22de57fa/Mako-1.0.7.tar.gz"; sha256 = "4e02fde57bd4abb5ec400181e4c314f56ac3e49ba4fb8b0d50bba18cb27d25ae"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."MarkupSafe"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://www.makotemplates.org/";
        license = licenses.mit;
        description = "A super-fast templating language that borrows the  best ideas from the existing templating languages.";
      };
    };

    "Markdown" = python.mkDerivation {
      name = "Markdown-2.6.7";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/d4/32/642bd580c577af37b00a1eb59b0eaa996f2d11dfe394f3dd0c7a8a2de81a/Markdown-2.6.7.tar.gz"; sha256 = "daebf24846efa7ff269cfde8c41a48bb2303920c7b2c7c5e04fa82e6282d05c0"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://pythonhosted.org/Markdown/";
        license = licenses.bsdOriginal;
        description = "Python implementation of Markdown.";
      };
    };

    "MarkupSafe" = python.mkDerivation {
      name = "MarkupSafe-1.0";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/4d/de/32d741db316d8fdb7680822dd37001ef7a448255de9699ab4bfcbdf4172b/MarkupSafe-1.0.tar.gz"; sha256 = "a6be69091dac236ea9c6bc7d012beab42010fa914c459791d627dad4910eb665"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://github.com/pallets/markupsafe";
        license = licenses.bsdOriginal;
        description = "Implements a XML/HTML/XHTML Markup safe string for Python";
      };
    };

    "Pairtree" = python.mkDerivation {
      name = "Pairtree-0.7.1-T";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/67/65/ce497b9d5b0e48007e5b2bbc91238b695e6425e5f546302a32eb77029c3e/Pairtree-0.7.1-T.tar.gz"; sha256 = "24f3778addb09b68fc82dcc905ecee2b9783b324995cfd31dd0cf68226b4f5c8"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://packages.python.org/Pairtree/";
        license = "http://www.apache.org/licenses/LICENSE-2.0";
        description = "Pairtree FS implementation.";
      };
    };

    "Paste" = python.mkDerivation {
      name = "Paste-1.7.5.1";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/ce/d5/ff405cab7ff454208d772cd27ba289726ef0ca1dfcbd07936918535bfb52/Paste-1.7.5.1.tar.gz"; sha256 = "11645842ba8ec986ae8cfbe4c6cacff5c35f0f4527abf4f5581ae8b4ad49c0b6"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://pythonpaste.org";
        license = licenses.mit;
        description = "Tools for using a Web Server Gateway Interface stack";
      };
    };

    "PasteDeploy" = python.mkDerivation {
      name = "PasteDeploy-1.5.2";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/0f/90/8e20cdae206c543ea10793cbf4136eb9a8b3f417e04e40a29d72d9922cbd/PasteDeploy-1.5.2.tar.gz"; sha256 = "d5858f89a255e6294e63ed46b73613c56e3b9a2d82a42f1df4d06c8421a9e3cb"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Paste"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://pythonpaste.org/deploy/";
        license = licenses.mit;
        description = "Load, configure, and compose WSGI applications and servers";
      };
    };

    "PasteScript" = python.mkDerivation {
      name = "PasteScript-2.0.2";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/e5/f0/78e766c3dcc61a4f3a6f71dd8c95168ae9c7a31722b5663d19c1fdf62cb6/PasteScript-2.0.2.tar.gz"; sha256 = "c03f249805538cc2328741ae8d262a9200ae1c993119b3d9bac4cd422cb476c0"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Paste"
      self."PasteDeploy"
      self."six"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://pythonpaste.org/script/";
        license = licenses.mit;
        description = "A pluggable command-line frontend, including commands to setup package file layouts";
      };
    };

    "Pygments" = python.mkDerivation {
      name = "Pygments-2.2.0";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/71/2a/2e4e77803a8bd6408a2903340ac498cb0a2181811af7c9ec92cb70b0308a/Pygments-2.2.0.tar.gz"; sha256 = "dbae1046def0efb574852fab9e90209b23f556367b5a320c0bcb871c77c3e8cc"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://pygments.org/";
        license = licenses.bsdOriginal;
        description = "Pygments is a syntax highlighting package written in Python.";
      };
    };

    "Pylons" = python.mkDerivation {
      name = "Pylons-0.9.7";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/8d/4d/2979d39cb9d512ddc14ea46604460ea436e71f339eaa65e8993ca8a4cd94/Pylons-0.9.7.tar.gz"; sha256 = "36a62a184819ef01e65c865364f1b262299e6215ef55d8add6a1a258a9dd6933"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Beaker"
      self."FormEncode"
      self."Jinja2"
      self."Mako"
      self."Paste"
      self."PasteDeploy"
      self."PasteScript"
      self."Pygments"
      self."Routes"
      self."Tempita"
      self."WebError"
      self."WebHelpers"
      self."WebOb"
      self."WebTest"
      self."decorator"
      self."nose"
      self."simplejson"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://www.pylonshq.com/";
        license = licenses.bsdOriginal;
        description = "Pylons Web Framework";
      };
    };

    "Routes" = python.mkDerivation {
      name = "Routes-1.13";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/88/d3/259c3b3cde8837eb9441ab5f574a660e8a4acea8f54a078441d4d2acac1c/Routes-1.13.tar.gz"; sha256 = "cc03d1a357cdb7af82e3909ee8ff93cb2b2afb48aca23bfde0117d6f49f624a7"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."repoze.lru"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://routes.groovie.org/";
        license = licenses.bsdOriginal;
        description = "Routing Recognition and Generation Tools";
      };
    };

    "SQLAlchemy" = python.mkDerivation {
      name = "SQLAlchemy-1.1.11";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/59/f1/28f2205c3175e6bf32300c0f30f9d91dbc9eb910debbff3ffecb88d18528/SQLAlchemy-1.1.11.tar.gz"; sha256 = "76f76965e9a968ba3aecd2a8bc0d991cea04fd9a182e6c95c81f1551487b0211"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."psycopg2"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://www.sqlalchemy.org";
        license = licenses.mit;
        description = "Database Abstraction Library";
      };
    };

    "Tempita" = python.mkDerivation {
      name = "Tempita-0.5.2";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/56/c8/8ed6eee83dbddf7b0fc64dd5d4454bc05e6ccaafff47991f73f2894d9ff4/Tempita-0.5.2.tar.gz"; sha256 = "cacecf0baa674d356641f1d406b8bff1d756d739c46b869a54de515d08e6fc9c"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://pythonpaste.org/tempita/";
        license = licenses.mit;
        description = "A very small text templating language";
      };
    };

    "WebError" = python.mkDerivation {
      name = "WebError-0.13.1";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/07/0a/09ca5eb0fab5c0d17b380026babe81c96ecebb13f2b06c3203432dd7be72/WebError-0.13.1.tar.gz"; sha256 = "c19f8bd57de2f1eea1b18a44f1ba1ad27421097c9ecfa0ae754fa42c9cdd9864"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Paste"
      self."Pygments"
      self."Tempita"
      self."WebOb"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://bitbucket.org/bbangert/weberror";
        license = licenses.mit;
        description = "Web Error handling and exception catching";
      };
    };

    "WebHelpers" = python.mkDerivation {
      name = "WebHelpers-1.3";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/ee/68/4d07672821d514184357f1552f2dad923324f597e722de3b016ca4f7844f/WebHelpers-1.3.tar.gz"; sha256 = "ea86f284e929366b77424ba9a89341f43ae8dee3cbeb8702f73bcf86058aa583"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."MarkupSafe"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://webhelpers.groovie.org/";
        license = licenses.bsdOriginal;
        description = "Web Helpers";
      };
    };

    "WebOb" = python.mkDerivation {
      name = "WebOb-1.0.8";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/4e/fe/cfc36faeeb9abe5bb2a98795631d299f9118b44d7b2a9697bf666a8ac2e6/WebOb-1.0.8.zip"; sha256 = "fe771def02bd7857b5519bdf3ae4ea7ea4ebb7d2f5fa10953c8d4535b0ccb2b5"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://pythonpaste.org/webob/";
        license = licenses.mit;
        description = "WSGI request and response object";
      };
    };

    "WebTest" = python.mkDerivation {
      name = "WebTest-1.4.3";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/51/3d/84fd0f628df10b30c7db87895f56d0158e5411206b721ca903cb51bfd948/WebTest-1.4.3.zip"; sha256 = "0439d951afdf6c58d19e0a83e30855d0bb7e35ab177d9261add71fc5a724b6ab"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."WebOb"
      self."nose"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://webtest.pythonpaste.org/";
        license = licenses.mit;
        description = "Helper to test WSGI applications";
      };
    };

    "Werkzeug" = python.mkDerivation {
      name = "Werkzeug-0.14.1";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/9f/08/a3bb1c045ec602dc680906fc0261c267bed6b3bb4609430aff92c3888ec8/Werkzeug-0.14.1.tar.gz"; sha256 = "c3fd7a7d41976d9f44db327260e263132466836cef6f91512889ed60ad26557c"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://www.palletsprojects.org/p/werkzeug/";
        license = licenses.bsdOriginal;
        description = "The comprehensive WSGI web application library.";
      };
    };

    "argparse" = python.mkDerivation {
      name = "argparse-1.4.0";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/18/dd/e617cfc3f6210ae183374cd9f6a26b20514bbb5a792af97949c5aacddf0f/argparse-1.4.0.tar.gz"; sha256 = "62b089a55be1d8949cd2bc7e0df0bddb9e028faefc8c32038cc84862aefdd6e4"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/ThomasWaldmann/argparse/";
        license = licenses.psfl;
        description = "Python command-line parsing library";
      };
    };

    "bleach" = python.mkDerivation {
      name = "bleach-2.1.3";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/eb/ea/58428609442130dc31d3a59010bf6cbd263a16c589d01d23b7c1e6997e3b/bleach-2.1.3.tar.gz"; sha256 = "eb7386f632349d10d9ce9d4a838b134d4731571851149f9cc2c05a9a837a9a44"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."html5lib"
      self."six"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://github.com/mozilla/bleach";
        license = "License :: OSI Approved :: Apache Software License";
        description = "An easy safelist-based HTML-sanitizing tool.";
      };
    };

    "ckan" = python.mkDerivation {
      name = "ckan-2.9.0a0";
      src = pkgs.fetchurl { url = "https://github.com/ckan/ckan/archive/master.zip"; sha256 = "bdc8fa85e2174c45d1835149e953c9e46821fe1ed77935b51d0052444d7420eb"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://ckan.org/";
        license = licenses.agpl3Plus;
        description = "CKAN Software";
      };
    };

    "click" = python.mkDerivation {
      name = "click-6.7";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/95/d9/c3336b6b5711c3ab9d1d3a80f1a3e2afeb9d8c02a7166462f6cc96570897/click-6.7.tar.gz"; sha256 = "f15516df478d5a56180fbf80e68f206010e6d160fc39fa508b65e035fd75130b"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://github.com/mitsuhiko/click";
        license = licenses.bsdOriginal;
        description = "A simple wrapper around optparse for powerful command line utilities.";
      };
    };

    "decorator" = python.mkDerivation {
      name = "decorator-4.2.1";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/70/f1/cb9373195639db13063f55eb06116310ad691e1fd125e6af057734dc44ea/decorator-4.2.1.tar.gz"; sha256 = "7d46dd9f3ea1cf5f06ee0e4e1277ae618cf48dfb10ada7c8427cd46c42702a0e"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/micheles/decorator";
        license = licenses.bsdOriginal;
        description = "Better living through Python with decorators";
      };
    };

    "fanstatic" = python.mkDerivation {
      name = "fanstatic-0.12";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/b5/93/8b1eb0d99b72799811ebfc76f20480225a3cc0e456452331d7baeb743dd6/fanstatic-0.12.tar.gz"; sha256 = "b9d4b2507163489a869502f1744fb3818ee07db434a705e50cbf5169fc8f4751"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Paste"
      self."WebOb"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://fanstatic.org";
        license = licenses.bsdOriginal;
        description = "Flexible static resources for web applications.";
      };
    };

    "funcsigs" = python.mkDerivation {
      name = "funcsigs-1.0.2";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/94/4a/db842e7a0545de1cdb0439bb80e6e42dfe82aaeaadd4072f2263a4fbed23/funcsigs-1.0.2.tar.gz"; sha256 = "a7bb0f2cf3a3fd1ab2732cb49eba4252c2af4240442415b4abce3b87022a8f50"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://funcsigs.readthedocs.org";
        license = "License :: OSI Approved :: Apache Software License";
        description = "Python function signatures from PEP362 for Python 2.6, 2.7 and 3.2+";
      };
    };

    "html5lib" = python.mkDerivation {
      name = "html5lib-1.0.1";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/85/3e/cf449cf1b5004e87510b9368e7a5f1acd8831c2d6691edd3c62a0823f98f/html5lib-1.0.1.tar.gz"; sha256 = "66cb0dcfdbbc4f9c3ba1a63fdb511ffdbd4f513b2b6d81b80cd26ce6b3fb3736"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."six"
      self."webencodings"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/html5lib/html5lib-python";
        license = licenses.mit;
        description = "HTML parser based on the WHATWG HTML specification";
      };
    };

    "itsdangerous" = python.mkDerivation {
      name = "itsdangerous-0.24";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/dc/b4/a60bcdba945c00f6d608d8975131ab3f25b22f2bcfe1dab221165194b2d4/itsdangerous-0.24.tar.gz"; sha256 = "cbb3fcf8d3e33df861709ecaf89d9e6629cff0a217bc2848f1b41cd30d360519"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://github.com/mitsuhiko/itsdangerous";
        license = licenses.bsdOriginal;
        description = "Various helpers to pass trusted data to untrusted environments and back.";
      };
    };

    "nose" = python.mkDerivation {
      name = "nose-1.3.7";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/58/a5/0dc93c3ec33f4e281849523a5a913fa1eea9a3068acfa754d44d88107a44/nose-1.3.7.tar.gz"; sha256 = "f1bffef9cbc82628f6e7d7b40d7e255aefaa1adb6a1b1d26c69a8b79e6208a98"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://readthedocs.org/docs/nose/";
        license = licenses.lgpl2;
        description = "nose extends unittest to make testing easier";
      };
    };

    "ofs" = python.mkDerivation {
      name = "ofs-0.4.2";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/59/48/9fc47bc658c0bca61892bf4304914b490a9ca24750c448d798075a467b18/ofs-0.4.2.tar.gz"; sha256 = "f0b9dcefdaf19d01776526da3c99ae24dfb9d7df60740a42fd709e332bb503d5"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."argparse"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://github.com/okfn/ofs";
        license = "http://www.apache.org/licenses/LICENSE-2.0";
        description = "OFS - provides plugin-orientated low-level blobstore.";
      };
    };

    "passlib" = python.mkDerivation {
      name = "passlib-1.6.5";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/1e/59/d1a50836b29c87a1bde9442e1846aa11e1548491cbee719e51b45a623e75/passlib-1.6.5.tar.gz"; sha256 = "a83d34f53dc9b17aa42c9a35c3fbcc5120f3fcb07f7f8721ec45e6a27be347fc"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://bitbucket.org/ecollins/passlib";
        license = licenses.bsdOriginal;
        description = "comprehensive password hashing framework supporting over 30 schemes";
      };
    };

    "pbr" = python.mkDerivation {
      name = "pbr-1.10.0";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/c3/2c/63275fab26a0fd8cadafca71a3623e4d0f0ee8ed7124a5bb128853d178a7/pbr-1.10.0.tar.gz"; sha256 = "186428c270309e6fdfe2d5ab0949ab21ae5f7dea831eab96701b86bd666af39c"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://launchpad.net/pbr";
        license = "License :: OSI Approved :: Apache Software License";
        description = "Python Build Reasonableness";
      };
    };

    "polib" = python.mkDerivation {
      name = "polib-1.0.7";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/45/1e/ba9e219d8dafc535075d5824148f64617db781821ba2d1e08a6a10210194/polib-1.0.7.tar.gz"; sha256 = "43ce60d05ffa442ba9d3c5722193aadb93c38174b9fb471c8ea7ccbf8349bbca"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://bitbucket.org/izi/polib/";
        license = licenses.mit;
        description = "A library to manipulate gettext files (po and mo files).";
      };
    };

    "psycopg2" = python.mkDerivation {
      name = "psycopg2-2.7.3.2";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/dd/47/000b405d73ca22980684fd7bd3318690cc03cfa3b2ae1c5b7fff8050b28a/psycopg2-2.7.3.2.tar.gz"; sha256 = "5c3213be557d0468f9df8fe2487eaf2990d9799202c5ff5cb8d394d09fad9b2a"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://initd.org/psycopg/";
        license = licenses.lgpl2;
        description = "psycopg2 - Python-PostgreSQL Database Adapter";
      };
    };

    "pysolr" = python.mkDerivation {
      name = "pysolr-3.6.0";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/47/d6/91dd269b4443c77905ac5f347318435bfeaa2825ce2763d936e0945f29e4/pysolr-3.6.0.tar.gz"; sha256 = "f94292c1002dbbbfaecaad18fec39cc4bff843b459c8851a2234f2799788ac6f"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."requests"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/django-haystack/pysolr/";
        license = licenses.bsdOriginal;
        description = "Lightweight python wrapper for Apache Solr.";
      };
    };

    "python-dateutil" = python.mkDerivation {
      name = "python-dateutil-1.5";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/b4/7c/df59c89a753eb33c7c44e1dd42de0e9bc2ccdd5a4d576e0bfad97cc280cb/python-dateutil-1.5.tar.gz"; sha256 = "6f197348b46fb8cdf9f3fcfc2a7d5a97da95db3e2e8667cf657216274fe1b009"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://labix.org/python-dateutil";
        license = "PSF License";
        description = "Extensions to the standard python 2.3+ datetime module";
      };
    };

    "python-magic" = python.mkDerivation {
      name = "python-magic-0.4.15";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/84/30/80932401906eaf787f2e9bd86dc458f1d2e75b064b4c187341f29516945c/python-magic-0.4.15.tar.gz"; sha256 = "f3765c0f582d2dfc72c15f3b5a82aecfae9498bd29ca840d72f37d7bd38bfcd5"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://github.com/ahupp/python-magic";
        license = licenses.mit;
        description = "File type identification using libmagic";
      };
    };

    "pytz" = python.mkDerivation {
      name = "pytz-2016.7";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/53/35/6376f58fb82ce69e2c113ca0ebe5c0f69b20f006e184bcc238a6007f4bdb/pytz-2016.7.tar.bz2"; sha256 = "6eab31709e3a4aea748457707da45e805b650cbb352583805d2417de2a1dd71e"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://pythonhosted.org/pytz";
        license = licenses.mit;
        description = "World timezone definitions, modern and historical";
      };
    };

    "pyutilib.component.core" = python.mkDerivation {
      name = "pyutilib.component.core-4.6.4";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/3e/98/4a54ea39806da1e89031624743fc5912f9b4e40509963ed668382ce26712/pyutilib.component.core-4.6.4.tar.gz"; sha256 = "96cf00a017bb7647af39c61a4977c1f667415557310591015d5653bc51b235b6"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."six"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://software.sandia.gov/svn/public/pyutilib/pyutilib.component.core";
        license = licenses.bsdOriginal;
        description = "The PyUtilib Component Architecture.";
      };
    };

    "redis" = python.mkDerivation {
      name = "redis-2.10.6";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/09/8d/6d34b75326bf96d4139a2ddd8e74b80840f800a0a79f9294399e212cb9a7/redis-2.10.6.tar.gz"; sha256 = "a22ca993cea2962dbb588f9f30d0015ac4afcc45bee27d3978c0dbe9e97c6c0f"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://github.com/andymccurdy/redis-py";
        license = licenses.mit;
        description = "Python client for Redis key-value store";
      };
    };

    "repoze.lru" = python.mkDerivation {
      name = "repoze.lru-0.7";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/12/bc/595a77c4b5e204847fdf19268314ef59c85193a9dc9f83630fc459c0fee5/repoze.lru-0.7.tar.gz"; sha256 = "0429a75e19380e4ed50c0694e26ac8819b4ea7851ee1fc7583c8572db80aff77"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."nose"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://www.repoze.org";
        license = "License :: Repoze Public License";
        description = "A tiny LRU cache implementation and decorator";
      };
    };

    "repoze.who" = python.mkDerivation {
      name = "repoze.who-2.3";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/19/ae/94cdd6ea2d3f79a1430993ee044da1ea6fb547675e0d0ca958c71009ddde/repoze.who-2.3.tar.gz"; sha256 = "b95dadc1242acc55950115a629cfb1352669774b46d22def51400ca683efea28"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."WebOb"
      self."nose"
      self."zope.interface"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://www.repoze.org";
        license = "BSD-derived (http://www.repoze.org/LICENSE.txt)";
        description = "repoze.who is an identification and authentication framework for WSGI.";
      };
    };

    "repoze.who-friendlyform" = python.mkDerivation {
      name = "repoze.who-friendlyform-1.0.8";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/50/94/ffd0cc5a941241df096096fb2639729ed00d8082df6cd11eb63e588f5e4c/repoze.who-friendlyform-1.0.8.tar.gz"; sha256 = "77138a94b11e8f846889fd7e025d6914e5966125869f6d75ef216801e29cdf13"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."WebOb"
      self."repoze.who"
      self."zope.interface"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://code.gustavonarea.net/repoze.who-friendlyform/";
        license = "BSD-derived (http://www.repoze.org/LICENSE.txt)";
        description = "Collection of repoze.who friendly form plugins";
      };
    };

    "requests" = python.mkDerivation {
      name = "requests-2.11.1";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/2e/ad/e627446492cc374c284e82381215dcd9a0a87c4f6e90e9789afefe6da0ad/requests-2.11.1.tar.gz"; sha256 = "5acf980358283faba0b897c73959cecf8b841205bb4b2ad3ef545f46eae1a133"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://python-requests.org";
        license = licenses.asl20;
        description = "Python HTTP for Humans.";
      };
    };

    "rq" = python.mkDerivation {
      name = "rq-0.6.0";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/ca/73/56460dfabc0b91b4e720c8b8c776c3d1163367a6bb00a32805c820b58afa/rq-0.6.0.tar.gz"; sha256 = "d6502f5041953b2e5f5411a59bfc9661f7fb2af2a7f412f0f7bc62b2e56d9341"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."argparse"
      self."click"
      self."redis"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/nvie/rq/";
        license = licenses.bsdOriginal;
        description = "RQ is a simple, lightweight, library for creating background jobs, and processing them.";
      };
    };

    "simplejson" = python.mkDerivation {
      name = "simplejson-3.10.0";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/40/ad/52c1f3a562df3b210e8f165e1aa243a178c454ead65476a39fa3ce1847b6/simplejson-3.10.0.tar.gz"; sha256 = "953be622e88323c6f43fad61ffd05bebe73b9fd9863a46d68b052d2aa7d71ce2"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://github.com/simplejson/simplejson";
        license = licenses.mit;
        description = "Simple, fast, extensible JSON encoder/decoder for Python";
      };
    };

    "six" = python.mkDerivation {
      name = "six-1.11.0";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/16/d8/bc6316cf98419719bd59c91742194c111b6f2e85abac88e496adefaf7afe/six-1.11.0.tar.gz"; sha256 = "70e8a77beed4562e7f14fe23a786b54f6296e34344c23bc42f07b15018ff98e9"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://pypi.python.org/pypi/six/";
        license = licenses.mit;
        description = "Python 2 and 3 compatibility utilities";
      };
    };

    "sqlalchemy-migrate" = python.mkDerivation {
      name = "sqlalchemy-migrate-0.10.0";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/83/c8/c9b30792222210e0c19c7dfc26ea3b777382417ea48ae9d9d02619de81ac/sqlalchemy-migrate-0.10.0.tar.gz"; sha256 = "f83c5cce9c09e5c05527279b7fe1565b32e5353342ff30b24f594fa2e5a7e003"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."SQLAlchemy"
      self."Tempita"
      self."decorator"
      self."pbr"
      self."six"
      self."sqlparse"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://www.openstack.org/";
        license = "License :: OSI Approved :: Apache Software License";
        description = "Database schema migration for SQLAlchemy";
      };
    };

    "sqlparse" = python.mkDerivation {
      name = "sqlparse-0.2.2";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/55/ce/3944e990b03f80f36f0050b407ad46cde192a210d473f0d705b554bddd1d/sqlparse-0.2.2.tar.gz"; sha256 = "d446296b2c26f9466860dd85fa32480bec523ab96bda8879262c38e8e8fbba21"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/andialbrecht/sqlparse";
        license = licenses.bsdOriginal;
        description = "Non-validating SQL parser";
      };
    };

    "tzlocal" = python.mkDerivation {
      name = "tzlocal-1.3";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/d3/64/e4b18738496213f82b88b31c431a0e4ece143801fb6771dddd1c2bf0101b/tzlocal-1.3.tar.gz"; sha256 = "d160c2ce4f8b1831dabfe766bd844cf9012f766539cf84139c2faac5201882ce"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."pytz"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/regebro/tzlocal";
        license = "License :: CC0 1.0 Universal (CC0 1.0) Public Domain Dedication";
        description = "tzinfo object for the local timezone";
      };
    };

    "unicodecsv" = python.mkDerivation {
      name = "unicodecsv-0.14.1";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/6f/a4/691ab63b17505a26096608cc309960b5a6bdf39e4ba1a793d5f9b1a53270/unicodecsv-0.14.1.tar.gz"; sha256 = "018c08037d48649a0412063ff4eda26eaa81eff1546dbffa51fa5293276ff7fc"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/jdunck/python-unicodecsv";
        license = licenses.bsdOriginal;
        description = "Python2's stdlib csv module is nice, but it doesn't support unicode. This module is a drop-in replacement which *does*.";
      };
    };

    "vdm" = python.mkDerivation {
      name = "vdm-0.14";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/e1/57/1051dfdf32c97feecdc87f0f28b97245ba19b4d6e5930ec6d9bc1623c1f7/vdm-0.14.tar.gz"; sha256 = "81bb747b422e68a59a8cbd42ac7fdf5d46cd4c96cca5b9b5dd48a18780b2afda"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://www.okfn.org/vdm/";
        license = licenses.mit;
        description = "A versioned domain model framework.";
      };
    };

    "webencodings" = python.mkDerivation {
      name = "webencodings-0.5.1";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/0b/02/ae6ceac1baeda530866a85075641cec12989bd8d31af6d5ab4a3e8c92f47/webencodings-0.5.1.tar.gz"; sha256 = "b36a1c245f2d304965eb4e0a82848379241dc04b865afcc4aab16748587e1923"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/SimonSapin/python-webencodings";
        license = licenses.bsdOriginal;
        description = "Character encoding aliases for legacy web content";
      };
    };

    "zope.interface" = python.mkDerivation {
      name = "zope.interface-4.3.2";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/38/1b/d55c39f2cf442bd9fb2c59760ed058c84b57d25c680819c25f3aff741e1f/zope.interface-4.3.2.tar.gz"; sha256 = "6a0e224a052e3ce27b3a7b1300a24747513f7a507217fcc2a4cb02eb92945cee"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."nose"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/zopefoundation/zope.interface";
        license = licenses.zpl21;
        description = "Interfaces for Python";
      };
    };
  };
  localOverridesFile = ./requirements_override.nix;
  localOverrides = import localOverridesFile { inherit pkgs python; };
  commonOverrides = [
        (import ../overrides.nix { inherit pkgs python ; })
  ];
  paramOverrides = [
    (overrides { inherit pkgs python; })
  ];
  allOverrides =
    (if (builtins.pathExists localOverridesFile)
     then [localOverrides] else [] ) ++ commonOverrides ++ paramOverrides;

in python.withPackages
   (fix' (pkgs.lib.fold
            extends
            generated
            allOverrides
         )
   )
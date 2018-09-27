# generated using pypi2nix tool (version: 1.8.1)
# See more at: https://github.com/garbas/pypi2nix
#
# COMMAND:
#   pypi2nix -W https://travis.garbas.si/wheels_cache/ -v -V 3.5 -O ../overrides.nix -r requirements.txt
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
    python = pkgs.python35;
    # patching pip so it does not try to remove files when running nix-shell
    overrides =
      self: super: {
        bootstrapped-pip = super.bootstrapped-pip.overrideDerivation (old: {
          patchPhase = old.patchPhase + ''
            if [ -e $out/${pkgs.python35.sitePackages}/pip/req/req_install.py ]; then
              sed -i \
                -e "s|paths_to_remove.remove(auto_confirm)|#paths_to_remove.remove(auto_confirm)|"  \
                -e "s|self.uninstalled = paths_to_remove|#self.uninstalled = paths_to_remove|"  \
                $out/${pkgs.python35.sitePackages}/pip/req/req_install.py
            fi
          '';
        });
      };
  };

  commonBuildInputs = [];
  commonDoCheck = false;

  withPackages = pkgs':
    let
      pkgs = builtins.removeAttrs pkgs' ["__unfix__"];
      interpreterWithPackages = selectPkgsFn: pythonPackages.buildPythonPackage {
        name = "python35-interpreter";
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
              python3
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
    "Chameleon" = python.mkDerivation {
      name = "Chameleon-3.4";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/96/8c/f8bcdf3563d625f2e6e9c04d02d0fff828777e35484e19035d0e6b0aedda/Chameleon-3.4.tar.gz"; sha256 = "7750865a68b469b34cbc60b9927f7e5c609808b6b966bf75bf8556e6ed48912c"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://chameleon.readthedocs.io";
        license = "BSD-like (http://repoze.org/license.html)";
        description = "Fast HTML/XML Template Compiler.";
      };
    };

    "Jinja2" = python.mkDerivation {
      name = "Jinja2-2.10";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/56/e6/332789f295cf22308386cf5bbd1f4e00ed11484299c5d7383378cf48ba47/Jinja2-2.10.tar.gz"; sha256 = "f84be1bb0040caca4cea721fcbbbbd61f9be9464ca236387158b0feea01914a4"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
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

    "PasteDeploy" = python.mkDerivation {
      name = "PasteDeploy-1.5.2";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/0f/90/8e20cdae206c543ea10793cbf4136eb9a8b3f417e04e40a29d72d9922cbd/PasteDeploy-1.5.2.tar.gz"; sha256 = "d5858f89a255e6294e63ed46b73613c56e3b9a2d82a42f1df4d06c8421a9e3cb"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://pythonpaste.org/deploy/";
        license = licenses.mit;
        description = "Load, configure, and compose WSGI applications and servers";
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

    "SQLAlchemy" = python.mkDerivation {
      name = "SQLAlchemy-1.2.12";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/25/c9/b0552098cee325425a61efdf380c51b5c721e459081c85bbb860f501c091/SQLAlchemy-1.2.12.tar.gz"; sha256 = "c5951d9ef1d5404ed04bae5a16b60a0779087378928f997a294d1229c6ca4d3e"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://www.sqlalchemy.org";
        license = licenses.mit;
        description = "Database Abstraction Library";
      };
    };

    "WebOb" = python.mkDerivation {
      name = "WebOb-1.8.2";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/f2/8a/dd4a3a32fba184e48a50be732aa390f9db2a725a535dcfb9fee781a2943c/WebOb-1.8.2.tar.gz"; sha256 = "1fe722f2ab857685fc96edec567dc40b1875b21219b3b348e58cd8c4d5ea7df3"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://webob.org/";
        license = licenses.mit;
        description = "WSGI request and response object";
      };
    };

    "colander" = python.mkDerivation {
      name = "colander-1.5.1";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/ec/d1/fcca811a0a692c69d27e36b4d11a73acb98b4bab48323442642b6fd4386d/colander-1.5.1.tar.gz"; sha256 = "d86b9e1fb42c80c68b26040e32dad584aa168abf3175133b36f5dace392350a1"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."iso8601"
      self."translationstring"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://docs.pylonsproject.org/projects/colander/en/latest/";
        license = "BSD-derived (http://www.repoze.org/LICENSE.txt)";
        description = "A simple schema-based serialization and deserialization library";
      };
    };

    "deform" = python.mkDerivation {
      name = "deform-2.0.6";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/44/89/0d734745d000492e2609e128923c066fa3e7954138ab12a6866ebe0b48a8/deform-2.0.6.tar.gz"; sha256 = "bda0b809c8a668e105e30650a6766103207eafdd12c313acd59274ccd2c4d297"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Chameleon"
      self."Pygments"
      self."colander"
      self."iso8601"
      self."peppercorn"
      self."pyramid"
      self."translationstring"
      self."zope.deprecation"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://docs.pylonsproject.org/projects/deform/en/latest/";
        license = "BSD-derived (http://www.repoze.org/LICENSE.txt)";
        description = "Form library with advanced features like nested forms";
      };
    };

    "gevent" = python.mkDerivation {
      name = "gevent-1.3.6";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/49/13/aa4bb3640b5167fe58875d3d7e65390cdb14f9682a41a741a566bb560842/gevent-1.3.6.tar.gz"; sha256 = "7b413c391e8ad6607b7f7540d698a94349abd64e4935184c595f7cdcc69904c6"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."greenlet"
      self."psutil"
      self."zope.event"
      self."zope.interface"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://www.gevent.org/";
        license = licenses.mit;
        description = "Coroutine-based network library";
      };
    };

    "gevent-socketio" = python.mkDerivation {
      name = "gevent-socketio-0.3.6";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/57/8f/16b508f602cff2dd506636b8d415e39cacb3400d49e885f002bf6436a777/gevent-socketio-0.3.6.tar.gz"; sha256 = "53394ab93fbd84d9dbbb2bef85349f6a503bfc53d86a9be8653250f1a0412aff"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."gevent"
      self."gevent-websocket"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/abourget/gevent-socketio";
        license = licenses.bsdOriginal;
        description = "SocketIO server based on the Gevent pywsgi server, a Python network library";
      };
    };

    "gevent-websocket" = python.mkDerivation {
      name = "gevent-websocket-0.10.1";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/98/d2/6fa19239ff1ab072af40ebf339acd91fb97f34617c2ee625b8e34bf42393/gevent-websocket-0.10.1.tar.gz"; sha256 = "7eaef32968290c9121f7c35b973e2cc302ffb076d018c9068d2f5ca8b2d85fb0"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."gevent"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://www.gitlab.com/noppo/gevent-websocket";
        license = "Copyright 2011-2017 Jeffrey Gelens <jeffrey@noppo.pro>";
        description = "Websocket handler for the gevent pywsgi server, a Python network library";
      };
    };

    "greenlet" = python.mkDerivation {
      name = "greenlet-0.4.15";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/f8/e8/b30ae23b45f69aa3f024b46064c0ac8e5fcb4f22ace0dca8d6f9c8bbe5e7/greenlet-0.4.15.tar.gz"; sha256 = "9416443e219356e3c31f1f918a91badf2e37acf297e2fa13d24d1cc2380f8fbc"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/python-greenlet/greenlet";
        license = licenses.mit;
        description = "Lightweight in-process concurrent programming";
      };
    };

    "hupper" = python.mkDerivation {
      name = "hupper-1.3";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/51/0c/96335b1f2f32245fb871eea5bb9773196505ddb71fad15190056a282df9e/hupper-1.3.tar.gz"; sha256 = "20387760e4d32bd4813c2cabc8e51d92b2c22c546102a0af182c33c152cd7ede"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/Pylons/hupper";
        license = licenses.mit;
        description = "Integrated process monitor for developing and reloading daemons.";
      };
    };

    "iso8601" = python.mkDerivation {
      name = "iso8601-0.1.12";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/45/13/3db24895497345fb44c4248c08b16da34a9eb02643cea2754b21b5ed08b0/iso8601-0.1.12.tar.gz"; sha256 = "49c4b20e1f38aa5cf109ddcd39647ac419f928512c869dc01d5c7098eddede82"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://bitbucket.org/micktwomey/pyiso8601";
        license = licenses.mit;
        description = "Simple module to parse ISO 8601 dates";
      };
    };

    "peppercorn" = python.mkDerivation {
      name = "peppercorn-0.6";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/e4/77/93085de7108cdf1a0b092ff443872a8f9442c736d7ddebdf2f27627935f4/peppercorn-0.6.tar.gz"; sha256 = "96d7681d7a04545cfbaf2c6fb66de67b29cfc42421aa263e4c78f2cbb85be4c6"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://docs.pylonsproject.org/projects/peppercorn/en/latest/";
        license = "BSD-derived (http://www.repoze.org/LICENSE.txt)";
        description = "A library for converting a token stream into a data structure for use in web form posts";
      };
    };

    "plaster" = python.mkDerivation {
      name = "plaster-1.0";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/37/e1/56d04382d718d32751017d32f351214384e529b794084eee20bb52405563/plaster-1.0.tar.gz"; sha256 = "8351c7c7efdf33084c1de88dd0f422cbe7342534537b553c49b857b12d98c8c3"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://docs.pylonsproject.org/projects/plaster/en/latest/";
        license = licenses.mit;
        description = "A loader interface around multiple config file formats.";
      };
    };

    "plaster-pastedeploy" = python.mkDerivation {
      name = "plaster-pastedeploy-0.6";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/3f/e7/6a6833158d2038ec40085433308a1e164fd1dac595513f6dd556d5669bb8/plaster_pastedeploy-0.6.tar.gz"; sha256 = "c231130cb86ae414084008fe1d1797db7e61dc5eaafb5e755de21387c27c6fae"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."PasteDeploy"
      self."plaster"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/Pylons/plaster_pastedeploy";
        license = licenses.mit;
        description = "A loader implementing the PasteDeploy syntax to be used by plaster.";
      };
    };

    "psutil" = python.mkDerivation {
      name = "psutil-5.4.3";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/e2/e1/600326635f97fee89bf8426fef14c5c29f4849c79f68fd79f433d8c1bd96/psutil-5.4.3.tar.gz"; sha256 = "e2467e9312c2fa191687b89ff4bc2ad8843be4af6fb4dc95a7cc5f7d7a327b18"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/giampaolo/psutil";
        license = licenses.bsdOriginal;
        description = "Cross-platform lib for process and system monitoring in Python.";
      };
    };

    "pyramid" = python.mkDerivation {
      name = "pyramid-1.9.2";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/a0/c1/b321d07cfc4870541989ad131c86a1d593bfe802af0eca9718a0dadfb97a/pyramid-1.9.2.tar.gz"; sha256 = "cf89a48cb899291639686bf3d4a883b39e496151fa4871fb83cc1a3200d5b925"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."PasteDeploy"
      self."WebOb"
      self."hupper"
      self."plaster"
      self."plaster-pastedeploy"
      self."repoze.lru"
      self."translationstring"
      self."venusian"
      self."zope.deprecation"
      self."zope.interface"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://trypyramid.com";
        license = "License :: Repoze Public License";
        description = "The Pyramid Web Framework, a Pylons project";
      };
    };

    "pyramid-chameleon" = python.mkDerivation {
      name = "pyramid-chameleon-0.3";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/8a/cd/ae2f1f2c547884bc6fa16aa607d21f8e85a0b7997b0ba6426e35212b1e2d/pyramid_chameleon-0.3.tar.gz"; sha256 = "d176792a50eb015d7865b44bd9b24a7bd0489fa9a5cebbd17b9e05048cef9017"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Chameleon"
      self."pyramid"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/Pylons/pyramid_chameleon";
        license = "License :: Repoze Public License";
        description = "pyramid_chameleon";
      };
    };

    "pyramid-debugtoolbar" = python.mkDerivation {
      name = "pyramid-debugtoolbar-4.5";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/14/28/1f240239af340d19ee271ac62958158c79edb01a44ad8c9885508dd003d2/pyramid_debugtoolbar-4.5.tar.gz"; sha256 = "74c5f52ce33765423810e156949b0f97852c66056c97de8c35a6db9b00195774"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Pygments"
      self."pyramid"
      self."pyramid-mako"
      self."repoze.lru"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://docs.pylonsproject.org/projects/pyramid-debugtoolbar/en/latest/";
        license = licenses.bsdOriginal;
        description = "A package which provides an interactive HTML debugger for Pyramid application development";
      };
    };

    "pyramid-deform" = python.mkDerivation {
      name = "pyramid-deform-0.2";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/f3/92/707f6e725aa9585179fc4919f7ef710815732bc54885a209b584d903c3c3/pyramid_deform-0.2.tar.gz"; sha256 = "09a73ceb0d351a20b3b85ded31fbf417b4756bafefd620cfd488202e2ad0fb7c"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."deform"
      self."pyramid"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://docs.pylonshq.com";
        license = "BSD-derived (http://www.repoze.org/LICENSE.txt)";
        description = "Bindings to the Deform form library for the Pyramid web framework";
      };
    };

    "pyramid-exclog" = python.mkDerivation {
      name = "pyramid-exclog-1.0";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/c5/a8/96449fdda3abfd2eb4dad075b25b9252856be84040f35c8194d55c80f345/pyramid_exclog-1.0.tar.gz"; sha256 = "d05ced5c12407507154de6750036bc83861b85c11be70b3ec3098c929652c14b"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."pyramid"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://docs.pylonsproject.org";
        license = "License :: Repoze Public License";
        description = "A package which logs to a Python logger when an exception is raised by a Pyramid application";
      };
    };

    "pyramid-jinja2" = python.mkDerivation {
      name = "pyramid-jinja2-2.7";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/d8/80/d60a7233823de22ce77bd864a8a83736a1fe8b49884b08303a2e68b2c853/pyramid_jinja2-2.7.tar.gz"; sha256 = "5c21081f65a5bec0b76957990c2b89ed41f4fd11257121387110cb722fd0e5eb"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Jinja2"
      self."MarkupSafe"
      self."pyramid"
      self."zope.deprecation"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/Pylons/pyramid_jinja2";
        license = "License :: Repoze Public License";
        description = "Jinja2 template bindings for the Pyramid web framework";
      };
    };

    "pyramid-mako" = python.mkDerivation {
      name = "pyramid-mako-1.0.2";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/f1/92/7e69bcf09676d286a71cb3bbb887b16595b96f9ba7adbdc239ffdd4b1eb9/pyramid_mako-1.0.2.tar.gz"; sha256 = "6da0987b9874cf53e72139624665a73965bbd7fbde504d1753e4231ce916f3a1"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Mako"
      self."pyramid"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/Pylons/pyramid_mako";
        license = "License :: Repoze Public License";
        description = "Mako template bindings for the Pyramid web framework";
      };
    };

    "pyramid-socketio" = python.mkDerivation {
      name = "pyramid-socketio-0.9";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/f3/e8/47482965df3757ff629bd356f41e0ff7f090dabeb7da745688791ff12ecc/pyramid_socketio-0.9.tar.gz"; sha256 = "b4ec2ca36d8f423cffde85887d266af3b84cdf4d2fd54b7f58c476d9329756ec"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."gevent"
      self."gevent-socketio"
      self."gevent-websocket"
      self."greenlet"
      self."pyramid"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/abourget/pyramid_socketio";
        license = "";
        description = "Gevent-based Socket.IO pyramid integration and helpers";
      };
    };

    "pyramid-sqlalchemy" = python.mkDerivation {
      name = "pyramid-sqlalchemy-1.6";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/f8/ef/1a7350be383d58efb806f1192ff09a8b2764082ef69719a20d2424d213b4/pyramid_sqlalchemy-1.6.tar.gz"; sha256 = "377a18834e15ff59ba89c882be7d40bdc92ab5ad39a881ff2eba111b84f2418b"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."SQLAlchemy"
      self."pyramid"
      self."zope.sqlalchemy"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://pyramid-sqlalchemy.readthedocs.org";
        license = licenses.bsdOriginal;
        description = "SQLAlchemy integration for pyramid";
      };
    };

    "pyramid-tm" = python.mkDerivation {
      name = "pyramid-tm-2.2";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/9e/66/048cc82262e93fcca4f2bcf448723028f3848f21411438127ee0cfa074ac/pyramid_tm-2.2.tar.gz"; sha256 = "07d03bab7bdd265c3920db4e68dbaa8cbaff27da828700f404b1424244ad617f"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."pyramid"
      self."transaction"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://docs.pylonsproject.org/projects/pyramid-tm/en/latest/";
        license = "License :: Repoze Public License";
        description = "A package which allows Pyramid requests to join the active transaction";
      };
    };

    "pyramid-who" = python.mkDerivation {
      name = "pyramid-who-0.3";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/2e/09/664840034d88a3e68a6c4256723da769e7a18a2edcde99b304340ca3e43b/pyramid_who-0.3.tar.gz"; sha256 = "ab682af0bd1c105184ad2fd417f3557c36e7bf803b1b290fa8325ce1ff83302d"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."pyramid"
      self."repoze.who"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://docs.pylonshq.com";
        license = "BSD-derived (http://www.repoze.org/LICENSE.txt)";
        description = "Pyramid authentication policies based on repoze.who";
      };
    };

    "pyramid-zcml" = python.mkDerivation {
      name = "pyramid-zcml-1.1.0";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/af/d7/57102753dd1731e17b8b038733ba1ab8237e0b55c8898d434133fcb4cae7/pyramid_zcml-1.1.0.tar.gz"; sha256 = "94cdb26ab1db58d20c405af48fb7ac00d7a68eb8b3089d242be1b05fb82239fb"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."pyramid"
      self."pyramid-mako"
      self."venusian"
      self."zope.configuration"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://docs.pylonsproject.org/projects/pyramid_zcml/en/latest/";
        license = "License :: Repoze Public License";
        description = "Zope Config Markup Language support for Pyramid";
      };
    };

    "repoze.lru" = python.mkDerivation {
      name = "repoze.lru-0.7";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/12/bc/595a77c4b5e204847fdf19268314ef59c85193a9dc9f83630fc459c0fee5/repoze.lru-0.7.tar.gz"; sha256 = "0429a75e19380e4ed50c0694e26ac8819b4ea7851ee1fc7583c8572db80aff77"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
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
      self."zope.interface"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://www.repoze.org";
        license = "BSD-derived (http://www.repoze.org/LICENSE.txt)";
        description = "repoze.who is an identification and authentication framework for WSGI.";
      };
    };

    "transaction" = python.mkDerivation {
      name = "transaction-2.2.1";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/a6/5e/09da91cb9373c73aae41721e5571c47db72fa9e11b259ca8fd3b01e306e9/transaction-2.2.1.tar.gz"; sha256 = "f2242070e437e5d555ea3df809cb517860513254c828f33847df1c5e4b776c7a"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."zope.interface"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/zopefoundation/transaction";
        license = licenses.zpl21;
        description = "Transaction management for Python";
      };
    };

    "translationstring" = python.mkDerivation {
      name = "translationstring-1.3";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/5e/eb/bee578cc150b44c653b63f5ebe258b5d0d812ddac12497e5f80fcad5d0b4/translationstring-1.3.tar.gz"; sha256 = "4ee44cfa58c52ade8910ea0ebc3d2d84bdcad9fa0422405b1801ec9b9a65b72d"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://pylonsproject.org";
        license = "BSD-like (http://repoze.org/license.html)";
        description = "Utility library for i18n relied on by various Repoze and Pyramid packages";
      };
    };

    "venusian" = python.mkDerivation {
      name = "venusian-1.1.0";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/38/24/b4b470ab9e0a2e2e9b9030c7735828c8934b4c6b45befd1bb713ec2aeb2d/venusian-1.1.0.tar.gz"; sha256 = "9902e492c71a89a241a18b2f9950bea7e41d025cc8f3af1ea8d8201346f8577d"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://pylonsproject.org";
        license = "BSD-derived (http://www.repoze.org/LICENSE.txt)";
        description = "A library for deferring decorator actions";
      };
    };

    "zope.configuration" = python.mkDerivation {
      name = "zope.configuration-4.2.2";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/2b/ec/964a962dffe48f7a5d2c7f38050c67ef0ee9c753be94fd35fec72eb40ab4/zope.configuration-4.2.2.tar.gz"; sha256 = "a1118c0a4bf478b3d831c03e2aa6d57d58ce31f9681962dc329d02f94ffc469d"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."zope.i18nmessageid"
      self."zope.interface"
      self."zope.schema"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/zopefoundation/zope.configuration";
        license = licenses.zpl21;
        description = "Zope Configuration Markup Language (ZCML)";
      };
    };

    "zope.deprecation" = python.mkDerivation {
      name = "zope.deprecation-4.3.0";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/a1/18/2dc5e6bfe64fdc3b79411b67464c55bb0b43b127051a20f7f492ab767758/zope.deprecation-4.3.0.tar.gz"; sha256 = "7d52e134bbaaa0d72e1e2bc90f0587f1adc116c4bdf15912afaf2f1e8856b224"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://github.com/zopefoundation/zope.deprecation";
        license = licenses.zpl21;
        description = "Zope Deprecation Infrastructure";
      };
    };

    "zope.event" = python.mkDerivation {
      name = "zope.event-4.3.0";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/9e/d0/54ba59f19a0635f6591b74be259cf6fbf67e73f4edda27b5cd0cf4d26efa/zope.event-4.3.0.tar.gz"; sha256 = "e0ecea24247a837c71c106b0341a7a997e3653da820d21ef6c08b32548f733e7"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://github.com/zopefoundation/zope.event";
        license = licenses.zpl21;
        description = "Very basic event publishing system";
      };
    };

    "zope.i18nmessageid" = python.mkDerivation {
      name = "zope.i18nmessageid-4.1.0";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/7e/1c/95949302c4a823c155539cf6fe0853e581cc98104dc603de97513f27b590/zope.i18nmessageid-4.1.0.tar.gz"; sha256 = "f72c00d53407626209b878333a24710e9afa69ae235233333581cc4f3cf1356e"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://pypi.python.org/pypi/zope.i18nmessageid";
        license = licenses.zpl21;
        description = "Message Identifiers for internationalization";
      };
    };

    "zope.interface" = python.mkDerivation {
      name = "zope.interface-4.5.0";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/ac/8a/657532df378c2cd2a1fe6b12be3b4097521570769d4852ec02c24bd3594e/zope.interface-4.5.0.tar.gz"; sha256 = "57c38470d9f57e37afb460c399eb254e7193ac7fb8042bd09bdc001981a9c74c"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."zope.event"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/zopefoundation/zope.interface";
        license = licenses.zpl21;
        description = "Interfaces for Python";
      };
    };

    "zope.schema" = python.mkDerivation {
      name = "zope.schema-4.9.0";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/7f/d7/fd4bde3529fd8e22304dc9e3a41d56320522709479628fce0a88be85bb93/zope.schema-4.9.0.tar.gz"; sha256 = "0e0d5791c5de020fcddc3ac26c671d871c23f3b00592d3b7703fc66f8e6214a6"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."zope.event"
      self."zope.i18nmessageid"
      self."zope.interface"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/zopefoundation/zope.schema";
        license = licenses.zpl21;
        description = "zope.interface extension for defining data schemas";
      };
    };

    "zope.sqlalchemy" = python.mkDerivation {
      name = "zope.sqlalchemy-1.0";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/75/13/b88b597ef6027b5480f68e022206e4b3ee2310a59bbc85bd3e9eca9566b6/zope.sqlalchemy-1.0.tar.gz"; sha256 = "9316a1a8bb9e4f9f59332acf1ad2cc8b664f19a4bde5f68be7f61f3e11f80514"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."SQLAlchemy"
      self."transaction"
      self."zope.interface"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://pypi.python.org/pypi/zope.sqlalchemy";
        license = licenses.zpl21;
        description = "Minimal Zope/SQLAlchemy transaction integration";
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
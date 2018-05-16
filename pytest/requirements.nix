# generated using pypi2nix tool (version: 1.8.1)
# See more at: https://github.com/garbas/pypi2nix
#
# COMMAND:
#   pypi2nix -W https://travis.garbas.si/wheels_cache/ -v -V 3.5 -O ../overrides.nix -r requirements.txt
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
            sed -i \
              -e "s|paths_to_remove.remove(auto_confirm)|#paths_to_remove.remove(auto_confirm)|"  \
              -e "s|self.uninstalled = paths_to_remove|#self.uninstalled = paths_to_remove|"  \
                $out/${pkgs.python35.sitePackages}/pip/req/req_install.py
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
          ln -s ${pythonPackages.python.interpreter} \
              $out/bin/${pythonPackages.python.executable}
          for dep in ${builtins.concatStringsSep " "
              (builtins.attrValues pkgs)}; do
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
    in {
      __old = pythonPackages;
      inherit interpreter;
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
    "Mako" = python.mkDerivation {
      name = "Mako-1.0.7";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/eb/f3/67579bb486517c0d49547f9697e36582cd19dafb5df9e687ed8e22de57fa/Mako-1.0.7.tar.gz"; sha256 = "4e02fde57bd4abb5ec400181e4c314f56ac3e49ba4fb8b0d50bba18cb27d25ae"; };
      doCheck = commonDoCheck;
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
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://github.com/pallets/markupsafe";
        license = licenses.bsdOriginal;
        description = "Implements a XML/HTML/XHTML Markup safe string for Python";
      };
    };

    "apipkg" = python.mkDerivation {
      name = "apipkg-1.4";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/32/37/6ce6dbaa8035730efa95e60b09498ec17000d137742391ff46974d9ef859/apipkg-1.4.tar.gz"; sha256 = "2e38399dbe842891fe85392601aab8f40a8f4cc5a9053c326de35a1cc0297ac6"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://bitbucket.org/hpk42/apipkg";
        license = licenses.mit;
        description = "apipkg: namespace control and lazy-import mechanism";
      };
    };

    "attrs" = python.mkDerivation {
      name = "attrs-18.1.0";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/e4/ac/a04671e118b57bee87dabca1e0f2d3bda816b7a551036012d0ca24190e71/attrs-18.1.0.tar.gz"; sha256 = "e0d0eb91441a3b53dab4d9b743eafc1ac44476296a2053b6ca3af0b139faf87b"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."coverage"
      self."pytest"
      self."six"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://www.attrs.org/";
        license = licenses.mit;
        description = "Classes Without Boilerplate";
      };
    };

    "coverage" = python.mkDerivation {
      name = "coverage-4.5.1";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/35/fe/e7df7289d717426093c68d156e0fd9117c8f4872b6588e8a8928a0f68424/coverage-4.5.1.tar.gz"; sha256 = "56e448f051a201c5ebbaa86a5efd0ca90d327204d8b059ab25ad0f35fbfd79f1"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://bitbucket.org/ned/coveragepy";
        license = licenses.asl20;
        description = "Code coverage measurement for Python";
      };
    };

    "decorator" = python.mkDerivation {
      name = "decorator-4.3.0";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/6f/24/15a229626c775aae5806312f6bf1e2a73785be3402c0acdec5dbddd8c11e/decorator-4.3.0.tar.gz"; sha256 = "c39efa13fbdeb4506c476c9b3babf6a718da943dab7811c206005a4a956c080c"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/micheles/decorator";
        license = licenses.bsdOriginal;
        description = "Better living through Python with decorators";
      };
    };

    "execnet" = python.mkDerivation {
      name = "execnet-1.5.0";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/ab/c0/9496c35092eac2523ee8993ca3690b2d0aa95ef56623035b9c890745ac55/execnet-1.5.0.tar.gz"; sha256 = "a7a84d5fa07a089186a329528f127c9d73b9de57f1a1131b82bb5320ee651f6a"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."apipkg"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://codespeak.net/execnet";
        license = licenses.mit;
        description = "execnet: rapid multi-Python deployment";
      };
    };

    "glob2" = python.mkDerivation {
      name = "glob2-0.6";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/f0/e8/970c7a031b2d7f9a21fefaa8c9d5c38001f8f25055f4ffcb32b3dbecd1ea/glob2-0.6.tar.gz"; sha256 = "f5b0a686ff21f820c4d3f0c4edd216704cea59d79d00fa337e244a2f2ff83ed6"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://github.com/miracle2k/python-glob2/";
        license = licenses.bsdOriginal;
        description = "Version of the glob module that can capture patterns and supports recursive wildcards";
      };
    };

    "greenlet" = python.mkDerivation {
      name = "greenlet-0.4.13";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/13/de/ba92335e9e76040ca7274224942282a80d54f85e342a5e33c5277c7f87eb/greenlet-0.4.13.tar.gz"; sha256 = "0fef83d43bf87a5196c91e73cb9772f945a4caaff91242766c5916d1dd1381e4"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/python-greenlet/greenlet";
        license = licenses.mit;
        description = "Lightweight in-process concurrent programming";
      };
    };

    "more-itertools" = python.mkDerivation {
      name = "more-itertools-4.1.0";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/db/0b/f5660bf6299ec5b9f17bd36096fa8148a1c843fa77ddfddf9bebac9301f7/more-itertools-4.1.0.tar.gz"; sha256 = "c9ce7eccdcb901a2c75d326ea134e0886abfbea5f93e91cc95de9507c0816c44"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."six"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/erikrose/more-itertools";
        license = licenses.mit;
        description = "More routines for operating on iterables, beyond itertools";
      };
    };

    "oejskit" = python.mkDerivation {
      name = "oejskit-0.9.0";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/16/10/f9d24c1f5ff7a8236e48d3c8fbd12e76eb4741e6f4e76e5c25c51d7ed7a9/oejskit-0.9.0.tar.gz"; sha256 = "06d645e2506acd85b8a858b550907c5c8440d4f1315fc2c4e6b86b091c29846e"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://bitbucket.org/pedronis/js-infrastructure/";
        license = licenses.mit;
        description = "Open End JavaScript testing and utility kit";
      };
    };

    "parse" = python.mkDerivation {
      name = "parse-1.8.2";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/13/71/e0b5c968c552f75a938db18e88a4e64d97dc212907b4aca0ff71293b4c80/parse-1.8.2.tar.gz"; sha256 = "8048dde3f5ca07ad7ac7350460952d83b63eaacecdac1b37f45fd74870d849d2"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/r1chardj0n3s/parse";
        license = licenses.bsdOriginal;
        description = "parse() is the opposite of format()";
      };
    };

    "parse-type" = python.mkDerivation {
      name = "parse-type-0.4.2";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/2b/e5/312ce9f1bd209afcf4fc68235c8776a36270d24ad05bdfd2aaaf06647ea9/parse_type-0.4.2.tar.gz"; sha256 = "f596bdc75d3dd93036fbfe3d04127da9f6df0c26c36e01e76da85adef4336b3c"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."coverage"
      self."parse"
      self."pytest"
      self."pytest-cov"
      self."six"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/jenisys/parse_type";
        license = licenses.bsdOriginal;
        description = "Simplifies to build parse types based on the parse module";
      };
    };

    "pep8" = python.mkDerivation {
      name = "pep8-1.7.1";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/01/a0/64ba19519db49e4094d82599412a9660dee8c26a7addbbb1bf17927ceefe/pep8-1.7.1.tar.gz"; sha256 = "fe249b52e20498e59e0b5c5256aa52ee99fc295b26ec9eaa85776ffdb9fe6374"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://pep8.readthedocs.org/";
        license = licenses.mit;
        description = "Python style guide checker";
      };
    };

    "pluggy" = python.mkDerivation {
      name = "pluggy-0.6.0";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/11/bf/cbeb8cdfaffa9f2ea154a30ae31a9d04a1209312e2919138b4171a1f8199/pluggy-0.6.0.tar.gz"; sha256 = "7f8ae7f5bdf75671a718d2daf0a64b7885f74510bcd98b1a0bb420eb9a9d0cff"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/pytest-dev/pluggy";
        license = licenses.mit;
        description = "plugin and hook calling mechanisms for python";
      };
    };

    "py" = python.mkDerivation {
      name = "py-1.5.3";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/f7/84/b4c6e84672c4ceb94f727f3da8344037b62cee960d80e999b1cd9b832d83/py-1.5.3.tar.gz"; sha256 = "29c9fab495d7528e80ba1e343b958684f4ace687327e6f789a94bf3d1915f881"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://py.readthedocs.io/";
        license = licenses.mit;
        description = "library with cross-python path, ini-parsing, io, code, log facilities";
      };
    };

    "pyflakes" = python.mkDerivation {
      name = "pyflakes-1.6.0";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/26/85/f6a315cd3c1aa597fb3a04cc7d7dbea5b3cc66ea6bd13dfa0478bf4876e6/pyflakes-1.6.0.tar.gz"; sha256 = "8d616a382f243dbf19b54743f280b80198be0bca3a5396f1d2e1fca6223e8805"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/PyCQA/pyflakes";
        license = licenses.mit;
        description = "passive checker of Python programs";
      };
    };

    "pytest" = python.mkDerivation {
      name = "pytest-3.5.1";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/b2/85/24954df0ea8156599563b753de54383a5d702081093b7953334e4701b8d8/pytest-3.5.1.tar.gz"; sha256 = "54713b26c97538db6ff0703a12b19aeaeb60b5e599de542e7fca0ec83b9038e8"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."attrs"
      self."more-itertools"
      self."pluggy"
      self."py"
      self."six"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://pytest.org";
        license = licenses.mit;
        description = "pytest: simple powerful testing with Python";
      };
    };

    "pytest-bdd" = python.mkDerivation {
      name = "pytest-bdd-2.21.0";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/10/38/8a72f701123ab474431366ee027f6c1517741ef09299b44720b49dc40e51/pytest-bdd-2.21.0.tar.gz"; sha256 = "1420bafbba5a3fe3182b553beb28bc5ab68f0e438fa4369b4f0f590a7f18177f"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Mako"
      self."glob2"
      self."parse"
      self."parse-type"
      self."pytest"
      self."six"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/pytest-dev/pytest-bdd";
        license = licenses.mit;
        description = "BDD for pytest";
      };
    };

    "pytest-cache" = python.mkDerivation {
      name = "pytest-cache-1.0";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/d1/15/082fd0428aab33d2bafa014f3beb241830427ba803a8912a5aaeaf3a5663/pytest-cache-1.0.tar.gz"; sha256 = "be7468edd4d3d83f1e844959fd6e3fd28e77a481440a7118d430130ea31b07a9"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."execnet"
      self."pytest"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://bitbucket.org/hpk42/pytest-cache/";
        license = licenses.gpl1;
        description = "pytest plugin with mechanisms for caching across test runs";
      };
    };

    "pytest-catchlog" = python.mkDerivation {
      name = "pytest-catchlog-1.2.2";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/f2/2b/2faccdb1a978fab9dd0bf31cca9f6847fbe9184a0bdcc3011ac41dd44191/pytest-catchlog-1.2.2.zip"; sha256 = "4be15dc5ac1750f83960897f591453040dff044b5966fe24a91c2f7d04ecfcf0"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."py"
      self."pytest"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/eisensheng/pytest-catchlog";
        license = licenses.mit;
        description = "py.test plugin to catch log messages. This is a fork of pytest-capturelog.";
      };
    };

    "pytest-cov" = python.mkDerivation {
      name = "pytest-cov-2.5.1";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/24/b4/7290d65b2f3633db51393bdf8ae66309b37620bc3ec116c5e357e3e37238/pytest-cov-2.5.1.tar.gz"; sha256 = "03aa752cf11db41d281ea1d807d954c4eda35cfa1b21d6971966cc041bbf6e2d"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."coverage"
      self."pytest"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/pytest-dev/pytest-cov";
        license = licenses.bsdOriginal;
        description = "Pytest plugin for measuring coverage.";
      };
    };

    "pytest-django" = python.mkDerivation {
      name = "pytest-django-3.2.1";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/97/f0/3983b5b372f56809883aca3563f839ee5eee6c64e1f1d664ff1019bdca63/pytest-django-3.2.1.tar.gz"; sha256 = "7501942093db2250a32a4e36826edfc542347bb9b26c78ed0649cdcfd49e5789"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."pytest"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://pytest-django.readthedocs.io/";
        license = licenses.bsdOriginal;
        description = "A Django plugin for pytest.";
      };
    };

    "pytest-flakes" = python.mkDerivation {
      name = "pytest-flakes-3.0.2";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/7c/d0/78bb26124f6de980206e941205cc11011a8bd4606c7294a259549af827e2/pytest-flakes-3.0.2.tar.gz"; sha256 = "763ec290b89e2dc8f25f49d71cb9b869b8df843697b730233f61c78f847f2e57"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."pyflakes"
      self."pytest"
      self."pytest-cache"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/fschulze/pytest-flakes";
        license = licenses.mit;
        description = "pytest plugin to check source code with pyflakes";
      };
    };

    "pytest-forked" = python.mkDerivation {
      name = "pytest-forked-0.2";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/b3/b2/1ec910b0f798cc86f2531631d7a2da030b16c165e07545537332fd4eb505/pytest-forked-0.2.tar.gz"; sha256 = "e4500cd0509ec4a26535f7d4112a8cc0f17d3a41c29ffd4eab479d2a55b30805"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."pytest"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/pytest-dev/pytest-forked";
        license = licenses.mit;
        description = "run tests in isolated forked subprocesses";
      };
    };

    "pytest-instafail" = python.mkDerivation {
      name = "pytest-instafail-0.3.0";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/11/d0/371d9e86e823c775e9f23ad797d7738b1afa94223ac82c20b5bdc735ea1d/pytest-instafail-0.3.0.tar.gz"; sha256 = "b4d5fc3ca81e530a8d0e15a7771dc14b06fc9a0930c4b3909a7f4527040572c3"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."pytest"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/jpvanhal/pytest-instafail";
        license = licenses.bsdOriginal;
        description = "py.test plugin to show failures instantly";
      };
    };

    "pytest-pep8" = python.mkDerivation {
      name = "pytest-pep8-1.0.6";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/1f/1c/c834344ef39381558b047bea1e3005197fa8457c199d58219996ca07defb/pytest-pep8-1.0.6.tar.gz"; sha256 = "032ef7e5fa3ac30f4458c73e05bb67b0f036a8a5cb418a534b3170f89f120318"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."pep8"
      self."pytest"
      self."pytest-cache"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://bitbucket.org/hpk42/pytest-pep8/";
        license = "MIT license";
        description = "pytest plugin to check PEP8 requirements";
      };
    };

    "pytest-timeout" = python.mkDerivation {
      name = "pytest-timeout-1.2.1";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/be/e9/a9106b8bc87521c6813060f50f7d1fdc15665bc1bbbe71c0ffc1c571aaa2/pytest-timeout-1.2.1.tar.gz"; sha256 = "68b7d264633d5d33ee6b14ce3a7f7d05f8fd9d2f6ae594283221ec021736b7cd"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."pytest"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://bitbucket.org/pytest-dev/pytest-timeout/";
        license = licenses.mit;
        description = "py.test plugin to abort hanging tests";
      };
    };

    "pytest-twisted" = python.mkDerivation {
      name = "pytest-twisted-1.8";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/fd/1e/d5ae0034e20750b6e7f9270af70bfa83e95707c538939511d460f0e4c5fc/pytest-twisted-1.8.zip"; sha256 = "6c3a0db55e0af2320b43b7ac9fe3045147b8148f6f1bfe1ce1b48f72e7d4ee13"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."decorator"
      self."greenlet"
      self."pytest"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/pytest-dev/pytest-twisted";
        license = licenses.bsdOriginal;
        description = "A twisted plugin for py.test.";
      };
    };

    "pytest-xdist" = python.mkDerivation {
      name = "pytest-xdist-1.22.2";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/5d/be/f3c5a5edf6161d17d90fe458281249bebb7aba1af076621a19b007d632fa/pytest-xdist-1.22.2.tar.gz"; sha256 = "e8f5744acc270b3e7d915bdb4d5f471670f049b6fbd163d4cbd52203b075d30f"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."execnet"
      self."pytest"
      self."pytest-forked"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/pytest-dev/pytest-xdist";
        license = licenses.mit;
        description = "py.test xdist plugin for distributed testing and loop-on-failing modes";
      };
    };

    "six" = python.mkDerivation {
      name = "six-1.11.0";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/16/d8/bc6316cf98419719bd59c91742194c111b6f2e85abac88e496adefaf7afe/six-1.11.0.tar.gz"; sha256 = "70e8a77beed4562e7f14fe23a786b54f6296e34344c23bc42f07b15018ff98e9"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://pypi.python.org/pypi/six/";
        license = licenses.mit;
        description = "Python 2 and 3 compatibility utilities";
      };
    };
  };
  localOverridesFile = ./requirements_override.nix;
  overrides = import localOverridesFile { inherit pkgs python; };
  commonOverrides = [
        (import ../overrides.nix { inherit pkgs python ; })
  ];
  allOverrides =
    (if (builtins.pathExists localOverridesFile)
     then [overrides] else [] ) ++ commonOverrides;

in python.withPackages
   (fix' (pkgs.lib.fold
            extends
            generated
            allOverrides
         )
   )
# generated using pypi2nix tool (version: 1.8.1)
# See more at: https://github.com/garbas/pypi2nix
#
# COMMAND:
#   pypi2nix -W https://travis.garbas.si/wheels_cache/ -v -V 2.7 -r requirements.txt -E which -E libffi -E openssl.dev
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

  commonBuildInputs = with pkgs; [ which libffi openssl.dev ];
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
      name = "Babel-2.6.0";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/be/cc/9c981b249a455fa0c76338966325fc70b7265521bad641bf2932f77712f4/Babel-2.6.0.tar.gz"; sha256 = "8cba50f48c529ca3fa18cf81fa9403be176d374ac4d60738b839122dfaaa3d23"; };
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

    "PyYAML" = python.mkDerivation {
      name = "PyYAML-3.13";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/9e/a3/1d13970c3f36777c583f136c136f804d70f500168edc1edea6daa7200769/PyYAML-3.13.tar.gz"; sha256 = "3ef3092145e9b70e3ddd2c7ad59bdd0252a94dfe3949721633e41344de00a6bf"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://pyyaml.org/wiki/PyYAML";
        license = licenses.mit;
        description = "YAML parser and emitter for Python";
      };
    };

    "appdirs" = python.mkDerivation {
      name = "appdirs-1.4.3";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/48/69/d87c60746b393309ca30761f8e2b49473d43450b150cb08f3c6df5c11be5/appdirs-1.4.3.tar.gz"; sha256 = "9e5896d1372858f8dd3344faf4e5014d21849c756c8d5701f78f8a103b372d92"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://github.com/ActiveState/appdirs";
        license = licenses.mit;
        description = "A small Python module for determining appropriate platform-specific dirs, e.g. a \"user data dir\".";
      };
    };

    "asn1crypto" = python.mkDerivation {
      name = "asn1crypto-0.24.0";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/fc/f1/8db7daa71f414ddabfa056c4ef792e1461ff655c2ae2928a2b675bfed6b4/asn1crypto-0.24.0.tar.gz"; sha256 = "9d5c20441baf0cb60a4ac34cc447c6c189024b6b4c6cd7877034f4965c464e49"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/wbond/asn1crypto";
        license = licenses.mit;
        description = "Fast ASN.1 parser and serializer with definitions for private keys, public keys, certificates, CRL, OCSP, CMS, PKCS#3, PKCS#7, PKCS#8, PKCS#12, PKCS#5, X.509 and TSP";
      };
    };

    "certifi" = python.mkDerivation {
      name = "certifi-2018.4.16";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/4d/9c/46e950a6f4d6b4be571ddcae21e7bc846fcbb88f1de3eff0f6dd0a6be55d/certifi-2018.4.16.tar.gz"; sha256 = "13e698f54293db9f89122b0581843a782ad0934a4fe0172d2a980ba77fc61bb7"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://certifi.io/";
        license = licenses.mpl20;
        description = "Python package for providing Mozilla's CA Bundle.";
      };
    };

    "cffi" = python.mkDerivation {
      name = "cffi-1.11.5";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/e7/a7/4cd50e57cc6f436f1cc3a7e8fa700ff9b8b4d471620629074913e3735fb2/cffi-1.11.5.tar.gz"; sha256 = "e90f17980e6ab0f3c2f3730e56d1fe9bcba1891eeea58966e89d352492cc74f4"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."pycparser"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://cffi.readthedocs.org";
        license = licenses.mit;
        description = "Foreign Function Interface for Python calling C code.";
      };
    };

    "chardet" = python.mkDerivation {
      name = "chardet-3.0.4";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/fc/bb/a5768c230f9ddb03acc9ef3f0d4a3cf93462473795d18e9535498c8f929d/chardet-3.0.4.tar.gz"; sha256 = "84ab92ed1c4d4f16916e05906b6b75a6c0fb5db821cc65e70cbd64a3e2a5eaae"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/chardet/chardet";
        license = licenses.lgpl2;
        description = "Universal encoding detector for Python 2 and 3";
      };
    };

    "cliff" = python.mkDerivation {
      name = "cliff-2.13.0";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/27/dc/4105138ccdf500a56f782ec2eb8a80eb3e35321133c9159224bda989d362/cliff-2.13.0.tar.gz"; sha256 = "447f0afe5fab907c51e3e451e6915cba424fe4a98962a5bdd7d4420b9d6aed35"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."PyYAML"
      self."cmd2"
      self."pbr"
      self."prettytable"
      self."pyparsing"
      self."six"
      self."stevedore"
      self."unicodecsv"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://docs.openstack.org/cliff/latest/";
        license = "License :: OSI Approved :: Apache Software License";
        description = "Command Line Interface Formulation Framework";
      };
    };

    "cmd2" = python.mkDerivation {
      name = "cmd2-0.8.8";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/e8/ee/e9d450ae62cc0bb535c1f9e3f67530abfdb7892a68761d11819b0da65467/cmd2-0.8.8.tar.gz"; sha256 = "b08bc5088fdd131d659354e6b4f8cf7c01a70566f68aed146e00d296a24b687b"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."contextlib2"
      self."enum34"
      self."pyparsing"
      self."pyperclip"
      self."six"
      self."subprocess32"
      self."wcwidth"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/python-cmd2/cmd2";
        license = licenses.mit;
        description = "cmd2 - a tool for building interactive command line applications in Python";
      };
    };

    "contextlib2" = python.mkDerivation {
      name = "contextlib2-0.5.5";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/6e/db/41233498c210b03ab8b072c8ee49b1cd63b3b0c76f8ea0a0e5d02df06898/contextlib2-0.5.5.tar.gz"; sha256 = "509f9419ee91cdd00ba34443217d5ca51f5a364a404e1dce9e8979cea969ca48"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://contextlib2.readthedocs.org";
        license = licenses.psfl;
        description = "Backports and enhancements for the contextlib module";
      };
    };

    "cryptography" = python.mkDerivation {
      name = "cryptography-2.3";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/79/a2/61c8625f96c8582d3053f89368c483ba62e56233d055e58e372f94a393f0/cryptography-2.3.tar.gz"; sha256 = "c132bab45d4bd0fff1d3fe294d92b0a6eb8404e93337b3127bdec9f21de117e6"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."asn1crypto"
      self."cffi"
      self."enum34"
      self."idna"
      self."ipaddress"
      self."iso8601"
      self."pytz"
      self."six"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/pyca/cryptography";
        license = licenses.bsdOriginal;
        description = "cryptography is a package which provides cryptographic recipes and primitives to Python developers.";
      };
    };

    "debtcollector" = python.mkDerivation {
      name = "debtcollector-1.19.0";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/44/db/6b54be9367110bc40468f3bcc75b115ab655a9fdd993a4ed01862fdb8d80/debtcollector-1.19.0.tar.gz"; sha256 = "4e90683553a6bb68d10a29b42c5df90d0e83d5085ff1ac2970c91314acdf8719"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."funcsigs"
      self."pbr"
      self."six"
      self."wrapt"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://docs.openstack.org/debtcollector/latest";
        license = "License :: OSI Approved :: Apache Software License";
        description = "A collection of Python deprecation patterns and strategies that help you collect your technical debt in a non-destructive manner.";
      };
    };

    "decorator" = python.mkDerivation {
      name = "decorator-4.3.0";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/6f/24/15a229626c775aae5806312f6bf1e2a73785be3402c0acdec5dbddd8c11e/decorator-4.3.0.tar.gz"; sha256 = "c39efa13fbdeb4506c476c9b3babf6a718da943dab7811c206005a4a956c080c"; };
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

    "deprecation" = python.mkDerivation {
      name = "deprecation-2.0.5";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/dd/06/aed49f13984c4acfcd67d699b2a0e96fefd2f9c700ce88a43120eb0363e2/deprecation-2.0.5.tar.gz"; sha256 = "cbe7d15006bc339709be5e02b14884ecc479639c1a3714a908de3a8ca13b5ca9"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."packaging"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://deprecation.readthedocs.io/";
        license = licenses.asl20;
        description = "A library to handle automated deprecations";
      };
    };

    "dogpile.cache" = python.mkDerivation {
      name = "dogpile.cache-0.6.6";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/48/ca/604154d835c3668efb8a31bd979b0ea4bf39c2934a40ffecc0662296cb51/dogpile.cache-0.6.6.tar.gz"; sha256 = "044d4ea0a0abc72491044f3d3df8e1fc9e8fa7a436c6e9a0da5850d23a0d16c1"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://bitbucket.org/zzzeek/dogpile.cache";
        license = licenses.bsdOriginal;
        description = "A caching front-end based on the Dogpile lock.";
      };
    };

    "enum34" = python.mkDerivation {
      name = "enum34-1.1.6";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/bf/3e/31d502c25302814a7c2f1d3959d2a3b3f78e509002ba91aea64993936876/enum34-1.1.6.tar.gz"; sha256 = "8ad8c4783bf61ded74527bffb48ed9b54166685e4230386a9ed9b1279e2df5b1"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://bitbucket.org/stoneleaf/enum34";
        license = licenses.bsdOriginal;
        description = "Python 3.4 Enum backported to 3.3, 3.2, 3.1, 2.7, 2.6, 2.5, and 2.4";
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

    "functools32" = python.mkDerivation {
      name = "functools32-3.2.3.post2";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/c5/60/6ac26ad05857c601308d8fb9e87fa36d0ebf889423f47c3502ef034365db/functools32-3.2.3-2.tar.gz"; sha256 = "f6253dfbe0538ad2e387bd8fdfd9293c925d63553f5813c4e587745416501e6d"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/MiCHiLU/python-functools32";
        license = "PSF license";
        description = "Backport of the functools module from Python 3.2.3 for use on 2.7 and PyPy.";
      };
    };

    "futures" = python.mkDerivation {
      name = "futures-3.2.0";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/1f/9e/7b2ff7e965fc654592269f2906ade1c7d705f1bf25b7d469fa153f7d19eb/futures-3.2.0.tar.gz"; sha256 = "9ec02aa7d674acb8618afb127e27fde7fc68994c0437ad759fa094a574adb265"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/agronholm/pythonfutures";
        license = licenses.psfl;
        description = "Backport of the concurrent.futures package from Python 3";
      };
    };

    "idna" = python.mkDerivation {
      name = "idna-2.7";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/65/c4/80f97e9c9628f3cac9b98bfca0402ede54e0563b56482e3e6e45c43c4935/idna-2.7.tar.gz"; sha256 = "684a38a6f903c1d71d6d5fac066b58d7768af4de2b832e426ec79c30daa94a16"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/kjd/idna";
        license = licenses.bsdOriginal;
        description = "Internationalized Domain Names in Applications (IDNA)";
      };
    };

    "ipaddress" = python.mkDerivation {
      name = "ipaddress-1.0.22";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/97/8d/77b8cedcfbf93676148518036c6b1ce7f8e14bf07e95d7fd4ddcb8cc052f/ipaddress-1.0.22.tar.gz"; sha256 = "b146c751ea45cad6188dd6cf2d9b757f6f4f8d6ffb96a023e6f2e26eea02a72c"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/phihag/ipaddress";
        license = licenses.psfl;
        description = "IPv4/IPv6 manipulation library";
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

    "jmespath" = python.mkDerivation {
      name = "jmespath-0.9.3";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/e5/21/795b7549397735e911b032f255cff5fb0de58f96da794274660bca4f58ef/jmespath-0.9.3.tar.gz"; sha256 = "6a81d4c9aa62caf061cb517b4d9ad1dd300374cd4706997aff9cd6aedd61fc64"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/jmespath/jmespath.py";
        license = licenses.mit;
        description = "JSON Matching Expressions";
      };
    };

    "jsonpatch" = python.mkDerivation {
      name = "jsonpatch-1.23";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/9a/7d/bcf203d81939420e1aaf7478a3efce1efb8ccb4d047a33cb85d7f96d775e/jsonpatch-1.23.tar.gz"; sha256 = "49f29cab70e9068db3b1dc6b656cbe2ee4edf7dfe9bf5a0055f17a4b6804a4b9"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."jsonpointer"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/stefankoegl/python-json-patch";
        license = licenses.bsdOriginal;
        description = "Apply JSON-Patches (RFC 6902) ";
      };
    };

    "jsonpointer" = python.mkDerivation {
      name = "jsonpointer-2.0";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/52/e7/246d9ef2366d430f0ce7bdc494ea2df8b49d7a2a41ba51f5655f68cfe85f/jsonpointer-2.0.tar.gz"; sha256 = "c192ba86648e05fdae4f08a17ec25180a9aef5008d973407b581798a83975362"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/stefankoegl/python-json-pointer";
        license = licenses.bsdOriginal;
        description = "Identify specific nodes in a JSON document (RFC 6901) ";
      };
    };

    "jsonschema" = python.mkDerivation {
      name = "jsonschema-2.6.0";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/58/b9/171dbb07e18c6346090a37f03c7e74410a1a56123f847efed59af260a298/jsonschema-2.6.0.tar.gz"; sha256 = "6ff5f3180870836cae40f06fa10419f557208175f13ad7bc26caa77beb1f6e02"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."functools32"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://github.com/Julian/jsonschema";
        license = licenses.mit;
        description = "An implementation of JSON Schema validation for Python";
      };
    };

    "keystoneauth1" = python.mkDerivation {
      name = "keystoneauth1-3.9.0";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/7b/69/28113a3bc22416c23d4f111984b109aeb09273153abe2d87ccfa0b78a68f/keystoneauth1-3.9.0.tar.gz"; sha256 = "59060ee313e2c57dcab9bfd59ca555bf9dc8e46cb76a5bbfb4be4eef6da6b016"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."PyYAML"
      self."iso8601"
      self."os-service-types"
      self."oslo.config"
      self."oslo.utils"
      self."pbr"
      self."requests"
      self."six"
      self."stevedore"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://docs.openstack.org/keystoneauth/latest/";
        license = "License :: OSI Approved :: Apache Software License";
        description = "Authentication Library for OpenStack Identity";
      };
    };

    "monotonic" = python.mkDerivation {
      name = "monotonic-1.5";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/19/c1/27f722aaaaf98786a1b338b78cf60960d9fe4849825b071f4e300da29589/monotonic-1.5.tar.gz"; sha256 = "23953d55076df038541e648a53676fb24980f7a1be290cdda21300b3bc21dfb0"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/atdt/monotonic";
        license = "License :: OSI Approved :: Apache Software License";
        description = "An implementation of time.monotonic() for Python 2 & < 3.3";
      };
    };

    "msgpack" = python.mkDerivation {
      name = "msgpack-0.5.6";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/f3/b6/9affbea179c3c03a0eb53515d9ce404809a122f76bee8fc8c6ec9497f51f/msgpack-0.5.6.tar.gz"; sha256 = "0ee8c8c85aa651be3aa0cd005b5931769eaa658c948ce79428766f1bd46ae2c3"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://msgpack.org/";
        license = licenses.asl20;
        description = "MessagePack (de)serializer.";
      };
    };

    "munch" = python.mkDerivation {
      name = "munch-2.3.2";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/68/f4/260ec98ea840757a0da09e0ed8135333d59b8dfebe9752a365b04857660a/munch-2.3.2.tar.gz"; sha256 = "6ae3d26b837feacf732fb8aa5b842130da1daf221f5af9f9d4b2a0a6414b0d51"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."six"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://github.com/Infinidat/munch";
        license = licenses.mit;
        description = "A dot-accessible dictionary (a la JavaScript objects).";
      };
    };

    "netaddr" = python.mkDerivation {
      name = "netaddr-0.7.19";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/0c/13/7cbb180b52201c07c796243eeff4c256b053656da5cfe3916c3f5b57b3a0/netaddr-0.7.19.tar.gz"; sha256 = "38aeec7cdd035081d3a4c306394b19d677623bf76fa0913f6695127c7753aefd"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/drkjam/netaddr/";
        license = licenses.bsdOriginal;
        description = "A network address manipulation library for Python";
      };
    };

    "netifaces" = python.mkDerivation {
      name = "netifaces-0.10.7";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/81/39/4e9a026265ba944ddf1fea176dbb29e0fe50c43717ba4fcf3646d099fe38/netifaces-0.10.7.tar.gz"; sha256 = "bd590fcb75421537d4149825e1e63cca225fd47dad861710c46bd1cb329d8cbd"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/al45tair/netifaces";
        license = licenses.mit;
        description = "Portable network interface information.";
      };
    };

    "openstacksdk" = python.mkDerivation {
      name = "openstacksdk-0.16.0";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/13/b7/ef77e4e2053204a5d82d78634c077198f3003518cfe4a103d09b54918119/openstacksdk-0.16.0.tar.gz"; sha256 = "a3c375ca00365fb359385bde759c8ccbdd63f871199248fab6757e733b7a9b85"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."PyYAML"
      self."appdirs"
      self."decorator"
      self."deprecation"
      self."dogpile.cache"
      self."futures"
      self."ipaddress"
      self."iso8601"
      self."jmespath"
      self."jsonpatch"
      self."keystoneauth1"
      self."munch"
      self."netifaces"
      self."os-service-types"
      self."pbr"
      self."requestsexceptions"
      self."six"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://developer.openstack.org/sdks/python/openstacksdk/";
        license = "License :: OSI Approved :: Apache Software License";
        description = "An SDK for building applications to work with OpenStack";
      };
    };

    "os-service-types" = python.mkDerivation {
      name = "os-service-types-1.2.0";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/b3/22/1d0a1f5fd633fdbdff3ac1191f95773e3277d1138e4cee09a891c9ee51aa/os-service-types-1.2.0.tar.gz"; sha256 = "b08fb4ec1249d313afea2728fa4db916b1907806364126fe46de482671203111"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."pbr"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://www.openstack.org/";
        license = "License :: OSI Approved :: Apache Software License";
        description = "Python library for consuming OpenStack sevice-types-authority data";
      };
    };

    "osc-lib" = python.mkDerivation {
      name = "osc-lib-1.11.0";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/d2/4a/85f07a320b6c76b68cc43161bd7bcfa66af8d016e3b37a14108dd7a7ff2e/osc-lib-1.11.0.tar.gz"; sha256 = "2cb8fb0e170bdf9f230911bf81e7cb3b488e469365e8b9495ad7291b90b4cb25"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Babel"
      self."cliff"
      self."keystoneauth1"
      self."openstacksdk"
      self."oslo.i18n"
      self."oslo.utils"
      self."pbr"
      self."simplejson"
      self."six"
      self."stevedore"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://docs.openstack.org/osc-lib/latest/";
        license = "License :: OSI Approved :: Apache Software License";
        description = "OpenStackClient Library";
      };
    };

    "oslo.config" = python.mkDerivation {
      name = "oslo.config-6.3.0";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/de/c2/4b653f3db231643e3ee8a61952aaf3df95e5e591075cd3f3bb62928f5d40/oslo.config-6.3.0.tar.gz"; sha256 = "bffe681bed69882ca8fa12df07b8d5194bbebb54f6ccf73ad096d5f5535ef450"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."PyYAML"
      self."debtcollector"
      self."enum34"
      self."netaddr"
      self."oslo.i18n"
      self."rfc3986"
      self."six"
      self."stevedore"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://docs.openstack.org/oslo.config/latest/";
        license = "License :: OSI Approved :: Apache Software License";
        description = "Oslo Configuration API";
      };
    };

    "oslo.i18n" = python.mkDerivation {
      name = "oslo.i18n-3.20.0";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/cc/8d/9514c0f979c858fcbf3c8300769f8323d5c69c20cffe3543059e978329cd/oslo.i18n-3.20.0.tar.gz"; sha256 = "c3cf63c01fa3ff1b5ae7d6445d805c6bf5390ac010725cf126b18eb9086f4c4e"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Babel"
      self."pbr"
      self."six"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://docs.openstack.org/oslo.i18n/latest";
        license = "License :: OSI Approved :: Apache Software License";
        description = "Oslo i18n library";
      };
    };

    "oslo.serialization" = python.mkDerivation {
      name = "oslo.serialization-2.27.0";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/21/b0/15a593a9fe8963cf3798f5b892389036936f0972ddc60d2b089b90c56517/oslo.serialization-2.27.0.tar.gz"; sha256 = "ec3f8ef108199204dcbded425e940625c3d4d8663cb69724c58d3c29031ab8e3"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."msgpack"
      self."oslo.utils"
      self."pbr"
      self."pytz"
      self."six"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://docs.openstack.org/developer/oslo.serialization/";
        license = "License :: OSI Approved :: Apache Software License";
        description = "Oslo Serialization library";
      };
    };

    "oslo.utils" = python.mkDerivation {
      name = "oslo.utils-3.36.3";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/88/36/638cadf97ac2f29e6b4c452f7aecb1294c38916ed869a6a23ee0ed794d4c/oslo.utils-3.36.3.tar.gz"; sha256 = "90ad73099884c6454b33ec809fde72e943b2a4481682a5f4d8aa6d103fddd73f"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."debtcollector"
      self."funcsigs"
      self."iso8601"
      self."monotonic"
      self."netaddr"
      self."netifaces"
      self."oslo.i18n"
      self."pbr"
      self."pyparsing"
      self."pytz"
      self."six"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://docs.openstack.org/oslo.utils/latest/";
        license = "License :: OSI Approved :: Apache Software License";
        description = "Oslo Utility library";
      };
    };

    "packaging" = python.mkDerivation {
      name = "packaging-17.1";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/77/32/439f47be99809c12ef2da8b60a2c47987786d2c6c9205549dd6ef95df8bd/packaging-17.1.tar.gz"; sha256 = "f019b770dd64e585a99714f1fd5e01c7a8f11b45635aa953fd41c689a657375b"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."pyparsing"
      self."six"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/pypa/packaging";
        license = licenses.bsdOriginal;
        description = "Core utilities for Python packages";
      };
    };

    "pbr" = python.mkDerivation {
      name = "pbr-4.1.0";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/04/69/25fb4c68ae8093cf7698cec37dbbfdd3f6161ccd94a407aea0c6c1d8ce29/pbr-4.1.0.tar.gz"; sha256 = "e0f23b61ec42473723b2fec2f33fb12558ff221ee551962f01dd4de9053c2055"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://docs.openstack.org/pbr/latest/";
        license = "License :: OSI Approved :: Apache Software License";
        description = "Python Build Reasonableness";
      };
    };

    "prettytable" = python.mkDerivation {
      name = "prettytable-0.7.2";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/ef/30/4b0746848746ed5941f052479e7c23d2b56d174b82f4fd34a25e389831f5/prettytable-0.7.2.tar.bz2"; sha256 = "853c116513625c738dc3ce1aee148b5b5757a86727e67eff6502c7ca59d43c36"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://code.google.com/p/prettytable";
        license = licenses.bsdOriginal;
        description = "A simple Python library for easily displaying tabular data in a visually appealing ASCII table format";
      };
    };

    "pyOpenSSL" = python.mkDerivation {
      name = "pyOpenSSL-18.0.0";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/9b/7c/ee600b2a9304d260d96044ab5c5e57aa489755b92bbeb4c0803f9504f480/pyOpenSSL-18.0.0.tar.gz"; sha256 = "6488f1423b00f73b7ad5167885312bb0ce410d3312eb212393795b53c8caa580"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."cryptography"
      self."six"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://pyopenssl.org/";
        license = licenses.asl20;
        description = "Python wrapper module around the OpenSSL library";
      };
    };

    "pycparser" = python.mkDerivation {
      name = "pycparser-2.18";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/8c/2d/aad7f16146f4197a11f8e91fb81df177adcc2073d36a17b1491fd09df6ed/pycparser-2.18.tar.gz"; sha256 = "99a8ca03e29851d96616ad0404b4aad7d9ee16f25c9f9708a11faf2810f7b226"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/eliben/pycparser";
        license = licenses.bsdOriginal;
        description = "C parser in Python";
      };
    };

    "pyparsing" = python.mkDerivation {
      name = "pyparsing-2.2.0";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/3c/ec/a94f8cf7274ea60b5413df054f82a8980523efd712ec55a59e7c3357cf7c/pyparsing-2.2.0.tar.gz"; sha256 = "0832bcf47acd283788593e7a0f542407bd9550a55a8a8435214a1960e04bcb04"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://pyparsing.wikispaces.com/";
        license = licenses.mit;
        description = "Python parsing module";
      };
    };

    "pyperclip" = python.mkDerivation {
      name = "pyperclip-1.6.2";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/33/15/f3c29b381815ae75e27589583655f4a8567721c541b8ba8cd52f76868655/pyperclip-1.6.2.tar.gz"; sha256 = "43496f0a1f363a5ecfc4cda5eba6a2a3d5056fe6c7ffb9a99fbb1c5a3c7dea05"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/asweigart/pyperclip";
        license = licenses.bsdOriginal;
        description = "A cross-platform clipboard module for Python. (Only handles plain text for now.)";
      };
    };

    "python-cinderclient" = python.mkDerivation {
      name = "python-cinderclient-3.6.1";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/dd/91/40d557b0760da0776411fcf7a20734de4a6f30b05681c7abcb17b2f777ea/python-cinderclient-3.6.1.tar.gz"; sha256 = "05085a2692391bb2f000bd64e6ad333783a6fc2e72158fda63375b4d5fc0bf60"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Babel"
      self."keystoneauth1"
      self."oslo.i18n"
      self."oslo.utils"
      self."pbr"
      self."prettytable"
      self."simplejson"
      self."six"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://docs.openstack.org/python-cinderclient/latest/";
        license = "License :: OSI Approved :: Apache Software License";
        description = "OpenStack Block Storage API Client Library";
      };
    };

    "python-glanceclient" = python.mkDerivation {
      name = "python-glanceclient-2.11.1";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/72/d1/37b59cdefa42de90dba94a2dc42ceb599e89423cc03ab837fe07dba05732/python-glanceclient-2.11.1.tar.gz"; sha256 = "4c06dd38d8c95ef5e0bae72133f067da6ee7b710a10b677855beabd3cc7af50e"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."keystoneauth1"
      self."oslo.i18n"
      self."oslo.utils"
      self."pbr"
      self."prettytable"
      self."pyOpenSSL"
      self."requests"
      self."six"
      self."warlock"
      self."wrapt"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://docs.openstack.org/python-glanceclient/latest/";
        license = licenses.asl20;
        description = "OpenStack Image API Client Library";
      };
    };

    "python-keystoneclient" = python.mkDerivation {
      name = "python-keystoneclient-3.17.0";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/f0/b4/f918f4873f1a3d4f7a00e874cddcc1bb67dc5ec1ce58166d96d42738d8fe/python-keystoneclient-3.17.0.tar.gz"; sha256 = "7fb770e194760fa3508e758e6ad316fc55d5b4ff97aa688867ef50f62f687624"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."debtcollector"
      self."keystoneauth1"
      self."oslo.config"
      self."oslo.i18n"
      self."oslo.serialization"
      self."oslo.utils"
      self."pbr"
      self."requests"
      self."six"
      self."stevedore"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://docs.openstack.org/python-keystoneclient/latest/";
        license = "License :: OSI Approved :: Apache Software License";
        description = "Client Library for OpenStack Identity";
      };
    };

    "python-novaclient" = python.mkDerivation {
      name = "python-novaclient-10.3.0";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/62/71/6b6a3e2d351c51fdb3449d0f445a379a30f6538e3abe36356e8a533caaf6/python-novaclient-10.3.0.tar.gz"; sha256 = "221c9a8c406146ebc51f78fe22c0eb0c36780eaef56b05ed0c04ec883bf8f90b"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Babel"
      self."iso8601"
      self."keystoneauth1"
      self."oslo.i18n"
      self."oslo.serialization"
      self."oslo.utils"
      self."pbr"
      self."prettytable"
      self."simplejson"
      self."six"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://docs.openstack.org/python-novaclient/latest";
        license = licenses.asl20;
        description = "Client library for OpenStack Compute API";
      };
    };

    "python-openstackclient" = python.mkDerivation {
      name = "python-openstackclient-3.15.0";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/6a/a1/3974a6261ce3eeb52859288934a8d7a8756dc895036fddaddd1d0c23773f/python-openstackclient-3.15.0.tar.gz"; sha256 = "075a8e38551ae24e32f61083d833990654eeaa7b516c5e3c6cc2a537d6d098d3"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Babel"
      self."cliff"
      self."keystoneauth1"
      self."openstacksdk"
      self."osc-lib"
      self."oslo.i18n"
      self."oslo.utils"
      self."pbr"
      self."python-cinderclient"
      self."python-glanceclient"
      self."python-keystoneclient"
      self."python-novaclient"
      self."six"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://docs.openstack.org/python-openstackclient/latest/";
        license = "License :: OSI Approved :: Apache Software License";
        description = "OpenStack Command-line Client";
      };
    };

    "pytz" = python.mkDerivation {
      name = "pytz-2018.5";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/ca/a9/62f96decb1e309d6300ebe7eee9acfd7bccaeedd693794437005b9067b44/pytz-2018.5.tar.gz"; sha256 = "ffb9ef1de172603304d9d2819af6f5ece76f2e85ec10692a524dd876e72bf277"; };
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

    "requests" = python.mkDerivation {
      name = "requests-2.19.1";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/54/1f/782a5734931ddf2e1494e4cd615a51ff98e1879cbe9eecbdfeaf09aa75e9/requests-2.19.1.tar.gz"; sha256 = "ec22d826a36ed72a7358ff3fe56cbd4ba69dd7a6718ffd450ff0e9df7a47ce6a"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."certifi"
      self."chardet"
      self."cryptography"
      self."idna"
      self."pyOpenSSL"
      self."urllib3"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://python-requests.org";
        license = licenses.asl20;
        description = "Python HTTP for Humans.";
      };
    };

    "requestsexceptions" = python.mkDerivation {
      name = "requestsexceptions-1.4.0";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/82/ed/61b9652d3256503c99b0b8f145d9c8aa24c514caff6efc229989505937c1/requestsexceptions-1.4.0.tar.gz"; sha256 = "b095cbc77618f066d459a02b137b020c37da9f46d9b057704019c9f77dba3065"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://www.openstack.org/";
        license = "License :: OSI Approved :: Apache Software License";
        description = "Import exceptions from potentially bundled packages in requests.";
      };
    };

    "rfc3986" = python.mkDerivation {
      name = "rfc3986-1.1.0";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/4b/f6/8f0a24e50454494b0736fe02e6617e7436f2b30148b8f062462177e2ca2d/rfc3986-1.1.0.tar.gz"; sha256 = "8458571c4c57e1cf23593ad860bb601b6a604df6217f829c2bc70dc4b5af941b"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://rfc3986.readthedocs.io";
        license = licenses.asl20;
        description = "Validating URI References per RFC 3986";
      };
    };

    "simplejson" = python.mkDerivation {
      name = "simplejson-3.16.0";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/e3/24/c35fb1c1c315fc0fffe61ea00d3f88e85469004713dab488dee4f35b0aff/simplejson-3.16.0.tar.gz"; sha256 = "b1f329139ba647a9548aa05fb95d046b4a677643070dc2afc05fa2e975d09ca5"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/simplejson/simplejson";
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

    "stevedore" = python.mkDerivation {
      name = "stevedore-1.28.0";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/ba/40/92295187c3157c109fde84eb2d4002c2bb3ab5a9c1df09f7fd96e6dfd5c9/stevedore-1.28.0.tar.gz"; sha256 = "f1c7518e7b160336040fee272174f1f7b29a46febb3632502a8f2055f973d60b"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."pbr"
      self."six"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://docs.openstack.org/stevedore/latest/";
        license = "License :: OSI Approved :: Apache Software License";
        description = "Manage dynamic plugins for Python applications";
      };
    };

    "subprocess32" = python.mkDerivation {
      name = "subprocess32-3.5.2";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/c3/5f/7117737fc7114061837a4f51670d863dd7f7f9c762a6546fa8a0dcfe61c8/subprocess32-3.5.2.tar.gz"; sha256 = "eb2b989cf03ffc7166339eb34f1aa26c5ace255243337b1e22dab7caa1166687"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/google/python-subprocess32";
        license = licenses.psfl;
        description = "A backport of the subprocess module from Python 3 for use on 2.x.";
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

    "urllib3" = python.mkDerivation {
      name = "urllib3-1.23";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/3c/d2/dc5471622bd200db1cd9319e02e71bc655e9ea27b8e0ce65fc69de0dac15/urllib3-1.23.tar.gz"; sha256 = "a68ac5e15e76e7e5dd2b8f94007233e01effe3e50e8daddf69acfd81cb686baf"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."certifi"
      self."cryptography"
      self."idna"
      self."ipaddress"
      self."pyOpenSSL"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://urllib3.readthedocs.io/";
        license = licenses.mit;
        description = "HTTP library with thread-safe connection pooling, file post, and more.";
      };
    };

    "warlock" = python.mkDerivation {
      name = "warlock-1.3.0";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/2d/40/9f01a5e1574dab946598793351d59c86f58209d182d229aaa545abb98894/warlock-1.3.0.tar.gz"; sha256 = "d7403f728fce67ee2f22f3d7fa09c9de0bc95c3e7bcf6005b9c1962b77976a06"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."jsonpatch"
      self."jsonschema"
      self."six"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://github.com/bcwaldon/warlock";
        license = "";
        description = "Python object model built on JSON schema and JSON patch.";
      };
    };

    "wcwidth" = python.mkDerivation {
      name = "wcwidth-0.1.7";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/55/11/e4a2bb08bb450fdbd42cc709dd40de4ed2c472cf0ccb9e64af22279c5495/wcwidth-0.1.7.tar.gz"; sha256 = "3df37372226d6e63e1b1e1eda15c594bca98a22d33a23832a90998faa96bc65e"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/jquast/wcwidth";
        license = licenses.mit;
        description = "Measures number of Terminal column cells of wide-character codes";
      };
    };

    "wrapt" = python.mkDerivation {
      name = "wrapt-1.10.11";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/a0/47/66897906448185fcb77fc3c2b1bc20ed0ecca81a0f2f88eda3fc5a34fc3d/wrapt-1.10.11.tar.gz"; sha256 = "d4d560d479f2c21e1b5443bbd15fe7ec4b37fe7e53d335d3b9b0a7b1226fe3c6"; };
      doCheck = commonDoCheck;
      checkPhase = "";
      installCheckPhase = "";
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/GrahamDumpleton/wrapt";
        license = licenses.bsdOriginal;
        description = "Module for decorators, wrappers and monkey patching.";
      };
    };
  };
  localOverridesFile = ./requirements_override.nix;
  overrides = import localOverridesFile { inherit pkgs python; };
  commonOverrides = [
    
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
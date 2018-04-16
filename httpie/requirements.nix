# generated using pypi2nix tool (version: 1.8.1)
# See more at: https://github.com/garbas/pypi2nix
#
# COMMAND:
#   pypi2nix -W https://travis.garbas.si/wheels_cache/ -v -V 3.5 -O ../overrides.nix -E gcc -E openssl -E libffi -E kerberos -r requirements.txt
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

  commonBuildInputs = with pkgs; [ gcc openssl libffi kerberos ];
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
    "PyJWT" = python.mkDerivation {
      name = "PyJWT-1.6.1";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/ee/af/7f500e3e587c927c88422099ce7ed9247f89f3217cabf00d3f48fe3ad5fe/PyJWT-1.6.1.tar.gz"; sha256 = "dacba5786fe3bf1a0ae8673874e29f9ac497860955c501289c63b15d3daae63a"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."cryptography"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://github.com/jpadilla/pyjwt";
        license = licenses.mit;
        description = "JSON Web Token implementation in Python";
      };
    };

    "Pygments" = python.mkDerivation {
      name = "Pygments-2.2.0";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/71/2a/2e4e77803a8bd6408a2903340ac498cb0a2181811af7c9ec92cb70b0308a/Pygments-2.2.0.tar.gz"; sha256 = "dbae1046def0efb574852fab9e90209b23f556367b5a320c0bcb871c77c3e8cc"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://pygments.org/";
        license = licenses.bsdOriginal;
        description = "Pygments is a syntax highlighting package written in Python.";
      };
    };

    "asn1crypto" = python.mkDerivation {
      name = "asn1crypto-0.24.0";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/fc/f1/8db7daa71f414ddabfa056c4ef792e1461ff655c2ae2928a2b675bfed6b4/asn1crypto-0.24.0.tar.gz"; sha256 = "9d5c20441baf0cb60a4ac34cc447c6c189024b6b4c6cd7877034f4965c464e49"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/wbond/asn1crypto";
        license = licenses.mit;
        description = "Fast ASN.1 parser and serializer with definitions for private keys, public keys, certificates, CRL, OCSP, CMS, PKCS#3, PKCS#7, PKCS#8, PKCS#12, PKCS#5, X.509 and TSP";
      };
    };

    "aws-requests-auth" = python.mkDerivation {
      name = "aws-requests-auth-0.4.1";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/bf/29/ba511024967460eb7411100f4143dd39f038e0887f2c1d3fa05d0d1a6048/aws-requests-auth-0.4.1.tar.gz"; sha256 = "3a3157843c6971b638336587d5cc0d09cc46848f953c677470829fc6006b93c3"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."requests"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/davidmuller/aws-requests-auth";
        license = licenses.bsdOriginal;
        description = "AWS signature version 4 signing process for the python requests module";
      };
    };

    "boto3" = python.mkDerivation {
      name = "boto3-1.7.4";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/c3/94/c4acda8f638697ad75ea92b6f256af4b21b69f44a8d42d33cfba68cb20f1/boto3-1.7.4.tar.gz"; sha256 = "a56b21efbc994580fc9cef454f0f949745c152326f939aed6609d1c47b2a0f8f"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."botocore"
      self."jmespath"
      self."s3transfer"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/boto/boto3";
        license = licenses.asl20;
        description = "The AWS SDK for Python";
      };
    };

    "botocore" = python.mkDerivation {
      name = "botocore-1.10.4";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/3c/48/fc6df53b42480e84965f3a46fe6f746bf4c83e6c982487907f641a6815fc/botocore-1.10.4.tar.gz"; sha256 = "5602738392ecde5c02a06a3b02de07171f440a44cdfef0aadff4b59567359607"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."docutils"
      self."jmespath"
      self."python-dateutil"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/boto/botocore";
        license = licenses.asl20;
        description = "Low-level, data-driven core of boto 3.";
      };
    };

    "certifi" = python.mkDerivation {
      name = "certifi-2018.1.18";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/15/d4/2f888fc463d516ff7bf2379a4e9a552fef7f22a94147655d9b1097108248/certifi-2018.1.18.tar.gz"; sha256 = "edbc3f203427eef571f79a7692bb160a2b0f7ccaa31953e99bd17e307cf63f7d"; };
      doCheck = commonDoCheck;
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
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/chardet/chardet";
        license = licenses.lgpl2;
        description = "Universal encoding detector for Python 2 and 3";
      };
    };

    "cryptography" = python.mkDerivation {
      name = "cryptography-2.2.2";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/ec/b2/faa78c1ab928d2b2c634c8b41ff1181f0abdd9adf9193211bd606ffa57e2/cryptography-2.2.2.tar.gz"; sha256 = "9fc295bf69130a342e7a19a39d7bbeb15c0bcaabc7382ec33ef3b2b7d18d2f63"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."asn1crypto"
      self."cffi"
      self."idna"
      self."six"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/pyca/cryptography";
        license = licenses.bsdOriginal;
        description = "cryptography is a package which provides cryptographic recipes and primitives to Python developers.";
      };
    };

    "docutils" = python.mkDerivation {
      name = "docutils-0.14";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/84/f4/5771e41fdf52aabebbadecc9381d11dea0fa34e4759b4071244fa094804c/docutils-0.14.tar.gz"; sha256 = "51e64ef2ebfb29cae1faa133b3710143496eca21c530f3f71424d77687764274"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://docutils.sourceforge.net/";
        license = licenses.publicDomain;
        description = "Docutils -- Python Documentation Utilities";
      };
    };

    "edgegrid-python" = python.mkDerivation {
      name = "edgegrid-python-1.1.0";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/2f/77/702e98a12a099bd5cd769f1d9c2d6802da409d7fcc8dfdaebea60c49bf19/edgegrid-python-1.1.0.tar.gz"; sha256 = "be87d29d5cd119ef80a44cd1a6203738a6a84713c01d5a4f20eac2d029927e82"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."ndg-httpsclient"
      self."pyasn1"
      self."requests"
      self."urllib3"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/akamai-open/AkamaiOPEN-edgegrid-python";
        license = "LICENSE.txt";
        description = "{OPEN} client authentication protocol for python-requests";
      };
    };

    "escherauth" = python.mkDerivation {
      name = "escherauth-0.2.5";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/b3/d4/0c7540909c14a5335a6ce01b6d50a2208a93af0ceb2f9fd0b67ccb6fc5b2/escherauth-0.2.5.tar.gz"; sha256 = "7167d27d0cde070dd274d9b4b2daed92ad6d1c765a4b5ec72175695e824a2e0b"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."requests"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://escherauth.io/";
        license = licenses.mit;
        description = "Python implementation of the AWS4 compatible Escher HTTP request signing protocol.";
      };
    };

    "h2" = python.mkDerivation {
      name = "h2-2.6.2";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/c9/ad/73a6c1a40eadbf9eef93fe16285a366c834cbd61783c30e6c23ef4b11e53/h2-2.6.2.tar.gz"; sha256 = "af35878673c83a44afbc12b13ac91a489da2819b5dc1e11768f3c2406f740fe9"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."hpack"
      self."hyperframe"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://hyper.rtfd.org";
        license = licenses.mit;
        description = "HTTP/2 State-Machine based protocol implementation";
      };
    };

    "hpack" = python.mkDerivation {
      name = "hpack-3.0.0";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/44/f1/b4440e46e265a29c0cb7b09b6daec6edf93c79eae713cfed93fbbf8716c5/hpack-3.0.0.tar.gz"; sha256 = "8eec9c1f4bfae3408a3f30500261f7e6a65912dc138526ea054f9ad98892e9d2"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://hyper.rtfd.org";
        license = licenses.mit;
        description = "Pure-Python HPACK header compression";
      };
    };

    "httpie" = python.mkDerivation {
      name = "httpie-0.9.9";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/28/93/4ebf2de4bc74bd517a27a600b2b23a5254a20f28e6e36fc876fd98f7a51b/httpie-0.9.9.tar.gz"; sha256 = "f1202e6fa60367e2265284a53f35bfa5917119592c2ab08277efc7fffd744fcb"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."Pygments"
      self."requests"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://httpie.org/";
        license = licenses.bsdOriginal;
        description = "HTTPie - a CLI, cURL-like tool for humans.";
      };
    };

    "httpie-akamai" = python.mkDerivation {
      name = "httpie-akamai-0.1.5";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/32/39/65a16bc76384626b8548994f9a128e9409b7b538abe4471c0b7d7f339b7c/httpie-akamai-0.1.5.tar.gz"; sha256 = "82388338c732d42023611aa81534e94d0c66afd91832cad9acb10870b3a25bcc"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."httpie"
      self."requests"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/matteck/httpie-akamai";
        license = licenses.bsdOriginal;
        description = "Akamai utility plugins for HTTPie.";
      };
    };

    "httpie-api-auth" = python.mkDerivation {
      name = "httpie-api-auth-0.3.0";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/d5/8a/83684aa4e9d7b326706613a96a205c898c02125e3cca47626975c974cad9/httpie-api-auth-0.3.0.tar.gz"; sha256 = "0f37bdb3f916125b9a19b4ccec0e7524539608e10d54abc8802500a2b8574a26"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."httpie"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/pd/httpie-api-auth";
        license = licenses.mit;
        description = "ApiAuth plugin for HTTPie.";
      };
    };

    "httpie-aws-auth" = python.mkDerivation {
      name = "httpie-aws-auth-0.0.3";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/e2/ad/141b002f7f962ae37622c4ba675eb7fa2621c29c802da1a46fe85d5f792e/httpie-aws-auth-0.0.3.tar.gz"; sha256 = "1af0b0a7430cc3246a570a8dd0e17dd9251c7e978e6c6b7cab77f566801ba14e"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."httpie"
      self."requests-aws"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/jkbrzt/httpie-aws-auth";
        license = licenses.bsdOriginal;
        description = "AWS/S3 auth plugin for HTTPie.";
      };
    };

    "httpie-aws-authv4" = python.mkDerivation {
      name = "httpie-aws-authv4-0.1.2";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/a9/bb/390bd36f7b8245e6df0eaff598c002ecb9f1dc5e7123d6374c9b2b05f50d/httpie-aws-authv4-0.1.2.tar.gz"; sha256 = "45dea0c499a3506730fa9346f1b936583ec0c1808a846baae98691e49f74cfcc"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."aws-requests-auth"
      self."boto3"
      self."httpie"
      self."requests-aws"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/aidan-/httpie-aws-authv4";
        license = licenses.bsdOriginal;
        description = "AWS auth v4 plugin for HTTPie.";
      };
    };

    "httpie-dag" = python.mkDerivation {
      name = "httpie-dag-0.1.0";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/0a/86/eab17701120c36fceaf0972011f1d99f4be20b9c8f6c9aaaaf3f43a273e4/httpie-dag-0.1.0.tar.gz"; sha256 = "53a5e340b07f94743c9622734b1a8dfdb1908b3b84e95eba38f9079827ddb6fd"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."httpie"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/iij/httpie-dag";
        license = licenses.bsdOriginal;
        description = "HTTPie plugin for IIJ GIO Storage & Analysis Service(DAG).";
      };
    };

    "httpie-django-auth" = python.mkDerivation {
      name = "httpie-django-auth-0.1.1";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/87/e9/46a546fa2a6eb753ff1b504466933a30468df08f45493856d2addf5bbfcc/httpie-django-auth-0.1.1.tar.gz"; sha256 = "216d1dc3925918cb248fdf093ef6def3658a2744aa02ce89a48a06642d4a2add"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."httpie"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/chillaranand/httpie-django-auth";
        license = licenses.mit;
        description = "django Auth plugin for HTTPie.";
      };
    };

    "httpie-edgegrid" = python.mkDerivation {
      name = "httpie-edgegrid-1.0.6";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/c8/e0/5eac4a04f7fca62dbbf7b302abb2d81676ff132aaf1373ba005b8d5bab80/httpie-edgegrid-1.0.6.tar.gz"; sha256 = "8aa1641591a0f94545907e03ce2f0f1077bd028a82b88ab7933186d42aad6a85"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."edgegrid-python"
      self."httpie"
      self."pyOpenSSL"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/akamai-open/httpie-edgegrid";
        license = licenses.asl20;
        description = "Edgegrid plugin for HTTPie.";
      };
    };

    "httpie-ems-auth" = python.mkDerivation {
      name = "httpie-ems-auth-0.2.2";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/b8/52/53fe718352385867f3779880c6f332a3b5e7d00ee60cb4eecd6641e09d11/httpie-ems-auth-0.2.2.tar.gz"; sha256 = "f756a92ddb358241d708b85e6ba57e694a1d31c2c37ed3002dabaff906c1f74f"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."escherauth"
      self."httpie"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/emartech/httpie-ems-auth";
        license = licenses.mit;
        description = "EmsAuth plugin for HTTPie.";
      };
    };

    "httpie-ems-auth-p3" = python.mkDerivation {
      name = "httpie-ems-auth-p3-0.2.3";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/44/ad/fc5be78495f455b44c9b0ee8a50e8ddbb3ea5bbdf41ffc35b1a8c9da0fea/httpie-ems-auth-p3-0.2.3.tar.gz"; sha256 = "52bd36adeeaf7df11fdfe4f24df4b14e4063a74f544cc2efcf891b8c90ea67e7"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."escherauth"
      self."httpie"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/emartech/httpie-ems-auth";
        license = licenses.mit;
        description = "EmsAuth plugin for HTTPie.";
      };
    };

    "httpie-escher-auth" = python.mkDerivation {
      name = "httpie-escher-auth-0.1.0";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/39/ba/b89e1bbafa96bf53269a13bc1a0b1ae5cf3cbca87a4068ef2b50a1a8d34a/httpie-escher-auth-0.1.0.tar.gz"; sha256 = "41565ee2b884bd7043caae6b580e971b1d211cec12ff945da8c877d25dcfde30"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."escherauth"
      self."httpie"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/emartech/httpie-escher-auth";
        license = licenses.mit;
        description = "EscherAuth plugin for HTTPie.";
      };
    };

    "httpie-esni-auth" = python.mkDerivation {
      name = "httpie-esni-auth-1.0.0";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/a9/6f/f5c73d194cecc859a66a3b347f04380b37eb7987a2f021115db23ac97406/httpie-esni-auth-1.0.0.tar.gz"; sha256 = "6c1f73b875a947f8b9694ce55991e6c0450b32705ad1b0e02cb75e8bcdee0c79"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."httpie"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/pd/httpie-esni-auth";
        license = licenses.mit;
        description = "ESNI auth plugin for HTTPie.";
      };
    };

    "httpie-f5-auth" = python.mkDerivation {
      name = "httpie-f5-auth-0.0.6";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/7d/05/a79bb2e20d0762872b9b1bf07bb3c6e71ad14e233faf1ebfd5ddf44f39cb/httpie-f5-auth-0.0.6.tar.gz"; sha256 = "b3912566e32b5fc1d8c389c26c8fffad38cfc8eee29799b90fc1e33dc76bd1b4"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."httpie"
      self."requests"
      self."requests-f5auth"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/imecimore/httpie-f5-auth";
        license = licenses.mit;
        description = "F5 BIG-IQ Auth plugin for HTTPie.";
      };
    };

    "httpie-hmac-auth" = python.mkDerivation {
      name = "httpie-hmac-auth-0.2.3";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/b1/b7/c4877e0c5b565166bc5b9df5dd1552aa2ba43983b1c9176fbbd8d9528b27/httpie-hmac-auth-0.2.3.tar.gz"; sha256 = "c8912ddf803c5d66aa4409d034f592f268f612c7d31451bde54c05edfd82e7b9"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."httpie"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/guardian/httpie-hmac-auth";
        license = licenses.mit;
        description = "HMAC Auth plugin for HTTPie.";
      };
    };

    "httpie-http2" = python.mkDerivation {
      name = "httpie-http2-0.0.1";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/35/e2/41c672bb014b9e7d4498c1f6c24be1bd2e2d9432cb16218afd94af39858c/httpie-http2-0.0.1.tar.gz"; sha256 = "0d5bb65d40a014368623d3ad48760d0a32951772b2267ab12577d82af51f3de7"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."httpie"
      self."hyper"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/jakubroztocil/httpie-http2";
        license = licenses.bsdOriginal;
        description = "HTTP/2 plugin for HTTPie.";
      };
    };

    "httpie-httpsig-auth" = python.mkDerivation {
      name = "httpie-httpsig-auth-0.1.1";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/b5/83/8ba08654654de4fbb477ec242a77df09c206a95a82e7326184f8f09b8654/httpie-httpsig-auth-0.1.1.tar.gz"; sha256 = "971bc9e9070c32df6ce79b55998c45e6ae9fa6a02746cffca3fc6aec9ef57a8e"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."httpie"
      self."httpsig-cffi"
      self."requests"
      self."six"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/east36/httpie-http-signatures";
        license = licenses.bsdOriginal;
        description = "HTTP Signatures plugin for HTTPie.";
      };
    };

    "httpie-image" = python.mkDerivation {
      name = "httpie-image-1.0.0";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/a9/61/806ab5656e9039851140957ff68c638f685231e6c9f65ab28ba00d6d66bd/httpie-image-1.0.0.tar.gz"; sha256 = "1b22894fc42025070b7d45b86337ebb85aeecf0fcd5b237812c626556e9017ca"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."httpie"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/banteg/httpie-image";
        license = "";
        description = "iTerm2 image display plugin for HTTPie.";
      };
    };

    "httpie-media-auth" = python.mkDerivation {
      name = "httpie-media-auth-0.0.8";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/45/25/746938326cba333222da8f1d3df77394ec44c613c12963ca35a6de22a970/httpie-media-auth-0.0.8.tar.gz"; sha256 = "ee507860c32390f85cdcbbd825611770d0ace670521f8aeb61ca82b0131d8363"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."httpie"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/semicarryispig/bce-multimedia-tool";
        license = licenses.bsdOriginal;
        description = "BCE/Media auth plugin for HTTPie.";
      };
    };

    "httpie-msgpack" = python.mkDerivation {
      name = "httpie-msgpack-1.0.0";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/34/db/410baa7e9a4195788e50323969a9ef5adb35ee40cf1cd68f279dc797be6e/httpie-msgpack-1.0.0.tar.gz"; sha256 = "ade37e87acb1f530f87c01f50d37bde4c3fa45aed5b77e384e19a00d517160f0"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."httpie"
      self."msgpack-python"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/rasky/httpie-msgpack";
        license = licenses.bsdOriginal;
        description = "Msgpack plugin for HTTPie.";
      };
    };

    "httpie-nsof" = python.mkDerivation {
      name = "httpie-nsof-0.9";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/25/c5/983e1ab460916326e4d24058700cf5ca68b1071e198dddccde7a6430fae5/httpie-nsof-0.9.tar.gz"; sha256 = "0a87a78bab57c69540618e3ce5ba7211cc8b69f7fb0288a505bbcfcee8a172f4"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."PyJWT"
      self."httpie"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/nsofnetworks/httpie-nsof";
        license = licenses.asl20;
        description = "Nsof OAuth 2 plugin for HTTPie.";
      };
    };

    "httpie-ntlm" = python.mkDerivation {
      name = "httpie-ntlm-1.0.2";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/93/ef/7ca80d6b7438aebeca167fdf8b9b4459939d4e06392df08e11380bf9beba/httpie-ntlm-1.0.2.tar.gz"; sha256 = "b1f757180c0bd60741ea16cf91fc53d47df402a5c287c4a61a14b335ea0552b3"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."httpie"
      self."requests-ntlm"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/jkbr/httpie-ntlm";
        license = licenses.bsdOriginal;
        description = "NTLM auth plugin for HTTPie.";
      };
    };

    "httpie-oauth" = python.mkDerivation {
      name = "httpie-oauth-1.0.2";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/ed/b5/d309cd50e319fa2d746eb8a5d4cb881d9973a0b1095e31e0fac77761cbd3/httpie-oauth-1.0.2.tar.gz"; sha256 = "b4fd8c6e85a7f84e27ba7bfc910627e7010465f4dc4999f81f6c43513485503f"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."httpie"
      self."requests-oauthlib"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/jkbr/httpie-oauth";
        license = licenses.bsdOriginal;
        description = "OAuth plugin for HTTPie.";
      };
    };

    "httpie-plex" = python.mkDerivation {
      name = "httpie-plex-1.0.1";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/40/5f/744e2d8ddb4b7ec075edb0be77764bbe5d59c18423dc683fc547fd0afb3d/httpie-plex-1.0.1-2.tar.gz"; sha256 = "81640824821f2af157b99c0725eb468a6128a7a15ae7991804f10f129a9d2e16"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."httpie"
      self."requests-oauthlib"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/MediaMath/httpie-plex";
        license = "Apache License
                           Version 2.0, January 2004
                        http://www.apache.org/licenses/";
        description = "Auth plugin for HTTPie for MediaMath's Plex.";
      };
    };

    "httpie-svb-auth" = python.mkDerivation {
      name = "httpie-svb-auth-1.0.4";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/0b/d1/6d999c6c381e277b5114bef6e1ff5eed091d5187c0987288cf3b89c90dec/httpie-svb-auth-1.0.4.tar.gz"; sha256 = "30ba22f3edf9dfe13312589850c039ea0ab1f2ecf05fb0fa711839de6a80326d"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."httpie"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/svb/httpie-svb-auth";
        license = licenses.mit;
        description = "SVB API auth plugin for HTTPie.";
      };
    };

    "httpie-token-auth" = python.mkDerivation {
      name = "httpie-token-auth-0.1.8";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/2b/02/43492dce84f66b40af7b50d37012cedc3b1588a5bdae814ae7da9eabd6ce/httpie-token-auth-0.1.8.tar.gz"; sha256 = "f773177a3356e08e190d34064453006cc5be4665a263fc8a0c6bddf0cee294cb"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."httpie"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/chillaranand/httpie-token-auth";
        license = licenses.mit;
        description = "token Auth plugin for HTTPie.";
      };
    };

    "httpie-visionect-auth" = python.mkDerivation {
      name = "httpie-visionect-auth-0.0.1";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/22/05/e77fdead51f0dd32395b8f5e318b98a8c159f81cf0122c7a009bd5aba2dd/httpie-visionect-auth-0.0.1.tar.gz"; sha256 = "3326a137f62a1d4811c85a8f16fbc07579012ba492f962ac2f48b363673d7b8f"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."httpie"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/pcoueffin/httpie-visionect-auth";
        license = licenses.mit;
        description = "HMAC Auth plugin for Joan Visionect and HTTPie.";
      };
    };

    "httpie-wsse-auth" = python.mkDerivation {
      name = "httpie-wsse-auth-0.1.1";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/9a/c4/f7c4ba0bdfb0696152eef4a1874f8ae9bf01b696dcf2d8ccb381cf191eb7/httpie-wsse-auth-0.1.1.tar.gz"; sha256 = "9a2f4759e59dfffd0a5bba93783eb8173b9292b2f00e8cd5272ef0fd981b64fe"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."httpie"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/emartech/httpie-wsse-auth";
        license = licenses.mit;
        description = "WsseAuth plugin for HTTPie.";
      };
    };

    "httpsig-cffi" = python.mkDerivation {
      name = "httpsig-cffi-15.0.0";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/2b/26/09b2f9b962e821abb41a7b5d15b60aedeccfe68f7fafd2040617f0b27c29/httpsig_cffi-15.0.0.tar.gz"; sha256 = "12b61008cd21cb18986de743959d63caaf8ac5b3cf3ee1d49fd1c53fe4f5d47a"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."cryptography"
      self."six"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/hawkowl/httpsig_cffi";
        license = licenses.mit;
        description = "Secure HTTP request signing using the HTTP Signature draft specification";
      };
    };

    "hyper" = python.mkDerivation {
      name = "hyper-0.7.0";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/af/f7/f60d8032f331994f29ce2d79fb5d7fe1e3c1355cac0078c070cf4feb3b52/hyper-0.7.0.tar.gz"; sha256 = "12c82eacd122a659673484c1ea0d34576430afbe5aa6b8f63fe37fcb06a2458c"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."cryptography"
      self."h2"
      self."hyperframe"
      self."pyOpenSSL"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://hyper.rtfd.org";
        license = licenses.mit;
        description = "HTTP/2 Client for Python";
      };
    };

    "hyperframe" = python.mkDerivation {
      name = "hyperframe-3.2.0";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/50/96/7080c938d2b06105365bae946c77c78a32d9e763eaa05d0e431b02d7bc12/hyperframe-3.2.0.tar.gz"; sha256 = "05f0e063e117c16fcdd13c12c93a4424a2c40668abfac3bb419a10f57698204e"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://hyper.rtfd.org";
        license = licenses.mit;
        description = "HTTP/2 framing layer for Python";
      };
    };

    "idna" = python.mkDerivation {
      name = "idna-2.6";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/f4/bd/0467d62790828c23c47fc1dfa1b1f052b24efdf5290f071c7a91d0d82fd3/idna-2.6.tar.gz"; sha256 = "2c6a5de3089009e3da7c5dde64a141dbc8551d5b7f6cf4ed7c2568d0cc520a8f"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/kjd/idna";
        license = licenses.bsdOriginal;
        description = "Internationalized Domain Names in Applications (IDNA)";
      };
    };

    "jmespath" = python.mkDerivation {
      name = "jmespath-0.9.3";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/e5/21/795b7549397735e911b032f255cff5fb0de58f96da794274660bca4f58ef/jmespath-0.9.3.tar.gz"; sha256 = "6a81d4c9aa62caf061cb517b4d9ad1dd300374cd4706997aff9cd6aedd61fc64"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/jmespath/jmespath.py";
        license = licenses.mit;
        description = "JSON Matching Expressions";
      };
    };

    "mohawk" = python.mkDerivation {
      name = "mohawk-0.3.4";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/19/22/10f696548a8d41ad41b92ab6c848c60c669e18c8681c179265ce4d048b03/mohawk-0.3.4.tar.gz"; sha256 = "e98b331d9fa9ece7b8be26094cbe2d57613ae882133cc755167268a984bc0ab3"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."six"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/kumar303/mohawk";
        license = licenses.mpl20;
        description = "Library for Hawk HTTP authorization";
      };
    };

    "msgpack-python" = python.mkDerivation {
      name = "msgpack-python-0.5.6";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/8a/20/6eca772d1a5830336f84aca1d8198e5a3f4715cd1c7fc36d3cc7f7185091/msgpack-python-0.5.6.tar.gz"; sha256 = "378cc8a6d3545b532dfd149da715abae4fda2a3adb6d74e525d0d5e51f46909b"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "http://msgpack.org/";
        license = licenses.asl20;
        description = "MessagePack (de)serializer.";
      };
    };

    "ndg-httpsclient" = python.mkDerivation {
      name = "ndg-httpsclient-0.4.4";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/6c/dd/4d4f1ad1158830b364beee70cb59f651018f36de24da80e52e47f80bc19f/ndg_httpsclient-0.4.4.tar.gz"; sha256 = "fba4d4798dcac2965874f24afb6631b4326baa4bd02505744d34f690c354856a"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."pyOpenSSL"
      self."pyasn1"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/cedadev/ndg_httpsclient/";
        license = licenses.bsdOriginal;
        description = "Provides enhanced HTTPS support for httplib and urllib2 using PyOpenSSL";
      };
    };

    "ntlm-auth" = python.mkDerivation {
      name = "ntlm-auth-1.1.0";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/f4/e5/72bcd01db360de8af903e303ba5ed4a26b95aec6799e4cd36dd7ccf367eb/ntlm-auth-1.1.0.tar.gz"; sha256 = "d4b21b85cbbf53ec1f16e435898eb9ab80f1e8f1571f0b7e2eb038c0517dd47a"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/jborean93/ntlm-auth";
        license = licenses.mit;
        description = "Creates NTLM authentication structures";
      };
    };

    "oauthlib" = python.mkDerivation {
      name = "oauthlib-2.0.7";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/47/b9/66278631430fe688b2e6c84df16619f1d1e27c9c6ebca28371f7c6fbb346/oauthlib-2.0.7.tar.gz"; sha256 = "909665297635fa11fe9914c146d875f2ed41c8c2d78e21a529dd71c0ba756508"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."PyJWT"
      self."cryptography"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/oauthlib/oauthlib";
        license = licenses.bsdOriginal;
        description = "A generic, spec-compliant, thorough implementation of the OAuth request-signing logic";
      };
    };

    "pyOpenSSL" = python.mkDerivation {
      name = "pyOpenSSL-17.5.0";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/3b/15/a5d90ab1a41075e8f0fae334f13452549528f82142b3b9d0c9d86ab7178c/pyOpenSSL-17.5.0.tar.gz"; sha256 = "2c10cfba46a52c0b0950118981d61e72c1e5b1aac451ca1bc77de1a679456773"; };
      doCheck = commonDoCheck;
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

    "pyasn1" = python.mkDerivation {
      name = "pyasn1-0.4.2";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/eb/3d/b7d0fdf4a882e26674c68c20f40682491377c4db1439870f5b6f862f76ed/pyasn1-0.4.2.tar.gz"; sha256 = "d258b0a71994f7770599835249cece1caef3c70def868c4915e6e5ca49b67d15"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/etingof/pyasn1";
        license = licenses.bsdOriginal;
        description = "ASN.1 types and codecs";
      };
    };

    "pycparser" = python.mkDerivation {
      name = "pycparser-2.18";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/8c/2d/aad7f16146f4197a11f8e91fb81df177adcc2073d36a17b1491fd09df6ed/pycparser-2.18.tar.gz"; sha256 = "99a8ca03e29851d96616ad0404b4aad7d9ee16f25c9f9708a11faf2810f7b226"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [ ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/eliben/pycparser";
        license = licenses.bsdOriginal;
        description = "C parser in Python";
      };
    };

    "python-dateutil" = python.mkDerivation {
      name = "python-dateutil-2.6.1";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/54/bb/f1db86504f7a49e1d9b9301531181b00a1c7325dc85a29160ee3eaa73a54/python-dateutil-2.6.1.tar.gz"; sha256 = "891c38b2a02f5bb1be3e4793866c8df49c7d19baabf9c1bad62547e0b4866aca"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."six"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://dateutil.readthedocs.io";
        license = licenses.bsdOriginal;
        description = "Extensions to the standard Python datetime module";
      };
    };

    "requests" = python.mkDerivation {
      name = "requests-2.18.4";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/b0/e1/eab4fc3752e3d240468a8c0b284607899d2fbfb236a56b7377a329aa8d09/requests-2.18.4.tar.gz"; sha256 = "9c443e7324ba5b85070c4a818ade28bfabedf16ea10206da1132edaa6dda237e"; };
      doCheck = commonDoCheck;
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

    "requests-aws" = python.mkDerivation {
      name = "requests-aws-0.1.8";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/5e/2f/4da17752036c04cf4c9af7a2da0d41ef2205043f1c61008006475aa24b8b/requests-aws-0.1.8.tar.gz"; sha256 = "bd2e8386f09d94a84b9cad6e966b21f31493734336a8f47b9b535806949a771f"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."requests"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/tax/python-requests-aws";
        license = "BSD licence, see LICENCE.txt";
        description = "AWS authentication for Amazon S3 for the python requests module";
      };
    };

    "requests-f5auth" = python.mkDerivation {
      name = "requests-f5auth-0.1.2";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/d2/0d/242f25e3b80937834346a66098b38d8279ea719188a2c04f36c937ea5e33/requests-f5auth-0.1.2.tar.gz"; sha256 = "b7c86af41ffef4209b3677e0143a1d3f71394f898a2a8489954be395ba231aa6"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."requests"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/requests/requests-f5auth";
        license = licenses.bsdOriginal;
        description = "F5 REST Authentication support for Requests.";
      };
    };

    "requests-hawk" = python.mkDerivation {
      name = "requests-hawk-1.0.0";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/8a/62/e89d4e23847f74f56c66a0ae76c17e356338a0fe7bd352842647f5877a07/requests-hawk-1.0.0.tar.gz"; sha256 = "aef0dff8053dcae2057774516386bed0a3bc03fabea9e18f3aa98f02672ea5d0"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."mohawk"
      self."requests"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/mozilla-services/requests-hawk";
        license = "License :: OSI Approved :: Apache Software License";
        description = "requests-hawk";
      };
    };

    "requests-ntlm" = python.mkDerivation {
      name = "requests-ntlm-1.1.0";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/3e/02/6b31dfc8334caeea446a2ac3aea5b8e197710e0b8ad3c3035f7c79e792a8/requests_ntlm-1.1.0.tar.gz"; sha256 = "9189c92e8c61ae91402a64b972c4802b2457ce6a799d658256ebf084d5c7eb71"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."cryptography"
      self."ntlm-auth"
      self."requests"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/requests/requests-ntlm";
        license = licenses.isc;
        description = "This package allows for HTTP NTLM authentication using the requests library.";
      };
    };

    "requests-oauthlib" = python.mkDerivation {
      name = "requests-oauthlib-0.8.0";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/80/14/ad120c720f86c547ba8988010d5186102030591f71f7099f23921ca47fe5/requests-oauthlib-0.8.0.tar.gz"; sha256 = "883ac416757eada6d3d07054ec7092ac21c7f35cb1d2cf82faf205637081f468"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."oauthlib"
      self."requests"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/requests/requests-oauthlib";
        license = licenses.bsdOriginal;
        description = "OAuthlib authentication support for Requests.";
      };
    };

    "s3transfer" = python.mkDerivation {
      name = "s3transfer-0.1.13";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/9a/66/c6a5ae4dbbaf253bd662921b805e4972451a6d214d0dc9fb3300cb642320/s3transfer-0.1.13.tar.gz"; sha256 = "90dc18e028989c609146e241ea153250be451e05ecc0c2832565231dacdf59c1"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."botocore"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://github.com/boto/s3transfer";
        license = licenses.asl20;
        description = "An Amazon S3 Transfer Manager";
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

    "urllib3" = python.mkDerivation {
      name = "urllib3-1.22";
      src = pkgs.fetchurl { url = "https://files.pythonhosted.org/packages/ee/11/7c59620aceedcc1ef65e156cc5ce5a24ef87be4107c2b74458464e437a5d/urllib3-1.22.tar.gz"; sha256 = "cc44da8e1145637334317feebd728bd869a35285b93cbb4cca2577da7e62db4f"; };
      doCheck = commonDoCheck;
      buildInputs = commonBuildInputs;
      propagatedBuildInputs = [
      self."certifi"
      self."cryptography"
      self."idna"
      self."pyOpenSSL"
    ];
      meta = with pkgs.stdenv.lib; {
        homepage = "https://urllib3.readthedocs.io/";
        license = licenses.mit;
        description = "HTTP library with thread-safe connection pooling, file post, and more.";
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
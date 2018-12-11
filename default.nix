{ pkgs ? import <nixpkgs> {}
}:

let

  createSet = meta:
    (import (./. + "/${meta.name}/requirements.nix") { inherit pkgs; }) // { __meta__ = meta; };

  createSets = sets:
    builtins.listToAttrs
      (map (x: { inherit (x) name;
                 value = createSet x;
               }
           ) sets);

  maintainers = {
    unknown =
      { name = "??? (Looking for maintainer)";
        url = "https://github.com/garbas/nixpkgs-python/issues/new";
      };
    garbas =
      { name = "Rok Garbas";
        url = "https://twitter.com/garbas";
      };
    lewo =
      { name = "Antoine Eiche";
        url = "https://github.com/nlewo";
      };
    seppeljordan =
      { name = "Sebastian Jordan";
        url = "https://github.com/seppeljordan";
      };
    sorki =
      { name = "Richard Marko";
        url = "https://github.com/sorki";
      };
  };

in createSets [
  { name = "attrs";
    maintainers = [ maintainers.seppeljordan ];
    description = "python-attrs";
  }

  { name = "django";
    maintainers = [ maintainers.unknown ];
    description = "Django framework and its extensions.";
  }

  { name = "flake8";
    maintainers = [ maintainers.seppeljordan ];
    description = "the modular source code checker: pep8, pyflakes and co";
  }

  { name = "flask";
    maintainers = [ maintainers.garbas ];
    description = "Flask framework and its extensions.";
  }

  { name = "pelican";
    maintainers = [ maintainers.garbas ];
    description = "Pelican static blog generator and its extensions.";
  }

  { name = "pyramid";
    maintainers = [ maintainers.unknown ];
    description = "Pyramid framework and its extensions.";
  }

  { name = "science";
    maintainers = [ maintainers.unknown ];
    description = "Science related python packages.";
  }

  { name = "openstackclient";
    maintainers = [ maintainers.lewo ];
    description = "Openstaclient client packages.";
  }

  { name = "pykube";
    maintainers = [ maintainers.seppeljordan ];
    description = "Python client library for Kubernetes";
  }

  { name = "pypi2nix";
    maintainers = [ maintainers.seppeljordan ];
    description = "Tool to generate nix expressions from python packages";
  }

  { name = "pypiserver";
    maintainers = [ maintainers.seppeljordan ];
    description = "Python package server compatible with pip";
  }
  { name = "pytest";
    maintainers = [ maintainers.seppeljordan ];
    description = "A python test engine";
  }
  { name = "sphinx";
    maintainers = [ maintainers.seppeljordan ];
    description = "Python documentation generator";
  }
  { name = "httpie";
    maintainers = [ maintainers.garbas ];
    description = "HTTPie - a CLI, cURL-like tool for humans.";
  }

]

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
  };

in createSets [

  { name = "django";
    maintainers = [ maintainers.unknown];
    description = "Django framework and its extensions.";
  }

  { name = "flask";
    maintainers = [ maintainers.garbas ];
    description = "Flask framework and its extensions.";
  }

  { name = "homeassistant";
    maintainers = [ maintainers.unknown ];
    description = "Homeassistant framework and its components.";
  }

  { name = "pelican";
    maintainers = [ maintainers.garbas ];
    description = "Pelican static blog generator and its extensions.";
  }

  { name = "pyramid";
    maintainers = [ maintainers.unknown ];
    description = "Pyramid framework and its extensions.";
  }

  #{ name = "science";
  #  maintainers = [ maintainers.unknown ];
  #  description = "Science related python packages.";
  #}

]

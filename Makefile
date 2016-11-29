NIX_PATH=nixpkgs=https://github.com/NixOS/nixpkgs-channels/archive/nixpkgs-unstable.tar.gz
PYPI2NIX=./../result-pypi2nix/bin/pypi2nix

all: flask pyramid django science

pypi2nix:
	@if [ ! -e pypi2nix ]; then git clone https://github.com/garbas/pypi2nix; fi
	@cd pypi2nix && nix-build release.nix -A build."x86_64-linux" -o $(PWD)/result-pypi2nix && cd ..

flask:
	cd flask/ && $(PYPI2NIX) -v -T -V 3.5 -r requirements.txt -r requirements-dev.txt
	nix-build -A flask -o result-flask

pyramid:
	cd pyramid/ && $(PYPI2NIX) -v -V 3.5 -r requirements.txt
	nix-build -A pyramid -o result-pyramid

django:
	cd django/ && $(PYPI2NIX) -v -V 3.5 -r requirements.txt
	nix-build -A django -o result-django

science:
	cd science/ && $(PYPI2NIX) -v -V 3.5 -r requirements.txt -s numpy -E gfortran -E blas
	nix-build -A science -o result-science

homeassistant:
	@cd homeassistant/ && $(PYPI2NIX) -v -V 3.5 -r requirements.txt #-E "libffi openssl" -s pytz
	@nix-build -A homeassistant -o result-homeassistant


.PHONY: pypi2nix flask pyramid django science homeassistant

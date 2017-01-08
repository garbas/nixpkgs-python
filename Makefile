NIX_PATH=nixpkgs=https://github.com/NixOS/nixpkgs-channels/archive/nixpkgs-unstable.tar.gz
PYPI2NIX=./../result-pypi2nix/bin/pypi2nix


all: \
	django \
	flask \
	homeassistant \
	pelican \
	pyramid \
	science \
	pypi2nix \
	static


django:
	cd django/ && \
		$(PYPI2NIX) -v \
					-V 3.5 \
					-r requirements.txt
	nix-build -A django -o result-django


flask:
	cd flask/ && \
		$(PYPI2NIX) -v \
					-V 3.5 \
					-r requirements.txt
	nix-build -A flask -o result-flask


homeassistant:
	cd homeassistant/ && \
		$(PYPI2NIX) -v \
					-V 3.5 \
					-r requirements.txt
	nix-build -A homeassistant -o result-homeassistant


pelican:
	cd pelican/ && \
		$(PYPI2NIX) -v \
					-V 3.5 \
					-r requirements.txt
	nix-build -A pelican -o result-pelican


pyramid:
	cd pyramid/ && \
		$(PYPI2NIX) -v \
					-V 3.5 \
					-r requirements.txt
	nix-build -A pyramid -o result-pyramid


science:
	cd science/ && \
		$(PYPI2NIX) -v \
					-V 3.5 \
					-s numpy \
					-r requirements.txt \
					-E gfortran -E blas
	nix-build -A science -o result-science


pypi2nix:
	if [ ! -e pypi2nix ]; then git clone https://github.com/garbas/pypi2nix; fi
	cd pypi2nix && nix-build release.nix -A build."x86_64-linux" -o $(PWD)/result-pypi2nix && cd ..


static:
	nix-build static.nix -o result-static


.PHONY: \
	django \
	flask \
	homeassistant \
	pelican \
	pyramid \
	science \
	pypi2nix \
	static

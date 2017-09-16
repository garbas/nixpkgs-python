NIX_PATH=nixpkgs=https://github.com/NixOS/nixpkgs-channels/archive/nixpkgs-unstable.tar.gz
PYPI2NIX=./../result-pypi2nix/bin/pypi2nix


all: \
	django \
	flake8 \
	flask \
	homeassistant \
	openstackclient \
	pelican \
	pykube \
	pyramid \
	pypiserver \
	pytest \
	science \
	pypi2nix \
	static


django:
	cd django/ && \
		$(PYPI2NIX) -v \
			-V 3.5 \
			-O ../overrides.nix \
			-r requirements.txt
	nix-build -A django -o result-django


flake8:
	cd flake8/ && \
		$(PYPI2NIX) -v \
			-V 3.5 \
			-r requirements.txt \
			-O ../overrides.nix
	nix-build -A flake8 -o result-flake8


flask:
	cd flask/ && \
		$(PYPI2NIX) -v \
			-V 3.5 \
			-r requirements.txt \
			-O ../overrides.nix
	nix-build -A flask -o result-flask


homeassistant:
	cd homeassistant/ && \
		$(PYPI2NIX) -v \
			-V 3.5 \
			-s pytz
			-O ../overrides.nix \
			-r requirements.txt
	nix-build -A homeassistant -o result-homeassistant


pelican:
	cd pelican/ && \
		$(PYPI2NIX) -v \
			-V 3.5 \
			-O ../overrides.nix \
			-r requirements.txt
	nix-build -A pelican -o result-pelican


pykube:
	cd pykube/ && \
		$(PYPI2NIX) -v \
		-V 3.5 \
		-r requirements.txt \
		-O ../overrides.nix
	nix-build -A pykube -o result-pykube


pyramid:
	cd pyramid/ && \
		$(PYPI2NIX) -v \
			-V 3.5 \
			-O ../overrides.nix \
			-r requirements.txt
	nix-build -A pyramid -o result-pyramid

pypiserver:
	cd pypiserver/ && \
		$(PYPI2NIX) -v \
			-V 3.5 \
			-O ../overrides.nix \
			-r requirements.txt
	nix-build -A pypiserver -o result-pypiserver


pytest:
	cd pytest/ && \
		$(PYPI2NIX) -v \
			-V 3.5 \
			-O ../overrides.nix \
			-r requirements.txt
	nix-build -A pytest -o result-pytest


science:
	cd science/ && \
		$(PYPI2NIX) -v \
			-V 3.5 \
			-s numpy \
			-r requirements.txt \
			-O ../overrides.nix \
			-E gfortran \
			-E blas \
			-E pkgconfig \
			-E freetype.dev \
			-E libpng \
			-E agg
	nix-build -A science -o result-science


openstackclient:
	cd openstackclient/ && \
		$(PYPI2NIX) -v \
			-V 2.7 \
			-r requirements.txt
	nix-build -A openstackclient -o result-openstackclient


pypi2nix:
	if [ ! -e pypi2nix ]; then git clone https://github.com/garbas/pypi2nix; fi
	cd pypi2nix && nix-build release.nix -A build."x86_64-linux" -o $(PWD)/result-pypi2nix && cd ..


static:
	nix-build static.nix -o result-static


.PHONY: \
	django \
	flake8 \
	flask \
	homeassistant \
	pelican \
	pykube \
	pyramid \
	pypiserver \
	pytest \
	openstackclient \
	science \
	pypi2nix \
	static

list_pkgs:
	cd pytest && ./manage-package-list.py

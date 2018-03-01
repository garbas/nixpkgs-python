NIX_PATH=nixpkgs=https://github.com/NixOS/nixpkgs-channels/archive/nixpkgs-unstable.tar.gz
PYPI2NIX=./../result-pypi2nix-bin/bin/pypi2nix -W https://travis.garbas.si/wheels_cache/


all: \
	attrs \
	django \
	flake8 \
	flask \
	homeassistant \
	openstackclient \
	pelican \
	pykube \
	pyramid \
	pypi2nix \
	pypiserver \
	pytest \
	science \
	sphinx \
	pypi2nix-bin \
	static

attrs:
	cd attrs/ && \
		$(PYPI2NIX) -v \
			-V 3 \
			-O ../overrides.nix \
			-r requirements.txt
	nix-build -Q -A attrs -o result-attrs

ckan:
	cd ckan/ && \
		$(PYPI2NIX) -v \
			-V 2.7 \
			-O ../overrides.nix \
			-r requirements.txt \
			-E postgresql \
			-E gcc \
			-E openssl \
			-E libffi
	nix-build -Q -A ckan -o result-ckan


django:
	cd django/ && \
		$(PYPI2NIX) -v \
			-V 3.5 \
			-O ../overrides.nix \
			-r requirements.txt
	nix-build -Q -A django -o result-django


flake8:
	cd flake8/ && \
		$(PYPI2NIX) -v \
			-V 3.5 \
			-r requirements.txt \
			-O ../overrides.nix
	nix-build -Q -A flake8 -o result-flake8


flask:
	cd flask/ && \
		$(PYPI2NIX) -v \
			-V 3.5 \
			-r requirements.txt \
			-O ../overrides.nix
	nix-build -Q -A flask -o result-flask


homeassistant:
	cd homeassistant/ && \
		$(PYPI2NIX) -v \
			-V 3.5 \
			-s pytz
			-O ../overrides.nix \
			-r requirements.txt
	nix-build -Q -A homeassistant -o result-homeassistant


pelican:
	cd pelican/ && \
		$(PYPI2NIX) -v \
			-V 3.5 \
			-O ../overrides.nix \
			-r requirements.txt
	nix-build -Q -A pelican -o result-pelican


pykube:
	cd pykube/ && \
		$(PYPI2NIX) -v \
		-V 3.5 \
		-r requirements.txt \
		-O ../overrides.nix
	nix-build -Q -A pykube -o result-pykube


pyramid:
	cd pyramid/ && \
		$(PYPI2NIX) -v \
			-V 3.5 \
			-O ../overrides.nix \
			-r requirements.txt
	nix-build -Q -A pyramid -o result-pyramid

pypi2nix:
	cd pypi2nix/ && \
		$(PYPI2NIX) -v \
			-V 3.5 \
			-O ../overrides.nix \
			-r requirements.txt
	nix-build -A pypi2nix -o result-pypi2nix

pypiserver:
	cd pypiserver/ && \
		$(PYPI2NIX) -v \
			-V 3.5 \
			-O ../overrides.nix \
			-r requirements.txt
	nix-build -Q -A pypiserver -o result-pypiserver


pytest:
	cd pytest/ && \
		$(PYPI2NIX) -v \
			-V 3.5 \
			-O ../overrides.nix \
			-r requirements.txt
	nix-build -Q -A pytest -o result-pytest


httpie:
	cd httpie/ && \
		$(PYPI2NIX) -v \
			-V 3.5 \
			-O ../overrides.nix \
			-E gcc \
			-E openssl \
			-E libffi \
			-E kerberos \
			-r requirements.txt
	nix-build -Q -A httpie -o result-httpie


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
	nix-build -Q -A science -o result-science


sphinx:
	cd sphinx/ && \
		$(PYPI2NIX) -v \
			-V 3 \
			-E libffi \
			-O ../overrides.nix \
			-E openssl.dev \
			-r requirements.txt
	nix-build -Q -A sphinx -o result-sphinx


openstackclient:
	cd openstackclient/ && \
		$(PYPI2NIX) -v \
			-V 2.7 \
			-r requirements.txt \
			-E which \
			-E libffi \
			-E openssl.dev
	nix-build -A openstackclient -o result-openstackclient


pypi2nix-bin:
	if [ ! -e pypi2nix-src ]; then git clone https://github.com/garbas/pypi2nix pypi2nix-src; fi
	cd pypi2nix-src && nix-build release.nix -Q -A build."x86_64-linux" -o $(PWD)/result-pypi2nix-bin && cd ..


static:
	nix-build -Q static.nix -o result-static


.PHONY: \
	attrs \
	ckan \
	django \
	flake8 \
	flask \
	homeassistant \
	httpie \
	openstackclient \
	pelican \
	pykube \
	pypi2nix \
	pypi2nix-bin \
	pypiserver \
	pyramid \
	pytest \
	science \
	sphinx \
	static

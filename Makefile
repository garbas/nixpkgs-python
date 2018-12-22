NIX_PATH=nixpkgs=https://github.com/NixOS/nixpkgs-channels/archive/nixpkgs-unstable.tar.gz
PYPI2NIX=pypi2nix -W https://console.cloud.google.com/storage/browser/nixpkgs-python-wheels/
NIX_BUILD=nix-build --option sandbox true -Q -j 1 -A
PY3=3.7
PY2=2.7


all: \
	attrs \
	django \
	flake8 \
	flask \
	httpie \
	openstackclient \
	pelican \
	pykube \
	pypiserver \
	pyramid \
	pytest \
	science \
	sphinx

attrs:
	cd attrs/ && \
		$(PYPI2NIX) -v \
			-V $(PY3) \
			-O ../overrides.nix \
			-r requirements.txt
	$(NIX_BUILD) attrs -o result-attrs

django:
	cd django/ && \
		$(PYPI2NIX) -v \
			-V $(PY3) \
			-O ../overrides.nix \
			-r requirements.txt
	$(NIX_BUILD) django -o result-django


flake8:
	cd flake8/ && \
		$(PYPI2NIX) -v \
			-V $(PY3) \
			-O ../overrides.nix \
			-s nose \
			-s pytest-runner \
			-s setuptools-scm \
			-r requirements.txt
	$(NIX_BUILD) flake8 -o result-flake8


flask:
	cd flask/ && \
		$(PYPI2NIX) -v \
			-V $(PY3) \
			-s vcversioner \
			-s flake8 \
			-s pytest-runner \
			-s setuptools-scm \
			-s six \
			-r requirements.txt \
			-O ../overrides.nix
	$(NIX_BUILD) flask -o result-flask


httpie:
	cd httpie/ && \
		$(PYPI2NIX) -v \
			-V $(PY3) \
			-O ../overrides.nix \
			-E gcc \
			-E openssl \
			-E libffi \
			-E kerberos \
			-s setuptools-scm \
			-r requirements.txt
	$(NIX_BUILD) httpie -o result-httpie


openstackclient:
	cd openstackclient/ && \
		$(PYPI2NIX) -v \
			-V $(PY2) \
			-O ../overrides.nix \
			-E which \
			-E libffi \
			-E openssl.dev \
			-s vcversioner \
			-s pbr \
			-e simplejson==3.16.0 \
			-r requirements.txt
	$(NIX_BUILD) openstackclient -o result-openstackclient


pelican:
	cd pelican/ && \
		$(PYPI2NIX) -v \
			-V $(PY3) \
			-O ../overrides.nix \
			-s setuptools-scm \
			-r requirements.txt
	$(NIX_BUILD) pelican -o result-pelican


pykube:
	cd pykube/ && \
		$(PYPI2NIX) -v \
			-V $(PY3) \
			-r requirements.txt \
			-O ../overrides.nix
	$(NIX_BUILD) pykube -o result-pykube


pyramid:
	cd pyramid/ && \
		$(PYPI2NIX) -v \
			-V $(PY3) \
			-O ../overrides.nix \
			-s pytest-runner \
			-s setuptools-scm \
			-s versiontools \
			-r requirements.txt
	$(NIX_BUILD) pyramid -o result-pyramid

pypiserver:
	cd pypiserver/ && \
		$(PYPI2NIX) -v \
			-V $(PY3) \
			-O ../overrides.nix \
			-s setuptools-git \
			-r requirements.txt
	$(NIX_BUILD) pypiserver -o result-pypiserver


pytest:
	cd pytest/ && \
		$(PYPI2NIX) -v \
			-V $(PY3) \
			-O ../overrides.nix \
			-s setuptools-scm \
			-r requirements.txt
	$(NIX_BUILD) pytest -o result-pytest


science:
	cd science/ && \
		$(PYPI2NIX) -v \
			-V $(PY3) \
			-O ../overrides.nix \
			-E gfortran \
			-E blas \
			-E pkgconfig \
			-E freetype.dev \
			-E libpng \
			-E agg \
			-s numpy \
			-s setuptools-scm \
			-r requirements.txt
	$(NIX_BUILD) science -o result-science


sphinx:
	cd sphinx/ && \
		$(PYPI2NIX) -v \
			-V $(PY3) \
			-O ../overrides.nix \
			-E libffi \
			-E openssl.dev \
			-r requirements.txt
	$(NIX_BUILD) sphinx -o result-sphinx


.PHONY: \
	attrs \
	django \
	flake8 \
	flask \
	httpie \
	openstackclient \
	pelican \
	pykube \
	pypiserver \
	pyramid \
	pytest \
	science \
	sphinx

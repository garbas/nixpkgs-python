
all: flask pyramid django science

pypi2nix:
	git clone https://github.com/garbas/pypi2nix
	nix-env -f pypi2nix/release.nix -iA build."x86_64-linux"

flask:
	cd flask/ && pypi2nix -v -T -V 3.5 -r requirements.txt -E "openssl libffi"
	nix-build -A flask -o result-flask

pyramid:
	cd pyramid/ && pypi2nix -v -V 3.5 -r requirements.txt
	nix-build -A pyramid -o result-pyramid

django:
	cd django/ && pypi2nix -v -V 3.5 -r requirements.txt
	nix-build -A django -o result-django

science:
	cd science/ && pypi2nix -v -V 3.5 -r requirements.txt -E "freetype libpng pkgconfig"
	nix-build -A science -o result-science


.PHONY: pypi2nix flask pyramid django science

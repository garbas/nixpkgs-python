
all: flask pyramid django scipy

flask:
	pypi2nix -r flask/requirements.txt -E "openssl libffi"

pyramid:
	pypi2nix -r pyramid/requirements.txt

django:
	pypi2nix -r django/requirements.txt

scipy:
	pypi2nix -r scipy/requirements.txt -E "freetype libpng pkgconfig"

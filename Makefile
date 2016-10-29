
all: flask pyramid django science

pypi2nix:
	git clone https://github.com/garbas/pypi2nix
	nix-env -f pypi2nix/release.nix -iA build."x86_64-linux"

flask:
	cd flask/ && pypi2nix -v -T -V 3.5 -r requirements.txt -r requirements-dev.txt
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

home-assistant:
	curl https://raw.githubusercontent.com/home-assistant/home-assistant/master/requirements_all.txt > home-assistant/requirements.txt
	sed -i -r home-assistant/requirements.txt \
		-e "s|^(http.*)#(.+==)|\1#egg=\2|" \
		-e "s|gps3==0.33.3|https://github.com/garbas/gps3/archive/master.zip#egg=gps3|" \
		-e "s|hbmqtt==0.7.1|https://github.com/beerfactory/hbmqtt/archive/0.7.1.zip#egg=hbmqtt|" \
		-e "/pywebpush/d" \
		-e "/radiotherm/d" \
		-e "/russound/d" \
		-e "/roku/d" \
		-e "/simplisafe/d" \
		-e "/^typing/d" \
		-e "s|w1ll2am23|greencoder|g"
	cd home-assistant/ && pypi2nix -v -V 3.5 -r requirements.txt -E "libffi openssl" -s pytz
	nix-build -A home-assistant -o result-home-assistant


.PHONY: pypi2nix flask pyramid django science home-assistant

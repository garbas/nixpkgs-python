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
	cd science/ && $(PYPI2NIX) -v -V 3.5 -r requirements.txt -E "freetype libpng pkgconfig"
	nix-build -A science -o result-science

home-assistant-requirements.txt:
	@curl https://raw.githubusercontent.com/home-assistant/home-assistant/master/requirements_all.txt > home-assistant/requirements.txt
	@sed -i -r home-assistant/requirements.txt \
		-e "s|concord232==0.14|https://github.com/JasonCarter80/concord232/archive/1ea0aa570df1cebb800ff83b9b6c394ce8e6008b.tar.gz#egg=concord232|g" \
		-e "s|gps3==0.33.3|https://github.com/wadda/gps3/archive/b55a13a7984fc7f06a1ec4734549884be724a51e.zip#egg=gps3|g" \
		-e "s|hbmqtt==0.7.1|https://github.com/beerfactory/hbmqtt/archive/0.7.1.zip#egg=hbmqtt|g" \
		-e "s|--only-binary=all git\+https://github.com/getSenic/nuimo-linux-python#nuimo==1.0.0|# https://github.com/getSenic/nuimo-linux-python/archive/29fc42987f74d8090d0e2382e8f248ff5990b8c9.tar.gz#egg=nuimo|g" \
		-e "s|https://github.com/Danielhiversen/flux_led/archive/0.9.zip#flux_led==0.9|https://github.com/Danielhiversen/flux_led/archive/0.9.zip#egg=flux-led|g" \
		-e "s|https://github.com/GadgetReactor/pyHS100/archive/1f771b7d8090a91c6a58931532e42730b021cbde.zip#pyHS100==0.2.0|https://github.com/GadgetReactor/pyHS100/archive/1f771b7d8090a91c6a58931532e42730b021cbde.zip#egg=pyHS100|g" \
		-e "s|https://github.com/LinuxChristian/pyW215/archive/v0.3.6.zip#pyW215==0.3.6|https://github.com/LinuxChristian/pyW215/archive/v0.3.6.zip#egg=pyW215|g" \
		-e "s|https://github.com/TheRealLink/pylgtv/archive/v0.1.2.zip#pylgtv==0.1.2|https://github.com/TheRealLink/pylgtv/archive/v0.1.2.zip#egg=pylgtv|g" \
		-e "s|https://github.com/TheRealLink/pythinkingcleaner/archive/v0.0.2.zip#pythinkingcleaner==0.0.2|https://github.com/TheRealLink/pythinkingcleaner/archive/v0.0.2.zip#egg=pythinkingcleaner|g" \
		-e "s|https://github.com/Xorso/pyalarmdotcom/archive/0.1.1.zip#pyalarmdotcom==0.1.1|https://github.com/Xorso/pyalarmdotcom/archive/0.1.1.zip#egg=pyalarmdotcom|g" \
		-e "s|https://github.com/aparraga/braviarc/archive/0.3.6.zip#braviarc==0.3.6|https://github.com/aparraga/braviarc/archive/0.3.6.zip#egg=braviarc|g" \
		-e "s|https://github.com/bah2830/python-roku/archive/3.1.2.zip#roku==3.1.2|https://github.com/bah2830/python-roku/archive/3.1.2.zip#egg=roku|g" \
		-e "s|https://github.com/bashwork/pymodbus/archive/d7fc4f1cc975631e0a9011390e8017f64b612661.zip#pymodbus==1.2.0|https://github.com/bashwork/pymodbus/archive/d7fc4f1cc975631e0a9011390e8017f64b612661.zip#egg=pymodbus|g" \
		-e "s|https://github.com/danieljkemp/onkyo-eiscp/archive/python3.zip#onkyo-eiscp==0.9.2|https://github.com/danieljkemp/onkyo-eiscp/archive/python3.zip#egg=onkyo-eiscp|g" \
		-e "s|https://github.com/deisi/fritzconnection/archive/b5c14515e1c8e2652b06b6316a7f3913df942841.zip#fritzconnection==0.4.6|https://github.com/deisi/fritzconnection/archive/b5c14515e1c8e2652b06b6316a7f3913df942841.zip#egg=fritzconnection|g" \
		-e "s|https://github.com/jabesq/netatmo-api-python/archive/v0.7.0.zip#lnetatmo==0.7.0|https://github.com/jabesq/netatmo-api-python/archive/v0.7.0.zip#egg=lnetatmo|g" \
		-e "s|https://github.com/jabesq/pybotvac/archive/v0.0.1.zip#pybotvac==0.0.1|https://github.com/jabesq/pybotvac/archive/v0.0.1.zip#egg=pybotvac|g" \
		-e "s|https://github.com/jamespcole/home-assistant-nzb-clients/archive/616cad59154092599278661af17e2a9f2cf5e2a9.zip#python-sabnzbd==0.1|https://github.com/jamespcole/home-assistant-nzb-clients/archive/616cad59154092599278661af17e2a9f2cf5e2a9.zip#egg=python-sabnzbd|g" \
		-e "s|https://github.com/kellerza/pyqwikswitch/archive/v0.4.zip#pyqwikswitch==0.4|https://github.com/kellerza/pyqwikswitch/archive/v0.4.zip#egg=pyqwikswitch|g" \
		-e "s|https://github.com/laf/russound/archive/0.1.6.zip#russound==0.1.6|https://github.com/laf/russound/archive/0.1.6.zip#egg=russound|g" \
		-e "s|https://github.com/mweinelt/anel-pwrctrl/archive/ed26e8830e28a2bfa4260a9002db23ce3e7e63d7.zip#anel_pwrctrl==0.0.1|https://github.com/mweinelt/anel-pwrctrl/archive/ed26e8830e28a2bfa4260a9002db23ce3e7e63d7.zip#egg=anel-pwrctrl|g" \
		-e "s|https://github.com/nkgilley/python-ecobee-api/archive/4856a704670c53afe1882178a89c209b5f98533d.zip#python-ecobee==0.0.6|https://github.com/nkgilley/python-ecobee-api/archive/4856a704670c53afe1882178a89c209b5f98533d.zip#egg=python-ecobee|g" \
		-e "s|https://github.com/nkgilley/python-join-api/archive/3e1e849f1af0b4080f551b62270c6d244d5fbcbd.zip#python-join-api==0.0.1|https://github.com/nkgilley/python-join-api/archive/3e1e849f1af0b4080f551b62270c6d244d5fbcbd.zip#egg=python-join-api|g" \
		-e "s|https://github.com/pvizeli/cloudapi/releases/download/1.0.2/python-1.0.2.zip#openalpr_api==1.0.2|https://github.com/pvizeli/cloudapi/releases/download/1.0.2/python-1.0.2.zip#egg=openalpr-api|g" \
		-e "s|https://github.com/rkabadi/pyedimax/archive/365301ce3ff26129a7910c501ead09ea625f3700.zip#pyedimax==0.1|https://github.com/rkabadi/pyedimax/archive/365301ce3ff26129a7910c501ead09ea625f3700.zip#egg=pyedimax|g" \
		-e "s|https://github.com/robbiet480/pygtfs/archive/00546724e4bbcb3053110d844ca44e2246267dd8.zip#pygtfs==0.1.3|https://github.com/robbiet480/pygtfs/archive/00546724e4bbcb3053110d844ca44e2246267dd8.zip#egg=pygtfs|g" \
		-e "s|https://github.com/sander76/powerviewApi/archive/246e782d60d5c0addcc98d7899a0186f9d5640b0.zip#powerviewApi==0.3.15|https://github.com/sander76/powerviewApi/archive/246e782d60d5c0addcc98d7899a0186f9d5640b0.zip#egg=powerviewApi|g" \
		-e "s|https://github.com/theolind/pymysensors/archive/0b705119389be58332f17753c53167f551254b6c.zip#pymysensors==0.8|https://github.com/theolind/pymysensors/archive/0b705119389be58332f17753c53167f551254b6c.zip#egg=pymysensors|g" \
		-e "s|https://github.com/w1ll1am23/simplisafe-python/archive/586fede0e85fd69e56e516aaa8e97eb644ca8866.zip#simplisafe-python==0.0.1|https://github.com/w1ll1am23/simplisafe-python/archive/586fede0e85fd69e56e516aaa8e97eb644ca8866.zip#egg=simplisafe-python|g" \
		-e "s|https://github.com/wokar/pylgnetcast/archive/v0.2.0.zip#pylgnetcast==0.2.0|https://github.com/wokar/pylgnetcast/archive/v0.2.0.zip#egg=pylgnetcast|g" \
		-e "s|temperusb==1.5.1|# temperusb==1.5.1|g" \
		-e "s|pyicloud==0.9.1|# pyicloud==0.9.1|g"
	echo "pytest-runner" >> home-assistant/requirements.txt
	echo "setuptools-scm" >> home-assistant/requirements.txt

home-assistant: home-assistant-requirements.txt
	@cd home-assistant/ && $(PYPI2NIX) -v -V 3.5 -r requirements.txt -E "libffi openssl" -s pytz
	@nix-build -A home-assistant -o result-home-assistant


.PHONY: pypi2nix flask pyramid django science home-assistant

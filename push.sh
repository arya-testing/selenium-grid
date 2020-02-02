#!/bin/sh -e

VERSION=3.141.59-zinc
docker build -t jlazarre95/selenium-hub --build-arg VERSION=${VERSION} ./hub
docker build -t jlazarre95/selenium-node-chrome --build-arg VERSION=${VERSION} ./node-chrome
docker build -t jlazarre95/selenium-node-firefox --build-arg VERSION=${VERSION} ./node-firefox
docker push jlazarre95/selenium-hub
docker push jlazarre95/selenium-node-chrome
docker push jlazarre95/selenium-node-firefox
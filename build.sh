#!/bin/bash
cd /opt/git/vnc-browser

sudo docker tag radiergimmy/vnc-browser:firefox radiergimmy/vnc-browser:firefox_old
sudo docker push radiergimmy/vnc-browser:firefox_old
buildFirefox=$(sudo docker build \
	-t radiergimmy/vnc-browser:firefox \
	. -f alpine-Firefox.dockerfile)
#buildFirefox=$(sudo docker buildx build --platform linux/amd64 -t radiergimmy/vnc-browser:firefox . -f alpine-Firefox.dockerfile)
buildFirefoxStatus=$?
if [ $buildFirefoxStatus -eq 0 ]; then
	sudo docker push radiergimmy/vnc-browser:firefox
else
	echo "$buildFirefoxStatus"
fi

sudo docker tag radiergimmy/vnc-browser:chromium radiergimmy/vnc-browser:chromium_old
sudo docker push radiergimmy/vnc-browser:chromium_old
buildChromium=$(sudo docker build \
	-t radiergimmy/vnc-browser:chromium \
	. -f debian-Chromium.dockerfile)
#buildChromium=$(sudo docker buildx build --platform linux/amd64 -t radiergimmy/vnc-browser:chromium . -f debian-Chromium.dockerfile)
buildChromiumStatus=$?
if [ $buildChromiumStatus -eq 0 ]; then
	sudo docker push radiergimmy/vnc-browser:chromium
else
	echo "$buildChromiumStatus"
fi

sudo docker tag radiergimmy/vnc-browser:brave radiergimmy/vnc-browser:brave_old
sudo docker push radiergimmy/vnc-browser:brave_old
buildBrave=$(sudo docker build \
	-t radiergimmy/vnc-browser:brave \
	. -f debian-Brave.dockerfile)
#buildBrave=$(sudo docker buildx build --platform linux/amd64 -t radiergimmy/vnc-browser:brave . -f debian-Brave.dockerfile)
buildBraveStatus=$?
if [ $buildBraveStatus -eq 0 ]; then
	sudo docker push radiergimmy/vnc-browser:brave
else
	echo "$buildBaveStatus"
fi

sudo docker tag radiergimmy/vnc-browser:chrome radiergimmy/vnc-browser:chrome_old
sudo docker push radiergimmy/vnc-browser:chrome_old
buildChrome=$(sudo docker build \
	-t radiergimmy/vnc-browser:chrome \
	. -f debian-Chrome.dockerfile)
#buildChrome=$(sudo docker buildx build --platform linux/amd64 -t radiergimmy/vnc-browser:chrome . -f debian-Chrome.dockerfile)
buildChromeStatus=$?
if [ $buildChromeStatus -eq 0 ]; then
	sudo docker push radiergimmy/vnc-browser:chrome
else
	echo "$buildChromeStatus"
fi

sudo docker tag radiergimmy/vnc-browser:edge radiergimmy/vnc-browser:edge_old
sudo docker push radiergimmy/vnc-browser:edge_old
buildEdge=$(sudo docker build \
	-t radiergimmy/vnc-browser:edge \
	. -f debian-MSEdge.dockerfile)
#buildEdge=$(sudo docker buildx build --platform linux/amd64 -t radiergimmy/vnc-browser:edge . -f debian-MSEdge.dockerfile)
buildEdgeStatus=$?
if [ $buildEdgeStatus -eq 0 ]; then
	sudo docker push radiergimmy/vnc-browser:edge
else
	echo "$buildEdgeStatus"
fi

ARG NAMESPACE
ARG VERSION
ARG AUTHORS
FROM ${NAMESPACE}/node-base:${VERSION}
LABEL authors=${AUTHORS}

USER root

#=========
# Firefox
#=========
RUN apt-get update -qqy && apt-get -qqy --no-install-recommends install firefox libavcodec-extra libgtk-3-dev libdbus-glib-1-dev

#============
# GeckoDriver
#============
ARG GECKODRIVER_VERSION=latest
RUN apt-get update -qqy && apt-get -qqy --no-install-recommends install firefox-geckodriver

USER 1200

#============================================
# Dumping Browser information for config
#============================================
RUN echo "firefox" > /opt/selenium/browser_name
RUN firefox --version | awk '{print $3}' > /opt/selenium/browser_version
RUN echo "\"moz:firefoxOptions\": {\"binary\": \"/usr/bin/firefox\"}" > /opt/selenium/browser_binary_location

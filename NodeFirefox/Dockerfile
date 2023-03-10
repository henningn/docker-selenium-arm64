ARG NAMESPACE
ARG VERSION
ARG AUTHORS
FROM ${NAMESPACE}/node-base:${VERSION}
LABEL authors=${AUTHORS}

USER root

#=========
# Firefox
#=========
RUN apt-get update -qqy && apt-get -qqy --no-install-recommends install firefox libavcodec-extra

#============
# GeckoDriver
#============
ARG GECKODRIVER_VERSION=latest
RUN apt-get update -qqy && apt-get -qqy --no-install-recommends install firefox-geckodriver

USER 1200

#============================================
# Dumping Browser name and version for config
#============================================
RUN echo "firefox" > /opt/selenium/browser_name

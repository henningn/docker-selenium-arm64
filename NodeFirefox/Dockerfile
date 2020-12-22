# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
# NOTE: DO *NOT* EDIT THIS FILE.  IT IS GENERATED.
# PLEASE UPDATE Dockerfile.txt INSTEAD OF THIS FILE
# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
FROM selenium/node-base:4.1.0-20211123
LABEL authors=SeleniumHQ

USER root

#=========
# Firefox
#=========
RUN apt-get -qqy update && apt-get -qqy --no-install-recommends install firefox

#============
# GeckoDriver
#============
RUN apt-get -qqy update && apt-get -qqy --no-install-recommends install firefox-geckodriver

USER 1200

#============================================
# Dumping Browser name and version for config
#============================================
RUN echo "firefox" > /opt/selenium/browser_name

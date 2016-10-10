FROM ubuntu:16.04
MAINTAINER Jordi Prats

#
# timezone and locale
#
RUN echo "Europe/Andorra" > /etc/timezone && \
    dpkg-reconfigure -f noninteractive tzdata

RUN export LANGUAGE=en_US.UTF-8 && \
    export LANG=en_US.UTF-8 && \
    export LC_ALL=en_US.UTF-8 && \
    locale-gen en_US.UTF-8 && \
    DEBIAN_FRONTEND=noninteractive dpkg-reconfigure locales

#
# base
#

RUN DEBIAN_FRONTEND=noninteractive ;\
    apt-get update && \
    apt-get install --assume-yes \
        	    openssl \
        	    sudo \
		    git \
		    vim \
        	    software-properties-common \
		    wget

#
# repo openvas
#

RUN DEBIAN_FRONTEND=noninteractive add-apt-repository ppa:mrazavi/openvas
RUN DEBIAN_FRONTEND=noninteractive apt-get update

# To install openvas 8, install the "openvas" package from this ppa. It is only tested on ubuntu 14.04 trusty and 16.04 xenial.
# 
# You have to update openvas scripts/data after installation with the following commands:
# 
# sudo apt-get install sqlite3
# sudo openvas-nvt-sync
# sudo openvas-scapdata-sync
# sudo openvas-certdata-sync
# 
# sudo service openvas-scanner restart
# sudo service openvas-manager restart
# sudo openvasmd --rebuild --progress
# 
# Login into https://localhost:443 with "admin" as username and password.
# 
# In case of "Secure Connection Failed" in firefox, use chromium.
# 
# To enable pdf reports:
# sudo apt-get install texlive-latex-extra --no-install-recommends
# 

CMD /bin/bash /usr/local/bin/runme.sh

EXPOSE 443
EXPOSE 80

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

CMD /bin/bash /usr/local/bin/runme.sh

EXPOSE 443
EXPOSE 80

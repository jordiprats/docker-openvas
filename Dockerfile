FROM ubuntu:16.04
MAINTAINER Jordi Prats

RUN DEBIAN_FRONTEND=noninteractive ;\
    apt-get update && \
    apt-get install --assume-yes \
        openssl \
        sudo \
	git \
	vim \
	wget

RUN DEBIAN_FRONTEND=noninteractive add-apt-repository ppa:mrazavi/openvas
RUN DEBIAN_FRONTEND=noninteractive apt-get update

CMD /bin/bash /usr/local/bin/runme.sh

EXPOSE 443
EXPOSE 80


FROM debian:jessie
MAINTAINER Paul Woelfel <github@frig.at>

RUN apt-get update \
	&& apt-get -y upgrade \
	&& apt-get -y install git cmake build-essential libgcrypt11-dev libyajl-dev \
    libboost-all-dev libcurl4-openssl-dev libexpat1-dev libcppunit-dev binutils-dev \
	pkg-config \
	&& rm -rf /var/lib/apt/lists/*
RUN git clone https://github.com/vitalif/grive2.git \
	&& mkdir grive2/build \
	&& cd grive2/build  \
	&& cmake ..  \
	&& make -j4  \
	&& make install \
  && cd ../.. \
	&& rm -rf grive2 \
	&& mkdir /drive \
	&& echo "Grive installation finished!"

WORKDIR /drive
ENTRYPOINT ["/usr/local/bin/grive"]
CMD []

# docker build -t paulwoelfel/grive2 .
# docker run --name grive --rm -it -v $PWD:/drive -w /drive -u $(id -u):$(id -g) paulwoelfel/grive2 grive "$@"

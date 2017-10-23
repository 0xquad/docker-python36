FROM debian-small
MAINTAINER Alexandre Hamelin <alexandre.hamelin gmail.com>
LABEL description "Minimal Debian system with Python 3.6 and Vim"
LABEL copyright "Copyright (c) 2017, Alexandre Hamelin <alexandre.hamelin gmail.com>"
LABEL license "MIT"

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -qq vim && rm -fr /var/lib/apt /usr/share/{doc,man}
RUN echo "deb http://ftp.de.debian.org/debian testing main" >> /etc/apt/sources.list
RUN echo 'APT::Default-Release "stable";' >> /etc/apt/apt.conf.d/00local
RUN apt-get update && \
    apt-get -qq -t testing install python3.6 && \
    rm -fr /var/lib/apt /usr/share/{doc,man}
RUN rm /etc/apt/apt.conf.d/00local
RUN cd /usr/bin && ln -s python3.6 python

CMD /bin/bash

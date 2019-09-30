FROM ubuntu:16.04
MAINTAINER Alexey Beljaev <alexisvabel@gmail.com>

RUN dpkg --add-architecture amd64 \
    && echo "deb http://dl.bintray.com/alexisvabel/otus-cpp xenial main" | tee -a /etc/apt/sources.list \
    && apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 379CE192D401AB61 \
    && apt-get update \
    && apt-get install apt-utils -y\
    && apt-get install libboost-system-dev -y \
    && apt-get install async \
    && apt-get install bulk_server


ENTRYPOINT ["bulk_server"]
CMD ["30010","4"]


EXPOSE 30010/tcp

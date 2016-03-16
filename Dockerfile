FROM java:8

MAINTAINER Tobie Morgan Hitchcock <tobie@abcum.com>

# Configs
ADD conf /opt/conf
ADD init /opt/init

# giddyup
ADD giddyup /bin

# RUN
RUN curl -o orientdb.tar.gz "http://orientdb.com/download.php?file=orientdb-community-2.1.13.tar.gz&os=linux" && mkdir -p /opt/orient && tar -zxvf orientdb.tar.gz --strip-components=1 --directory /opt/orient && rm -rf orientdb.tar.gz && rm -rf /opt/orient/config && mv /opt/conf /opt/orient/config && rm -rf /opt/orient/databases/*

# Expose the necessary ports
EXPOSE 2424 2480 5701

# Setup default environment
ENV IP=127.0.0.1 MEM=512M TCP=true AWS=false AWS_ACCESS_KEY=NOTSET AWS_SECRET_KEY=NOTSET AWS_REGION=eu-west-1 AWS_SECURITY_GROUP=default VERSION=2.1.13

# Set the default command
CMD /opt/init/orient.sh
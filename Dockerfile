FROM java:8

MAINTAINER Tobie Morgan Hitchcock <tobie@abcum.com>

# Configs
ADD conf /opt/conf
ADD init /opt/init

# giddyup
ADD giddyup /bin

# Expose the necessary ports
EXPOSE 2424 2480 5701

# Setup default environment
ENV IP=127.0.0.1 MEM=512M TCP=true AWS=false AWS_ACCESS_KEY=NOTSET AWS_SECRET_KEY=NOTSET AWS_REGION=eu-west-1 AWS_SECURITY_GROUP=default VERSION=2.1.12

# Set the default command
CMD /opt/init/orient.sh
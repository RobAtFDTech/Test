# start from base
FROM ubuntu:latest
MAINTAINER rv

# install stuff

COPY startup.sh /
RUN chmod 775 startup.sh

ADD testFolder /testFolder
RUN chmod -R 775 /testFolder



FROM debian:buster-slim

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
apt-get -yy dist-upgrade && \
  apt-get install -yy postfix rsyslog && \
  apt-get clean

ADD entrypoint.sh /
ADD rsyslog.conf /etc
ADD sasl_passwd /etc/postfix

ENTRYPOINT [ "/entrypoint.sh"]

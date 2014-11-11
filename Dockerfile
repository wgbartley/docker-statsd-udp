FROM phusion/baseimage

RUN rm -rf /etc/service/sshd /etc/my_init.d/00_regen_ssh_host_keys.sh
RUN apt-get -y update && apt-get -y install git nodejs supervisor


# logging support
RUN mkdir -p /var/log/supervisor


# install statsd
RUN git clone https://github.com/etsy/statsd.git /opt/statsd
ADD conf/config.js /opt/statsd/config.js


# daemons
ADD conf/statsd.conf /etc/supervisor/conf.d/statsd.conf
ADD conf/start.sh /start.sh

RUN chmod +x /start.sh


# defaults
EXPOSE 8125/udp 8126/tcp

WORKDIR /
ENV HOME /root

CMD ["/start.sh"]

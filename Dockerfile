# Resilio Sync
#
# VERSION               0.1
#

FROM resin/rpi-raspbian:latest 

ADD https://download-cdn.resilio.com/2.5.6/linux-armhf/resilio-sync_armhf.tar.gz /tmp/sync
RUN cp /tmp/sync/rslsync /usr/bin/rslsync && rm -rf /tmp/sync

COPY sync.conf.default /etc/
COPY run_sync /usr/bin/

EXPOSE 8888
EXPOSE 55555

VOLUME /mnt/sync

ENTRYPOINT ["run_sync"]
CMD ["--config", "/mnt/sync/sync.conf"]

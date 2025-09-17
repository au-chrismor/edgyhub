FROM ubuntu:noble

# Preparations
RUN apt update
RUN apt upgrade -y
RUN apt install -y curl wget zip unzip xz-utils tzdata
RUN apt install -y mosquitto mosquitto-clients

EXPOSE 1883/tcp
EXPOSE 8883/tcp

RUN mkdir -p /mosquitto/conf/conf.d
RUN mkdir -p /mosquitto/log
RUN mkdir -p /mosquitto/data

COPY passwd /etc/mosquitto/passwd
RUN chmod 0700 /etc/mosquitto/passwd
COPY mosquitto.conf /mosquitto/conf/mosquitto.conf
COPY default.conf /mosquitto/conf/conf.d/default.conf
RUN chown -R mosquitto:mosquitto /mosquitto

RUN /usr/bin/mosquitto_passwd -U /etc/mosquitto/passwd
RUN chown mosquitto:mosquitto /etc/mosquitto/passwd

VOLUME /mosquitto/conf
VOLUME /mosquitto/log
VOLUME /mosquitto/data

ENTRYPOINT [ "/usr/sbin/mosquitto", "-c", "/mosquitto/conf/mosquitto.conf" ]

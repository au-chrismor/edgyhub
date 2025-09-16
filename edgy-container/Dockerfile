FROM ubuntu:noble

# Preparations
RUN apt update
RUN apt upgrade -y
RUN apt install -y curl wget zip unzip xz-utils tzdata
RUN apt install -y mosquitto mosquitto-clients

EXPOSE 1883/tcp
EXPOSE 8883/tcp

RUN mkdir -p /etc/mosquitto/conf.d
RUN mkdir -p /var/log/mosquitto

COPY passwd /etc/mosquitto/passwd
RUN chmod 0700 /etc/mosquitto/passwd
COPY mosquitto.conf /etc/mosquitto/conf.d/default.conf

RUN /usr/bin/mosquitto_passwd -U /etc/mosquitto/passwd
RUN chown mosquitto:mosquitto /etc/mosquitto/passwd

ENTRYPOINT [ "/usr/sbin/mosquitto", "-c", "/etc/mosquitto/mosquitto.conf" ]

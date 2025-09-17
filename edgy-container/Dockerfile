FROM ubuntu:noble

# Preparations
RUN apt update
RUN apt upgrade -y
RUN apt install -y curl wget zip unzip xz-utils tzdata python3 python3-pip

RUN mkdir /app
COPY app/edgywriter.py /app
COPY app/requirements.txt /app

RUN pip3 install --break-system-packages -r /app/requirements.txt

ENTRYPOINT [ "/usr/bin/python3", "/app/edgywriter.py" ]

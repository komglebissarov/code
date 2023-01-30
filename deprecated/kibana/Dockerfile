FROM elk_essentials:latest

RUN apt update
RUN apt install -y kibana curl
COPY kibana.yml /etc/kibana/kibana.yml

ENTRYPOINT service kibana start && tail -f /var/log/kibana/startup.log
#ENTRYPOINT tail -f /dev/null
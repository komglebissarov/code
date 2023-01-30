FROM elk_essentials:latest

RUN apt update
RUN apt -y install elasticsearch procps
#procps install for ps
ENTRYPOINT tail -f /dev/stdout
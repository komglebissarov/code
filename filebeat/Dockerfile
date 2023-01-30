# some base image from dockerhub
FROM debian:latest
# update stuff
RUN apt update
# install prerequsites for ELK
RUN apt install -y default-jre gnupg2 wget apt-transport-https
# download & add elk repo key
RUN wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | apt-key add -
# add elk repo
RUN echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | tee /etc/apt/sources.list.d/elastic-7.x.list

# install filebeat
RUN apt update
RUN apt install filebeat

# copy dummy script & config to container
COPY dummy.sh /
COPY filebeat.yml /
# make script executable and config writable(filebeat really doesnt want to work otherwise)
RUN chmod +x dummy.sh
RUN chmod go-w filebeat.yml

# start dummy script & filebeat on container startup
ENTRYPOINT ./dummy.sh & /usr/share/filebeat/bin/filebeat -c filebeat.yml

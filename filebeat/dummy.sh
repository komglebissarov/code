# simple dummy script to generate logs
# was put here to check if filebeat actually can send logs to logstash
while :
do
    echo "text" >> log.log
    sleep 20
done


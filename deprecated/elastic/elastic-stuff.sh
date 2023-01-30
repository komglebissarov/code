source ../base.env

docker build -t elastic-node .

docker run -d --name node1 --net-alias node1 --network elk_network elastic-node 
docker run -d --name node2 --net-alias node2 --network elk_network elastic-node 
docker run -d --name node3 --net-alias node3 --network elk_network elastic-node 


docker cp config1.yml node1:/etc/elasticsearch/elasticsearch.yml
docker cp config2.yml node2:/etc/elasticsearch/elasticsearch.yml
docker cp config3.yml node3:/etc/elasticsearch/elasticsearch.yml

docker exec -d --user elasticsearch node1 bash -c '/usr/share/elasticsearch/bin/elasticsearch'
docker exec -d --user elasticsearch node2 bash -c '/usr/share/elasticsearch/bin/elasticsearch'
docker exec -d --user elasticsearch node3 bash -c '/usr/share/elasticsearch/bin/elasticsearch'


# i = 0
# run node x times + add generated config
# cluster name: CLUSTER_NAME
# node.name: NODE_NAME + i
# node.master = tru 
# network.host:
# seim for data nods 


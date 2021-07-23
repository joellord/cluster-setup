# Create a Docker network
docker network create mongoCluster

# Start three instances of Mongo in Docker
docker run -d --rm -p 27017:27017 --name mongo1 --network mongoCluster mongo:5 mongod --replSet myReplicaSet --bind_ip localhost
docker run -d --rm -p 27018:27018 --name mongo2 --network mongoCluster mongo:5 mongod --replSet myReplicaSet --bind_ip localhost
docker run -d --rm -p 27019:27019 --name mongo3 --network mongoCluster mongo:5 mongod --replSet myReplicaSet --bind_ip localhost

# Initiate the replica set with mongosh
docker exec -it mongo1 mongosh --eval "rs.initiate()"
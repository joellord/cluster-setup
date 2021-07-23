# Prepare the environment
mkdir db0 && mkdir db1 && mkdir db2

# Start your three instances of mongod
mongod --port 27017 --dbpath $(pwd)/db0 --replSet myReplicaSet --bind_ip localhost --fork --logpath $(pwd)/log0
mongod --port 27018 --dbpath $(pwd)/db1 --replSet myReplicaSet --bind_ip localhost --fork --logpath $(pwd)/log1
mongod --port 27019 --dbpath $(pwd)/db2 --replSet myReplicaSet --bind_ip localhost --fork --logpath $(pwd)/log2

# Login to your cluster to run the rs.initiate() command
mongosh --eval "rs.initiate()"
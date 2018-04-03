# StreamSets Data Collector
Extended version of StreamSets Data Collector with installed dependencies.

## Run
### Locally
```
docker-compose up -d
```

Map local directories to:
- `/home/sdc/data`
- `/data`

Note: Make sure the container will have permission to write.

### Docker Swarm
```
docker service create \
  --restart-condition any \
  --restart-delay 5s \
  --log-opt max-size=50m \
  --log-opt max-file=5 \
  -e SDC_JAVA_OPTS="-Xmx512m -Xms512m -server" \
  --limit-memory 1G \
  --constraint 'node.hostname == $VM' \
  --mount type=bind,src=/home/USER/streamsets/datasets,dst=/home/sdc/data \
  --mount type=bind,src=/home/USER/streamsets/data,dst=/data \
  --hostname streamsets-datacollector \
  --host streamsets-datacollector:127.0.0.1 \
  -p 18630:18630 \
  --name streamsets-datacollector \
  graphpathai/datacollector:3.1.2.0
```

Note: Make sure to have the directories created and with permissions.

## Admin
http://localhost:18630/
- user: admin
- pass: admin



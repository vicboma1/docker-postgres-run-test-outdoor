# docker-postgres-run-test-outdoor

### Run swarm

```shell
set -a
source /home/${APP}-${ENTORNO}/env/${ENTORNO}-raw.env
cat docker-swarm.yml | envsubst > docker-swarm-tmp.yml
docker stack deploy -c docker-swarm-tmp.yml postgres-run-scripts
set +a
```

#### Clevers <[^_^]>! 

```postgresql
psql -U postgres
SELECT * FROM pg_stat_activity;
SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE state = 'idle' AND pid <> pg_backend_pid();
```
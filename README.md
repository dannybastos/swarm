# Swarm-sandbox
This is a swarm-sandbox cluster

## A simple cluster using 3 vm's ( one master and 2 workers )

## System requirements
- vagrant
- virtualbox

## How to run
```
vagrant up
```

## How to use
Connect into master:
```
vagrant ssh master
#to see the join cluster command
cat join-command
```
Something like: ```docker swarm join --token <tokenId> <ip>:<port>```

Connect into a worker and paste the join command.


## Publish an app

```
#creating a local registry
docker service create --name registry --publish published=5000,target=5000 registry:2

#publishing the sample-app into local registry
git clone https://github.com/dannybastos/spring-boot-sample-app.git
cd spring-boot-sample-app/
docker-compose build
docker-compose push

#deploy sample-app into cluster
docker stack deploy --compose-file docker-compose.yml spring-boot-sample-app
docker service ls
docker service logs spring-boot-sample-app_web  -f
```

Test in :
> curl http://localhost:8080/hi

Enjoy!

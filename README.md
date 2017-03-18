# CABINS

California Foundation for the Advancement of Electronic Arts cabins reservations system

# local dev
1. install docker & docker-compose: https://docs.docker.com/compose/install/
2. run `docker-compose -f ./docker-compose-local.yml up` (builds and links to current directory for live editing)

# image build & publish
1. git tag -a -m "release 1.1.0" 1.1.0
2. docker build -t cabins .
3. docker image ls
4. docker tag <image hash> gerstle/cabins:latest
5. docker tag <image hash> gerstle/cabins:1.1.0
6. docker login
7. docker push gerstle/cabins

# simple ec2 instance deployment
1. docker-machine create --driver amazonec2 --amazonec2-region us-west-1 --amazonec2-instance-type t2.micro --amazonec2-zone "b" cabins-dev
2. (alternatively) docker-machine start/restart/stop cabins-dev
3. docker-machine env cabins-dev
4. eval $(docker-machine env cabins-dev)
5. docker image pull gerstle/cabins
6. docker-compose up -d

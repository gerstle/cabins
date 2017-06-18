# CABINS

California Foundation for the Advancement of Electronic Arts cabins reservations system

# local dev
1. install docker & docker-compose: https://docs.docker.com/compose/install/
2. To set the environment variable in the docker-compose file, create a `.env` file w/ ```MYSQL_ROOT_PASSWORD=<YOUR MYSQL PASSWORD>```
3. `mv example.cabins.env cabins-dev.env` & replace all the `XXXXXX`'s with your values.
4. make sure `ProxyPass /assets` is commented out in conf/httpd-vhosts.conf
5. run `docker-compose -f ./docker-compose-local.yml build`
6. run `docker-compose -f ./docker-compose-local.yml up`
7. open separate terminal
8. `docker-compose exec --user "$(id -u):$(id -g)" app rake db:reset`
9. `docker-compose exec --user "$(id -u):$(id -g)" app rake db:migrate`

# image build & publish
1. git tag -a -m "release 1.1.0" 1.1.0
2. `rm -rf public/assets; RAILS_ENV=production bundle exec rake assets:precompile`
3. make sure `ProxyPass /assets` is set in conf/httpd-vhosts.conf
4. docker build -t cabins .
5. docker image ls
6. docker tag <image hash> gerstle/cabins:latest
7. docker tag <image hash> gerstle/cabins:1.1.0
8. docker login
9. docker push gerstle/cabins

# simple ec2 instance deployment
1. docker-machine create --driver amazonec2 --amazonec2-region us-west-1 --amazonec2-instance-type t2.micro --amazonec2-zone "b" cabins-dev
2. (alternatively) docker-machine start/restart/stop cabins-dev
3. docker-machine env cabins-dev
4. eval $(docker-machine env cabins-dev)
5. docker image pull gerstle/cabins
6. docker-compose build (needed for web)
7. docker-compose up -d
8. docker-compose logs -f -t

for prod...
1. update cabins.env for prod settings
2. ssh in and `bundle exec rake assets:precompile` ... probably a way to do this in the dockerfile or something

# email previews
http://localhost/rails/mailers/user_mailer/
http://localhost/rails/mailers/reservation_mailer/
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cp $DIR/cabins-prod.env $DIR/cabins.env

echo "
<VirtualHost *:80>
  ProxyPreserveHost On
  ProxyPassMatch ^/(404|422|500).html$ !
  # uncomment for prod
  ProxyPass /assets/ !
  ProxyPass /stuff/ !

  ProxyPass / http://app:3000/
  ProxyPassReverse / http://app:3000/

  ServerName cabins.inappropirates.com
</VirtualHost>
" > $DIR/config/httpd-vhosts.conf

sudo rm -rf tmp && rm -rf $DIR/public/assets && RAILS_ENV=production bundle exec rake assets:precompile

docker build -t cabins $DIR
docker tag $(docker image ls cabins -q) gerstle/cabins:latest
docker login
docker push gerstle/cabins
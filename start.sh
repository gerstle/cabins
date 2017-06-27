DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cp $DIR/cabins-dev.env $DIR/cabins.env

echo "
<VirtualHost *:80>
  ProxyPreserveHost On
  ProxyPassMatch ^/(404|422|500).html$ !
  # uncomment for prod
  # ProxyPass /assets/ !
  # ProxyPass /stuff/ !

  ProxyPass / http://app:3000/
  ProxyPassReverse / http://app:3000/

  ServerName cabins.inappropirates.com
</VirtualHost>
" > $DIR/config/httpd-vhosts.conf

sudo rm -rf tmp && rm -rf $DIR/public/assets && RAILS_ENV=production bundle exec rake assets:precompile

docker-compose -f $DIR/docker-compose-local.yml build
docker-compose -f $DIR/docker-compose-local.yml up
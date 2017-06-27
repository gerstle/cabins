while true; do
    read -p "Do you really wanna deploy to PRODUCTION?! " yn
    case $yn in
        [Yy]* ) break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done

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

eval $(docker-machine env cabins-prod)

docker image pull gerstle/cabins
docker-compose build
docker-compose up -d

eval $(docker-machine env -u)

sudo apt update

sudo apt -y upgrade

sudo apt install -y python3 python3-pip apache2 libapache2-mod-wsgi-py3

rm -fr /tmp/flaskapp

cd /tmp

sudo git clone https://github.com/pbeniwal/flaskapp

mkdir -p /var/www/flaskapp

cp flaskapp/* /var/www/flaskapp/

sudo pip install -r /var/www/flaskapp/requirements.txt

sudo cp /var/www/flaskapp/apache-flask.conf /etc/apache2/sites-enabled/000-default.conf

sudo a2enmod wsgi

sudo apachectl restart

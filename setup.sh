
sudo apt update

sudo apt -y upgrade

sudo apt install -y python3 python3-pip apache2 libapache2-mod-wsgi-py3

sudo rm -fr /tmp/flaskapp
sudo rm -fr /var/www/flaskapp

cd /tmp

sudo git clone https://github.com/pbeniwal/flaskapp

sudo mv flaskapp/ /var/www/

sudo pip install -r /var/www/flaskapp/requirements.txt

sudo cp /var/www/flaskapp/apache-flask.conf /etc/apache2/sites-enabled/000-default.conf

sudo a2enmod wsgi

sudo apachectl restart

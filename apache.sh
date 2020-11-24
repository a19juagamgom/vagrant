#!/bin/bash
#Actulitzar
apt-get update
#Instala apache2
apt-get install -y apache2
#Instalar
apt-get install -y php5 php5-mysql
#Encen el apache2
sudo /etc/init.d/apache2 restart
#Canviem al directori public
cd /var/www/html
sudo apt-get install -y git
#Descarrega adminer amb git clone
git clone https://github.com/vrana/adminer.git
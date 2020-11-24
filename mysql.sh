#!/bin/bash
apt-get update
#Instala debconf-utils per utilitzar comandes
apt-get install -y debconf-utils
#Asignar root a variable
DB_ROOT_PASSWD=aso
#Regenerem el llenguatge
locale-gen es_ES.UTF-8
#Canvia la pass de mysql
debconf-set-selections <<< "mysql-server mysql-server/root_password password $DB_ROOT_PASSWD"
#Envia un altre cop la pass per a que no la demani
debconf-set-selections <<< "mysql-server mysql-server/root_password_again password $DB_ROOT_PASSWD"
#Instala mysql-server
apt-get install -y mysql-server-5.5
#Autoritza l'entrada a qualsevol host
sed -i -e 's/127.0.0.1/0.0.0.0/' /etc/mysql/my.cnf
#Reinicia mysql
/etc/init.d/mysql restart
#Entra a mysql i dona tots els privilegis
mysql -u root -p$DB_ROOT_PASSWD <<< "GRANT ALL PRIVILEGES ON *.* TO root@'%' IDENTIFIED BY '$DB_ROOT_PASSWD'; FLUSH PRIVILEGES;"
mysql -u root -p$DB_ROOT_PASSWD <<< "CREATE DATABASE Projecte17;"

# -*- mode: ruby -*-
# vi: set ft=ruby :
 
#Linea que comença la configuració del vagrant file
Vagrant.configure("2") do |config|

#Box que hem d'instalar
  config.vm.box = "ubuntu/trusty64"
#Nom  xarxa i ip de la maquina
  #config.vm.network "public_network", ip: "192.168.23.10"
#Configuració NAT
#  config.vm.network "forwarded_port", guest: 80, host: 8080
#Ruta del fitxer 
  config.vm.synced_folder "./", "/vagrant"
#Noms
  config.vm.hostname = "ProjecteASO"
  config.ssh.password = "aso"
#Configuracio parametres de VB
  config.vm.provider "virtualbox" do |vb|
#memoria ram
	vb.memory = "2048"
  end

#Configuració de apache y mysql

#Configuració de apache
  config.vm.define "dadesweb" do |app|
	app.vm.hostname = "dadesweb"
	app.vm.network "public_network", ip: "192.168.23.11"
	app.ssh.password = "aso"
	app.vm.network "forwarded_port", guest: 80, host: 8080
	app.vm.provision "shell", path: "apache.sh"
  end
#Configuració de MySQL
  config.vm.define "database" do |app|
	app.vm.hostname = "database"
	app.vm.network "public_network", ip: "192.168.23.12"
	app.ssh.password = "aso"
	app.vm.network "forwarded_port", guest: 80, host: 3333
	app.vm.network "forwarded_port", guest: 3306, host: 3306
	app.vm.provision "shell", path: "mysql.sh"
  end
end

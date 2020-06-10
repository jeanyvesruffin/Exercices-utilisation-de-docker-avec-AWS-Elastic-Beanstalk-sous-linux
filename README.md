# Linux

# Exercices utilisation de docker avec AWS Elastic Beanstalk

AWS Elastic Beanstalk est un service facile à utiliser pour déployer et faire évoluer des applications et services Web développés avec Java, .NET, PHP, Node.js, Python, Ruby, Go et Docker sur des serveurs familiers tels qu'Apache, Nginx, Passenger et IIS.

Vous pouvez simplement télécharger votre code et Elastic Beanstalk gère automatiquement le déploiement, du provisionnement de capacité, de l'équilibrage de charge, de la mise à l'échelle automatique à la surveillance de l'intégrité des applications. Dans le même temps, vous conservez un contrôle total sur les ressources AWS alimentant votre application et pouvez accéder à tout moment aux ressources sous-jacentes.

## Introduction

* Allez a la racine de votre projet
* Creer un fichier index.html
* Creer un fichier DockerFile

```Dockerfile
FROM ubuntu:latest
MAINTAINER D Clinton info@bootstrap-it.com
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get install -y apache2
ADD index.html /var/www/html/
CMD /usr/sbin/apache2ctl -D FOREGROUND
EXPOSE 80
```

* Monter dans votre docker l'image ubuntu (pour la 1er fois)

```cmd
docker pull ubuntu
```

* Build image docker

```cmd
sudo docker build -t myserver .
```

* Execution de l'image docker (A chaque demarrage)

```cmd
sudo docker run -d myserver
```

* Verification

```cmd
sudo docker ps -a
sudo docker network inspect bridge
```

**reperer IPv4Address**

* Execution de ligne de commande cUrl

cURL (abréviation de client URL request library : « bibliothèque de requêtes aux URL pour les clients » ou see URL : « voir URL ») est une interface en ligne de commande, destinée à récupérer le contenu d'une ressource accessible par un réseau informatique. 

```cmd
sudo curl [IPv4Address]
```

## Initialisation de swarm manager

Docker Swarm fournit une fonctionnalité de clustering native pour les conteneurs Docker, qui transforme un groupe de moteurs Docker en un seul moteur Docker virtuel

#### Ajouter node

```cmd
sudo docker swarm init
```

#### Swarm

* Pour connaitre les nodes sur ce swarm

```cmd
sudo docker node ls
```
```cmd
sudo docker info
```
#### Executer un service (exemple de nginx)

* Execution du service nginx

```cmd
sudo docker service create -p 80:80 --name webserver nginx
```

* Controle du service sur docker

```cmd
sudo docker service ls
```

* Voir les informations du container

```cmd
sudo docker service ps webserver
```


#### Dimensionner (scale) le swarm

* Repartie sur 5 nodes l'images nginx

```cmd
sudo docker service scale webserver=5
```

* Controle

```cmd
sudo docker service ps webserver
sudo docker network ls
//exemple avec docker_gwbridge
sudo docker network inspect docker_gwbridge
// relever [IPv4Address]
sudo curl [IPv4Address]
```

![swarm](documents/swarm1.png)

## Installation de Elstic Beanstalk CLI

* Creer un compte sur aws
* Cliquer sur Elastic Beanstalk
* Cliquer sur Mon profil > My Security Credentials
* Cliquer sur Access keys > Create New Access Key 
* Cliquer sur Show Access Key


* Dans le terminal installer pip.py

```cmd
sudo apt update
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
sudo python3 get-pip.py --user
```

* Verification de pip version

```cmd
sudo pip --version
```

* Installation du client aws Elstic Beanstalk

```cmd
sudo pip install awsebcli --upgrade --user
```


## Platforms dockers

#### container simple

#### Container multiple

#### Preconfiguratio

## Dockerrun.aws.json version


# apt

* Permet de mettre à jours les packages installé
```cmd
apt-get update
```
* Permet de mettre à jours à la dernière version des packages installé
```cmd
apt-get update
```
## Resources apt

https://www.math-linux.com/linux-2/tutoriels-linux/article/installation-de-paquets-logiciels-sous-debian-ubuntu-apt-get

# npm

```cmd
curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
sudo apt install -y nodejs
```

Installer le global localement

Quand vous installez des paquets via npm, si vous ne précisez rien, ils seront installés dans le dossier actuel, généralement du projet en cours. Certains paquets, notamment les outils doivent s’installer globalement avec l’option -g. Pour éviter que ceux-ci s’installent dans un dossier système et exigent l’accès root, vous pouvez:

* créer un dossier dédié

```cmd
mkdir ~/.npm-global
```

* Configurer npm pour utiliser ce dossier

```cmd
npm config set prefix '~/.npm-global'
```

* Ajouter cette ligne à votre fichier .profile ou .bashrc

```cmd
export PATH=~/.npm-global/bin:$PATH

```

* Mettre à jour les variables

```cmd
source ~/.profile
```

* Installation de npm en privilege root

```cmd
sudo npm install
```
# netstat
https://www.rekha.com/netstat-cheat-sheet-for-newbies.html

# Bug-fix et tricks

1. Comment passer d'un user a un autre dans une console ?

Return current user

```cmd
whoami
```

change le current user (en invite1)

```cmd
su - invite1
```

2. Ecouter les ports (80)

sudo fuser 80/tcp

3. Kill un processus (port 80)

sudo lsof -t -i tcp:80 -s tcp:listen | sudo xargs kill

4. ERROR Linuxlite: la session s'ouvre mais ne s'ouvre pas

* Supprimer le fichier XAuthority (remplacer [user] par le votre)

    sudo rm -f /home/[user]/.Xauthority


* Creer le fichier XAuthority (remplacer [user] par le votre)

    touch /home/[user]/.Xauthority

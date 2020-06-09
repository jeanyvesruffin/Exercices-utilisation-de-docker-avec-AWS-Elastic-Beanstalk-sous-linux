# Linux

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


## Resource npm

https://lesbricodeurs.fr/articles/Comment-installer-npm-proprement/
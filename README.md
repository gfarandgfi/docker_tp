# Travaux pratiques pour formation docker

## TP-03
Démarrage container de niveau 2


### Executez un container de type serveur web
Afin d'aller plus loin, nous allons lancer un serveur web avec nginx.

* Pour le reconnaitre, nous allons lui donner explicitement un nom 
* Pour pouvoir communiquer avec lui, nous allons lui attribuer un port sur notre machine hôte (particularité unix, le container nginx est prévu pour écouter sur le port 80)

Notre commande :
```
docker container run --name my-web-server -p 8080:80 nginx
```

Avec votre navigateur (ou curl sur votre vm), tentez d'accéder au port 8080 de votre vm : http://capcloud-X.westeurope.cloudapp.azure.com:8080/

Que remarquez-vous ?
 * Le serveur web nginx est fonctionnel (il répond aux requêtes http)
 * Le process ne rend pas la main. Ce qui est normal puisqu'il s'agit d'un serveur web qui n'a pas vocation à s'arrêter.
 * Sur la sortie standard de notre terminal sont affichés tous les logs du serveur nginx (logs applicatifs + access logs)


### Executez un container de type service
On veut pouvoir lancer le container en mode arrière plan (détaché du terminal).

Pour cela, il faut l'arrêter. Un Ctrl-C est suffisant, mais vous pouvez executer 'docker container stop my-web-server' depuis un autre terminal.

Ensuite, puisqu'on va le relancer avec le même nom, il nous faut le détruire :
```
docker container rm my-web-server
```

Nous pouvons maintenant le relancer en arrière plan :
```
docker container run -d --name my-web-server -p 8080:80 nginx
```

Cette fois-ci, le container rend la main et tourne en tâche de fond.
Il est possible de vérifier avec un navigateur qu'il répond aux requêtes.
Il est possible de voir le container avec 'docker container list' 
  * vu qu'il tourne encore, pas besoin de préciser --all
  * vous pouvez voir son nom dans la dernière colonne NAMES
  * vous pouvez consulter les logs avec la commande 'docker log my-web-server'  (à un instant t)
  * vous pouvez visualiser les logs du container avec 'docker logs my-web-server', ou en continu avec l'option -f => 'docker logs -f my-web-server'

Avant de passer à l'étape suivante, vous pouvez arrêter le container et même le supprimer
```
docker container stop my-web-server
docker container rm my-web-server
```


### Executez une version spécifique
Avec un navigateur, visiter le [Hub Docker](https://hub.docker.com/) et recherchez l'image officielle de nginx.

Vous pourrez trouver les nombreuses versions existantes :
  * numéro de version
  * build spécifique basé sur alpine ou perl

Choisissez un tag et essayer dans lancer le container sur cette version spacifique.
```
docker container run -d --name my-web-server -p 8080:80 nginx:1.18.0-alpine
```

Vérifiez qu'il télécharge bien la nouvelle image (docker pull) et constatez-le par la suite avec
```
docker image list
```
# Travaux pratiques pour formation docker

## TP no 2
Démarrer nos premiers containers


### Executez un premier container type hello-word

Envoyez la commande suivante:
```
docker run hello-world
```

La sortie écran (stdout) vous explique ce qu'il s'est déroulé :
 1. Le client docker a contacté (via api) le daemon docker
 2. Le daemon docker a constaté que l'image recherchée n'est pas présente localement.
 3. Le daemon docker a téléchargé l'image **hello-world** depuis la registry publique (docker pull hello-world)
 4. Le daemon docker a instancié un container à partir de l'image **hello-world** (docker start hello-world)
    (Cette application ne fait qu'écrire le texte sur stdout)
 5. Le daemon docker stream la sortie standard *stdout* pour l'afficher à l'écran.

**Remarque 1** : A l'avenir, il est plus précis et plus pérenne d'utiliser les **Management Commands**. 
```
docker image pull hello-world
docker container start hello-world
docker container run hello-world
```

**Remarque 2** : 'docker run *image*', soit 'docker container run *image*', correspond à 'docker image pull *image*' puis 'docker container create *image*' et enfin 'docker container start *image*'


### Visualisez les changements
Au travers de la commande précédente, on a appris que l'on avait téléchargé une image.
   ```
     docker image list
   ```

Pour l'anectdote, comparez le résultat avec cette autre commande (sera intéressant pour la suite) :
   ```
     docker image list --all
   ```
 
Ensuite, un container s'est executé et s'est terminé.
   ```
     docker container list
   ```

La commande ne montre aucun container. C'est **normal** car elle liste que les containers en cours d'execution. Pour trouver notre container, il faut ajouter '--all'
   ```
     docker container list --all
   ```

**Remarque 3** : Nous n'avons pas donné de nom à notre container. Il se voit par défaut attribué un nom généré aléatoirement (dans la dernière colonne **NAMES**)


### Nettoyage du container et de l'image
Prenons tout de suite des bonnes habitudes : Nettoyer !
Pour supprimer un container, il faut connaître son nom (cf la remarque 3)
   ```
     docker container rm <nom_container>
   ```
**Remarque 4** : Il est possible de détruire le container parce qu'il est effectivement terminé. 

Pour supprimer une image, c'est pratiquement la même commande  :grinning:
   ```
     docker image rm <image_id>
   ```
**Remarque 5** : Pour pouvoir détruire une image, il faut avoir détruit tous les containers la référençant (en cours ou arrêtés).


### Comment trouver plus d'images ? Visite du Docker Hub

Avec un navigateur, visite guidée du [Hub Docker](https://hub.docker.com/) : https://hub.docker.com/


# Travaux pratiques pour formation docker

## TP-04
Container en mode interactif


### Executer un container en y restant connecté
Au TP-03, la première fois que nous avons lancé notre container nginx, stdout s'affichait à l'écran, mais nous ne pouvions pas interagir.

L'écran affichait donc bien stdout, mais stdin n'était pas disponible. Pour executer le même container en mode interactif, il nous faut donc:

[] maintenir stdin ouvert (flag -i)
[] attribuer un terminal (tty) (flag -t)
[] executer une commande

Nous voulons, par exemple, faire tourner interactivement un container sous centos 7. Notre commande est la suivante:
```
docker run -it centos:7 bash
```

Le container se lance et surprise! vous obtenez un shell root à l'intérieur.
Vous pouvez en proficter pour exécuter toutes les commandes que vous souhaitez (date, ls, vi, cd, touch...)

Pour sortir, un 'exit' ou un 'Ctrl-D' suffit à terminer le shell bash, et le container se termine en même temps.


#### Attention !
Inclure 'bash' ne fonctionne pas à tous les coups. Si le shell bash n'existe pas sur l'OS qui tourne dans notre container, il ne sera évidemment pas accessible.

De même, il n'est pas nécéssaire d'ouvrir un shell. Il est tout à fait possible de faire éxecuter une commande à notre container au lancement.


### Se connecter à un container existant
Imaginons un container en cours d'execution
```
docker run -d --name dodo centos:7 sleep 120
```

Vous pouvez vous y connecter (via son nom ou son id) et observer de l'intérieur ce qui s'y déroule
```
docker exec -it dodo bash
```

Cela permet de voir le process exécuté (avec la commande ps) ou de suivre les logs (avec par exemple un tail -f )
Vous pouvez quitter ce shell bash, le container hôte continuera à vivre.

### La méthode attach
Selon la documentation, il y a une méthode plus simple
```
docker attach <id_or_name>
```

Cette méthode est pratique, car nous héritons automatiquement des flux stdin, stdout et stderr.
Cependant, elle est aussi plus risquée car comme nous sommes directement connecté au vrai container, un Ctrl-C tuerait le container de facto.

A utiliser avec parcimonie.



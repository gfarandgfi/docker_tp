# Travaux pratiques pour formation docker

## TP no 00
Prise en main.

### Git et docker ont été pré-installés et vos machines parametrées

Pour verifier ceci nous allons effectuer deux actions:
  
  - cloner le repo de ce TP
  ```
  git clone https://github.com/gfarandgfi/docker_tp.git
  ```

Chaque nouveau TP est sur une nouvelle branche. Pour en changer il suffira de la checkout:
```
git checkout tp-xx
```

  - lancer un container test (et observer le comportement de Docker)
  ```
  docker run hello-world
  ```
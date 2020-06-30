# Travaux pratiques pour formation docker

## TP no 00
Prise en main.

### Git et docker ont été pré-installés sur vos machines

Pour verifier ceci nous allons effectuer deux actions:
  
  - cloner le repo de ce TP
  ```bash
  git clone https://github.com/gfarandgfi/docker_tp.git
  ```bash
  
    Chaque nouveau TP est sur une nouvelle branche. Pour en changer il suffira de la checkout:
    ```bash
    git checkout tp-xx
    ```

  - lancer un container test (et observer le comportement de Docker)
  ```bash
  docker run hello-world
  ```

### Pour ce TP, il faut être root :
```
sudo su – 
```

### Pour installer git :
```
yum install -y git
```

### Pour installer docker-ce :
```
yum install -y yum-utils
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
yum install -y docker-ce docker-ce-cli containerd.io
systemctl start docker
systemctl enable docker
```

### Paramétrage de l’environnement :
```
usermod –a –G docker gfiuser
echo "gfiuser ALL=(ALL)       NOPASSWD: ALL" >> /etc/sudoers
exit
```


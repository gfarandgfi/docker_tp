    #!/bin/bash
    
    cd /tmp 
    sudo apt update 
    sudo apt install -y git 
    sudo apt install -y curl 
    curl -fsSL https://get.docker.com -o get-docker.sh 
    sudo sh get-docker.sh 
    sudo usermod -aG docker ${aws_instance.docker1.key_name} rm -rf *

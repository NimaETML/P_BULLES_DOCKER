# Fichier docker-compose.yaml pour mettre en place un environnement DEV.

# L'environnement contient:

- une base de donnée mariaDB

version: latest
port: 3306

user: nims
password: pswnims

- une interface phpmyadmin pour la base de donnée

version: 5.2.0
port: 8080

user: nims
password: pswnims

-

- un volume de donnée "db-data"

## marche a suivre:

clonez ce répértoire sur votre machine avec ´git clone https://github.com/NimaETML/P_BULLES_DOCKER.git´ dans un invite de commande, ou de préférence git bash

a présent, lancer la commmande ´docker-compose up -d´

vous devriez avoir ces lignes affiché:

´´´
Network p_bulles_nimzarrabi_docker_default Creating
Network p_bulles_nimzarrabi_docker_default Created
Container p_bulles_nimzarrabi_docker-db-1 Creating
Container p_bulles_nimzarrabi_docker-db-1 Created
Container p_bulles_nimzarrabi_docker-phpmyadmin-1 Creating
Container p_bulles_nimzarrabi_docker-phpmyadmin-1 Created
Container p_bulles_nimzarrabi_docker-db-1 Starting
Container p_bulles_nimzarrabi_docker-db-1 Started
Container p_bulles_nimzarrabi_docker-phpmyadmin-1 Starting
Container p_bulles_nimzarrabi_docker-phpmyadmin-1 Started
´´´

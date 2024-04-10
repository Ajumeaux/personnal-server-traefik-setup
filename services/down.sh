#!/bin/bash

# Définit le chemin absolu vers le dossier contenant ce script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# Parcourt tous les dossiers du dossier actuel à la recherche de fichiers docker-compose.yml
find "$DIR" -type f \( -name "docker-compose.yml" -o -name "*-compose.yml" \) | while read f; do
  # Récupère le dossier contenant le fichier docker-compose trouvé
  COMPOSE_DIR=$(dirname "$f")
  
  # Change le répertoire courant au dossier contenant le fichier docker-compose
  cd "$COMPOSE_DIR"
  
  # Affiche le répertoire à partir duquel le docker compose sera exécuté
  echo "Exécution de docker compose down dans $COMPOSE_DIR"
  
  # Exécute docker compose down pour arrêter et supprimer les conteneurs et réseaux
  sudo docker compose down
  
  # Retourne au dossier original pour éviter des changements inattendus dans le répertoire courant
  cd "$DIR"
done
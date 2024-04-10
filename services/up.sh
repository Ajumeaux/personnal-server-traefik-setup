#!/bin/bash

# Définit le chemin absolu vers le dossier contenant ce script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# Lit la liste des services à exclure depuis .scriptignore
EXCLUDE_SERVICES=()
if [ -f "${DIR}/.scriptignore" ]; then
    while IFS= read -r line; do
        EXCLUDE_SERVICES+=("$line")
    done < "${DIR}/.scriptignore"
fi

# Parcourt tous les dossiers du dossier actuel à la recherche de fichiers docker-compose.yml
find "$DIR" -type f \( -name "docker-compose.yml" -o -name "*-compose.yml" \) | while read f; do
  COMPOSE_DIR=$(dirname "$f")
  RELATIVE_DIR=${COMPOSE_DIR#$DIR}

  if printf '%s\n' "${EXCLUDE_SERVICES[@]}" | grep -q "^$RELATIVE_DIR$"; then
      echo "Exclusion du service : $RELATIVE_DIR"
      continue
  fi
  
  cd "$COMPOSE_DIR"
  echo "Exécution de docker compose up -d dans $COMPOSE_DIR"
  sudo docker compose up -d
  
  cd "$DIR"
done
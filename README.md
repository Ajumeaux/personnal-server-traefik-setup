# Mon Projet Docker

Ce projet contient les configurations Docker pour déployer plusieurs services, notamment Traefik comme reverse proxy, Gitea pour le versionnement de code, Prometheus et Grafana pour le monitoring, un serveur Minecraft, et Focalboard pour la gestion de projet. Voici un aperçu de chaque service et de son rôle dans l'architecture :

# Services

## Traefik

Traefik est utilisé comme reverse proxy pour gérer le trafic entrant et automatiquement rediriger vers les services correspondants, tout en fournissant le support HTTPS via des certificats SSL automatiques.

## Gitea

Gitea offre un service de gestion de version Git auto-hébergé, léger et facile à installer. Il est configuré pour utiliser PostgreSQL comme base de données.

## Prometheus et Grafana

Prometheus est utilisé pour le monitoring et la collecte de métriques, tandis que Grafana permet la visualisation de ces métriques à travers des tableaux de bord interactifs.

## Serveur Minecraft

Un serveur Minecraft configuré pour utiliser PaperMC, optimisé pour la performance, et pré-configuré avec des plugins pour le support multi-plateforme.

## Focalboard

Focalboard sert comme une alternative open source à Trello, Notion, et Asana pour la gestion de tâches et de projets. Il utilise PostgreSQL pour le stockage des données.

## Configuration

Chaque service est configuré à travers des fichiers docker-compose.yml et des fichiers de configuration spécifiques (par exemple, focalboard-config.json pour Focalboard). Ces fichiers définissent les images Docker à utiliser, les volumes pour la persistance des données, les réseaux pour la communication inter-service, et les labels pour l'intégration avec Traefik.

## Démarrage

Pour démarrer les services, naviguez dans le répertoire contenant le fichier docker-compose.yml correspondant et exécutez :

```bash
docker-compose up -d
```
## Accès aux Services

Les services sont accessibles via les noms de domaines configurés dans les labels Traefik des fichiers docker-compose.yml. Assurez-vous que ces noms de domaines sont correctement redirigés vers votre serveur Docker.

# Recommendation des Films

## Description

Ce projet implémente un système de recommandation de films basé sur l'apprentissage automatique. Il utilise l'IA pour offrir des recommandations de films personnalisées en fonction des préférences des utilisateurs. Ce README fournit un aperçu rapide des étapes et des composants clés du projet.

## Membres de l'équipe 

- BENAISSA Sidahmed 20012296
- SAMMATRICE Lorenzo 22009074

## Répartition de tâches :

Diagramme de Gaant : https://docs.google.com/spreadsheets/d/1oQpN8IbCruVLwIbYxTpXyGg-q9uK_OgEmNuSrVO-9V4/edit#gid=1115838130


## Diagramme bas de données
![Alt text]('./Base de données projet recommandation des films.png')


## Commandes Docker

Pour build l'image Docker de Flask Python

```bash
cd Back
docker build
```

Pour démarrer le serveur

```bash
docker compose up -d
```

Pour se connecter dans le docker

```bash
docker exec -it flask-docker bash
```

Une fois fini le développement pour mettre en production il faut build.
```bash
npm build
```

```bash
npm install -g serve
```
```bash
serve -s build
```
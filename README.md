# Recommendation des Films

## Description

Ce projet implémente un système de recommandation de films basé sur l'apprentissage automatique. Il utilise l'IA pour offrir des recommandations de films personnalisées en fonction des préférences des utilisateurs. Ce README fournit un aperçu rapide des étapes et des composants clés du projet.

## Membres de l'équipe

- BENAISSA Sidahmed 20012296
- SAMMATRICE Lorenzo 22009074

## Répartition des tâches :

Diagramme de Gaant : https://docs.google.com/spreadsheets/d/1oQpN8IbCruVLwIbYxTpXyGg-q9uK_OgEmNuSrVO-9V4/edit#gid=1115838130

### Support de présentation
https://www.canva.com/design/DAF1RuZEUrY/N5EHFHV6b74_rx6jWSe7PQ/edit?utm_content=DAF1RuZEUrY&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton

[Support de présentation en pdf](Oral%20projet%20recommendation%20des%20films.pdf)

## Diagramme bas de données

![bdd](https://github.com/Sidahmed-ben/recommendation-des-films/assets/90385023/045ff928-d5a3-47d1-a1dd-acd200c3e7be)

## Maquettes du site

### Page d’accueil :
![maquette](https://raw.githubusercontent.com/Sidahmed-ben/recommendation-des-films/main/maquette/PageAccueil.png)

### Page films à recommander :
![maquette](https://raw.githubusercontent.com/Sidahmed-ben/recommendation-des-films/main/maquette/FilmsRecommende.png)

### Page films à voter :
![maquette](https://raw.githubusercontent.com/Sidahmed-ben/recommendation-des-films/main/maquette/recommendationDesFilmVoter.png)


## Commandes Docker

Pour build l'image Docker de Flask Python

```bash
cd Back
docker build
```

Pour démarrer le serveur

````bash
docker compose up --build```

### Cela permet de lancer et builder en même temps le docker
```bash
docker compose up --build
```

Pour se connecter dans le docker

```bash
docker exec -it flask-docker bash
````

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

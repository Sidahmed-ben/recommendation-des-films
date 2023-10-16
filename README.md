# Recommendation des Films

Website for movie recommandation created with react framework

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
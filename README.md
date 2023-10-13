# TP3-Mise-en-place-pour-une-application-python-d-une-chaine-CI

### Objectif

Le TP consiste à tester et à push l'image doxker sur docker hub, ils'agit de l'intégration continue(CI) avec jenkins.


### Prérequis

 - un compte Github
 - un compte docker hub
 - Lance le script sur linux et avoir docker installer dessus


### Composition du dépot

Le dossier est constitué des dossiers et fichiers comme suit:

```
├── app
├── jenkins
│       ├── plugins.txt
├── docker-compose.yml
├── Jenkinsfile
├── README.md
```
### Présentation du pipeline

Les étapes du pipeline sont décritées dans le Jenkinsfile qui est disponible sur le dépôt, jenkins l'utilise pour executer les tâches suivantes:

1. Lancement du linter pylint
2. Verification des copiers-coller avec radon raw
3. Analyse de la Complexité Cyclomatique avec radon cc 
4. Lancement des tests unitaires
5. Builder l'image docker avec docker
6. Pusher l'image sur le docker hub

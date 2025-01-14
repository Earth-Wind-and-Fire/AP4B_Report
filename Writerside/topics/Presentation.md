#    Présentation

Projet Turing Machine - UTBM    

## Introduction

Ce projet rend hommage à Alan Turing, un génie des mathématiques et du cryptage qui a contribué à l'invention des ordinateurs. Inspiré du jeu de société Turing Machine, notre version numérique propose une adaptation unique et ludique pour les étudiants de l'UTBM.

## Objectif du Projet

L'objectif de ce projet est de créer une version numérique du jeu Turing Machine, en s'inspirant du monde de l'**UTBM**. 
Dans cette adaptation, un **professeur** envoie un mail à ses élèves pour leur donner une **énigme** afin qu'ils puissent rentrer dans la salle d'examen grâce à un **mot de passe**.
Les étudiants doivent proposer des mots de passe et l'application leur indique si les mots de passe proposés valident les critères de l'énigme.
Pour éviter toute triche et pour rendre le jeu plus **stimulant**, les mots de passes seront à usage unique et généré en fonction de l'INE de l'étudiant.
De plus lors du lancement de l'application, une difficulté est choisie par l'étudiant, ce qui influe sur la **complexité** de l'énigme et pour favoriser la prise de risque, un **multiplicateur** de points (variant de 1.2 à 2) sera appliqué sur la note de l'examen en fonction de la difficulté choisie.

Il est également possible de jouer à plusieurs, en **compétition** ou le **premier** qui trouve le mot de passe gagne. Dans ce cas l'INE n'est pas nécessaire.

## Technologies Utilisées

Pour réaliser ce projet, nous avons utilisé les technologies suivantes :
- **Java** : pour la logique de programmation.
- **JavaFX** : pour l'interface utilisateur.
- **MVC (Model-View-Controller)** : pour structurer le code de manière modulaire et maintenable.

## Fonctionnalités du Jeu

- **Connexion** : l'étudiant doit se connecter avec son INE pour accéder à l'énigme.
- **Choix de la difficulté** : l'étudiant peut choisir la difficulté de l'énigme.
- **Génération de mot de passe** : l'application génère un mot de passe unique en fonction de l'INE de l'étudiant.
- **Validation du mot de passe** : l'application valide le mot de passe proposé par l'étudiant.

## Répartition des Tâches

### **Arnaud Michel** : 
  - Conception `théorique` de l'application
  - Conception du diagramme de `séquence` sur l'initialisation de la partie
  - Conception du diagramme de `classe`
  - Implémentation des `vues`, des `contrôleurs` et la base des `modèles`.
  - Relecture et `optimisation` de la génération de combinaisons.
  - Design de l'interface graphique.
  - Rédaction du rapport.
### **Antoine Laurant** : 
  - Conception `théorique` de l'application
  - Conception du diagramme de `classe` 
  - Conception du diagramme de `séquence` sur la gestion des manches 
  - Implémentation de l'**algorithme de génération de combinaisons**
    - Usine de stratégies
    - Test de solution
    - Récupération de la solution unique
  - View et Controller de la fenêtre de fin de partie
  - Relecture du rapport.
### **Antoine Perrin** : 
  - Conception `théorique` de l'application
  - Conception du diagramme `Use Case`
  - Analyse et compréhension des règles du jeu pour l'adapter à l'UTBM
  - Ajouts de stratégies
  - Relecture complète du code et correction des bugs
  - Écriture / montage vidéo de présentation
  - Relecture du rapport.
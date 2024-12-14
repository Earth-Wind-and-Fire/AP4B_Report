# Choix de conceptions

## Création d'une unique solution

Pour créer une solution unique en fonctions de différents critères, nous avons choisi de modéliser les différentes étapes de la création de la solution grâce à la **composition de fonctions**. 

Mathématiquement, nous créons un tableau de **125** éléments, chaque élément étant une **combinaison possible**. Nous appliquons ensuite une série de fonctions pour **filtrer** les combinaisons en fonction des critères choisis par l'utilisateur. Et nous continuons ce processus jusqu'à ce qu'il ne reste qu'**une** seule combinaison. Si au bout de 6 étapes, il reste plusieurs combinaisons, nous revenons à l'étape 1 et nous recommençons le processus. Ce processus est développé dans un diagramme de séquence disponible [ici](Initialisation-de-la-partie.md).
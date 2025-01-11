# Implémentation

## Première Partie

La première chose que nous avons implémentée est le **model**, fidèle à notre conception.
Cela nous a permis de pouvoir directement ajouter les vues et les contrôleurs.

Mettre en place le modèle nous a permis de commencer à réfléchir à la manière dont nous allions **implémenter** les différentes fonctionnalités du jeu.

De plus nous avons mis en place la première vue, qui est la vue d'accueil du jeu pour que tout le monde ait les mêmes **bases** et **règles** pour commencer à programmer.
Pour pouvoir gérer nos vues et ne pas s'embeter avec des dizaines d'attributs graphiques, nous avons décidé d'utiliser des fichiers **FXML** pour décrire nos vues.
Ces fichiers permettent de décrire l'interface graphique de manière déclarative, ce qui facilite la **maintenance** et l'**évolution** de l'interface.
Il suffit d'associer un fichier FXML à un contrôleur pour que l'interface soit **automatiquement** générée.

## Deuxième Partie

Nous avons séparé le travail en **deux parties**, la première partie étant de mettre en place l'**algorithme** de génération de solution et la deuxième partie étant de mettre en place l'**interface graphique** liée avec la classe `Game`.

Ces deux taches pouvant être faites **indépendamment** l'une de l'autre, nous avons pu avancer plus **rapidement**.

Nous avons donc pu mettre en place les rounds alors même que l'algorithme de génération de solution n'était pas encore **fonctionnel**.

## Troisième Partie

Nous avons rajouté des **fonctionnalités** au jeu, comme la possibilité de choisir la **difficulté** de l'énigme, de **valider** le mot de passe proposé par l'étudiant, etc.

Nous avons également ajouté la possibilité de jouer à **plusieurs** en **compétition**.


## Tests unitaires

Nous avons mis en place un **test unitaire** pour générer des combinaisons et vérifier que l'algorithme fonctionne correctement (vérification de l'amplitude des combinaisons, de la génération de combinaisons uniques, etc.).
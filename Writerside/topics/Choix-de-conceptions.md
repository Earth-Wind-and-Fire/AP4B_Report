# Choix de conceptions

Afin de réaliser notre application, nous avons dû faire des choix de conception. Ces choix ont été faits en fonction des besoins de l'application et des contraintes techniques.

## Model View Controller

Nous avons choisi d'utiliser le **modèle MVC** pour la conception de notre application. 
En effet, cette architecture permet de séparer les différentes composantes de l'application, ce qui facilite la maintenance et l'évolution de l'application. 
De plus le modèle MVC permet de rendre l'application plus modulaire et donc plus facile à comprendre et à maintenir.

## Evolution des choix de conception

Depuis la première version de l'application, l'architecture n'a pas grandement évolué.


Nous avons supprimé une classe que nous avions jugée inutile et nous avons ajouté quelques méthodes pour l'encapsulation des données.
Nous avons aussi ajouter des Enumerations pour les différentes difficultés et les différents types de stratégies afin de rendre le code plus lisible et plus facile à maintenir.

Nous détaillerons ces modifications dans la partie **[](Diagramme-de-Classe.md)**.

## Création d'une unique solution

Pour créer une solution unique en fonctions de différents critères, nous avons choisi de modéliser les différentes étapes de la création de la solution grâce à la **composition de fonctions**. 

Mathématiquement, nous créons un tableau de **125** éléments, chaque élément étant une **combinaison possible**. Nous appliquons ensuite une série de fonctions récursivement  pour **filtrer** les combinaisons en fonction des critères choisis par l'utilisateur. Et nous continuons ce processus jusqu'à ce qu'il ne reste qu'**une** seule combinaison. Si au bout de 6 étapes, s'il reste plusieurs combinaisons, nous revenons à l'étape précédente et recommençons le processus (donc, de manière récursive). Ce processus est développé dans un diagramme de séquence disponible **[ici](Initialisation-de-la-partie.md)**.

### Modélisation mathématique du processus :
$$
\begin{array}{l}
\textbf{Initialisation :} \\
\Omega = \{ (x_1, x_2, x_3) \mid x_i \in \{1, 2, 3, 4, 5\} \text{ pour } i = 1, 2, 3 \} \\
\quad \text{(ensemble de toutes les combinaisons possibles, taille 125)} \\
\\
\textbf{Processus de filtrage :} \\
F = f_1 \circ f_2 \circ f_3 \circ f_4 \circ f_5 \circ f_6 : \Omega \rightarrow \mathcal{P}(\Omega) \\
\text{avec } f_k : \text{fonctions de filtrage appliquées séquentiellement} \\
\\
\textbf{Résultat après chaque étape :} \\
\Omega_k = f_k(\Omega_{k-1}) \quad \text{avec } \Omega_0 = \Omega \\
\text{Si } |\Omega_k| = 1 \text{ (une seule combinaison restante) et } 4 \leq k \leq 6 \text{, le processus s'arrête.} \\
\text{Si } |\Omega_k| \not= 1 \text{ (il reste plusieurs combinaisons) ou } k = 6 \text{ (6 étapes atteintes), alors :} \\
\text{Retour à l'étape précédente avec une nouvelle fonction de filtrage.}
\end{array}
$$

## Utilisation de JavaFX

Nous avons choisi d'utiliser **JavaFX** pour la conception de l'interface graphique de notre application.
JavaFX est un framework qui permet de créer des interfaces graphiques de manière simple et efficace.
Par ailleurs, c'est une technologie qui est intégrée à Java, ce qui facilite son utilisation.

> Nous avons fait le choix de JavaFX plutôt que Swing, car JavaFX est plus moderne et plus adapté pour la création d'interfaces graphiques.
> De plus, JavaFX est plus performant que Swing et offre plus de possibilités en termes de design.
{style="note"}


Nous avons utilisé Maven pour gérer les dépendances de notre projet. Maven est un outil de gestion de projet qui permet de gérer les dépendances, de compiler le code, de générer des rapports, etc.
# Choix de conceptions

## Création d'une unique solution

Pour créer une solution unique en fonctions de différents critères, nous avons choisi de modéliser les différentes étapes de la création de la solution grâce à la **composition de fonctions**. 

Mathématiquement, nous créons un tableau de **125** éléments, chaque élément étant une **combinaison possible**. Nous appliquons ensuite une série de fonctions pour **filtrer** les combinaisons en fonction des critères choisis par l'utilisateur. Et nous continuons ce processus jusqu'à ce qu'il ne reste qu'**une** seule combinaison. Si au bout de 6 étapes, s'il reste plusieurs combinaisons, nous revenons à l'étape précédente et recommence le processus (donc, de manière récursive). Ce processus est développé dans un diagramme de séquence disponible **[ici](Initialisation-de-la-partie.md)**.

Modélisation mathématique du processus :
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
\text{Si } |\Omega_k| = 1 \text{ (une seule combinaison restante), le processus s'arrête.} \\
\text{Si } |\Omega_k| != 1 \text{ (il reste plusieurs combinaisons) ou } k = 6 \text{ (6 étapes atteintes), alors :} \\
\text{Retour à l'étape précédente avec une nouvelle fonction de filtrage.}
\end{array}
$$

## Utilisation de la programmation fonctionnelle
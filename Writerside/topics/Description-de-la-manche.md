# Description de la manche

<primary-label ref="diagram"/>

## Description

La manche est une partie du jeu. Elle est composée de plusieurs éléments :
- Un **Game** : le contenu de la partie.
- Un **RoundController** : le contrôleur de la manche.
- Un **RoundView** : la vue de la manche.

A chaque manche, un joueur doit proposer une combinaison. Cette combinaison est testée et le résultat est affiché à l'écran.
Puis, le résultat de la manche est retourné au jeu.

### Modifications continue de la conception

Dans la première version de notre conception, nous avions prévu de créer une classe `Round` pour chaque manche.
Cependant, comme nous n'avons pas besoin de stocker tout les résultats des manches, nous avons décidé de ne pas créer de classe `Round` et de gérer les manches directement dans le contrôleur de la manche.
Et de stocker les résultats et les combinaisons dans la classe `Player`.

### Exemple

Un joueur propose la combinaison `123`. Pour un critère nombre de `1` le test renvoie `validé` (true), pour le critère le 3ᵉ nombre est le plus grand, le test renvoie `non validé` (false), et ainsi de suite pour le nombre de critères de la partie.
Enfin, le résultat de la manche est retourné au jeu.

## Diagramme de séquence

<secondary-label ref="comportemental"/>

```plantuml
@startuml
'https://plantuml.com/sequence-diagram


autonumber

participant "Game" as Game
participant "RoundView" as RoundView
participant "RoundController" as RoundController
participant "Player" as Player
participant "Recap" as Recap

loop for each Player until the secret combination will found

    ' Create Game and Round
    activate Game

' instantiate RoundView
    create RoundView
    Game -> RoundView: void play()
    activate RoundView

' instantiate RoundController
    create RoundController
    RoundView -> RoundController: instantiate RoundController
    activate RoundController
    RoundController -> RoundView: Controller created
    deactivate RoundController

    RoundView -> RoundController : onValidate() : submit solution
    activate RoundController

    RoundController -> RoundController : checkCombination()
    note left
        Here, we check the combination
        set by the player and compare
        with the specific criteria asked
        for generate result
    end note
    RoundController -> Player : saveResult
    activate Player
    Player -> Recap : saveResult
    activate Recap
    Recap -> Player : result saved
    deactivate Recap
    Player -> RoundController : result saved
    deactivate Player
    RoundController -> RoundView : updateView
    deactivate RoundController

    RoundView -> RoundController : onValidate() : next round
    destroy RoundView

    activate RoundController
    RoundController -> Game : next Round
    destroy RoundController
end





@enduml
```
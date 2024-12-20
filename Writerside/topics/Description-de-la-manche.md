# Description de la manche

<primary-label ref="diagram"/>

## Description

La manche est une partie du jeu. Elle est composée de plusieurs éléments :
- Un **Round** : le model de la manche.
- Un **RoundController** : le contrôleur de la manche.
- Un **RoundView** : la vue de la manche.

A chaque manche, un joueur doit proposer une combinaison. Cette combinaison est testée et le résultat est affiché à l'écran.
Puis, le résultat de la manche est retourné au jeu.

### Exemple

Un joueur propose la combinaison `123`. Pour un critère nombre de `1` le test renvoie `validé` (true), pour le critère le 3ᵉ nombre est le plus grand, le test renvoie `non validé` (false), et ainsi de suite pour le nombre de critères de la partie.
Enfin, le résultat de la manche est retourné au jeu.

## Diagramme de séquence

<secondary-label ref="comportemental"/>

```plantuml
@startuml
'https://plantuml.com/sequence-diagram

title Manche
autonumber

participant "Game" as Game
participant "Round" as Round
participant "RoundController" as RoundController
participant "Player" as Player
participant "RoundView" as RoundView

' Create Game and Round
activate Game
create Round
Game -> Round: Instantiate Round
activate Round
Round -> Game: Round
deactivate Round

create RoundController
Game -> RoundController: Instantiate RoundController
activate RoundController

create RoundView
RoundController -> RoundView: Instantiate RoundView
activate RoundView
RoundView -> RoundController: View created
deactivate RoundView

RoundController -> Player: Ask a combination
activate Player

Player -> RoundController: Return a combination
deactivate Player
RoundController -> Round: Submit combination
activate Round
Round -> RoundController: update combination
deactivate Round

RoundController -> RoundView: Update view with combination
activate RoundView
RoundView -> RoundController: View updated
deactivate RoundView

RoundController -> Round: Test combination
activate Round
Round -> RoundController: return result
deactivate Round

RoundController -> RoundView: Update view with result
activate RoundView
RoundView -> RoundController: View updated
deactivate RoundView

RoundController -> Game: Return result of the round
deactivate RoundController
deactivate Game



@enduml
```
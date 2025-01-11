# Initialisation de la partie

<primary-label ref="diagram"/>

Le diagramme de séquence ci-dessous illustre les interactions entre les classes du système lors de l'initialisation de la partie. Il montre comment la classe `TuringApplication` instancie la classe `Game`, qui à son tour initialise le jeu en générant les stratégies et la solution.
Il met en évidence le rôle de notre algorithmie de génération de stratégies, notamment la validation des stratégies par rapport à la solution.

### Modifications continue de la conception

Cette partie n'a que peu évolué ormis certains ajouts de fonction afin de mieux séparer les responsabilités des méthodes.

## Diagramme de séquence

<secondary-label ref="comportemental"/>

```plantuml
@startuml
'https://plantuml.com/sequence-diagram
scale 0.625
autonumber

' Paritipant
participant "TuringApplication" as Main
participant "Game" as Game
participant "FactoryStrategy" as Factory
participant "Strategy" as Strategy


'Create Game
activate Main
create Game
Main -> Game : Instantiate Game

'Fct initialise
activate Game
Game -> Game : Initialise()
activate Game #aqua

loop while (SecretCombination is not find)

    Game -> Game : generate Elem
    note left
        Generate a list
        of the 125
        enable numbers
    end note

    Game -> Game : genrate TypeStrat
    note left
            Generate a list
            with all type of
            strategy enable
    end note

    loop 4 times
        create Factory
        Game -> Factory : generateStrategy(random TypeStrat)
        activate Factory

        Factory -> Strategy : instantiate a specific strategy
        activate Strategy
        Strategy -> Factory : return strategy
        deactivate Strategy
        Factory -> Game : add strategy to the list (Game attribute)
        destroy Factory

        Game -> Strategy : check remaining combinations (Elem)
        activate Strategy
        Strategy -> Game : remove combination (from Elem) who are not validate by the strategy
        deactivate Strategy
    end

    alt Elem.size == 1
        Game -> Game : set the last remaining combination as SecretCombination
    end
end

Game -> Game : fillRemainingStrategies()
activate Game #gold

loop while strategy.size != 5
    create Factory
    Game -> Factory : generateStrategy(random TypeStrat)
    activate Factory

    Factory -> Strategy : instantiate a specific strategy
    activate Strategy
    Strategy -> Factory : return strategy
    deactivate Strategy
    Factory -> Game : add strategy to the list (Game attribute)
    destroy Factory


    Game -> Strategy : check the SecretCombination
    activate Strategy
    Strategy -> Game : return
    deactivate Strategy

    alt if the SecretCombination is not validate by the strategy
        Game -> Game : delete the strategy
    end
end

Game -> Game : all Strategy & SecretCombination are find
deactivate Game

Game -> Game : game is set
deactivate Game




@enduml
```



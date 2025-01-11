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

'Creat Factory
create Factory
Game->Factory : Instantiate FactoryStrategy
activate Factory
Factory->Game : FactoryStrategy
deactivate Factory

'Fct GenerateStrategies
Game->Game : GenerateStrategies() : Strategyable[*]
activate Game #gold
Game->Game : Generate Elem
note left
    Generate a list
    of the 125
    enable numbers
end note

'Strategy generation section
loop while (len(Elem)!=1)
    alt len(Elem>1)
        Game->Factory : Generate n° Strategy
        activate Factory


        'create Strategy
        create Strategy

        note right
            FactoryStrategy determine witch strategy
            instantiate with a specific algorithm
        end note

        Factory->Strategy : Instantiate specific Strategy
        activate Strategy
        Strategy->Factory : Strategy
        deactivate Strategy
        Factory->Game : Strategy
        deactivate Factory

        'test combination
        Game->Strategy : TestCombinason(Elem)
        activate Strategy
        Strategy->Game : return Elem validate
        deactivate Strategy

        note right
            Return all of the elements who
            are validate by the strategy
        end note

    else len(Elem)=0 or nb Strategy == 6
        Game->Game : delet last Strategy

        note right
            Remove the last strategy
            from strategyable [*]
        end note
    end
end

deactivate Game

deactivate Game

@enduml
```



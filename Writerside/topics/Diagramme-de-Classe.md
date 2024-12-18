# Diagramme de Classe

<primary-label ref="diagram"/>

### Explication

Le diagramme de classe ci-dessous illustre la structure de notre application.

Voici quelques points clés à retenir :
- `Strategyable` est une interface qui définit une méthode `TestCombination` pour tester une combinaison. Nous avons préféré utiliser une interface plutôt qu'une classe abstraite pour permettre une plus grande flexibilité dans la définition des stratégies. De plus elle ne contient pas d'attributs.
- `FactoryStrategy` est une classe qui permet de créer des stratégies. Elle contient des méthodes pour créer différentes stratégies (par exemple `MakeMax`, `MakeMin`, `MakeEven`, `MakeNb`, etc.). Cette classe permet de centraliser la création des stratégies et de faciliter l'ajout de nouvelles stratégies. Cela limite aussi beaucoup les dépendances entre les classes.
- `TestSolution` est une classe qui permet de tester une solution par rapport à une combinaison. Elle contient un tableau de stratégies et une méthode `TrySolution` qui teste une combinaison par rapport à chaque stratégie.
- `Player` est une classe qui représente un joueur. Elle contient un nom et un récapitulatif des combinaisons proposées par le joueur, ainsi que les résultats obtenus pour chaque combinaison.
- `Recap` est une classe qui représente le récapitulatif des combinaisons proposées par un joueur. Elle contient un tableau de combinaisons, un tableau de résultats et un tableau de notes pour chaque combinaison.

## Diagramme de Classe

<secondary-label ref="structurel"/>

```PlantUML
@startuml

scale 0.5
title AP4B Turing Machine - Class Diagram


legend bottom
Antoine Laurant, Arnaud Michel, Antoine Perrin
endlegend

' Aligner les packages verticalement
package Model {
    class TuringApplication {
        +{static} void main()
    }
    TuringApplication --> Game: Starting application

    class Game {
        - Combination solution
        - Strategyable[3..6] strategies
        - Player[1..6] players
        - Integer nbRounds
        - TestSolution _testSolution
        + Game(nbJoueurs, nbStrats)
        + Game(nbJoueurs, nbStrats, difficulty)
        + Initialise()
        + GenerateStrategies(): Strategyable[*]
        + Play()
        + PlayRound(TestSolution, Player): Round
        + End()
    }
    Game o--> TestSolution
    Game o--> "0..*" Round
    Game o--> "0..6" Strategyable
    Game o--> "0..6" Player
    Game o--> FactoryStrategy

    interface Strategyable {
        + TestCombinaton(Combination): Boolean
    }

    class Strategy {
        + TestCombinaton(Combination): Boolean
    }
    Strategy --|> Strategyable

    class FactoryStrategy {
        + FactoryStrategy()
        + MakeMax(): Strategyable
        + MakeMin(): Strategyable
        + MakeEven(int index): Strategyable
        + MakeNb(int x): Strategyable
        ....
        "Liste des stratégies"
    }
    FactoryStrategy --> Strategy

    class TestSolution {
        - Strategyable[3..6] strategies
        + TestSolution(Strategyable[3..6])
        - TrySolution(Combination): Boolean[3..6]
    }

    class Player {
        - String name
        - Recap recap
    }
    Player o--> Recap: Have

    class Recap {
        - Combination[*] combinations
        - Boolean[*] results
        - String[6] notes
    }

    class Combination {
        - Integer[3] combination
    }

    class Round {
        - Player player
        - Combination combination
        + Round(Player, TestSolution)
        + Play()
        + TestCombination()
        + GetRecap(): map[Combination, Boolean[3..6]]
    }
    Round o--> Player
    Round o--> Combination
    Round o--> TestSolution
}

package Controller {
    class HomeController {
        - Game game
        - HomeView view
        + HomeController()
        + Start(nbJoueurs, nbStrats)
        + Start(nbJoueurs, nbStrats, difficulty)
        + ChangeViewRound(Round)
    }
    HomeController --> Game: Start Game

    class RoundController {
        - Round round
        - RoundView view
        + RoundController(Round)
        + Play()
        + Submit(Combination)
        + TestCombination()
        + ChangeViewRecap()
        + ChangeViewEnding()
    }
    RoundController ---> Round: Play Round
    RoundController ---> Round: Submit Combination
    RoundController ---> RecapController: Change View to RecapView
    RoundController ---> EndingController: Change View to EndingView

    class RecapController {
        - Recap recap
        - RecapView view
        + RecapController(RoundView)
        + ChangeViewRound()
        + ModifyRecap()
    }
    RecapController ---> Recap: Add Recap
    RecapController ---> RoundController: Change View to RoundView

    class EndingController {
        - Game game
        - EndingView view
        + EndingController()
        + Reset()
        + ChangeViewHome()
    }
    EndingController ---> HomeController: Change View to HomeView
    EndingController ---> Game: Reset Game

    HomeController --> RoundController: Change View to RoundView
}

package View {
    class HomeView <<HomeView page>> {
        - HomeController homeController
        - Button btnDificultyEasy
        - Button btnDificultyMedium
        - Button btnDificultyHard
        - Button btnStart
        - Slider sldNumberPlayer
        - Label lbPlayerName
        - TextField tfPlayerName
        + HomeView(Game)
        + creatGUI()
        + showGUI()
    }
    HomeView <-- HomeController: controlle

    class RecapView <<Personal note page>> {
        - RecapController recapController
        - TextArea taPersonalNote
        + RecapView(Game)
        + creatGUI()
        + showGUI()
    }
    RecapView <-- RecapController: controlle

    class RoundView <<RoundView page>> {
        - RadioButton [3] rbDigitSelector
        - Button btnTestNumber
        - Button btnSwitchRecapView
        - Button btnNextRound
        - CheckBox [3..6] cbCritSelector
        + RoundView(Game)
        + creatGUI()
        + showGUI()
    }
    RoundView <-- RoundController: controlle

    class EndingView <<Ending game page>> {
        - EndingController endingController
        - Button btnRestart
        - Button btnLeave
        + EndingView(Game)
        + creatGUI()
        + showGUI()
    }
    EndingView <-- EndingController: controlle
}

@enduml
```

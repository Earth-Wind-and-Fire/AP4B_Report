# Diagramme de Classe

<primary-label ref="diagram"/>

### Explication

Le diagramme de classe ci-dessous illustre la structure de notre application.

Voici quelques points clés à retenir :
- `Strategyable` est une interface qui définit une méthode `TestCombination` pour tester une combinaison. Nous avons préféré utiliser une interface plutôt qu'une classe abstraite pour permettre une plus grande flexibilité dans la définition des stratégies. De plus elle ne contient pas d'attributs.
- `FactoryStrategy` est une classe qui permet de créer des stratégies. Elle contient des méthodes pour créer différentes stratégies (par exemple `MakeMax`, `MakeMin`, `MakeEven`, `MakeNb`, etc.). Cette classe permet de centraliser la création des stratégies et de faciliter l'ajout de nouvelles stratégies. Cela limite aussi beaucoup les dépendances entre les classes.
- `Player` est une classe qui représente un joueur. Elle contient un nom et un récapitulatif des combinaisons proposées par le joueur, ainsi que les résultats obtenus pour chaque combinaison.
- `Recap` est une classe qui représente le récapitulatif des combinaisons proposées par un joueur. Elle contient un tableau de combinaisons, un tableau de résultats et un tableau de notes pour chaque combinaison.


### Modifications continue de la conception

Nous avons décidé de supprimer les classe `Round` et `TestSolution` car pour l'une nous pouvons récupérer les valeurs dans le controller.
Et pour la seconde nous nous en sommes dispensé en utilisant une méthode de la classe `Game` pour tester les combinaisons.

Nous avons aussi ajouté des méthodes:
Dans la classe `Game`:
- `generateAllCombinations` pour générer toutes les combinaisons possibles. (125 combinaisons)
- `filterCombinations` pour filtrer les combinaisons en fonction des stratégies choisies par les joueurs.
- `fillRemainStrategies` pour remplir les stratégies restantes avec des stratégies aléatoires.
- `isUniqueCombination` pour vérifier si une combinaison est unique.

Dans la classe `FactoryStrategy` nous avons ajoutés toutes les stratégies que nous voulions implémenter.

Pour la gestion des stratégies, nous avons supprimé la classe abstraite `Strategy` et nous avons transformé l'inteface `Strategyable` en classe abstraite pour pouvoir ajouter des méthodes. Ces classes sont implémentées dans la classe `FactoryStrategy` en redéfinissant la méthode abstraite `TestCombination`.

> Pour la partie vue et contrôleur, nous avons ajouté des méthodes pour faciliter la manipulation des données et des élements interagissant avec l'utilisateur.
> Nous les avons simplement ajoutées sans les détailler ici car elles sont assez simples et ne nécessitent pas d'explications supplémentaires.

> Il y a eu aussi des ajouts de méthodes de type `getter` et `setter` pour les attributs des classes mais aussi des méthodes pour faciliter la manipulation des données.
> De la même manière, ces méthodes sont assez simples et ne nécessitent pas d'explications supplémentaires.
{style="note"}

## Diagramme de Classe

<secondary-label ref="structurel"/>

```PlantUML
@startuml

scale 0.244

title AP4B Turing Machine - Class Diagram


package ewf {
    class Main {
        + {static} void main(String[])
    }

    Main ----> TuringApplication : Starting application

    class TuringApplication {
        - {static} Stage primaryStage
        + {static} Stage getPrimaryStage()
        + void start(Stage)
        + {static} void main(String[])
    }

    package model {
        enum TypeStrat {
            +  MAX
            +  MIN
            +  NB_ODD
            +  NB_EVEN
            +  COMPARE_TO_THREE
            +  COMPARE_SYMBOL_TO_SYMBOL
            +  COMPARE_SUM_TO_ALPHA
            +  SYMBOL_PRIME
            +  SYMBOL_ODD
            +  SYMBOL_EVEN
            +  SEQUENCE
            +  SUM_PRIME
            +  SUM_MULTIPLE
            + {static} TypeStrat getRandom()
        }

        class Game {
            - Combination: secretCombination
            - Strategy[]: strategies
            - Player[]: players
            - Difficulty: difficulty
            - int: nbRounds
            - RoundView: roundView
            - int: playerIndex
            + <<Create>> Game(int nbPlayers, Difficulty difficulty)
            - void initGame()
            - List<Combination> generateAllCombinations()
            - Strategy generateStrategy(TypeStrat: start)
            - List<Combination> filterCombinations(List<Combination>: combinations, Strategy: strategy)
            - void fillRemainingStrategies(List<Combination>: combinations)
            - boolean isUniqueStrategy(Strategy: strategy)
            + void play(List<String>: playerNames)
            + void nextRound()
            + void endGame()
            + Strategy[] getStrategies()
            + Difficulty getDifficulty()
            + Combination getSecretCombination()
            + String toString()
        }

        Game "1" --> "1..6" Player : has
        Game "1" --> "4..6" Strategy : uses
        Game "1" --> Difficulty : depends on
        Game --> Combination : has secret
        Game --> FactoryStrategy : creates strategies

        TuringApplication --> Game : start Game

        class Combination {
            - Integer[]: combination
            + <<Create>> Combination(Integer[]: combination)
            + <<Create>> Combination(Integer: a, Integer: b, Integer: c)
            + Integer[] getCombination()
            + void setCombination(Integer[]: combination)
            + String toString()
            + Integer getTriangle()
            + Integer getCircle()
            + Integer getSquare()
        }

        class FactoryStrategy {
            + <<Create>> Strategy ManufactureStrategy(TypeStrat: TypeStrat)
            - Strategy CreateMaxStrategy()
            - Strategy CreateMinStrategy()
            - Strategy CreateNbOddStrategy()
            - Strategy CreateNbEvenStrategy()
            - Strategy CreateCompareToThreeStrategy()
            - Strategy CreateCompareSymbolToSymbolStrategy()
            - Strategy CreateCompareSumToAlphaStrategy()
            - Strategy CreateSymbolOddStrategy()
            - Strategy CreateSymbolEvenStrategy()
            - Strategy CreateSequenceStrategy()
            - Strategy CreateSumPrimeStrategy()
            - Strategy CreateSymbolPrimeStrategy()
            - Strategy CreateSumMultipleStrategy()
        }

        FactoryStrategy --> Strategy : creates

        class Player {
            - String: name
            - Recap: recap
            + <<Create>> Player(String: name)
            + String getName()
            + Recap getRecap()
        }

        Player --> Recap : has

        class Recap {
            - List<Combination>: combinations
            - List<Boolean[]>: results
            - String[]: notes
            + <<Create>> Recap()
            + List<Combination> getCombinations()
            + void setCombinations(List<Combination>: combinations)
            + List<String[]> getResults()
            + String[] getNotes()
            + void addRound(Combination: combination, Boolean[]: result)
        }

        Recap --> Combination : has

        abstract class Strategy {
            ~ Integer: alpha
            ~ Integer: beta
            ~ TypeStrat: type
            ~ String: description
            + {abstract}Integer TestCombination(Combination: combination)
            + String getDescription()
        }


        enum Difficulty {
            +  EASY
            +  MEDIUM
            +  HARD
            + {static} Difficulty fromString(String: difficulty)
            + {static} String toString(Difficulty: difficulty)
            + {static} Float getMultiplicator(Difficulty: difficulty)
        }

        class TextReplacer {
            + {static} String replaceSymbols(String: input)
        }
    }

    package controller {
        class HomeController {
            - List<TextField>: playerFields
            + <<Create>> HomeController()
            + void initialize()
            + void startGame(ActionEvent: event)
            + void updatePlayers(MouseEvent: event)
        }

        HomeController ---> Game : starts

        class RoundController {
            - List<CheckBox>: criteria
            ~ boolean: validate
            ~ Game: game
            ~ Player: player
            ~ RoundView: roundView
            + <<Create>> RoundController(Game: game, Player: player, RoundView: roundView)
            + void initialize()
            + void onValidate(ActionEvent)
            + void showRecap(ActionEvent)
            + void endingGame()
        }

        RoundController ---> Player : controls
        RoundController ---> Game : manages

        class RecapController {
            - List<TextArea>: recapTexts
            - Player: player
            - RoundView: roundView
            + <<Create>> RecapController(Player: player, RoundView: roundView)
            + void initialize()
            - void backToRound(ActionEvent)
        }

        RecapController ---> Recap : shows
        RecapController ---> Player : has

        class EndController {
            + Player winner
            + Game game
            + <<Create>> EndController(Game: game, Player: winner)
            + void initialize()
            + void newGame(ActionEvent)
        }

        EndController ----> Player : shows winner
        EndController ----> Game : finalizes and restarts

        class component.CardCriteria {
            - Label descriptionLabel
            + <<Create>> CardCriteria(String)
            + void setBackgroundInRed()
            + void setBackgroundInGreen()
            + void setBackgroundInWhite()
            + String getDescription()
            + void setDescription(String)
        }
    }

    package view {
        class HomeView {
            + <<Create>> HomeView()
        }

        HomeView <-- HomeController : shows

        class RoundView {
            - Scene: scene
            + <<Create>> RoundView(Game: game, Player: player)
            + Scene getScene()
        }

        RoundView <-- RoundController : shows

        class RecapView {
            + <<Create>> RecapView(Player: player, RoundView: roundView)
            + Parent getRoot()
        }

        RecapView <-- RecapController : shows

        class EndView {
            + <<Create>> EndView(Game: game, Player: winner)
        }

        RecapController ---> RoundView : uses
        RecapController ---> TextReplacer : uses


        EndView <-- EndController : shows

        RoundView <---- Game : has
    }



}

javafx.application.Application <|---- TuringApplication
javafx.scene.control.CheckBox <|--- CardCriteria


legend Antoine Laurant Arnaud Michel Antoine Perrin

@enduml
```

# Diagrammes Use Case

<primary-label ref="diagram"/>

Le diagramme de cas d'utilisation ci-dessous illustre les principales interactions entre l'utilisateur ("Joueur") et le
système numérique dans le cadre du jeu. Il met en évidence les différents cas d'utilisation,
organisés en parties, fiches de notes et manches, ainsi que leurs relations (includes, extends) pour une meilleure
compréhension des fonctionnalités du système pour le client.

## Diagramme de cas d'utilisation

<secondary-label ref="structurel"/>

```PlantUML
@startuml
scale 0.6

title Alan Turing Game

left to right direction

actor "Joueur" as Player

rectangle "Système Numérique" as System {

    rectangle "Partie" as game {
        usecase UC5 as "Démarrer partie"
        usecase UC6 as "Choix critères"
        usecase UC7 as "Comfiguration matrice vérifieurses"
        usecase UC8 as "Définition problème"

        rectangle "Configuration" as config{
                usecase UC9 as "Choix difficulté"
                usecase UC10 as "Choix nb joueur"
                usecase UC14 as "Rentrer INE"
        }

        UC5 --> UC6 : includes
        UC6 --> UC7 : includes
        UC6 --> UC8 : includes
        UC5 --> config
    }

    rectangle "Fiche de note" as paper{
        usecase UC3 as "Gerer fiche de note"
        usecase UC11 as "Ajouter une note"
        usecase UC12 as "Afficher note"

        UC3 ..> UC11 : Extends
        UC3 ..> UC12 : Extends
    }

    rectangle "Manche" as round{
        usecase UC13 as "Jouer manche"
        usecase UC1 as "Composer une Proposition"
        usecase UC2 as "Interroger les Vérificateurs"
        usecase UC4 as "Soumettre une Solution"

        UC13 --> UC1 : Includes
        UC1 --> UC2 : Includes
        UC13 ..> UC4 : Extends
    }
}

Player --> UC5
Player --> UC3
Player --> UC13

@enduml
```

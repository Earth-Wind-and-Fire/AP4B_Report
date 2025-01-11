# Utilisation

Pour utiliser notre application, vous avez deux possibilités :

### Prérequis

Si vous souhaitez utiliser notre application, vous devez respecter les prérequis suivants :

> Dans les deux cas, vous devez avoir installé Java `23.0.1` sur votre machine ou un environnement Java compatible.
> Vous pouvez télécharger Java sur le site officiel d'Oracle : [Java SE Downloads](https://www.oracle.com/java/technologies/javase-jdk11-downloads.html)
> 
> De plus, vous devez avoir installé JavaFX `23.0.1` sur votre machine. Vous pouvez télécharger JavaFX sur le site officiel d'OpenJFX : [OpenJFX](https://openjfx.io/)
> 
> Enfin, vous devez avoir installé Maven `3.8.3` sur votre machine. Vous pouvez télécharger Maven sur le site officiel de Apache : [Maven](https://maven.apache.org/download.cgi)
> Pour vérifier que Java, JavaFX et Maven sont bien installés, vous pouvez taper les commandes suivantes dans un terminal :
> ```bash
> java -version
> javafx -version
> mvn -version
> ```
> Si les commandes renvoient des informations sur les versions installées, c'est que tout est bien installé.
{style="warning"}

## Avec le code source

Pour utiliser notre application avec le code source, vous devez suivre les étapes suivantes :

1. Décompresser l'archive contenant le code source.
2. Ouvrir le projet dans votre IDE préféré (IntelliJ IDEA, Eclipse, NetBeans, etc.).
3. Compiler le projet avec Maven :
   ```bash
   mvn clean install
   ```
4. Exécuter le projet avec Maven :
   ```bash
   mvn javafx:run
   ```
5. Vous pouvez maintenant utiliser notre application.

## Avec le .jar

Pour utiliser notre application avec le fichier `.jar`, vous devez suivre les étapes suivantes :

1. Décompresser l'archive contenant le fichier `.jar`.
2. Ouvrir un terminal et vous rendre dans le dossier où se trouve le fichier `.jar`.
3. Exécuter le fichier `.jar avec Java :
   ```bash
   java -jar TuringMachine.jar
   ```
4. Vous pouvez maintenant utiliser notre application.
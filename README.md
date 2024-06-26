# Eco CarWash

Ce projet est une application mobile permettant de consulter la liste des stations 
de lavages présentes à proximité de l'utilisateur. 

## Prérequis

Avant de commencer, assurez-vous d'avoir les éléments suivants installés sur votre machine :

- Flutter
- Un éditeur de texte (VSCode, Android Studio, IntelliJ, etc.)
- Un émulateur Android ou iOS ou un appareil physique
- Une clé api Google Maps

## Installation

Suivez ces étapes pour installer et configurer le projet :

1. Cloner le projet :
    ```bash
    git clone <url_du_projet>
    ```

2. Se rendre dans le dossier du projet :
    ```bash
    cd <nom_du_projet>
    ```

3. Lancer le script d'initialisation :
    ```bash
    bash init.sh
    ```
   ou selon votre système :
    ```bash
    ./init.sh
    ```
4. Insérer votre clé api Google Maps dans le fichier app/src/main/AndroidManifest.xml :
```xml
<meta-data android:name="com.google.android.geo.API_KEY" android:value="<votre_clé_api"/>
```

## Configuration

Un fichier `lib/config.dart` est fourni. Vous pouvez y ajouter vos variables d'environnement. Il contient notamment l'URL de l'API.
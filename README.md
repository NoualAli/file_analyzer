# Analyseur de fichiers et lignes de code

## Description
Ce script PHP permet d'analyser un dossier donné en comptant le nombre de fichiers et de lignes de code pour des extensions spécifiques. Il est utile pour obtenir des statistiques sur un projet et mieux comprendre sa structure.

## Fonctionnalités
- Demande à l'utilisateur le dossier à analyser
- Demande les extensions de fichiers à inclure dans l'analyse
- Parcours récursivement tous les fichiers du dossier
- Compte le nombre de fichiers et le total de lignes de code (en excluant les lignes vides)
- Affiche les résultats formatés avec un total général

## Prérequis
- PHP 8.3.12 >=
- Accès en ligne de commande (Terminal, CMD ou PowerShell)

## Installation
1. Clonez ce repository :
   ```sh
   git clone https://github.com/NoualAli/file_analyzer.git
   ```
2. Accédez au dossier du projet :
   ```sh
   cd nom-du-projet
   ```
3. Assurez-vous que PHP est bien installé (Ce script a été testé avec PHP 8.3.12) :
   ```sh
   php -v
   ```

## Utilisation
1. Exécutez le script dans un terminal :
   ```sh
   php file_analyzer.php
   ```
2. Entrez le chemin du dossier à analyser lorsqu'il est demandé.
3. Entrez les extensions à analyser une par une (exemple : `php`, `js`, `html`).
4. Tapez vide lorsque vous avez terminé d'entrer les extensions.
5. Attendez que l'analyse soit effectuée.
6. Les résultats s'afficheront sous la forme :

   ```sh
   📊 Résultats de l'analyse :
   🔹 Extension .php → Fichiers : 25, Lignes : 10 234
   🔹 Extension .js → Fichiers : 12, Lignes : 3 450

   📌 Total général :
   📂 Nombre total de fichiers analysés : 37
   📄 Nombre total de lignes de code : 13 684
   ```

## Exemple d'utilisation
Si vous souhaitez analyser un projet dans `/Users/macbook/Documents/projet`, avec des fichiers `.php` et `.js` :
```
Entrez le chemin du dossier à analyser : /Users/macbook/Documents/projet
Entrez les extensions à analyser (une par une, entrer vide pour terminer) :
Extension : php
Extension : js
Extension :
```

## Contributions
Les contributions sont les bienvenues ! N'hésitez pas à proposer des améliorations via des pull requests.

## Licence
Ce projet est sous licence MIT. Vous êtes libre de l'utiliser et de le modifier selon vos besoins.


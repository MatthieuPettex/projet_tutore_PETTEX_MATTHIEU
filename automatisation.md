# Automatisation des Tests – OrangeHRM

## Objectif
Mettre en place une automatisation des tests fonctionnels de l’application OrangeHRM
à l’aide du framework Robot Framework et de Selenium.

---

## Architecture du projet

Le projet est structuré selon une approche modulaire inspirée du Page Object Model.

projet/
    tests/
        test_orange_HRM.robot
    pages/
        loginPage.resource
        userMenu.resource
        upgradePage.resource
    data/
        users.json
    results/
    README.md

---

## Description des composants

### tests/
Contient les fichiers de tests principaux (test cases).

- Définit les scénarios fonctionnels
- Appelle les keywords définis dans les fichiers resource

---

### pages/
Contient les fichiers `.resource` (keywords réutilisables).

- `loginPage.resource` : gestion de la connexion
- `userMenu.resource` : actions utilisateur (logout, about, etc.)
- `upgradePage.resource` : gestion du formulaire Upgrade

Permet une séparation claire entre logique métier et implémentation technique

---

### data/
Contient les données de test.

- `users.json` : identifiants utilisateurs

---

### results/
Contient les résultats d’exécution :

- `log.html`
- `report.html`
- `output.xml`

---

## Fonctionnement de l’automate

### Cycle d’exécution

1. Ouverture du navigateur
2. Chargement des données
3. Exécution des étapes du test
4. Vérification des résultats
5. Fermeture du navigateur

---

### Principe des Keywords

Les actions sont définies sous forme de **keywords** :

Exemple :


Log In
Load User Data
Input Text username
Input Text password
Click Button


Avantages :
- Réutilisabilité
- Lisibilité
- Maintenance facilitée

---

## Modalités d’exécution

### Lancer tous les tests (si le bouton play n'apparait pas)

```bash
robot tests/test_orange_HRM.robot
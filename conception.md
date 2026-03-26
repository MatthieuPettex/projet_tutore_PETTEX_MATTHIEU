# Plan de Test – OrangeHRM

## Objectif
Valider les principales fonctionnalités de l’application OrangeHRM :
- Authentification
- Gestion du profil utilisateur
- Navigation
- Formulaires

---

## Périmètre
### Inclus
- Connexion utilisateur
- Déconnexion
- Menu utilisateur (About, Support, Change Password)
- Formulaire Upgrade

### Exclus
- Performance
- Sécurité avancée
- Tests multi-navigateurs

---

## Utilisateur
- Username : Admin
- Password : admin123

---

## Environnement
- URL : https://opensource-demo.orangehrmlive.com
- Navigateur : Chrome
- Framework : Robot Framework

---

## Cas de test

### Authentification

#### TC01 - Connexion valide
- Étapes :
  1. Ouvrir le site
  2. Saisir username/password
  3. Cliquer sur login
- Résultat attendu :
  - Accès au Dashboard

---

#### TC02 - Connexion invalide
- Étapes :
  1. Saisir mauvais mot de passe
  2. Cliquer sur login
- Résultat attendu :
  - Message "Invalid credentials"

---

### Déconnexion

#### TC03 - Déconnexion utilisateur
- Étapes :
  1. Cliquer sur menu utilisateur
  2. Cliquer sur Logout
- Résultat attendu :
  - Retour page login

---

### Menu utilisateur

#### TC04 - Accès About
- Résultat attendu :
  - Popup affichée

#### TC05 - Accès Support
- Résultat attendu :
  - Redirection ou nouvel onglet

---

### Mot de passe

#### TC06 - Accès page Change Password
- Résultat attendu :
  - Page affichée

#### TC07 - Changement de mot de passe
- Résultat attendu :
  - Formulaire soumis

#### TC08 - Reconnexion avec nouveau mot de passe
- Résultat attendu :
  - Échec (site démo)

---

### Formulaire Upgrade

#### TC09 - Accès page Upgrade
- Résultat attendu :
  - Page chargée

#### TC10 - Remplissage formulaire
- Résultat attendu :
  - Champs remplis correctement

#### TC11 - Soumission formulaire
- Résultat attendu :
  - Message de confirmation ou redirection

---

## Risques
- Popup bloquant les actions
- Iframe dans le formulaire
- Données non persistées (site démo)

---

## Critères de succès
- Tous les tests critiques passent
- Aucun blocage majeur
# Plan de Test – OrangeHRM

## Objectif
Valider les fonctionnalités pertinentes pour une automatisation sur l’application OrangeHRM :

---

## Périmètre
### Inclus
- Connexion utilisateur
- Déconnexion
- Menu utilisateur (About, Support, Change Password, Log Out)
- Création, visualisation et suppression de candidats

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
  2. Saisir un username et un password valides
  3. Cliquer sur login
- Résultat attendu :
  - Accès au "Dashboard"

---

#### TC02 - Connexion invalide
- Étapes :
  1. Saisir un mauvais mot de passe
  2. Cliquer sur login
- Résultat attendu :
  - Message "Invalid credentials"

---

### Déconnexion

#### TC03 - Déconnexion utilisateur
- Étapes :
  1. Ouvrir le site
  2. Saisir un username et un password valides
  3. Cliquer sur login
  4. Cliquer sur menu utilisateur
  5. Cliquer sur Logout
- Résultat attendu :
  - Retour page login

---

### Menu utilisateur

#### TC04 - Accès About
- Étapes :
  1. Ouvrir le site
  2. Saisir un username et un password valides
  3. Cliquer sur login
  4. Cliquer sur menu utilisateur
  5. Cliquer sur About
  6. Fermer la pop up
- Résultat attendu :
  - La Popup s'affiche puis s'enlève après avoir cliqué dessus

#### TC05 - Accès Support
- Étapes :
  1. Ouvrir le site
  2. Saisir un username et un password valides
  3. Cliquer sur login
  4. Cliquer sur menu utilisateur
  5. Cliquer sur Support
- Résultat attendu :
  - Redirection vers un nouvel onglet Support

---

### Mot de passe

#### TC06 - E2E Reconnexion Avec Nouveau Mot De Passe (Anomalie)
- Étapes :
  1. Ouvrir le site
  2. Saisir un username et un password valides
  3. Cliquer sur login
  4. Cliquer sur menu utilisateur
  5. Cliquer sur Change Password
  6. Saisir le mot de passe actuel
  7. Saisir le nouveau mot de passe 
  8. Confirmer le nouveau mot de passe
  9. Enregistrer
  10. Cliquer sur menu utilisateur
  11. Cliquer sur log out
  12. Saisir le même nom d'utilisateur que à l'étape 2
  13. Saisir le nouveau mot de passe
  14. Cliquer sur login
- Résultat attendu :
  - Accès au "Dashboard"
- Résultat obtenu :
  - Message "Invalid credentials"


---

#### TC07 - E2E Recruitment
- Étapes :
  1. Se connecter
  2. Aller sur la page Recruitment
  3. Cliquer sur "Add"
  4. Renseigner les informations du candidat
  5. Cliquer sur Save
  6. Retourner sur la page Recruitment
  7. Utiliser le champ "name" pour rechercher le candidat ajouté précédemment
  8. Cliquer sur l'icone d'oeil à droite du candidat
  9. Essayer les options shortlist et reject puis cliquer sur save (ne fonctionne pas)
  10. Retourner sur la page Recruitment
  11. Utiliser à nouveau le champ "name" pour rechercher le candidat ajouté précédemment
  12. Cliquer sur l'icone de poubelle pour supprimer le candidat
  13. Rechercher le candidat pour vérifier qu'il n'existe plus
  14. Se déconnecter
- Résultat attendu :
  - Le candidat est ajouté, on peut le retrouver dans la liste, le consulter puis le supprimer
---

#### TC08 - E2E Myinfo
- Étapes :
  1. Se connecter
  2. Aller sur la page My Info
  3. Modifier des champs de texte
  4. Cliquer sur Save
  5. Vérifier que les nouvelles informations ont bien été prises en compte
  6. Se déconnecter
  - Résultat attendu :
    - Les nouvelles informations sont prises en compte

---

## Critères de succès
- Tous les tests critiques passent
- Aucun blocage majeur
- Pas d'anomalie détectées sur les fonctionnalités importantes
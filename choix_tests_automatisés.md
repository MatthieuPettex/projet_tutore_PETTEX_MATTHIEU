# Choix des Tests à Automatiser – OrangeHRM

## Objectif
Identifier les tests pertinents à automatiser.

---

## Critères de sélection

Tests automatisés si :
- Répétitifs
- Rapides à exécuter

---

## Tests automatisés

### Authentification
- Connexion valide
- Connexion invalide

Pourquoi :
- Scénario simple
- Fonction critique
- Fréquemment utilisée

---

### Déconnexion
- Logout utilisateur

Pourquoi :
- Scénario simple
- Important pour la sécurité
- Fréquemment utilisée

---

### Menu utilisateur

- About
- Logout

Pourquoi :
- Scénario simple
- Navigation fréquente

---

### Modification du mot de passe
- Accès page Change Password
- Test négatif (nouveau mot de passe ne fonctionne pas)

Pourquoi :
- Scénario simple
- Important pour la sécurité
- Test négatif important (Détection d'anomalie)

---

### Création, consultation et suppression d'un candidat
- Ajout d'un candidat (remplissage d'un formulaire)
- Consulation du candidat
- Suppression du candidat

Pourquoi :
- Scénario répétitif

---

### Modification des informations utilisateur
- Modification des informations du formulaire sur la page My Info

Pourquoi :
- Scénario répétitif

## Stratégie

- Priorité aux tests rapides (peu de temps)
- Priorité aux tests critiques

---

## Résumé

| Type de test       | Automatisé|
|--------------------|-----------|
| Login              | V         |
| About              | V         |
| Support            | V         |
| Change Password    | V         |
| Logout             | V         |
| Upgrade Form       | X         |
| Logout             | V         |
| Recruitment        | V         |
| Add                | V         |
| Search             | V         |
| Consult            | V         |
| Delete             | V         |
| My Info            | V         |

---

## Améliorations futures

- Améliorer les xpath (ne pas utilier des xpaths absolus)
- Rajouter plus de tests pertinents
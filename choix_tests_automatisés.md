# Choix des Tests à Automatiser – OrangeHRM

## Objectif
Identifier les tests pertinents à automatiser.

---

## Critères de sélection

Tests automatisés si :
- Répétitifs
- Critiques métier
- Stables
- Rapides à exécuter

---

## Tests automatisés

### Authentification
- Connexion valide
- Connexion invalide

Pourquoi :
- Fonction critique
- Fréquemment utilisée

---

### Déconnexion
- Logout utilisateur

Pourquoi :
- Scénario simple
- Important pour sécurité

---

### Menu utilisateur

- About
- Change Password
- Logout

Pourquoi :
- Navigation fréquente
- Bon candidat UI test

---

### Mot de passe
- Accès page Change Password
- Test négatif (nouveau mot de passe ne fonctionne pas)

Pourquoi :
- Cas métier intéressant
- Test négatif important

---

### Formulaire Upgrade
- Accès page
- Remplissage formulaire
- Soumission

Pourquoi :
- Cas utilisateur réel
- Bon test E2E

---

## Tests non automatisés

### Support
- Ouverture onglet

Pourquoi :
- Gestion multi-onglet complexe
- Peu critique

---

### Vérification visuelle
- UI / design

Pourquoi :
- Non fiable en automatisation

---

## Stratégie

- Priorité aux tests critiques
- Tests rapides et stables
- Couverture fonctionnelle essentielle

---

## Résumé

| Type de test        | Automatisé |
|--------------------|----------|
| Login              | V        |
| Logout             | V        |
| Change Password    | V        |
| Upgrade Form       | V        |
| Support            | X        |

---

## Améliorations futures

- Ajouter tests API
- Ajouter tests data-driven
- Intégration CI/CD
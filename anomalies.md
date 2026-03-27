# Rapport d’Anomalies – OrangeHRM

## Objectif
Documenter les anomalies détectées lors des tests.

---

## Anomalie 1 – Changement de mot de passe non pris en compte

### ID
BUG-001

---

### Description
Après modification du mot de passe, l’utilisateur ne peut pas se reconnecter avec le nouveau mot de passe.

---

### Étapes de reproduction

1. Se connecter avec un utilisateur valide
2. Accéder à "Change Password"
3. Modifier le mot de passe
4. Se déconnecter
5. Tenter de se reconnecter avec le nouveau mot de passe

---

### Résultat observé
- Message : "Invalid credentials"
- Le nouveau mot de passe ne fonctionne pas

---

### Résultat attendu
- L’utilisateur doit pouvoir se reconnecter avec le nouveau mot de passe

---

### Gravité
Moyenne

---

### Priorité
Moyenne

---

### Analyse
- Les modifications ne semblent pas être enregistrées.
- Comportement probablement lié à l’environnement de démonstration (si un testeur modifie le mot de passe de l'admin, cela peut empecher les autres testeurs de se connecter et donc d'effectuer leurs tests.)

---

## Anomalie 2 – Pop up "Error, Unexpected Error Occured"

### ID
BUG-002

---

### Description
Lorsqu’un candidat est visualisé et que l’on clique sur Reject ou Shortlist puis Save, un message d’erreur apparaît empêchant la modification du statut.

---

### Étapes de reproduction

1. Se connecter avec un utilisateur valide
2. Accéder à la page Recruitment
3. Rechercher ou créer un candidat
4. Cliquer sur l’icône View du candidat
5. Cliquer sur Reject ou Shortlist
6. Cliquer sur Save

---

### Résultat observé
- Message : "Error, Unexpected Error Occured"
- Le statut du candidat n’est pas mis à jour

---

### Résultat attendu
- Cliquer sur Reject → le candidat passe en statut rejeté
- Cliquer sur Shortlist → le candidat passe en shortlist
- Aucun message d’erreur

---

### Gravité
Moyenne

---

### Priorité
Moyenne

---

### Analyse
- Comportement reproductible pour tous les candidats testés.

---

## Conclusion

Les anomalies identifiées sont principalement liées :
- à l’environnement de démonstration
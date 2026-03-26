---

# 📄 2. `Anomalies.md` (rapport d’anomalie)

```markdown
# 🐞 Rapport d’Anomalies – OrangeHRM

## 🎯 Objectif
Documenter les anomalies détectées lors des tests.

---

## 🐛 Anomalie 1 – Changement de mot de passe non pris en compte

### 📌 ID
BUG-001

---

### 📍 Description
Après modification du mot de passe, l’utilisateur ne peut pas se reconnecter avec le nouveau mot de passe.

---

### 🔁 Étapes de reproduction

1. Se connecter avec un utilisateur valide
2. Accéder à "Change Password"
3. Modifier le mot de passe
4. Se déconnecter
5. Tenter de se reconnecter avec le nouveau mot de passe

---

### ❌ Résultat observé
- Message : "Invalid credentials"
- Le nouveau mot de passe ne fonctionne pas

---

### ✅ Résultat attendu
- L’utilisateur doit pouvoir se reconnecter avec le nouveau mot de passe

---

### 📊 Gravité
Moyenne

---

### ⚠️ Priorité
Moyenne

---

### 🧠 Analyse
- Le backend ne semble pas enregistrer les modifications
- Comportement probablement lié à l’environnement de démonstration

---

## 🐛 Anomalie 2 – Popup bloquant le formulaire Upgrade

### 📌 ID
BUG-002

---

### 📍 Description
Un popup apparaît sur la page Upgrade et empêche l’interaction avec le formulaire.

---

### 🔁 Étapes de reproduction

1. Accéder à la page Upgrade
2. Observer l’apparition d’un popup
3. Essayer de remplir le formulaire

---

### ❌ Résultat observé
- Impossible de cliquer sur les champs

---

### ✅ Résultat attendu
- Le formulaire doit être directement accessible

---

### 📊 Gravité
Faible

---

### ⚠️ Priorité
Faible

---

### 🧠 Analyse
- Popup marketing ou cookie
- Nécessite une gestion dans les tests automatisés

---

## 🐛 Anomalie 3 – Locators instables

### 📌 ID
BUG-003

---

### 📍 Description
Certains éléments ne sont pas trouvés avec XPath.

---

### ❌ Résultat observé
- Erreur "Element not found"

---

### ✅ Résultat attendu
- Tous les éléments doivent être accessibles

---

### 🧠 Analyse
- Structure DOM dynamique
- Utilisation de XPath trop stricts

---

## 🧪 Conclusion

Les anomalies identifiées sont principalement liées :
- à l’environnement de démonstration
- à la structure dynamique du site

---

## 🚀 Recommandations

- Utiliser des locators robustes
- Ajouter des waits explicites
- Gérer les popups
- Vérifier le comportement backend
# cafet-app

L'app de la cafétéria. Deux équipes travaillent dessus :

- **l'exploitation** gère le serveur de production, sur la branche `main` ;
- **le dev** ajoute des fonctionnalités, sur la branche `dev`.

Ce midi, le serveur a saturé et l'exploitation a dû corriger la production en urgence.
Pendant ce temps, le dev a terminé sa fonctionnalité. Il faut maintenant tout réunir.

**Vous êtes la personne chargée de cette intégration.**

---

## La convention de l'équipe

Chaque commit de ce projet respecte ces règles :

- le titre commence par un tag : `[feature]`, `[fix]`, `[hotfix]`, `[doc]`, `[refactor]`… ;
- après le tag, une majuscule ;
- le titre fait 50 caractères maximum.

---

## Partie 1 : lire l'historique

Avant de toucher à quoi que ce soit, comprenez ce qui s'est passé.
Répondez à ces questions **uniquement avec Git** :

1. Combien de commits la branche `dev` a-t-elle que `main` n'a pas ? Et l'inverse ?
2. Qui a fait le hotfix, et quand ?
3. Quelles lignes exactement le hotfix a-t-il modifiées ?
4. Notez l'identifiant (le hash) du dernier commit de `dev`. Vous en aurez besoin plus tard.

---

## Partie 2 : la mission

> **Intégrez le travail de `dev` dans `main`, avec un rebase.**

L'équipe veut un historique **linéaire** : aucun commit de merge.

---

## Partie 3 : comprendre ce que vous avez fait

1. Quelle valeur de `max_utilisateurs` avez-vous gardée ? Pourquoi ? Qui faudrait-il prévenir ?
2. Le message du commit que vous avez résolu décrit-il encore ce que fait ce commit ?
3. Comparez le hash du dernier commit de `dev` avec celui noté dans la partie 1. Que s'est-il passé ?
4. Quelle différence y aurait-il eu avec un `merge` au lieu d'un `rebase` ?

---

## Défi

Le serveur a reçu plus de mémoire : on peut passer à 100 utilisateurs.
Faites ce changement dans **un seul commit** qui respecte la convention de l'équipe, puis vérifiez avec `git log` que votre commit ressemble à ceux des autres.

---
description: Formaliser ou enrichir une méthode/workflow transverse dans le memory layer Obsidian
argument-hint: <nom de la méthode>
---

# /methodize

Formaliser une façon de faire récurrente en méthode nommée. Stocke dans `methods/` avec scope frontmatter.

## Contexte — Chemin du vault

Cette commande écrit dans le memory layer situé à :
`~/Documents/obsidian-vault`

Tous les chemins mentionnés ci-dessous sont **relatifs à ce répertoire**, peu importe le cwd de la session Claude Code.
**Avant toute écriture**, lire `~/Documents/obsidian-vault/CLAUDE.md`.

## Entrée

`$ARGUMENTS` = nom court (ex : "revue hebdo", "onboarding client").

## Procédure

1. Lire `~/Documents/obsidian-vault/CLAUDE.md` et `methods/_index.md`.
2. **Check existence** : une méthode identique ou très proche existe-t-elle ?
   - **Oui** → mode **enrichissement** (lire l'existant, proposer les ajouts).
   - **Non** → mode **création**.
3. Poser les 6 questions **groupées en un seul message**, en mode formulaire numéroté. L'utilisateur répond à toutes en un bloc.
   1. **Objectif** : résultat que produit cette méthode ?
   2. **Déclencheur** : quand je la lance ?
   3. **Étapes** : séquence d'actions ?
   4. **Écueils connus** : erreurs fréquentes à éviter ?
   5. **Format de sortie** : ce que la méthode produit concrètement (doc, décision, fichier, liste) ?
   6. **Scope** : `<project-slug>`, `clients`, `general`, autre ?
4. Si une réponse manque ou est ambiguë, reposer **uniquement celle-là** en clarification.
5. Créer/mettre à jour `methods/[nom-kebab].md`.
6. Updater `methods/_index.md`.
7. Appeler `/save` : `methodize | nom méthode`.

## Frontmatter

`type: method`, `name:`, `scope:`, `created:`, `updated:`, `tags: []`

## Sections du fichier

**Objectif** · **Déclencheur** · **Étapes** (numérotées) · **Écueils** · **Format de sortie** · **Exemples** (optionnel)

## Règles

- Questions toujours groupées (formulaire).
- Clarification ciblée si besoin, pas redemander tout le formulaire.
- Mode enrichissement : jamais écraser, toujours compléter. Ajouter une section "Historique" avec la date si changement substantiel.

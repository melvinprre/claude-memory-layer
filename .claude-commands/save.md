---
description: Append une entrée dans log.md du memory layer Obsidian
argument-hint: <type> | <titre> [— notes]
---

# /save

Logger une opération dans le `log.md` du memory layer. Appelée par les autres slash commands en fin de workflow, ou manuellement.

## Contexte — Chemin du vault

Cette commande écrit dans :
`~/Documents/obsidian-vault/log.md`

## Entrée

`$ARGUMENTS`, format : `type | titre [— notes]`

Types valides : `init`, `remember`, `decision`, `recap`, `methodize`, `session`, `refactor`, `capture`.

Exemple : `session | Debug auth — 2h, fix cookie SameSite`

## Procédure

1. Valider : type dans la liste, sinon refuser et afficher les types valides.
2. Append dans `~/Documents/obsidian-vault/log.md` au format :

   `## [YYYY-MM-DD] type | titre`

   puis les notes en bullets si fournies.
3. Confirmer avec un extrait de l'entrée ajoutée.

## Règles

- Append-only strict. Jamais de modification d'une entrée existante.
- Date = aujourd'hui, automatique.
- Type invalide → refuser et lister les valides.
- Jamais de fusion d'entrées : 1 opération = 1 entrée.

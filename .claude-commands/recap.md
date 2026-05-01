---
description: Brief synthétique sur un projet, une période, ou les décisions récentes (memory layer Obsidian)
argument-hint: <nom-projet> | last-week | last-month | decisions | (vide)
---

# /recap

État des lieux selon l'argument, à partir du memory layer.

## Contexte — Chemin du vault

Cette commande lit le memory layer situé à :
`~/Documents/obsidian-vault`

Tous les chemins mentionnés ci-dessous sont **relatifs à ce répertoire**, peu importe le cwd de la session Claude Code.
**Avant toute lecture**, lire `~/Documents/obsidian-vault/CLAUDE.md` pour le contexte.

## Entrée

`$ARGUMENTS` peut être :
- **Nom de projet** (slug du dossier dans `projects/`) → état du projet
- **`last-week`** → activité chronologique des 7 derniers jours via `log.md`
- **`last-month`** → activité des 30 derniers jours via `log.md`
- **`decisions`** → décisions récentes groupées par scope
- **Vide** → liste des projets actifs

## Procédure par cas

### Projet

1. Lire `projects/[projet]/_context.md`.
2. Lire les décisions du scope correspondant dans `decisions/` (filtre frontmatter `scope:`).
3. Lire les 5 notes les plus récentes dans `projects/[projet]/notes/`.
4. Produire un brief :
   - **Où on en est** (3-5 lignes)
   - **Dernières décisions** (bullets avec dates et liens)
   - **Sujets ouverts** (inférés depuis notes et `_context.md`)
   - **Prochaines étapes possibles** (hypothèses à valider)

### last-week / last-month

1. Lire `log.md`, filtrer les entrées dans la fenêtre.
2. Grouper par type (`remember`, `decision`, `methodize`, `session`, `refactor`).
3. Produire un récap chronologique compact.

### decisions

1. Lire tous les fichiers `decisions/`.
2. Grouper par `scope:`, trier par date desc.
3. Lister : date · titre · statut · 1 ligne de résumé.

### Vide

1. Lire `projects/_index.md`.
2. Pour chaque projet actif : nom + 1 ligne de statut depuis `_context.md`.
3. Proposer : "Sur lequel tu veux un recap détaillé ?"

## Règles

- Pas de prose, format brief scannable.
- Citer les sources : `[[liens]]` vers pages lues.
- "Prochaines étapes" = **hypothèses** à valider, pas des ordres.
- Ne rien écrire dans le vault sauf si demande explicite (ex : "file ce recap en synthèse").

---
description: Formaliser une décision structurante dans le memory layer Obsidian
argument-hint: <sujet de la décision>
---

# /decision

Formaliser une décision qui cadre l'activité. Questions groupées en formulaire, fichier daté.

## Contexte — Chemin du vault

Cette commande écrit dans le memory layer situé à :
`~/Documents/obsidian-vault`

Tous les chemins mentionnés ci-dessous sont **relatifs à ce répertoire**, peu importe le cwd de la session Claude Code.
**Avant toute écriture**, lire `~/Documents/obsidian-vault/CLAUDE.md`.

## Entrée

`$ARGUMENTS` = sujet court.

## Procédure

1. Lire `~/Documents/obsidian-vault/CLAUDE.md`.
2. Poser les 5 questions **groupées en un seul message**, en mode formulaire numéroté. L'utilisateur répond à toutes en un bloc.
   1. **Contexte** : pourquoi cette décision se pose maintenant ?
   2. **Options** : quels choix possibles ?
   3. **Choix** : option retenue ?
   4. **Raisons** : pourquoi ce choix vs les autres ?
   5. **Déclencheurs de revisite** : dans quelles conditions faudrait-il ressortir cette décision ?
3. Si une réponse manque ou est ambiguë, reposer **uniquement celle-là** en clarification. Ne pas redemander les autres.
4. Déterminer le scope : `<project-slug>`, `career`, `personal`, `client-[nom]`, `global`.
5. Créer `decisions/YYYY-MM-DD-slug.md` avec frontmatter complet.
6. Cross-linker : si la décision touche un projet, ajouter un lien dans `projects/[projet]/_context.md` section "Décisions récentes".
7. Appeler `/save` : `decision | titre`.

## Frontmatter

`type: decision`, `date:`, `scope:`, `status: active | revisited | superseded`, `supersedes: [liens] ou vide`, `tags: []`

## Sections du fichier

**Contexte** · **Options** · **Choix** · **Raisons** · **Déclencheurs de revisite** · **Liens**

## Règles

- Questions toujours groupées en un seul message (formulaire).
- Clarification ciblée si besoin, pas redemander tout le formulaire.
- Rédaction factuelle, listes.
- Si remplace une ancienne décision : `supersedes:` + passer l'ancienne en `status: superseded`.

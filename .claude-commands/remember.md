---
description: Capturer un fait stable dans le memory layer Obsidian
argument-hint: <contenu à mémoriser>
---

# /remember

Capturer une info stable dans le memory layer. Tu classes, je valide, tu écris.

## Contexte — Chemin du vault

Cette commande écrit dans le memory layer situé à :
`~/Documents/obsidian-vault`

Tous les chemins mentionnés ci-dessous sont **relatifs à ce répertoire**, peu importe le cwd de la session Claude Code.
**Avant toute écriture**, lire `~/Documents/obsidian-vault/CLAUDE.md`.

## Entrée

`$ARGUMENTS` = contenu brut à mémoriser.

## Procédure

1. Lire `~/Documents/obsidian-vault/CLAUDE.md` et `~/Documents/obsidian-vault/index.md`.
2. Analyser et proposer la destination :
   - **Fait sur moi** → `about-me/[section].md` (édition section existante)
   - **Info projet** → `projects/[projet]/_context.md` ou `projects/[projet]/notes/YYYY-MM-DD-slug.md`
   - **Apprentissage** → `learnings/YYYY-MM-DD-slug.md` (nouveau fichier)
   - **Contact** → `people/[nom-kebab].md` (nouveau fichier)
   - **Décision structurante** → rediriger vers `/decision`
3. Proposer : "Je range X dans Y parce que Z." Attendre validation.
4. Écrire :
   - Nouveau fichier → frontmatter YAML + contenu en listes
   - Édition → ajouter sans écraser
5. Updater `index.md` si création.
6. Appeler `/save` : `remember | titre court`.

## Frontmatter par destination

- **learnings/** : `type: learning`, `date: YYYY-MM-DD`, `source: <project-slug> | client-xyz | general`, `tags: []`
- **people/** : `type: person`, `role:`, `project:` (ou vide), `created:`, `updated:`

## Règles

- Jamais d'invention. Info manquante → question.
- Contenu dense, memory-first : listes, sections courtes.
- Liens `[[wiki]]` vers pages reliées.
- Si tu as un outil opérationnel (Notion, Linear, Airtable) source de vérité pour des données structurées : linker, pas copier.
- Ne jamais écrire dans le vault de ta propre initiative : uniquement sur instruction explicite.

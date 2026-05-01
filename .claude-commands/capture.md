---
description: Append rapide d'une idée volatile dans inbox/ du memory layer Obsidian
argument-hint: <idée à capturer>
---

# /capture

Capture rapide, sans friction, d'une idée moyen-terme non urgente. Append dans `inbox/` du vault. Zéro classification, zéro validation — le tri se fait plus tard (manuellement ou flaggé par le Morning Brief si stagnation > 3j).

## Contexte — Chemin du vault

Cette commande écrit dans :
`~/Documents/obsidian-vault/inbox/`

Peu importe le cwd de la session Claude Code.

## Entrée

`$ARGUMENTS` = le contenu brut de l'idée (texte libre, une phrase ou un paragraphe).

## Procédure

1. **Ne PAS lire `CLAUDE.md`** — c'est volontaire. Capture = friction minimale. On écrit et on log, point.
2. Générer le timestamp : `YYYY-MM-DD-HHMM` (heure locale machine).
3. Générer un slug à partir de l'idée :
   - Extraire les 6-8 premiers mots significatifs
   - Lowercase, kebab-case, retirer accents et ponctuation
   - Tronquer à ~40 caractères max
   - Exemple : `"Tester l'intégration Stripe Connect"` → `tester-integration-stripe-connect`
4. Construire le chemin : `inbox/YYYY-MM-DD-HHMM-slug.md`
5. Créer le fichier avec :
   - Frontmatter YAML minimal
   - Contenu brut de l'idée en-dessous (texte tel quel, pas de reformulation)
6. Appeler `/save` avec : `capture | <titre court dérivé du slug>`
7. Confirmer à l'utilisateur en une ligne : `Capturé → inbox/YYYY-MM-DD-HHMM-slug.md`

## Frontmatter

```yaml
---
type: capture
date: YYYY-MM-DD
time: HH:MM
status: untriaged
tags: []
---
```

## Exemple

Commande : `/capture Tester Stripe Connect pour escrow futur`

Fichier créé : `inbox/2026-04-20-1530-tester-stripe-connect-pour-escrow.md`

Contenu :
```markdown
---
type: capture
date: 2026-04-20
time: 15:30
status: untriaged
tags: []
---

Tester Stripe Connect pour escrow futur
```

Log.md : `## [2026-04-20] capture | tester-stripe-connect-pour-escrow`

## Règles

- **Zéro classification à la capture.** Ne jamais proposer un rangement dans `learnings/`, `decisions/`, etc. Le tri se fait plus tard.
- **Pas de reformulation.** Le texte est copié tel quel. L'utilisateur doit retrouver ses mots à la relecture.
- **Pas de question de clarification.** Si l'idée est ambiguë, elle reste ambiguë dans `inbox/`. C'est le rôle du triage ultérieur.
- **Pas de mise à jour de `index.md`.** `inbox/` est volatile et n'apparaît pas dans l'index.
- **Conflits de nom** : si `inbox/YYYY-MM-DD-HHMM-slug.md` existe déjà (même minute, même slug — rare), ajouter un suffixe numérique `-2`, `-3`, etc.
- **Respect du garde-fou CLAUDE.md** : ne jamais modifier ou supprimer un fichier existant dans `inbox/`. Append-only strict.
- Le type `capture` s'ajoute à la liste des types valides de `/save` (si `/save` refuse, ajouter `capture` dans sa liste).

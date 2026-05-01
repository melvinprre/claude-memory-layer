---
type: project-context
status: reference
updated: {{ YYYY-MM-DD }}
---

# Formation Memory Layer — Contenu pédagogique

Ce dossier contient la **méthode** derrière le template. Tu n'es pas obligé de le lire pour utiliser le memory layer — `SETUP_PROMPT.md` à la racine te guide directement. Mais si tu veux comprendre **pourquoi** chaque pièce est conçue comme elle est, lis :

- `process/01-le-probleme-du-re-briefing.md` — ce que ce système résout
- `process/02-pivot-karpathy-vers-memory-layer.md` — pourquoi ce n'est pas un wiki LLM classique
- `process/03-construction-en-5-etapes.md` — la méthode étape par étape (équivalent du SETUP_PROMPT en version texte)
- `process/04-architecture-cross-sessions.md` — pourquoi le system marche depuis n'importe quelle session
- `process/05-decisions-cles-et-tradeoffs.md` — les choix non-évidents et leurs raisons

Et 5 insights clés dans `key-insights/` :
- `dialogue-avant-execution.md`
- `granularite-fine-vs-pre-decoupage.md`
- `sessions-claude-code-strategie-hybride.md`
- `source-unique-de-verite.md`
- `sparring-partner-vs-executant.md`

## Origine

Construit à partir d'un memory layer perso testé en production sur le projet BaliKula (marketplace P2P de location à Bali). Sanitisé et packagé pour être réutilisable.

## À toi de jouer

Une fois ton memory layer installé, tu peux **supprimer ce dossier** si tu veux garder ton vault propre. Le contenu pédagogique reste dispo dans le repo cloné.

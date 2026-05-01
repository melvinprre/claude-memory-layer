---
type: formation-process
section: process
order: 05
updated: 2026-04-19
---

# 05 — Décisions structurantes et tradeoffs

Les choix non-évidents qu'on a tranchés pendant la construction. Pour chaque : le contexte, les options, le choix, le pourquoi.

## Décision 1 — Notion vs Obsidian

**Question** : pourquoi ne pas tout mettre dans Notion (qui structure déjà bien) ?

**Choix** : Notion garde les **données structurées opérationnelles** (DBs prospection, roadmap, backlog). Obsidian garde le **memory layer personnel** (identité, décisions, méthodes, learnings).

**Pourquoi** :
- Notion est une DB excellente, mais ses pages ne sont pas optimisées pour la lecture LLM (HTML lourd, blocs imbriqués)
- Markdown plat = format natif des LLMs, lit en un clin d'œil
- Notion reste source de vérité pour ce qu'il fait bien — on ne le remplace pas

**Règle d'or** : si une info vit mieux dans Notion, on linke depuis Obsidian, on ne duplique pas.

## Décision 2 — Granularité fine vs gros fichiers

**Question** : `learnings.md` (un gros fichier) vs `learnings/YYYY-MM-DD-slug.md` (un fichier par learning) ?

**Choix** : un fichier par learning.

**Pourquoi** :
- Un gros fichier devient illisible pour un LLM au-delà de quelques centaines de lignes
- L'atomicité permet de linker précisément (`[[learnings/whatsapp-24h-window]]`)
- Le scope se gère via frontmatter YAML, pas via la structure de dossiers

Voir aussi : [[../key-insights/granularite-fine-vs-pre-decoupage]].

## Décision 3 — Décisions unifiées vs scope par dossier

**Question** : `decisions/` global vs `projects/X/decisions.md` local à chaque projet ?

**Choix** : un seul `decisions/` au top-level, avec `scope:` dans le frontmatter (`scope: balikula`, `scope: career`, `scope: client-xyz`...).

**Pourquoi** :
- Évite la duplication ("je mets cette décision où ? dans projects/X/ ou dans decisions/ ?")
- Permet de filtrer cross-projet (toutes les décisions `scope: career` peu importe le projet)
- Une seule règle = pas d'ambiguïté

## Décision 4 — Questions groupées vs séquentielles

**Question** : pour `/decision` et `/methodize`, poser les questions une par une (Claude attend la réponse) ou groupées en formulaire ?

**Choix** : groupées en formulaire numéroté. Si une réponse manque ou est ambiguë, Claude redemande **uniquement** celle-là.

**Pourquoi** :
- Une par une = trop lent pour un usage réel quotidien
- Groupées = tu remplis en un bloc, comme un Google Form
- Clarification ciblée = pas de redite frustrante

## Décision 5 — Slash commands user-level vs project-level

**Question** : où installer les slash commands `/remember`, `/decision`, etc. ?

**Choix** : user-level (`~/.claude/commands/`), source unique.

**Pourquoi** :
- Project-level = visibles uniquement quand tu codes dans le vault
- User-level = visibles dans toutes tes sessions Claude Code (dev, vault, autres)
- Avec chemins absolus dans les commandes vers le vault, ça écrit toujours au bon endroit

## Décision 6 — Pas de wiki Karpathy intégral

**Question** : adopter le pattern complet (sources/, entities/, concepts/, topics/, syntheses/) en plus du memory layer ?

**Choix** : non. On garde uniquement la structure pertinente pour un memory layer personnel.

**Pourquoi** :
- Le wiki Karpathy est conçu pour la **veille**, on construit un **memory layer pro**
- Adopter une structure non utilisée = bruit visuel et confusion d'usage
- Si plus tard l'utilisateur veut ajouter de la veille → on créera `veille/` à ce moment-là

## Le principe transverse

**Simplicité d'abord. On commence minimal, on enrichit avec l'expérience.**

Refuser la sur-ingénierie. Tu as besoin de 5 dossiers fonctionnels qui marchent, pas de 15 dossiers vides "au cas où".

Fin de la section process. Voir aussi : `key-insights/`.

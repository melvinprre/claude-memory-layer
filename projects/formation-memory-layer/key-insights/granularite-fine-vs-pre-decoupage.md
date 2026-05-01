---
type: formation-insight
updated: 2026-04-19
---

# Granularité fine vs pré-découpage

## L'insight

Quand tu démarres, tu es tenté de pré-découper par catégories anticipées :
- `learnings/from-product.md`
- `learnings/from-clients.md`
- `learnings/general.md`

**Mauvaise idée.** Dans 2 ans, `learnings/from-product.md` fait 800 lignes, illisible pour un LLM, intolérable à lire pour toi.

## La règle

**1 fichier = 1 sujet atomique.**

Plutôt que des catégories pré-découpées, tu créés un fichier par learning, chacun avec un frontmatter qui précise sa source/scope.

Exemple :

```yaml
---
type: learning
date: 2026-04-19
source: balikula
tags: [api, whatsapp]
---

# WhatsApp Business API : fenêtre 24h pour messages libres

[contenu du learning, focalisé, scannable]
```

## Pourquoi ça scale

| Pré-découpage | Granularité fine |
|---------------|------------------|
| 3 fichiers qui gonflent à l'infini | N petits fichiers atomiques |
| Recherche = scan de gros fichiers | Recherche = retrouver un fichier |
| Refactor coûteux quand un fichier devient illisible | Pas de refactor, juste de nouveaux fichiers |
| Cross-référence impossible (tu ne peux pas linker à un paragraphe) | `[[whatsapp-24h-window]]` cible exactement |
| Frontmatter inutile | Frontmatter permet le filtrage cross-fichier |

## La transposition

Cette règle s'applique partout :
- `decisions/` → 1 décision = 1 fichier daté
- `learnings/` → 1 leçon = 1 fichier daté
- `methods/` → 1 méthode = 1 fichier
- `people/` → 1 personne = 1 fichier

Le scope (projet, domaine) se gère **dans le frontmatter**, pas dans la hiérarchie de dossiers.

## Quand pré-découper EST justifié

Pour les zones très stables, structurées en sections fixes :

- `about-me/` → 6 fichiers thématiques (identity, activity, values, working-style, communication-style, stack). Stable, ne change pas tous les 3 mois.
- `projects/` → 1 dossier par projet, avec `_context.md` comme hub.

## Règle synthétique

> **Pré-découper si la structure est stable et bornée.**
> **Granularité fine si la structure va croître et évoluer.**

C'est cette distinction qui évite à la fois la sur-ingénierie (pré-découper trop tôt) et le chaos (tout balancer en vrac).

---
type: formation-insight
updated: 2026-04-19
---

# Source unique de vérité

## L'insight

Quand une même information peut vivre à 2 endroits, elle finit par diverger. Une version est à jour, l'autre périmée. Tu ne sais plus laquelle croire.

Donc : **chaque fait n'a qu'un seul foyer**. Ailleurs, on linke.

## Application au memory layer

| Tentation | Risque | Solution |
|-----------|--------|----------|
| Slash commands dans `~/.claude/commands/` ET dans le vault | Versions divergentes après 1 modif | User-level uniquement |
| Décision dans `decisions/` ET dans `projects/X/decisions.md` | "C'est laquelle la vraie ?" | `decisions/` unifié, `scope:` dans le frontmatter |
| Stack tech dans le vault ET dans le CLAUDE.md du repo code | Le repo évolue, le vault prend du retard | Source = repo, le vault linke |
| DB de prospection dans Notion ET dans le vault | Notion structuré, vault redondant | Notion garde les DBs, vault linke |

## La règle générale

> Si une info vit mieux ailleurs, on linke. On ne copie jamais.

## Conséquence pour ton stack

Trois rôles distincts, **zéro chevauchement** :

- **Notion** = DBs structurées, opérationnel (prospection, roadmap, backlog)
- **Repo de code** = stack tech, configs, code source
- **Vault Obsidian** = memory layer personnel (identité, méthodes, décisions, learnings)

## Le cas limite : enrichissement périodique

Pour le stack tech : tu ne dupliques pas, mais tu peux **synthétiser** depuis le repo vers le vault de temps en temps via `/remember`. Ça crée une vue lisible côté vault, sans dupliquer la source.

Le repo reste source de vérité. Le vault contient une **synthèse** datée et pointe vers le repo pour le détail courant.

## Le piège à éviter dans la formation

Quand tu vendras le template repo GitHub, l'utilisateur sera tenté de tout mettre dans son vault Obsidian (parce que c'est "neuf et excitant"). Rappelle dans ton ebook/cours : **les outils existants qui marchent restent source de vérité**. Le memory layer COMPLÈTE, il ne REMPLACE PAS.

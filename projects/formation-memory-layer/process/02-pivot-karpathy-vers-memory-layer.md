---
type: formation-process
section: process
order: 02
updated: 2026-04-19
---

# 02 — Pivot : du wiki Karpathy au memory layer

## Le point de départ

En 2026, Andrej Karpathy publie le pattern "[LLM Wiki](https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f)" — l'idée que tu fournis des sources brutes, et le LLM construit incrémentalement un wiki personnel structuré (entités, concepts, topics).

C'est brillant pour la **veille** et la **recherche thématique** sur un sujet.

## Pourquoi ça ne suffit pas pour un solopreneur

Le wiki Karpathy est centré **sources externes** : tu lui donnes des articles, des PDFs, des transcriptions, et il les digère.

Mais un solopreneur n'a pas seulement besoin de digérer des sources. Il a besoin que Claude se souvienne de :

- **Qui il est** (identité, parcours, valeurs, communication style)
- **Ce qu'il fait** (projets actifs, stade, décisions stratégiques)
- **Comment il bosse** (style de travail, outils, rythme)
- **Les méthodes qu'il a formalisées** (workflows internes, templates)
- **Les contacts qui comptent** (clients, partenaires, hosts)
- **Les apprentissages atomiques** (bugs résolus, leçons retenues)

Ce n'est pas du wiki sourcé. C'est un **memory layer personnel** structuré par DOMAINES DE VIE PRO, pas par sujets de veille.

## La distinction clé

| Wiki Karpathy | Memory Layer |
|---------------|--------------|
| Centré sources externes | Centré identité + activité du solopreneur |
| Pages : entities, concepts, topics, syntheses | Pages : about-me, projects, decisions, learnings, methods, people |
| Workflow : ingest, query, lint | Workflow : remember, decision, recap, methodize |
| Optimisé pour : recherche thématique | Optimisé pour : continuité du contexte cross-sessions |

## Le pivot opéré dans la formation

On garde **3 principes structurants** du gist Karpathy :
1. **Le LLM écrit, l'humain valide** (le bookkeeping est délégué)
2. **Markdown + git** (zéro lock-in)
3. **Un fichier de schéma central** (CLAUDE.md) qui sert de contrat

On **change** le contenu : sources externes → connaissance personnelle.
On **change** la typologie : wiki encyclopédique → mémoire pro structurée.

## Ce que ça permet une fois en place

Le memory layer absorbe **toute l'évolution de ton activité** :
- Tu prends une décision → `/decision` → archivée datée scopée
- Tu apprends un truc → `/remember` → classé en learnings/
- Tu formalises un workflow → `/methodize` → réutilisable
- Tu veux un brief sur un projet → `/recap [projet]` → état des lieux instantané

## Note pédagogique

Ce pivot illustre une règle utile : **un pattern peut être brillant ET ne pas s'appliquer à ton cas**. Bien identifier ce que tu réutilises (les principes) vs ce que tu rejettes (la structure inadaptée) est le travail le plus important au démarrage.

Suite : [[03-construction-en-5-etapes]] — la méthode de construction étape par étape.

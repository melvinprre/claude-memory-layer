# Claude Memory Layer

> **Une mémoire externe persistante pour ton workflow Claude.** Markdown + git, zéro lock-in. Tu fournis le contexte une fois, Claude le maintient à jour, tu le relis quand tu veux.

Si tu utilises Claude (Code et/ou Chat) plusieurs fois par jour, tu connais le problème : à chaque session, tu re-briefes le contexte. Tes décisions, tes apprentissages, tes méthodes — tout disparaît avec la session courante.

Ce template installe en **1h** un système de mémoire externe que Claude lit et enrichit à travers toutes tes sessions. Testé en production sur un projet réel (marketplace P2P).

## Ce que tu vas avoir

- **Un vault Obsidian structuré** — sections claires : qui tu es, tes projets, tes décisions, tes apprentissages, tes méthodes
- **6 slash commands globaux Claude Code** — `/remember`, `/decision`, `/recap`, `/methodize`, `/capture`, `/save` — utilisables depuis n'importe quelle session, peu importe le cwd
- **Un contrat `CLAUDE.md`** — lu en premier à chaque session, garantit la cohérence

Et en option :
- **NotebookLM MCP** — branche NotebookLM sur Claude Code (recherche documentaire, Deep Research)
- **Paperclip** — orchestrateur d'agents IA (ex : brief matinal automatique). ⚠️ Composant expérimental.

## Pour qui

Solopreneurs, builders, créateurs IA-first qui :
- Lancent 5-15 sessions Claude par jour
- Touchent à plusieurs chantiers en parallèle
- Prennent des décisions structurantes en cours de route
- N'ont pas d'équipe pour mémoriser à leur place

## Comment l'utiliser — méthode one-shot (recommandée)

Tu n'as **rien à faire en terminal**. Ouvre une session Claude Code, colle le mini-prompt ci-dessous, Claude Code s'occupe du reste (clone du repo, lecture du SETUP_PROMPT, exécution).

```
Installe-moi le memory layer claude-memory-layer.

1. Clone https://github.com/melvinprre/claude-memory-layer.git dans ~/Projects/
   (crée ~/Projects si besoin, skip le clone si le repo existe déjà)
2. Lis le fichier SETUP_PROMPT.md du repo cloné
3. Identifie le bloc entre "## DÉBUT DU PROMPT — copier à partir d'ici"
   et "## FIN DU PROMPT — copier jusqu'ici"
4. Adopte ce bloc comme tes instructions et exécute la séquence
   strictement dans l'ordre, en commençant par Phase 0.
```

Claude te guide ensuite en 6 phases (Phase 0 → A → A.5 → B → C → D → E, plus F optionnelle). Compter **1h-1h30**.

**💡 Astuce qui change tout** : quand Claude te pose les 8 questions de Phase A, **ne réponds pas de tête**. Colle le formulaire dans une session existante avec ton IA principale (celle où tu as déjà discuté de tes projets) et fais-la répondre avec tout son contexte sur toi. Tu ramènes ses réponses dans la session d'install. Memory layer 5x plus riche.

Le guide complet : [`INSTALL.md`](./INSTALL.md). Méthode manuelle (fallback) également documentée là-bas.

À la fin : vault opérationnel à `~/Documents/obsidian-vault` (ou ton chemin custom), 6 slash commands installés, `/recap` disponible depuis n'importe quelle session Claude Code.

## La méthode pédagogique

Détaillée dans [`projects/formation-memory-layer/process/`](./projects/formation-memory-layer/process/) :

1. Le problème du re-briefing
2. Pourquoi le memory layer n'est pas un wiki LLM classique
3. Construction en 5 étapes
4. Architecture cross-sessions
5. Décisions clés et trade-offs

Et 5 insights clés dans [`projects/formation-memory-layer/key-insights/`](./projects/formation-memory-layer/key-insights/).

## Pourquoi markdown + git

- Lisible dans 10 ans, même si Obsidian disparaît
- Versionné, diffable, mergeable
- Ouvrable dans n'importe quel éditeur (VS Code, Sublime, vim)
- Aucune dépendance à un plugin proprio

## Stack

- **Obsidian** (gratuit, optionnel) — pour la graph view et les liens wiki cliquables
- **Claude Code CLI** — où vivent les slash commands
- **git** — pour le versioning du vault
- **Optionnel** : `uv` (pour NotebookLM MCP), Node.js (pour Paperclip)

## Modules avancés

Voir [`MODULES.md`](./MODULES.md) :
- NotebookLM MCP (recherche documentaire dans Claude Code)
- Paperclip (orchestrateur d'agents IA, brief matinal automatique)

## Licence

MIT — fais-en ce que tu veux. Si tu adaptes le template, un lien retour est apprécié mais pas obligatoire.

## Genèse

Construit à partir d'un memory layer perso testé en production sur un produit réel (marketplace P2P). La méthode est extraite, sanitisée, et packagée pour être réutilisable par n'importe qui qui builde sérieusement avec Claude.

## Contribuer / Feedback

Issues GitHub bienvenues. Si tu installes le template et que ça t'aide, fais signe — ça motive à itérer.

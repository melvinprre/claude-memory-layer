# Claude Memory Layer

> **Une mémoire externe persistante pour ton workflow Claude.** Markdown + git, zéro lock-in. Tu fournis le contexte une fois, Claude le maintient à jour, tu le relis quand tu veux.

Si tu utilises Claude (Code et/ou Chat) plusieurs fois par jour, tu connais le problème : à chaque session, tu re-briefes le contexte. Tes décisions, tes apprentissages, tes méthodes — tout disparaît avec la session courante.

Ce template installe en **1h** un système de mémoire externe que Claude lit et enrichit à travers toutes tes sessions. Testé en production sur un projet réel (marketplace P2P à Bali).

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

## Comment l'utiliser

1. **Clone ce repo** dans un dossier temporaire :
   ```
   git clone https://github.com/{{ ton-user }}/claude-memory-layer.git
   cd claude-memory-layer
   ```
2. **Ouvre une session Claude Code** dans n'importe quel dossier
3. **Colle le contenu de [`SETUP_PROMPT.md`](./SETUP_PROMPT.md)** comme premier message — Claude te guide en 5 phases (1h-1h30)

À la fin, tu as ton vault opérationnel à `~/Documents/obsidian-vault` (ou ailleurs si tu changes le chemin), tes slash commands installés, et tu peux taper `/recap` depuis n'importe quelle session pour briefer Claude sur ton état du moment.

## La méthode en 5 étapes

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

Construit à partir d'un memory layer perso testé en production sur le projet [BaliKula](https://github.com/{{ ton-user }}) (marketplace de location P2P à Bali). La méthode est extraite, sanitisée, et packagée pour être réutilisable par n'importe qui qui builde sérieusement avec Claude.

## Contribuer / Feedback

Issues GitHub bienvenues. Si tu installes le template et que ça t'aide, fais signe — ça motive à itérer.

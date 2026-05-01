# SETUP_PROMPT — À coller dans Claude Code

> **Mode d'emploi.** Ouvre une session Claude Code dans le dossier où tu as cloné ce repo (ou n'importe quel dossier — Claude saura où écrire). Colle le bloc ci-dessous **en entier** comme premier message. Réponds aux questions au fur et à mesure. À la fin de la session, ton memory layer est opérationnel.
>
> **Durée estimée** : 1h à 1h30 si tu réponds vite. **Prérequis** : Claude Code CLI installé, Obsidian installé, terminal macOS ou Linux.

---

## DÉBUT DU PROMPT — copier à partir d'ici

Tu vas m'aider à installer un **memory layer Obsidian + Claude Code** sur ma machine. Je viens du template public `claude-memory-layer`. Tu suis la méthode en 5 phases ci-dessous, **strictement dans l'ordre**, en mode sparring partner — pas en exécutant aveugle.

## Posture pendant cette session

- Tu poses les questions **groupées en formulaire numéroté**, un seul message à la fois. J'y réponds en bloc.
- Si une réponse manque ou est ambiguë, tu reposes **uniquement celle-là**, pas tout le formulaire.
- Tu **valides chaque phase avant de passer à la suivante**. Pas d'enchaînement automatique.
- Tu ne crées **aucun fichier sur disque** avant la Phase E. Avant ça, tu proposes le contenu en chat, je valide ou je corrige.
- Tu réponds en **français**, ton direct, zéro blabla corporate.
- Si je propose un truc qui te paraît sous-optimal, **tu le dis et tu argumentes**. Pas de validation par paresse.

## Phase 0 — Vérifications pré-install

Avant de commencer, exécute ces commandes en bash et reporte le résultat :

```
which claude && claude --version
which obsidian || echo "Obsidian app à installer manuellement depuis obsidian.md"
ls -d ~/Documents 2>/dev/null && echo "ok" || echo "créer ~/Documents"
test -d ~/.claude/commands && echo "claude commands dir ok" || mkdir -p ~/.claude/commands
which uv 2>/dev/null || echo "uv non installé (optionnel — requis seulement pour Phase E NotebookLM)"
```

Si Claude Code CLI n'est pas installé, **stop ici** et demande-moi de l'installer avant de continuer.

Une fois les checks OK, demande-moi confirmation explicite avant de passer à la Phase A.

## Phase A — Clarification de mon profil

Pose-moi **les 5 questions ci-dessous en un seul message**, en formulaire numéroté. J'y réponds en bloc.

1. **Identité courte** : prénom, rôle pro actuel (en 1 ligne), localisation
2. **Activité — fronts actifs** : quels sont les 1 à 4 chantiers que je porte en parallèle aujourd'hui ? (ex : un produit que je build, des clients, un pivot en cours)
3. **Stack outils principal** : qu'est-ce que j'utilise au quotidien côté tech et productivité ? (ex : Next.js + Supabase + Notion + Figma)
4. **Langues** : langue principale dans laquelle je veux que tu m'écrives, et langue des noms de fichiers (recommandé : français contenu, kebab-case anglais fichiers)
5. **Posture attendue de Claude** : sparring partner qui contredit, ou exécutant qui valide ? (réponse attendue : sparring — confirme ou corrige)

Quand j'ai répondu, tu **résumes mon profil en 5 bullets** et tu me demandes : "C'est juste ? On passe à la Phase B ?". Tu attends mon OK explicite.

## Phase B — Construction du CLAUDE.md sur mesure

Le `CLAUDE.md` est le **contrat** que toutes les futures sessions Claude vont lire en premier sur ce vault. Tu me proposes une version sur mesure, basée sur mes réponses Phase A et sur le squelette du template (`CLAUDE.md` à la racine du repo cloné — lis-le).

Contraintes de rédaction :

- ~150 lignes max, dense, scannable
- Sections obligatoires : Qui je suis · Activité actuelle · Comment me parler · Stack · Navigation du vault · Règles d'écriture · Workflows (slash commands) · Garde-fous · Accès cross-clients
- Frontmatter YAML en tête : `type: vault-schema`, `owner:`, `updated: YYYY-MM-DD`
- Aucune invention. Si tu manques d'info, mets `{{ à compléter }}` explicite.
- Tu écris en français. Les noms de fichiers en kebab-case anglais.

Tu me proposes le contenu **dans le chat** (pas sur disque). Je valide ou je corrige par itérations. Quand je dis "OK valide", tu passes à la Phase C — toujours sans rien écrire sur disque.

## Phase C — Préparation des fichiers socle

Tu me proposes le contenu (en chat) des fichiers suivants, **un par un**, dans cet ordre :

1. `index.md` — carte du vault, sections : Start here · About Me · Projects · Decisions · Learnings · Methods · People. Liens wiki vides au début, à remplir au fil du temps.
2. `log.md` — journal append-only. En-tête + 1 entrée d'init datée d'aujourd'hui.
3. `about-me/identity.md` — frontmatter + sections vides (`{{ à compléter via /remember }}`)
4. `about-me/activity.md` — pareil, avec les 1-4 fronts identifiés en Phase A en stubs
5. `about-me/stack.md` — pareil, avec le stack identifié en Phase A en stubs
6. `about-me/working-style.md`, `communication-style.md`, `values-and-principles.md` — stubs avec frontmatter
7. `projects/_index.md` — liste vide
8. Pour chaque front identifié en Phase A : `projects/[slug]/_context.md` avec frontmatter + sections (Objectif, Stade actuel, Décisions fondatrices vides, Liens)

Validation à chaque fichier. Quand je dis "OK on écrit tout", tu passes à la Phase D — toujours rien sur disque pour l'instant.

## Phase D — Slash commands globaux Claude Code

Les 5 slash commands vivent dans `~/.claude/commands/` (user-level — disponibles depuis n'importe quelle session Claude Code, peu importe le cwd). Le repo cloné contient leur source dans `.claude-commands/`.

Tu me proposes :

```
cp <chemin-repo-cloné>/.claude-commands/*.md ~/.claude/commands/
```

Avant d'exécuter, tu me listes les 5 fichiers et tu m'expliques en 1 ligne ce que fait chacun :

- `/remember` — capturer un fait stable, tu proposes le rangement, je valide
- `/decision` — formaliser une décision (formulaire 5 questions, fichier daté)
- `/recap` — brief d'état (projet, période, ou décisions récentes)
- `/methodize` — formaliser un workflow récurrent (formulaire 6 questions)
- `/save` — append une entrée dans `log.md`
- `/capture` — append rapide d'une idée volatile dans `inbox/`, zéro friction

Tu attends mon OK avant le `cp`.

## Phase E — Création réelle sur disque + git init

Maintenant tu écris tout :

1. Créer le dossier vault à `~/Documents/obsidian-vault` (ou un autre chemin si je précise)
2. Écrire `CLAUDE.md` validé en Phase B
3. Créer toute l'arborescence de dossiers : `about-me/`, `projects/`, `decisions/`, `learnings/`, `methods/`, `people/`, `inbox/`, `daily-brief/`
4. Écrire tous les fichiers validés en Phase C
5. Copier les 5 slash commands dans `~/.claude/commands/`
6. `git init` dans le vault, premier commit `init memory layer`

Tu me reportes l'arbre final avec `tree -L 2` et tu me demandes de l'ouvrir dans Obsidian (`open -a Obsidian ~/Documents/obsidian-vault`).

## Phase F (optionnelle) — Modules avancés

Demande-moi si je veux installer **maintenant** ou **plus tard** les 2 modules optionnels suivants. Si "plus tard", tu me donnes le chemin du repo cloné où je retrouverai les guides (`MODULES.md`).

### F1 — NotebookLM MCP (recherche documentaire)

Branche NotebookLM sur Claude Code. Permet d'interroger des sources documentaires depuis tes sessions Claude.

Commandes :

```
curl -LsSf https://astral.sh/uv/install.sh | sh
~/.local/bin/uv tool install --python 3.12 --force notebooklm-mcp-cli
nlm login
```

**Gotchas non négociables** (sinon ça crashe) :

1. `--python 3.12` est **obligatoire**. Par défaut, uv tombe sur 3.11 et le serveur MCP crashe (`PydanticUserError: Please use typing_extensions.TypedDict...`).
2. Le binaire `notebooklm-mcp` est dans `~/.local/bin/` — utiliser le **chemin absolu** dans la config MCP, pas juste le nom.
3. La config MCP va dans `~/.claude.json` (top-level), **pas** `~/.claude/settings.json` (le `nlm setup` suggère le mauvais fichier).

Bloc à ajouter dans `~/.claude.json` :

```json
"mcpServers": {
  "notebooklm-mcp": {
    "type": "stdio",
    "command": "/Users/[ton-user]/.local/bin/notebooklm-mcp",
    "args": [],
    "env": {}
  }
}
```

Relancer Claude Code après édition. Vérifier avec `/mcp` dans une session.

**Auth** : pas d'OAuth. `nlm login` ouvre un Chrome dédié, tu te logges Google, le CLI extrait les cookies de session. Validité ~2-4 semaines. Cookies stockés en 0o600 dans `~/.notebooklm-mcp-cli/profiles/` — équivalent password Google, **ne jamais commit**.

### F2 — Paperclip (orchestrateur d'agents IA)

⚠️ **Composant expérimental.** Ce module branche Paperclip (paperclip.ing, open source MIT, Node + Postgres local) pour faire tourner des agents Claude en cron sur le memory layer (ex : "Morning Brief" qui te livre un résumé chaque matin à 6h).

**Statut au moment de la rédaction** : installé, pas encore validé en production sur ce setup. À tester chez toi avant de t'engager dessus.

Lis le guide complet : `MODULES.md` section Paperclip dans le repo cloné. Décision-cadre, choix d'architecture et garde-fous documentés là-bas.

## Vérification finale (10 points)

À la toute fin, tu me fais valider cette checklist, ligne par ligne :

- [ ] `~/Documents/obsidian-vault/CLAUDE.md` existe et reflète mon profil
- [ ] `~/Documents/obsidian-vault/index.md` existe avec les sections
- [ ] `~/Documents/obsidian-vault/log.md` existe avec une entrée d'init
- [ ] `about-me/` contient mes 6 fichiers stubs
- [ ] `projects/` contient au moins 1 `_context.md` par front actif
- [ ] Les dossiers `decisions/`, `learnings/`, `methods/`, `people/`, `inbox/`, `daily-brief/` existent (vides)
- [ ] `~/.claude/commands/` contient les 6 fichiers : remember, decision, recap, methodize, save, capture
- [ ] `git log` dans le vault montre le commit d'init
- [ ] Le vault est ouvert dans Obsidian
- [ ] Test fonctionnel : je tape `/recap` dans une session Claude Code (n'importe quel cwd) → Claude lit le vault et me liste mes projets

Si un point échoue, tu m'aides à corriger avant de clôturer.

## Clôture

À la fin, donne-moi en 5 lignes :
1. Ce qu'on a installé
2. Le premier réflexe à prendre dès demain
3. Quand utiliser quel slash command (tableau de 4 lignes)
4. Où relire la méthode complète (process/ et key-insights/ dans le repo cloné)
5. Quel est le prochain palier (lancer `/decision` au prochain choix structurant)

## FIN DU PROMPT — copier jusqu'ici

---

## FAQ

**Q : Je peux changer le chemin du vault ?**
Oui. Indique-le en Phase A (question 1 ou en remarque libre). Toutes les slash commands utilisent un chemin **codé en dur** (`~/Documents/obsidian-vault`). Si tu changes, demande à Claude d'éditer les 6 commandes dans `~/.claude/commands/` pour pointer vers ton chemin.

**Q : Je peux faire tourner ça sur Linux ou Windows ?**
macOS testé. Linux devrait marcher sans modif. Windows : non testé, le `~` et les chemins POSIX vont casser — adapter les slash commands.

**Q : Je dois utiliser Obsidian ?**
Non. Le vault est juste du markdown. Tu peux ouvrir avec n'importe quel éditeur (VS Code, Sublime, vim). Obsidian apporte la graph view et les liens wiki cliquables — utile au bout de quelques semaines.

**Q : Et si je veux que Claude écrive dans mon vault depuis Claude Desktop (pas Claude Code) ?**
Le contrat dit non — Claude Desktop reste **lecture seule** par discipline. Les slash commands (qui imposent frontmatter, naming, scope) ne sont disponibles que dans Claude Code. Sans cette discipline, l'écriture devient désordonnée. Voir `CLAUDE.md` section "Accès cross-clients".

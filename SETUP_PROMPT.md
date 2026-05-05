# SETUP_PROMPT — À coller dans Claude Code

> **Mode d'emploi.** Ouvre une session Claude Code dans le dossier où tu as cloné ce repo (ou n'importe quel dossier — Claude saura où écrire). Colle le bloc ci-dessous **en entier** comme premier message. Réponds aux questions au fur et à mesure. À la fin de la session, ton memory layer est opérationnel.
>
> **Durée estimée** : 1h à 1h30 si tu réponds vite. **Prérequis** : Claude Code CLI installé, Obsidian installé, terminal macOS ou Linux.

---

## DÉBUT DU PROMPT — copier à partir d'ici

Tu vas m'aider à installer un **memory layer Obsidian + Claude Code** sur ma machine. Je viens du template public `claude-memory-layer`. Tu suis la méthode en 6 phases ci-dessous (0 → A → A.5 → B → C → D → E, plus F optionnelle), **strictement dans l'ordre**, en mode sparring partner — pas en exécutant aveugle.

L'esprit de ce setup : **on ne remplit pas un template avec mon nom, on conçoit une memory layer sur mesure pour mon activité réelle**. Phase A me fait extraire le contexte de mes IA actuelles, Phase A.5 te fait proposer une architecture custom, Phases B-E construisent cette architecture précise. Pas un wizard formulaire, un mini-kickoff de consultant.

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

## Phase A — Discovery de mon profil et de mes pains

Avant de poser les questions, **affiche-moi en tête de ton message le bloc suivant, mot pour mot, encadré, comme une recommandation de méthode** :

> 💡 **Méthode recommandée — ne réponds pas de tête.**
>
> Tu vas avoir un memory layer infiniment plus précis si tu **fais répondre ton IA actuelle** à ce questionnaire — celle où tu as déjà discuté de ton activité, de tes projets, de tes décisions, de tes clients (Claude Chat, ChatGPT, Gemini, peu importe).
>
> Comment faire :
> 1. Copie le formulaire ci-dessous
> 2. Colle-le dans une conversation existante avec ton IA principale (celle qui te connaît le mieux)
> 3. Demande-lui : *"Réponds à ce formulaire avec le maximum de contexte que tu as accumulé sur moi et mes projets. Sois précis, dense, factuel. Pour les questions où tu n'as pas l'info, dis 'à compléter' explicitement plutôt que d'inventer."*
> 4. Récupère ses réponses, relis-les, corrige ce qui est faux, puis colle le tout ici
>
> Pourquoi : ton IA actuelle a déjà un état de l'art de ton activité, de ton vocabulaire, de tes douleurs récurrentes. Re-écrire de tête, c'est perdre 80% de la richesse. Tu transformes ce setup en **pont entre ta session IA actuelle et ta nouvelle memory layer permanente**.
>
> Si tu n'as pas d'IA avec contexte accumulé sur toi, réponds de tête — c'est OK, on enrichira au fil du temps via `/remember` et `/decision`.

Puis pose-moi **les 8 questions ci-dessous en un seul message**, en formulaire numéroté. J'y réponds en bloc.

1. **Identité** : prénom, rôle pro actuel (1 ligne), localisation, statut (salarié / freelance / fondateur / autre)
2. **Fronts actifs** : les 1 à 4 chantiers que je porte en parallèle aujourd'hui — pour chacun : nom court, nature (produit / client / pivot / side-project), stade, stack si pertinent
3. **Stack outils** : tech (langages, frameworks, DB, infra) + productivité (Notion, Figma, Linear, etc.) + IA (Claude Code, Claude Chat, ChatGPT…)
4. **Pains récurrents avec l'IA** ⭐ (la question clé) : qu'est-ce que je **ré-explique systématiquement** à Claude/ChatGPT à chaque nouvelle session ? Quel contexte je perds le plus souvent ? (ex : "le positionnement de mon produit", "qui sont mes clients récurrents", "mes contraintes techniques", "mes décisions de mars que j'ai oubliées")
5. **Décisions récurrentes** : quels types de décisions je prends régulièrement et que j'aimerais pouvoir relire ? (tech, produit, business, client, perso) — donne 2-3 exemples concrets de décisions récentes
6. **Personas clés** : qui Claude doit absolument connaître dans mon écosystème ? (clients récurrents, partenaires, prestataires, mentors, équipe) — 3-8 noms maximum + nature de la relation
7. **Méthodes existantes à formaliser** : ai-je des workflows récurrents que j'aimerais documenter une fois pour toutes ? (ex : "comment je brief un dev", "ma méthode de discovery client", "ma checklist avant un déploiement")
8. **Posture attendue de Claude** + **langues** : sparring qui contredit ou exécutant ? · langue de travail · langue des noms de fichiers (recommandé : français contenu, kebab-case anglais fichiers)

Quand j'ai répondu, tu **résumes mon profil en 8 bullets** et tu me demandes : "C'est juste ? On passe à l'architecture personnalisée (Phase A.5) ?". Tu attends mon OK explicite.

## Phase A.5 — Architecture personnalisée (synthèse)

Avant de générer le moindre fichier, tu produis un **plan d'architecture sur mesure** basé sur mes réponses Phase A. Pas un template générique — une vraie réflexion d'architecte memory layer.

Format de ta proposition (en chat, pas sur disque) :

```
🏗️ ARCHITECTURE PROPOSÉE POUR [prénom]

1. SECTIONS CUSTOM dans CLAUDE.md
   En plus du squelette standard, je rajoute :
   - [section X] — parce que tu as dit Y en Phase A
   - [section Z] — parce que tu as dit W en Phase A
   (zéro section custom si le standard suffit — on n'invente pas du bruit)

2. DOSSIERS SUPPLÉMENTAIRES (au-delà des dossiers standards)
   - [dossier] — pour [usage spécifique tiré de Phase A]
   (ou "aucun" si non pertinent)

3. FICHIERS PRIORITAIRES À PRÉ-REMPLIR EN PHASE C
   Au lieu de stubs vides, je vais pré-remplir avec ton contexte :
   - projects/[front-1]/_context.md → objectif, stack, décisions fondatrices reformulées
   - people/[persona-1].md → [nature relation tirée de Phase A]
   - methods/[méthode-1].md → squelette de la méthode que tu as mentionnée
   - decisions/[YYYY-MM-DD]-[décision-récente].md → archive d'une décision exemple

4. SLASH COMMANDS — adaptations
   - Chemin vault : [chemin choisi]
   - Si chemin custom → patch des 6 commandes pour pointer vers ce chemin
   - (les 6 commandes restent fonctionnelles à l'identique)

5. PRIORITÉS SEMAINE 1 — où injecter de la valeur dès le début
   Basé sur tes pains Phase A (Q4) et tes décisions récurrentes (Q5) :
   - Réflexe quotidien à prendre : [exemple précis]
   - Premier `/decision` à archiver : [décision récente que tu as mentionnée]
   - Premier `/methodize` à formaliser : [méthode mentionnée Q7]

6. CE QUE JE NE FAIS PAS (et pourquoi)
   - [chose qu'on aurait pu faire mais qu'on skip délibérément]
   - Justification : [...]
```

Tu me demandes : **"Cette architecture te parle ? Tu veux ajuster quelque chose avant qu'on construise ?"**

J'itère avec toi (1-3 passes max), puis je dis "OK valide architecture" et tu passes à la Phase B avec ce plan en tête. **Toutes les phases B/C/D s'exécutent en respectant cette architecture, pas le template générique.**

## Phase B — Construction du CLAUDE.md sur mesure

Le `CLAUDE.md` est le **contrat** que toutes les futures sessions Claude vont lire en premier sur ce vault. Tu me proposes une version sur mesure, basée sur mes réponses Phase A, **l'architecture validée Phase A.5**, et le squelette du template (`CLAUDE.md` à la racine du repo cloné — lis-le).

Contraintes de rédaction :

- ~150 lignes max, dense, scannable
- Sections obligatoires : Qui je suis · Activité actuelle · Comment me parler · Stack · Navigation du vault · Règles d'écriture · Workflows (slash commands) · Garde-fous · Accès cross-clients
- **Sections custom** ajoutées si l'architecture A.5 les a validées
- Frontmatter YAML en tête : `type: vault-schema`, `owner:`, `updated: YYYY-MM-DD`
- Aucune invention. Si tu manques d'info, mets `{{ à compléter }}` explicite.
- Tu écris en français. Les noms de fichiers en kebab-case anglais.

Tu me proposes le contenu **dans le chat** (pas sur disque). Je valide ou je corrige par itérations. Quand je dis "OK valide", tu passes à la Phase C — toujours sans rien écrire sur disque.

## Phase C — Préparation des fichiers socle (pré-remplis selon Phase A.5)

Important : **on ne génère pas des stubs vides quand on a la matière**. Pour chaque fichier, tu pré-remplis avec le contexte de Phase A et les priorités validées en Phase A.5. Les `{{ à compléter via /remember }}` ne servent que pour les vraies inconnues, pas pour de l'info que j'ai déjà donnée.

Tu me proposes le contenu (en chat) des fichiers suivants, **un par un**, dans cet ordre :

1. `index.md` — carte du vault, sections : Start here · About Me · Projects · Decisions · Learnings · Methods · People. Liens wiki préremplis vers les fichiers qu'on va créer.
2. `log.md` — journal append-only. En-tête + 1 entrée d'init datée d'aujourd'hui mentionnant le profil et les fronts.
3. `about-me/identity.md` — frontmatter + sections **pré-remplies** avec Phase A Q1
4. `about-me/activity.md` — frontmatter + section par front (Phase A Q2), avec stade et stack reformulés
5. `about-me/stack.md` — frontmatter + stack pré-rempli (Phase A Q3), groupé par catégorie
6. `about-me/working-style.md`, `communication-style.md`, `values-and-principles.md` — stubs avec frontmatter (à enrichir au fil du temps)
7. `projects/_index.md` — liste des fronts en table avec liens
8. Pour chaque front (Phase A Q2) : `projects/[slug]/_context.md` avec frontmatter + sections **pré-remplies** (Objectif, Stade, Stack, Décisions fondatrices vides, Liens)
9. **Si Phase A.5 a identifié des personas clés (Q6) :** `people/[slug].md` pour chaque persona prioritaire (3 max), pré-rempli avec la nature de la relation
10. **Si Phase A.5 a identifié une décision récente exemple (Q5) :** `decisions/YYYY-MM-DD-[slug].md` pré-rempli comme premier exemple — ça montre le format et donne une seed value immédiate
11. **Si Phase A.5 a identifié une méthode à formaliser (Q7) :** `methods/[slug].md` avec squelette pré-rempli

Validation à chaque fichier. Quand je dis "OK on écrit tout", tu passes à la Phase D — toujours rien sur disque pour l'instant.

## Phase D — Slash commands globaux Claude Code

Les 6 slash commands vivent dans `~/.claude/commands/` (user-level — disponibles depuis n'importe quelle session Claude Code, peu importe le cwd). Le repo cloné contient leur source dans `.claude-commands/`.

Tu me proposes :

```
cp <chemin-repo-cloné>/.claude-commands/*.md ~/.claude/commands/
```

Avant d'exécuter, tu me listes les 6 fichiers et tu m'expliques en 1 ligne ce que fait chacun :

- `/remember` — capturer un fait stable, tu proposes le rangement, je valide
- `/decision` — formaliser une décision (formulaire 5 questions, fichier daté)
- `/recap` — brief d'état (projet, période, ou décisions récentes)
- `/methodize` — formaliser un workflow récurrent (formulaire 6 questions)
- `/save` — append une entrée dans `log.md`
- `/capture` — append rapide d'une idée volatile dans `inbox/`, zéro friction

Tu attends mon OK avant le `cp`.

### ⚠️ Path-patching obligatoire si vault custom

Les 6 commandes du template contiennent le chemin **codé en dur** `~/Documents/obsidian-vault`. Si l'architecture Phase A.5 a validé un autre chemin de vault, **tu dois patcher les commandes après le `cp`**, sinon les commandes pointeront vers le mauvais vault (ou un vault inexistant).

Vérification puis patch :

```bash
VAULT_PATH="<chemin du vault tel que défini en Phase A.5>"

if [ "$VAULT_PATH" != "$HOME/Documents/obsidian-vault" ]; then
  echo "==> Patch des slash commands (chemin custom : $VAULT_PATH)"
  for cmd in remember decision recap methodize capture save; do
    sed -i.bak "s#~/Documents/obsidian-vault#$VAULT_PATH#g" "$HOME/.claude/commands/$cmd.md"
    rm "$HOME/.claude/commands/$cmd.md.bak"
  done
  echo "==> Patch OK — les 6 commandes pointent vers $VAULT_PATH"
else
  echo "==> Chemin par défaut, aucun patch nécessaire"
fi
```

Tu reportes le résultat. Si patch effectué, tu me montres une ligne grep pour vérifier (ex : `grep "$VAULT_PATH" ~/.claude/commands/recap.md | head -1`).

## Phase E — Création réelle sur disque + git init

Maintenant tu écris tout :

1. Créer le dossier vault à `~/Documents/obsidian-vault` (ou un autre chemin si je précise)
2. Écrire `CLAUDE.md` validé en Phase B
3. Créer toute l'arborescence de dossiers : `about-me/`, `projects/`, `decisions/`, `learnings/`, `methods/`, `people/`, `inbox/`, `daily-brief/`
4. Écrire tous les fichiers validés en Phase C
5. Copier les 6 slash commands dans `~/.claude/commands/`
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
Oui. Indique-le en Phase A.5 (architecture). La Phase D inclut un step de path-patching automatique qui adapte les 6 slash commands au chemin choisi. Aucune édition manuelle requise.

**Q : Je peux faire tourner ça sur Linux ou Windows ?**
macOS testé. Linux devrait marcher sans modif. Windows : non testé, le `~` et les chemins POSIX vont casser — adapter les slash commands.

**Q : Je dois utiliser Obsidian ?**
Non. Le vault est juste du markdown. Tu peux ouvrir avec n'importe quel éditeur (VS Code, Sublime, vim). Obsidian apporte la graph view et les liens wiki cliquables — utile au bout de quelques semaines.

**Q : Et si je veux que Claude écrive dans mon vault depuis Claude Desktop (pas Claude Code) ?**
Le contrat dit non — Claude Desktop reste **lecture seule** par discipline. Les slash commands (qui imposent frontmatter, naming, scope) ne sont disponibles que dans Claude Code. Sans cette discipline, l'écriture devient désordonnée. Voir `CLAUDE.md` section "Accès cross-clients".

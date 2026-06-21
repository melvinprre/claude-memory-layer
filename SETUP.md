# SETUP — Instructions détaillées

> Tu peux suivre **soit** ce SETUP en mode manuel, **soit** [`SETUP_PROMPT.md`](./SETUP_PROMPT.md) en mode guidé par Claude. Le prompt est recommandé : il personnalise le `CLAUDE.md` à ton profil.

## Prérequis

- macOS ou Linux (Windows non testé)
- [Claude Code CLI](https://docs.claude.com/claude-code) installé et fonctionnel
- [Obsidian](https://obsidian.md) installé (optionnel mais recommandé pour la graph view)
- `git` installé

## Setup manuel — 6 étapes

### 1. Cloner le template

```
git clone https://github.com/melvinprre/claude-memory-layer.git ~/claude-memory-layer-tmp
cd ~/claude-memory-layer-tmp
```

### 2. Créer ton vault

```
mkdir -p ~/Documents/obsidian-vault
cp -r ./{about-me,projects,decisions,learnings,methods,people,inbox,daily-brief} ~/Documents/obsidian-vault/
cp CLAUDE.md index.md log.md ~/Documents/obsidian-vault/
```

### 3. Personnaliser le `CLAUDE.md`

Ouvre `~/Documents/obsidian-vault/CLAUDE.md`. Remplace tous les `{{ ... }}` par tes infos :
- `{{ ton-prenom }}` → ton prénom
- `{{ rôle pro actuel }}` → ce que tu fais
- `{{ Front 1/2/3 }}` → tes chantiers actifs
- etc.

Si tu ne sais pas quoi mettre, mets `{{ à compléter via /remember }}` — tu reviendras dessus plus tard via les slash commands.

### 4. Installer les slash commands globaux

```
mkdir -p ~/.claude/commands
cp .claude-commands/*.md ~/.claude/commands/
```

Vérifier :
```
ls ~/.claude/commands/ | grep -E "remember|decision|recap|methodize|capture|save"
```

Tu dois voir les 6 fichiers.

### 5. Adapter le chemin du vault dans les slash commands (si tu ne uses pas `~/Documents/obsidian-vault`)

Les 6 commandes contiennent en dur le chemin `~/Documents/obsidian-vault`. Si tu mets ton vault ailleurs :

```
cd ~/.claude/commands
sed -i '' 's|~/Documents/obsidian-vault|/ton/chemin/vault|g' remember.md decision.md recap.md methodize.md capture.md save.md
```

(Sur Linux : retirer le `''` après `-i`.)

### 6. Init git et premier commit

```
cd ~/Documents/obsidian-vault
git init
git add .
git commit -m "init memory layer"
```

### Vérification

Lance une session Claude Code dans n'importe quel dossier et tape :

```
/recap
```

Claude doit lire ton vault et te lister tes projets actifs (vides au début, normal).

## Modules avancés

Voir [`MODULES.md`](./MODULES.md) pour :
- **NotebookLM MCP** — recherche documentaire depuis Claude Code
- **Paperclip** — agents IA orchestrés en cron (brief matinal, etc.)

## Personnalisation

- **Changer le chemin du vault** : éditer les 6 slash commands (étape 5 ci-dessus)
- **Ajouter une langue** : modifier la section "Comment me parler" dans `CLAUDE.md`
- **Ajouter un type de fichier** (ex: `recipes/`, `prompts/`) : créer le dossier, l'ajouter dans `CLAUDE.md` section "Navigation du vault" et dans `index.md`

## Bootstrap suggéré (4 premiers réflexes)

| Moment | Action |
|--------|--------|
| Tu viens de trancher un truc qui cadre un projet | `/decision` |
| Tu retiens une leçon que tu veux pas re-découvrir dans 3 mois | `/remember` |
| Tu démarres une session sur un projet et veux le contexte | `/recap [nom-projet]` |
| Tu trouves un workflow qui marche, formalise-le | `/methodize` |

Une idée volatile qui te traverse l'esprit hors session ? `/capture [idée]` — zéro friction, tu tries plus tard.

## Désinstaller

```
rm -rf ~/Documents/obsidian-vault
rm ~/.claude/commands/{remember,decision,recap,methodize,capture,save}.md
```

(Si tu as installé NotebookLM MCP ou Paperclip, voir leurs sections respectives dans `MODULES.md`.)

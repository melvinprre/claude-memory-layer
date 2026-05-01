# MODULES.md — Composants optionnels

Le memory layer fonctionne entièrement standalone (vault + slash commands). Les modules ci-dessous l'enrichissent. À installer **après** avoir validé le setup de base et pris quelques jours d'usage.

---

## Module 1 — NotebookLM MCP

### Quoi

Branche [NotebookLM](https://notebooklm.google.com) sur Claude Code via le serveur MCP [`notebooklm-mcp-cli`](https://github.com/jacob-bd/notebooklm-mcp-cli) (Jacob Ben-David, MIT).

Permet d'interroger des sources documentaires (PDFs, articles, transcripts) depuis tes sessions Claude. Utile pour : recherches sectorielles, brief avant pitch, deep research async.

Expose ~40 tools MCP : `notebook_list/create/query`, `source_add`, `studio_create` (podcast audio/vidéo), `research_start` (Deep Research), `cross_notebook_query`, etc.

### Install

```
curl -LsSf https://astral.sh/uv/install.sh | sh
~/.local/bin/uv tool install --python 3.12 --force notebooklm-mcp-cli
```

### Gotchas non-négociables

**1. `--python 3.12` est obligatoire.** Par défaut, `uv` tombe sur Python 3.11.x et le serveur crashe au démarrage :

```
PydanticUserError: Please use `typing_extensions.TypedDict` instead of `typing.TypedDict` on Python < 3.12
```

Bug pydantic 2.13 + code qui importe `typing.TypedDict` depuis stdlib. Python 3.12+ contourne le problème.

**2. La config MCP va dans `~/.claude.json`, PAS `~/.claude/settings.json`.** Le `nlm setup add claude-code` suggère le mauvais fichier — ignore-le.

**3. Toujours utiliser le chemin absolu du binaire.** `notebooklm-mcp` est dans `~/.local/bin/`. Sans chemin absolu, le process MCP spawné peut ne pas trouver le binaire.

### Wire sur Claude Code

Édite `~/.claude.json` et ajoute (ou complète) la clé `mcpServers` au top-level :

```json
{
  "mcpServers": {
    "notebooklm-mcp": {
      "type": "stdio",
      "command": "/Users/[ton-user]/.local/bin/notebooklm-mcp",
      "args": [],
      "env": {}
    }
  }
}
```

Relancer Claude Code. Vérifier dans une session :

```
/mcp
```

Tu dois voir `notebooklm-mcp` listé.

### Auth

Pas d'OAuth (NotebookLM n'a pas d'API publique). Le CLI ouvre un Chrome dédié, tu te logges Google, le CLI extrait les cookies de session. Validité ~2-4 semaines.

```
nlm login
```

Multi-comptes :
```
nlm login --profile work
nlm login switch work
```

Cookies stockés en `0o600` dans `~/.notebooklm-mcp-cli/profiles/<profile>/auth.json`. **Équivalent password Google complet** — ne jamais commit, ne jamais partager.

### Maintenance

- Update : `uv tool upgrade notebooklm-mcp-cli`
- Désinstall : `uv tool uninstall notebooklm-mcp-cli && rm -rf ~/.notebooklm-mcp-cli` + retirer le bloc dans `~/.claude.json`
- Désactiver temporairement (sans désinstaller) : `/mcp` dans Claude Code, désactiver `notebooklm-mcp`. Recommandé quand tu n'en as pas besoin — le serveur expose ~40 tools et consomme du contexte.

---

## Module 2 — Paperclip (orchestrateur d'agents)

⚠️ **Statut : composant expérimental.** Installé et fonctionnel sur le setup de référence, mais pas encore validé en production sur plusieurs semaines. Lis cette section comme un guide de décision, pas un mode d'emploi clé en main.

### Quoi

[Paperclip](https://paperclip.ing) — open source MIT, Node + Postgres local, self-hosted. Positionnement : "human control plane for AI labor". Tu agis comme board d'une entreprise virtuelle peuplée d'agents-employés.

Cas d'usage type : un agent **Morning Brief** qui à 6h du matin lit ton vault Obsidian + ton outil opérationnel (Notion, Linear, etc.) + ton calendrier, et te livre un brief synthétique avec : top 3 focus, signaux faibles, 1 question challenge. Tout ça en background.

### Décisions de cadrage avant install

Si tu pars sur Paperclip, tranche ces 5 axes **avant** :

1. **Runtime des agents** : API Anthropic directe (facture séparée) ou Claude Code consommant ton quota Claude Max ?
2. **Ordre de déploiement** : commence par l'agent à risque zéro (lecture seule) avant celui qui écrit dans des systèmes critiques.
3. **Profondeur fonctionnelle** : aggregator basique, prioritizer, ou sparring partner ? (Plus profond = plus de valeur, plus cher en tokens.)
4. **Canal de livraison** : Slack DM, fichier Obsidian + notif macOS, hybride ?
5. **Garde-fou quota** : si tu utilises Claude Max, définis une règle de pause auto si dépassement N fois dans le mois.

Voir la décision-cadre complète dans le projet de référence (sera publié séparément).

### Install (esquisse — à valider chez toi)

```
git clone https://github.com/paperclip-ing/paperclip ~/paperclip
cd ~/paperclip
npm install
# config .env, postgres local, etc. — voir README upstream
```

Pour le scheduling sur macOS : **utiliser launchd, pas cron classique**. Raison : `launchd` catch-up automatiquement une tâche ratée à la sortie de sleep (cron classique skippe). Indispensable pour un laptop qui dort la nuit.

Plist exemple à `~/Library/LaunchAgents/com.user.morning-brief.plist` :

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
  <key>Label</key>
  <string>com.user.morning-brief</string>
  <key>ProgramArguments</key>
  <array>
    <string>/path/to/morning-brief-agent.sh</string>
  </array>
  <key>StartCalendarInterval</key>
  <dict>
    <key>Hour</key><integer>6</integer>
    <key>Minute</key><integer>0</integer>
  </dict>
  <key>StandardOutPath</key>
  <string>/tmp/morning-brief.log</string>
  <key>StandardErrorPath</key>
  <string>/tmp/morning-brief.err</string>
</dict>
</plist>
```

Charger : `launchctl load ~/Library/LaunchAgents/com.user.morning-brief.plist`

### Garde-fous obligatoires

- Le Morning Brief écrit dans `~/Documents/obsidian-vault/daily-brief/YYYY-MM-DD.md` — **ne jamais le laisser écrire ailleurs** dans le vault. Cohérence avec la règle "Claude Code écrit via slash commands uniquement".
- Budget par session : fixer un cap explicite (ex : $0.80/session, $25/mois).
- Garde-fou quota : si dépassement 2+ fois dans un mois glissant, pause auto + notif. **Pas de réarbitrage autonome** — tu décides à la main.

### Pourquoi pas d'install automatique ici

L'install Paperclip dépend de :
- Ton OS (macOS launchd vs Linux systemd vs Linux cron)
- Ton runtime choisi (API vs Claude Max)
- Ta tolérance au coût et au risque

Trop de variables pour un script "one-shot". Le bon réflexe : copier la décision-cadre, l'adapter à ton contexte, **t'engager publiquement** sur les garde-fous (issue GitHub, log dans `decisions/` du vault), puis installer.

---

## Combinaisons utiles

- **Memory layer seul** = MVP, déjà très utile. Reste là 2-4 semaines minimum avant d'ajouter de la complexité.
- **Memory layer + NotebookLM MCP** = combo recommandé pour qui fait beaucoup de research/strat. Risque faible.
- **Memory layer + Paperclip** = passage à l'industrialisation. Stakes plus élevés. Demande discipline (logs, garde-fous, monitoring).
- **Les trois** = setup complet. Cible : 4-8 semaines après le memory layer de base.

---

## Demandes de modules manquants

Tu en veux un autre (ex : intégration Linear, Make.com, etc.) ? Ouvre une issue sur le repo. Si plusieurs personnes le demandent, je le rajoute.

---
type: formation-process
section: process
order: 04
updated: 2026-04-19
---

# 04 — Architecture cross-sessions

## Le piège classique

Tu construis un beau vault Obsidian avec un CLAUDE.md riche. Génial.

Mais quand tu ouvres une **autre session** Claude Code (par exemple dans le repo de ton produit pour coder), cette session **ne charge pas** le CLAUDE.md du vault. Elle est aveugle au memory layer.

Résultat : tu reviens au point zéro à chaque session ailleurs que dans le vault.

## La solution en 3 pièces

```
┌─────────────────────────────────────┐
│ ~/Documents/obsidian-vault/         │
│   CLAUDE.md (le contrat du vault)   │
│   about-me/, projects/, etc.        │
└─────────────────────────────────────┘
              ↑ écrit dans
┌─────────────────────────────────────┐
│ ~/.claude/commands/                 │  ← user-level
│   /remember, /decision, /recap,     │     dispo dans
│   /methodize, /save                 │     TOUTES sessions
└─────────────────────────────────────┘
              ↑ référencé dans
┌─────────────────────────────────────┐
│ ~/.claude/CLAUDE.md (global)        │  ← chargé par
│   Section "Memory Layer Obsidian"   │     toutes sessions
│   "Vault à : ~/Documents/...        │     Claude Code
│   Lis CLAUDE.md du vault avant      │
│    écriture. Slash commands dispo." │
└─────────────────────────────────────┘
```

### Pièce 1 — Le vault avec son CLAUDE.md

Le vault contient le contrat (CLAUDE.md), la carte (index.md), le journal (log.md), et toutes les pages structurées (about-me, projects, decisions, learnings, methods, people).

### Pièce 2 — Slash commands au niveau **user**, pas projet

`~/.claude/commands/` est chargé dans **toutes** tes sessions Claude Code, peu importe le cwd.

Les commandes contiennent des **chemins absolus** vers le vault. Du coup, peu importe où tu lances la session — repo principal, repo client, dossier random — un `/remember` écrit toujours dans `~/Documents/obsidian-vault/`.

### Pièce 3 — Pointeur dans le CLAUDE.md global

Tu ajoutes une section "Memory Layer Obsidian" à ton `~/.claude/CLAUDE.md` global. Cette section :
- Indique que le memory layer existe à `~/Documents/obsidian-vault`
- Liste les 5 slash commands disponibles
- Pose les règles : "lis le CLAUDE.md du vault avant d'écrire", "n'écris jamais de ta propre initiative"

Comme `~/.claude/CLAUDE.md` est chargé par toutes tes sessions, **toutes tes sessions savent** que le memory layer existe et comment l'utiliser.

## Conséquence pratique

Tu codes ton produit (par exemple BaliKula) dans Claude Code. Tu prends une décision tech qui cadre le projet. Tu tapes `/decision` dans ta session de dev. Le formulaire groupé apparaît. Tu remplis. Le fichier est créé dans `~/Documents/obsidian-vault/decisions/2026-04-XX-...md`.

Tu n'as pas changé de session, tu n'as pas perdu ton contexte de code, et la décision est archivée pour toutes tes futures sessions.

C'est ça qui rend le système **réellement utilisable** au quotidien, pas juste théorique.

## Une seule source de vérité pour les commandes

Tentation : avoir les slash commands aussi dans le `.claude/commands/` du vault (pour les retrouver près du code lié).

**À éviter.** Deux sources = deux versions qui divergent. La source unique au niveau user (`~/.claude/commands/`) garantit la cohérence.

Voir aussi : [[../key-insights/source-unique-de-verite]].

Suite : [[05-decisions-cles-et-tradeoffs]] — les décisions structurantes prises pendant la construction et leurs tradeoffs.

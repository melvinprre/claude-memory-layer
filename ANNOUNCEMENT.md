# Announcement copy

Versions prêtes à poster pour annoncer le template `claude-memory-layer`. À adapter avec ton handle, ton URL repo et ton contexte.

---

## Twitter / X — version courte (280 chars)

```
J'ai construit un memory layer pour Claude — markdown + git, 6 slash commands globaux, install en 1h via un super-prompt.

Plus jamais re-briefer Claude au démarrage d'une session.

Template MIT, clonable, prêt à l'emploi : github.com/melvinprre/claude-memory-layer
```

## Twitter / X — thread (4 tweets)

**1/**
```
Le problème quand tu lances 5-15 sessions Claude par jour : à chaque session, tu re-briefes le contexte. Tes décisions, tes apprentissages, tes méthodes — tout disparaît.

J'ai construit une solution. Markdown + git. Open source. Install en 1h.

Thread ↓
```

**2/**
```
Le système : un vault Obsidian structuré (qui tu es, tes projets, tes décisions, tes learnings, tes méthodes) + 6 slash commands globaux Claude Code.

Tu tapes /decision dans n'importe quelle session → formulaire groupé → fichier daté archivé.
Tu tapes /recap mon-projet → brief instantané.
```

**3/**
```
La clé : les slash commands vivent en user-level (~/.claude/commands/). Du coup elles marchent dans TOUTES tes sessions, peu importe le cwd. Tu codes ton SaaS, tu tapes /decision, ça écrit dans ton vault.

Plus de "rappelle-moi le contexte" au démarrage.
```

**4/**
```
Template public, MIT, clonable.

Tu colles SETUP_PROMPT.md dans Claude Code, il te guide en 5 phases, tu réponds aux questions, à la fin ton memory layer est opérationnel.

→ github.com/melvinprre/claude-memory-layer

Feedback bienvenus.
```

---

## LinkedIn — version longue

```
J'utilise Claude (Code et Chat) entre 5 et 15 fois par jour. Dev, sparring stratégique, rédaction, recherche.

Le problème : à chaque nouvelle session, le modèle redémarre à zéro. Aucune mémoire. Donc soit je re-briefe le contexte (temps + tokens + énergie), soit je lance sans contexte (qualité dégradée).

Multipliée par 10 sessions par jour, la friction devient massive.

J'ai construit un memory layer pour résoudre ça. Aujourd'hui je le rends public, en MIT.

Le système :
→ Un vault Obsidian structuré (qui je suis, mes projets, mes décisions, mes apprentissages, mes méthodes)
→ 6 slash commands globaux Claude Code (/remember, /decision, /recap, /methodize, /capture, /save)
→ Un contrat CLAUDE.md lu en premier à chaque session

La clé technique : les slash commands sont installés au niveau user (~/.claude/commands/), pas au niveau projet. Donc elles marchent dans TOUTES mes sessions, peu importe où je code.

Concrètement : je code mon produit, je prends une décision tech qui cadre le projet, je tape /decision dans la session de dev, formulaire groupé, fichier daté archivé. Sans changer de session.

Cette discipline a transformé ma façon de bosser avec l'IA. Plus de "rappelle-moi le contexte". Mes décisions de mars sont toujours actionnables en juillet, avec leur contexte.

Le template est livré avec :
→ Un super-prompt SETUP_PROMPT.md à coller dans Claude Code, qui guide l'installation en 5 phases (1h-1h30)
→ Le contenu pédagogique complet (5 process + 5 key-insights) qui explique pourquoi chaque pièce est conçue comme elle est
→ Des modules optionnels documentés (NotebookLM MCP, Paperclip)

Construit à partir d'un memory layer perso testé sur un produit en production (marketplace P2P à Bali). Sanitisé et packagé pour être réutilisable.

→ Repo : github.com/melvinprre/claude-memory-layer

Si tu utilises Claude au quotidien, dis-moi ce que tu en penses. Je continue à itérer.
```

---

## Notes pour la diff de plateforme

- **Twitter** : pas de smiley/emoji. Punch direct. Format thread > monoposte.
- **LinkedIn** : ton storytelling OK, pas de hype creator. Plus long, narratif, pose le problème avant la solution.
- **Posts dérivés à prévoir** :
  - Post détaillé sur "Pourquoi user-level beats project-level pour les slash commands"
  - Post avec screencast de l'install en 1h
  - Reply au post qui annonce un futur ebook payant (Gumroad)

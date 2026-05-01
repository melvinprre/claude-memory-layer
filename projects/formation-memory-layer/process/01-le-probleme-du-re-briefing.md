---
type: formation-process
section: process
order: 01
updated: 2026-04-19
---

# 01 — Le problème du re-briefing

## Le constat

Tu utilises Claude (chat ou code) plusieurs fois par jour. À chaque nouvelle conversation, le modèle redémarre à zéro. Aucune mémoire persistante.

Conséquence : 2 mauvaises options à chaque session.

| Option | Coût |
|--------|------|
| Re-briefer le contexte | Temps + tokens + énergie (et tu oublies des trucs) |
| Lancer sans contexte | Qualité dégradée, recommandations bancales |

## Pourquoi ce problème explose pour les solopreneurs IA-first

Un solopreneur qui builde sérieusement avec l'IA :
- Lance 5-15 sessions Claude par jour (dev, stratégie, sparring, rédaction)
- Touche à plusieurs fronts en parallèle (produit, business, marketing, ops)
- Prend des décisions structurantes en cours de route
- N'a pas d'équipe pour mémoriser à sa place

Sans mémoire externe, il **réinvente le contexte** à chaque conversation. Multiplié par 5-15 fois par jour, la friction devient massive.

## Ce que les solutions actuelles ne résolvent pas

- **Custom instructions Claude** → globales, statiques, pas spécifiques par projet
- **RAG / NotebookLM / ChatGPT files** → l'IA redécouvre le contexte à chaque requête, rien ne s'accumule
- **CLAUDE.md de projet** → utile pour le code, mais ne couvre pas la stratégie, les décisions, l'identité
- **Notes manuelles** → tu maintiens à la main = ça crève

## L'insight structurant

> Le bookkeeping de la mémoire est ce qui crève les humains.
> Les LLMs ne se fatiguent jamais.

C'est exactement ce que résout le memory layer : tu fournis le contexte une fois, le LLM le maintient à jour, tu le relis quand tu veux.

## La proposition

Un **vault Obsidian** + des **slash commands Claude Code globaux** + un pointeur dans ton **CLAUDE.md global** = une mémoire externe persistante, écrite par Claude, accessible depuis toutes tes sessions.

Reste 100 % markdown + git. Zéro lock-in. Migrable en un jour si tu changes d'outil.

Suite : [[02-pivot-karpathy-vers-memory-layer]] — pourquoi le pattern "wiki LLM" classique ne suffit pas pour un solopreneur.

---
type: formation-insight
updated: 2026-04-19
---

# Stratégie sessions Claude Code — hybride longue/fraîche

## L'insight

Par défaut, le solopreneur tient **une session longue par projet** ("General Coding Session"). C'est confortable, mais ça coûte cher. Le memory layer change l'équation et autorise une stratégie hybride beaucoup plus efficace.

## Les 3 coûts cachés d'une session longue

| Coût | Symptôme |
|------|----------|
| **Bloat contextuel** | Tokens consommés à relire l'historique. Auto-compression qui dégrade la qualité après quelques heures. |
| **Inertie de direction** | Si la session part dans une mauvaise direction, c'est lourd à corriger. Anciennes hypothèses qui polluent les nouvelles décisions. |
| **Friction de navigation** | Chercher "où on en était sur X" dans une session de 12h = pénible, voire impossible. |

Le solopreneur discipliné ne ressent pas ces coûts directement (il pousse régulièrement vers Notion ou un memory layer). Mais le coût est là, silencieux.

## Pourquoi le memory layer change tout

**Avant memory layer** : nouvelle session = repartir de zéro = coût élevé. Donc on maintient la même session par flemme rationnelle.

**Après memory layer** : nouvelle session = Claude lit le CLAUDE.md global → voit le pointeur memory layer → on lance `/recap [projet]` → état complet en 30 secondes. **Coût d'ouverture quasi-nul.**

Le bon réflexe peut donc changer : ouvrir des sessions fraîches devient économiquement viable.

## L'approche hybride

### Garde une session longue pour

- Une **feature en cours** dont le contexte est utile (ex : refactor qui touche plusieurs fichiers liés)
- Du **debug profond** où l'historique des hypothèses testées sert (ne pas retester ce qui a déjà été éliminé)

### Ouvre une session fraîche pour

- Un **nouveau bug** sans rapport avec ce que tu codes (ne pas polluer la session feature)
- Une **discussion stratégique** (où va le produit ?) — tu ne veux pas le contexte code, tu veux le contexte stratégique du memory layer
- Une **exploration** (essayer une lib, tester une approche) — si ça foire, tu jettes la session sans regret
- **Quand la session actuelle te paraît "lourde" ou "perdue"** — symptôme classique : changement de direction 3 fois en 30 minutes

## Triggers concrets pour fermer/ouvrir

- **Fin de feature shippée** → ferme la session, ouvre une fraîche pour la suivante
- **"Je ne sais plus où on en est"** → ferme, lance `/recap [projet]` ailleurs, reviens propre
- **Direction stratégique vs exécution tactique** → 2 sessions distinctes en parallèle
- **Tu veux paralléliser** → plusieurs windows Claude Code, chacune sur son sujet

## Pattern à installer

**À la fin d'une session productive** : lance `/decision` (si décision prise) ou `/remember` (si learning capturé). Pousse ce qui mérite de durer dans le memory layer. Tu peux fermer la session sans rien perdre.

**À l'ouverture d'une session** : `/recap [projet]` (état projet) ou `/recap last-week` (activité récente). 30 secondes, tu es en ligne.

## Le but final

Ne plus penser à "garder ma session" parce que **le memory layer est ta vraie session permanente**. Les sessions Claude Code deviennent des outils jetables, pas des sanctuaires à protéger.

C'est un changement de paradigme : la session était la mémoire → maintenant le vault est la mémoire, la session est le moteur.

## Roadmap d'adoption pour le solopreneur

1. **Semaine 1** : continuer la pratique habituelle pour finir les features en cours dans la session longue actuelle.
2. **Prochaine feature** : l'attaquer dans une session fraîche. Sentir la différence de fluidité.
3. **Après 2 semaines d'usage hybride** : `/methodize "ouverture de session Claude Code"` pour formaliser le workflow personnel.

## Lien avec l'architecture du memory layer

Cette stratégie n'est viable **que** parce que le memory layer existe et que les slash commands fonctionnent cross-sessions. Sans cette plomberie, le coût d'ouverture d'une session fraîche serait prohibitif.

Voir aussi : [[../process/04-architecture-cross-sessions]] qui explique pourquoi les sessions fraîches ont accès au contexte via le pointeur dans `~/.claude/CLAUDE.md`.

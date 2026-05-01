---
type: formation-process
section: process
order: 03
updated: 2026-04-19
---

# 03 — La méthode de construction en 5 étapes

## Principe non-négociable : dialogue d'abord, exécute ensuite

La construction se fait en **co-création** avec Claude. Pas de solution clé en main générée d'un coup. Pourquoi :

- Le memory layer doit refléter **ta réalité**, pas un template générique
- Une structure imposée d'en haut ne sera pas réutilisée
- Le dialogue force à expliciter tes choix → tu apprends à utiliser l'outil en le construisant

Voir aussi : [[../key-insights/dialogue-avant-execution]].

## Les 5 étapes

### Étape A — Validation de la structure de dossiers

Tu proposes une structure (ou tu en demandes une à Claude). Claude la **critique en sparring partner**, pas en exécutant. Il identifie les redondances, les confusions, les manques.

Tu valides la structure finale. Aucun fichier créé à ce stade.

### Étape B — Rédaction du CLAUDE.md

C'est le contrat. Le fichier que Claude lit en premier à chaque session. Il contient :
- Qui tu es (identité, localisation, langues)
- Ton activité (3-4 fronts max)
- Comment te parler (ton, sparring partner vs exécutant, langue)
- Ton stack
- La navigation du vault
- Les règles d'écriture
- Les workflows (slash commands)
- Les garde-fous

**~150 lignes max.** Dense, scannable, listes plutôt que prose.

### Étape C — Fichiers socle

- `index.md` : carte vivante du vault
- `log.md` : journal append-only des opérations
- Stubs des fichiers `about-me/`, `projects/`, etc.
- 1 fichier `_context.md` rempli par projet actif (questions guidées par Claude, tu remplis)

### Étape D — Slash commands

5 commandes que tu installeras au niveau utilisateur Claude Code (dispo dans toutes tes sessions) :

- `/remember` — capturer un fait stable
- `/decision` — formaliser une décision (formulaire groupé)
- `/recap` — brief d'état (projet, période, décisions récentes)
- `/methodize` — formaliser une méthode (formulaire groupé)
- `/save` — append une entrée dans log.md

### Étape E — Création réelle

Claude crée tous les dossiers et fichiers sur disque. Tu vérifies l'arborescence.

## Pourquoi 5 étapes et pas 1 long script

Chaque étape = un point de validation. Si tu te plantes à l'étape A, tu ne perds pas l'investissement de B/C/D/E. Tu corriges et tu repars.

C'est le **principe du blast radius** : limiter le coût d'une erreur en validant fréquemment.

## Durée typique

Avec un Claude bien briefé (Opus 4.x ou supérieur) : **1h30 à 2h** pour un solopreneur qui répond aux questions et valide. Le système est ensuite immédiatement opérationnel.

Suite : [[04-architecture-cross-sessions]] — pourquoi le memory layer est utilisable depuis n'importe quelle session Claude.

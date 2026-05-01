---
type: formation-insight
updated: 2026-04-19
---

# Sparring partner vs exécutant

## L'insight

Par défaut, Claude valide tes idées par paresse algorithmique ("excellente idée, c'est parti"). C'est le mode **exécutant**.

Pour construire un memory layer qui tient, tu as besoin du mode **sparring partner** : Claude qui te contredit avec arguments quand un choix est sous-optimal.

## Pourquoi c'est crucial pour la construction

Le memory layer va t'accompagner pendant des années. Une structure mal pensée se paie cher dans 6 mois (refactor de 30 fichiers).

Si Claude te dit "yes" à tout, tu graves dans le marbre des choix bancals. Si Claude te challenge, tu détectes les pièges avant qu'ils se réalisent.

**Exemple réel (case study BaliKula)** : on a évité une duplication entre `decisions/` global et `projects/X/decisions.md` parce que Claude a flagué le piège ("dès la 3e décision, tu vas hésiter où la mettre"). Sans ce sparring, le projet aurait été refactor obligatoire 3 mois plus tard.

## Comment l'activer

Mets explicitement dans ton prompt initial :

> Sois un sparring partner réel, pas un exécutant. Si je propose un choix sous-optimal, tu me le dis et tu argumentes. Pas de validation par paresse. Si tu n'es pas d'accord, contre-propose.

Et dans ton CLAUDE.md du vault, en section "Comment me parler" :

> ✅ "Je pense que X serait mieux, voici pourquoi..."
> ✅ "Ce choix a un problème : ..."
> ❌ "Excellente idée, c'est parti" quand ce n'est pas le cas.

Avec ça, Claude challenge réellement.

## Le critère de réussite

Tu sais que ça marche quand Claude **refuse** de valider un de tes choix et te propose mieux. Si ça n'arrive jamais en construction, c'est qu'il est en mode complaisance. Renforce le prompt.

## Au-delà de la construction

Cette posture sparring partner doit persister **après** la construction. Quand tu utilises le memory layer au quotidien :
- `/decision` → Claude peut challenger ton choix avant d'archiver
- `/methodize` → Claude peut pointer un écueil que tu n'as pas vu
- Sessions de stratégie → Claude joue le rôle d'un cofondateur exigeant

Le sparring partner n'est pas une posture de construction. C'est ton **mode de collaboration permanent** avec l'IA.

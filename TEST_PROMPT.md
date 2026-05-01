# TEST_PROMPT — Tester ce template sans casser un setup live

> **Pour qui.** Tu as **déjà** un memory layer en production (vault Obsidian + slash commands `~/.claude/commands/` + éventuellement NotebookLM MCP / Paperclip). Tu veux valider ce template (ou un fork, ou un PR) sans risquer d'écraser tes données ou tes commandes live.
>
> **Mode d'emploi.** Ouvre une session Claude Code vierge dans n'importe quel dossier. Colle le bloc ci-dessous **en entier**. Réponds aux questions. À la fin, ton setup live est intact et tu sais si le template est solide.
>
> **Durée.** 15-25 min.

---

## DÉBUT DU PROMPT — copier à partir d'ici

Tu vas m'aider à **tester** le template `claude-memory-layer` sans toucher à mon setup live. Je suis l'auteur (ou un contributeur) du template, j'ai déjà un memory layer en production, et je veux valider qu'une install à partir de ce template produit un résultat propre.

## Posture pendant cette session

- Tu es en mode **test**, pas install. Aucune écriture ne doit toucher mes chemins live.
- Tu groupes les questions en formulaire, je réponds en bloc.
- Tu **valides chaque étape destructive avec moi avant de l'exécuter**.
- Tu réponds en français, ton direct.
- Si tu détectes un risque de collision avec mon setup live (un chemin, un fichier qui existe déjà), tu **stoppes** et tu me demandes confirmation explicite.

## Phase 0 — Détection de mon setup live

Exécute ces vérifications en bash et reporte le résultat :

```bash
echo "=== VAULT LIVE ==="
ls -la ~/Documents/obsidian-vault/CLAUDE.md 2>/dev/null && echo "→ vault live détecté" || echo "→ pas de vault live"

echo "=== SLASH COMMANDS LIVE ==="
ls ~/.claude/commands/ 2>/dev/null | grep -E "^(remember|decision|recap|methodize|capture|save)\.md$" || echo "→ aucune commande memory layer installée"

echo "=== NOTEBOOKLM MCP LIVE ==="
grep -l "notebooklm-mcp" ~/.claude.json 2>/dev/null && echo "→ NotebookLM MCP wired" || echo "→ pas de NotebookLM"

echo "=== PAPERCLIP / LAUNCHD ==="
launchctl list 2>/dev/null | grep -i "morning-brief\|paperclip" || echo "→ pas de launchd job lié"

echo "=== CHEMIN DU REPO TEMPLATE ==="
pwd
ls SETUP_PROMPT.md TEST_PROMPT.md CLAUDE.md 2>/dev/null && echo "→ je suis dans un repo claude-memory-layer" || echo "→ je suis ailleurs (préciser le chemin du template)"
```

Sur la base du résultat, **résume-moi en 4 lignes** :
- Vault live : oui/non + chemin
- Commandes live : liste des fichiers détectés
- NotebookLM MCP : actif oui/non
- Paperclip / launchd : actif oui/non

Puis demande-moi le chemin du repo template si tu n'es pas dedans.

## Phase 1 — Définir l'isolation

Pose-moi **les 3 questions ci-dessous en un seul message**, en formulaire :

1. **Chemin du vault de test** (par défaut : `~/Desktop/test-vault-claude-memory-layer-YYYY-MM-DD`) — confirme ou propose un autre chemin
2. **Stratégie pour les slash commands** : (a) backup live + install commandes test à `~/.claude/commands/` puis restore en cleanup, (b) installer les commandes avec un préfixe `test-` (test-remember, test-decision, etc.), (c) skip totalement la Phase D — je validerai juste que le vault est généré proprement
3. **Modules optionnels (Phase F NotebookLM/Paperclip)** : skip d'office (recommandé pour un test) ou tester aussi ?

Quand j'ai répondu, **résume le plan d'isolation en bullets**, et demande validation explicite avant d'exécuter quoi que ce soit.

## Phase 2 — Backup (si stratégie A choisie)

Si j'ai choisi la stratégie (a) backup + restore :

```bash
BACKUP_DIR="$HOME/.claude/commands.bak.$(date +%Y%m%d-%H%M%S)"
cp -r ~/.claude/commands "$BACKUP_DIR"
echo "Backup créé : $BACKUP_DIR"
```

Reporte le chemin du backup. **Je dois pouvoir le restorer manuellement si la session crashe avant le cleanup final.**

## Phase 3 — Exécution du SETUP_PROMPT en mode test

Lance la séquence d'install du `SETUP_PROMPT.md` du repo template, **en injectant les paramètres d'isolation** définis en Phase 1 :

- Phase A (profil) : utilise un profil **fictif** que tu génères toi-même (ex : "Alice, freelance designer Berlin, 2 fronts : produit SaaS + clients") — pas mes vraies infos. Précise-moi ce profil avant de continuer pour que je valide qu'il est cohérent comme cas-test.
- Phase B (CLAUDE.md) : génère le contenu en chat, je valide en 30 secondes (pas besoin de scrute ligne par ligne — on teste la mécanique, pas la qualité éditoriale).
- Phase C (fichiers socle) : pareil, génère, je valide en bloc.
- Phase D (slash commands) : applique la stratégie choisie en Phase 1.
- Phase E (création disque) : écris **uniquement dans le chemin de test**. Si à un moment un chemin résolu pointe vers `~/Documents/obsidian-vault` ou un autre chemin live, **stop** et demande confirmation.
- Phase F : skip (sauf si j'ai dit oui en Phase 1).

## Phase 4 — Vérifications post-install

Une fois le vault test créé, exécute :

```bash
TEST_VAULT="<chemin défini en Phase 1>"

echo "=== ARBORESCENCE ==="
find "$TEST_VAULT" -type f | sort

echo "=== CLAUDE.md du test ==="
head -20 "$TEST_VAULT/CLAUDE.md"

echo "=== Reste-t-il des {{ }} non remplacés ? ==="
grep -rn "{{ " "$TEST_VAULT" | head -20 || echo "aucun"

echo "=== git log du vault test ==="
cd "$TEST_VAULT" && git log --oneline 2>/dev/null || echo "pas de git init"

echo "=== Les commandes live sont-elles intactes ? ==="
ls ~/.claude/commands/ | sort
```

Et fais-moi un **rapport en 6 points** :

1. ✅/❌ Le vault test contient bien tous les dossiers attendus
2. ✅/❌ Le CLAUDE.md a bien été personnalisé avec le profil fictif
3. ✅/❌ Les `{{ ... }}` restants sont **explicitement** des placeholders (pas des oublis) — liste les
4. ✅/❌ Git init + premier commit OK dans le vault test
5. ✅/❌ Mes commandes live sont intactes (compare avec ce que tu as détecté en Phase 0)
6. ✅/❌ Aucun fichier hors du vault test n'a été modifié (à part les commandes si stratégie a été choisie)

Si un point est ❌, **arrête tout** et explique le problème. Je décide de la suite (corriger le template, repush, ou cleanup et retester).

## Phase 5 — Test fonctionnel

Si Phase 4 OK, propose **un test fonctionnel rapide** :

Je vais ouvrir une nouvelle session Claude Code dans un dossier random et taper `/recap` (ou la version préfixée si stratégie b). Tu m'expliques ce que je dois voir comme comportement attendu (lecture du vault test, listing des projets fictifs).

⚠️ Si stratégie A (commandes live remplacées), tu **m'avertis** que le `/recap` va lire le **vault test**, pas mon vault live. C'est attendu et normal pendant le test.

## Phase 6 — Cleanup

À la fin, propose-moi le cleanup en **un seul bloc copiable** (je dois pouvoir le lire en entier avant exécution) :

```bash
# 1. Suppression du vault test
rm -rf "<chemin vault test>"

# 2. Si stratégie a (backup) : restore des commandes live
rm -rf ~/.claude/commands
mv "<chemin backup défini en Phase 2>" ~/.claude/commands

# 2bis. Si stratégie b (préfixe test-) : suppression des commandes test
rm ~/.claude/commands/test-*.md

# 2ter. Si stratégie c (skip Phase D) : rien à faire

# 3. Vérification finale
ls ~/.claude/commands/
ls -la ~/Documents/obsidian-vault/CLAUDE.md
```

**Attends ma validation explicite avant de l'exécuter.** Une fois validé, tu exécutes et tu me confirmes que mon setup live est restoré à l'identique.

## Phase 7 — Rapport final

Donne-moi en 5 lignes :

1. Verdict global : le template est-il prêt à publier ? (oui / oui avec corrections / non)
2. Liste des bugs ou frictions détectés pendant le test (vide si rien)
3. Liste des `{{ ... }}` qui devraient être pré-remplis ou clarifiés
4. Suggestions d'amélioration du SETUP_PROMPT public à partir de ce que tu as observé
5. Mon setup live : confirmé intact

## FIN DU PROMPT — copier jusqu'ici

---

## Garde-fous résumés

- **Aucune écriture en dehors du vault test ni du backup explicite.**
- **Stop si un chemin live est touché** — toujours demander confirmation.
- **Cleanup en un bloc lisible** — pas d'exécution silencieuse à la fin.
- **Modules Phase F skipés par défaut** — NotebookLM et Paperclip live ne sont jamais touchés.
- **Profil fictif** — pas de vraies données personnelles pendant le test.

## Quand re-lancer ce prompt

- Tu modifies le SETUP_PROMPT et tu veux valider la nouvelle version
- Quelqu'un fork le template et veut tester ses changements
- Tu reviens 6 mois plus tard et tu veux vérifier que rien n'a régressé (Claude a évolué, MCP a évolué, etc.)

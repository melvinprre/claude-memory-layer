# Installer claude-memory-layer en 1h chrono

Tu n'as **rien à faire en terminal**. Tu copies un mini-prompt, tu le colles dans Claude Code, et Claude Code s'occupe de tout : cloner le repo, lire la méthode, te poser les questions, construire ton vault.

---

## Prérequis (une seule fois)

- **Claude Code** installé. Test : tape `claude --version` dans un terminal. Si ça répond une version, c'est bon. Sinon : https://docs.claude.com/en/docs/claude-code
- **Obsidian** installé (gratuit) : https://obsidian.md
- macOS ou Linux. Windows non testé.

---

## La méthode "one-shot" — recommandée

**1. Ouvre Claude Code.** Lance simplement `claude` dans un terminal, depuis n'importe quel dossier. (Si tu utilises l'app desktop Claude, ouvre l'onglet Claude Code.)

**2. Copie le mini-prompt ci-dessous** :

```
Installe-moi le memory layer claude-memory-layer.

1. Clone https://github.com/melvinprre/claude-memory-layer.git dans ~/Projects/
   (crée ~/Projects si besoin, skip le clone si le repo existe déjà)
2. Lis le fichier SETUP_PROMPT.md du repo cloné
3. Identifie le bloc entre "## DÉBUT DU PROMPT — copier à partir d'ici"
   et "## FIN DU PROMPT — copier jusqu'ici"
4. Adopte ce bloc comme tes instructions et exécute la séquence
   strictement dans l'ordre, en commençant par Phase 0.
```

**3. Colle-le comme premier message** de ta session Claude Code. Envoie.

**4. Suis le guide.** Claude va :
- Vérifier que tout est installé (Phase 0)
- Te poser 8 questions sur ton activité (Phase A)
- Te proposer une **architecture personnalisée** pour ton memory layer (Phase A.5)
- Construire ton `CLAUDE.md` sur mesure (Phase B)
- Préparer les fichiers socle pré-remplis avec ton contexte (Phase C)
- Installer les 6 slash commands globaux (Phase D)
- Tout écrire sur disque + git init (Phase E)

Compter **1h à 1h30**. Pas besoin d'être technique : tu réponds aux questions, tu valides à chaque étape.

---

## 💡 Astuce qui change tout (Phase A)

Quand Claude te pose les 8 questions Phase A, **ne réponds pas de tête**.

Prends le formulaire, **colle-le dans une session existante** avec ton IA principale (Claude Chat, ChatGPT, Gemini — celle où tu as déjà discuté de tes projets), et demande-lui :

> *"Réponds à ce formulaire avec le maximum de contexte que tu as accumulé sur moi et mes projets. Sois précis, dense, factuel. Pour les questions où tu n'as pas l'info, dis 'à compléter' explicitement plutôt que d'inventer."*

Récupère ses réponses, relis-les, corrige ce qui est faux, puis colle dans la session Claude Code d'install.

**Pourquoi** : ton IA actuelle a déjà un état de l'art de ton activité. Re-écrire de tête, c'est perdre 80% de la richesse. Tu transformes ce setup en **pont entre ta session IA actuelle et ta nouvelle memory layer permanente**.

---

## À la fin

- Ton vault Obsidian est à `~/Documents/obsidian-vault` (ou ton chemin custom)
- Tu peux l'ouvrir avec : `open -a Obsidian ~/Documents/obsidian-vault`
- Dans **n'importe quelle session Claude Code à partir de maintenant**, tu peux taper :
  - `/recap` → brief d'état de tes projets
  - `/decision` → archiver une décision structurante
  - `/remember` → noter un fait stable
  - `/methodize` → formaliser une méthode récurrente
  - `/save` → ajouter une entrée au journal
  - `/capture` → dump rapide d'une idée

---

## Méthode manuelle (si la méthode one-shot échoue)

Si Claude Code ne peut pas cloner pour une raison X (problème SSH, permissions, etc.), fallback en 3 commandes :

```bash
mkdir -p ~/Projects && cd ~/Projects
git clone https://github.com/melvinprre/claude-memory-layer.git
cd claude-memory-layer && claude
```

Puis ouvre `SETUP_PROMPT.md` dans ton éditeur, copie le bloc entre `## DÉBUT DU PROMPT` et `## FIN DU PROMPT`, et colle-le dans la session Claude Code que tu viens de lancer.

---

## Modules optionnels (à activer plus tard)

Une fois ton memory layer base opérationnel et utilisé pendant 1-2 semaines, tu peux activer :

- **NotebookLM MCP** — interroger des sources documentaires depuis Claude Code
- **Paperclip** ⚠️ — agent IA en cron qui te livre un Morning Brief chaque matin (composant expérimental, valider chez toi avant de t'engager)

Voir `MODULES.md` dans le repo cloné.

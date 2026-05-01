#!/usr/bin/env bash
# init-vault.sh — bootstrap minimal du memory layer depuis ce template.
#
# Usage :
#   bash scripts/init-vault.sh [chemin-vault]
#
# Si aucun chemin fourni, défaut : ~/Documents/obsidian-vault

set -euo pipefail

VAULT="${1:-$HOME/Documents/obsidian-vault}"
REPO_DIR="$(cd "$(dirname "$0")/.." && pwd)"

echo "==> Init memory layer"
echo "    Vault       : $VAULT"
echo "    Template    : $REPO_DIR"
echo

if [ -e "$VAULT" ] && [ "$(ls -A "$VAULT" 2>/dev/null || true)" ]; then
  echo "ERROR: $VAULT existe déjà et n'est pas vide. Stop."
  echo "       Supprime-le manuellement ou choisis un autre chemin."
  exit 1
fi

mkdir -p "$VAULT"

# Copier la structure
cp -r "$REPO_DIR"/{about-me,projects,decisions,learnings,methods,people,inbox,daily-brief} "$VAULT/"
cp "$REPO_DIR"/{CLAUDE.md,index.md,log.md} "$VAULT/"

# Slash commands
mkdir -p "$HOME/.claude/commands"
for cmd in remember decision recap methodize capture save; do
  if [ -f "$HOME/.claude/commands/$cmd.md" ]; then
    echo "    skip ~/.claude/commands/$cmd.md (existe déjà)"
  else
    cp "$REPO_DIR/.claude-commands/$cmd.md" "$HOME/.claude/commands/$cmd.md"
    echo "    installed ~/.claude/commands/$cmd.md"
  fi
done

# Adapter les slash commands si chemin custom
if [ "$VAULT" != "$HOME/Documents/obsidian-vault" ]; then
  echo "==> Patch des slash commands (chemin custom)"
  for cmd in remember decision recap methodize capture save; do
    sed -i.bak "s|~/Documents/obsidian-vault|$VAULT|g" "$HOME/.claude/commands/$cmd.md"
    rm "$HOME/.claude/commands/$cmd.md.bak"
  done
fi

# Git init
cd "$VAULT"
if [ ! -d .git ]; then
  git init -q
  git add .
  git commit -q -m "init memory layer"
  echo "==> git init + first commit OK"
fi

echo
echo "==> Vault prêt à $VAULT"
echo "    Ouvre-le : open -a Obsidian \"$VAULT\""
echo "    Test     : lance une session Claude Code, tape /recap"
echo
echo "Reste à faire MANUELLEMENT :"
echo "  - Personnaliser \"$VAULT/CLAUDE.md\" (remplacer les {{ ... }})"
echo "  - Créer un projet : éditer projects/_index.md, mkdir projects/<slug>, créer projects/<slug>/_context.md"

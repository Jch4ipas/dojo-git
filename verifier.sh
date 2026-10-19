#!/usr/bin/env bash
# Vérifie que la mission est réussie. Usage : bash verifier.sh

ok=0
total=0

verifier() {
  total=$((total + 1))
  if eval "$2" > /dev/null 2>&1; then
    echo "✅ $1"
    ok=$((ok + 1))
  else
    echo "❌ $1"
  fi
}

git_dir="$(git rev-parse --git-dir)"
hotfix="$(git log main --format=%H --grep='^\[hotfix\]' | head -n 1)"

verifier "Aucun rebase ou merge en cours" \
  "[ ! -d '$git_dir/rebase-merge' ] && [ ! -d '$git_dir/rebase-apply' ] && [ ! -f '$git_dir/MERGE_HEAD' ]"
verifier "Vous êtes sur la branche main" \
  "[ \"\$(git branch --show-current)\" = main ]"
verifier "Tout est commité (rien en attente)" \
  "[ -z \"\$(git status --porcelain)\" ]"
verifier "Aucun marqueur de conflit dans les fichiers" \
  "! git grep -q -E '^(<<<<<<<|=======|>>>>>>>)' main"
verifier "Le hotfix de l'exploitation est dans main" \
  "[ -n '$hotfix' ]"
verifier "Le menu du dev est dans main" \
  "git cat-file -e main:menu.yml"
verifier "L'accès public du dev est dans main" \
  "git show main:config.yml | grep -q 'acces: public'"
verifier "Le travail du dev est rejoué après le hotfix" \
  "[ -n \"\$(git log '$hotfix'..main --format=%H -- menu.yml)\" ]"
verifier "L'historique est linéaire (aucun commit de merge)" \
  "[ -z \"\$(git rev-list --merges main)\" ]"

echo
echo "$ok / $total"
[ "$ok" -eq "$total" ] && echo "🎉 Mission réussie ! Répondez maintenant aux questions du README."

#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILLS=(deep-research academic-paper academic-paper-reviewer academic-pipeline)

CODEX_HOME_DIR="${CODEX_HOME:-$HOME/.codex}"
TARGET_SKILLS_DIR="$CODEX_HOME_DIR/skills"
TIMESTAMP="$(date +%Y%m%d-%H%M%S)"
BACKUP_DIR="$CODEX_HOME_DIR/skill_backups/academic-research-skills/uninstall-$TIMESTAMP"
INSTALLED_VERSION_FILE="$CODEX_HOME_DIR/academic-research-skills.version"

mkdir -p "$BACKUP_DIR"

for skill in "${SKILLS[@]}"; do
  target="$TARGET_SKILLS_DIR/$skill"
  if [[ -e "$target" ]]; then
    echo "==> Backing up and removing $skill"
    mv "$target" "$BACKUP_DIR/$skill"
  else
    echo "==> Skipping missing $skill"
  fi
done

rm -f "$INSTALLED_VERSION_FILE"

echo "Removed managed skills."
echo "Backup dir: $BACKUP_DIR"
echo "Please restart Codex."

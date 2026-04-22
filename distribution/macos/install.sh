#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PACKAGE_ROOT="$SCRIPT_DIR"
PAYLOAD_DIR="$PACKAGE_ROOT/skills"
VERSION_FILE="$PACKAGE_ROOT/VERSION"
SKILLS=(deep-research academic-paper academic-paper-reviewer academic-pipeline)

CODEX_HOME_DIR="${CODEX_HOME:-$HOME/.codex}"
TARGET_SKILLS_DIR="$CODEX_HOME_DIR/skills"
TIMESTAMP="$(date +%Y%m%d-%H%M%S)"
BACKUP_DIR="$CODEX_HOME_DIR/skill_backups/academic-research-skills/$TIMESTAMP"
INSTALLED_VERSION_FILE="$CODEX_HOME_DIR/academic-research-skills.version"

echo "==> Codex home: $CODEX_HOME_DIR"
echo "==> Target skills dir: $TARGET_SKILLS_DIR"

mkdir -p "$TARGET_SKILLS_DIR"
mkdir -p "$BACKUP_DIR"

for skill in "${SKILLS[@]}"; do
  if [[ ! -f "$PAYLOAD_DIR/$skill/SKILL.md" ]]; then
    echo "Missing payload: $PAYLOAD_DIR/$skill/SKILL.md" >&2
    exit 1
  fi
done

for skill in "${SKILLS[@]}"; do
  target="$TARGET_SKILLS_DIR/$skill"
  source="$PAYLOAD_DIR/$skill"
  if [[ -e "$target" ]]; then
    echo "==> Backing up $skill"
    mv "$target" "$BACKUP_DIR/$skill"
  fi
  echo "==> Installing $skill"
  cp -R "$source" "$target"
done

if [[ -f "$VERSION_FILE" ]]; then
  cp "$VERSION_FILE" "$INSTALLED_VERSION_FILE"
fi

echo
echo "Installed skills:"
for skill in "${SKILLS[@]}"; do
  echo "  - $skill"
done
echo "Backup dir: $BACKUP_DIR"
echo "Please restart Codex."

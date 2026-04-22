#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd -- "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
DIST_DIR="$ROOT_DIR/dist"
TMP_DIR="$DIST_DIR/.build"
COMMON_DIR="$ROOT_DIR/distribution/common"
MAC_SRC_DIR="$ROOT_DIR/distribution/macos"
WIN_SRC_DIR="$ROOT_DIR/distribution/windows"
SKILL_DIRS=(deep-research academic-paper academic-paper-reviewer academic-pipeline)

build_package() {
  local platform="$1"
  local source_dir="$2"
  local package_dir="$DIST_DIR/codex-academic-skills-$platform"

  rm -rf "$package_dir"
  mkdir -p "$package_dir/skills"

  cp "$COMMON_DIR/VERSION" "$package_dir/VERSION"
  cp "$COMMON_DIR/README.zh-CN.md" "$package_dir/README.zh-CN.md"
  cp -R "$source_dir/." "$package_dir/"

  for skill in "${SKILL_DIRS[@]}"; do
    cp -R "$ROOT_DIR/$skill" "$package_dir/skills/$skill"
  done
}

zip_package() {
  local platform="$1"
  local package_dir="$DIST_DIR/codex-academic-skills-$platform"
  local zip_path="$DIST_DIR/codex-academic-skills-$platform.zip"

  rm -f "$zip_path"
  (
    cd "$DIST_DIR"
    ditto -c -k --sequesterRsrc --keepParent "codex-academic-skills-$platform" "$zip_path"
  )
}

rm -rf "$TMP_DIR"
mkdir -p "$DIST_DIR"

build_package "macos" "$MAC_SRC_DIR"
build_package "windows" "$WIN_SRC_DIR"

chmod +x \
  "$DIST_DIR/codex-academic-skills-macos/install.command" \
  "$DIST_DIR/codex-academic-skills-macos/update.command" \
  "$DIST_DIR/codex-academic-skills-macos/uninstall.command" \
  "$DIST_DIR/codex-academic-skills-macos/install.sh" \
  "$DIST_DIR/codex-academic-skills-macos/update.sh" \
  "$DIST_DIR/codex-academic-skills-macos/uninstall.sh"

zip_package "macos"
zip_package "windows"

echo "Done:"
echo "  $DIST_DIR/codex-academic-skills-macos"
echo "  $DIST_DIR/codex-academic-skills-macos.zip"
echo "  $DIST_DIR/codex-academic-skills-windows"
echo "  $DIST_DIR/codex-academic-skills-windows.zip"

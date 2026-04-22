#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"
bash "$SCRIPT_DIR/update.sh"
echo
read -r -p "按回车键关闭窗口..." _

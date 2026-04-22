# Codex 离线安装包说明

本目录用于生成两套面向客户的离线安装包：

- `macOS`
- `Windows`

设计目标：

- 不依赖 GitHub 在线访问
- 自动识别 Codex 安装目录
- 先备份旧版本，再安装新版本
- 统一安装这 4 个技能：
  - `deep-research`
  - `academic-paper`
  - `academic-paper-reviewer`
  - `academic-pipeline`

路径规则：

- macOS
  - 若设置了 `CODEX_HOME`，安装到 `$CODEX_HOME/skills`
  - 否则安装到 `~/.codex/skills`
- Windows
  - 若设置了 `CODEX_HOME`，安装到 `%CODEX_HOME%\\skills`
  - 否则安装到 `%USERPROFILE%\\.codex\\skills`

备份规则：

- 备份目录位于 `CODEX_HOME/skill_backups/academic-research-skills/<timestamp>/`

构建方式：

```bash
bash distribution/build-packages.sh
```

构建产物：

- `dist/codex-academic-skills-macos/`
- `dist/codex-academic-skills-macos.zip`
- `dist/codex-academic-skills-windows/`
- `dist/codex-academic-skills-windows.zip`

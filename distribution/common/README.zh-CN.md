# Codex Academic Research Skills 离线安装包

这个安装包用于把以下 4 个技能离线安装到 Codex：

- `deep-research`
- `academic-paper`
- `academic-paper-reviewer`
- `academic-pipeline`

默认推荐入口：

- `academic-pipeline`

## 安装路径

安装脚本会自动判断 Codex 技能目录：

- macOS
  - 优先：`$CODEX_HOME/skills`
  - 默认：`~/.codex/skills`
- Windows
  - 优先：`%CODEX_HOME%\skills`
  - 默认：`%USERPROFILE%\.codex\skills`

## 备份路径

安装、更新、卸载前，脚本会先备份当前同名技能目录：

- `CODEX_HOME/skill_backups/academic-research-skills/<时间戳>/`

## 安装后

完成后请重启 Codex。

## 推荐测试句

完整流程：

```text
我想写一篇关于 AI 对高等教育质量保障影响的研究论文
```

只做研究：

```text
帮我做这个主题的文献研究与问题收敛
```

只做审稿：

```text
帮我 review 这篇论文
```

## 许可证提醒

原项目当前许可证是 **CC BY-NC 4.0**。该安装包不改变许可证。

如果你要把这套技能用于收费客户、商业交付、商业产品或商业服务，请先审查许可证并联系原作者确认授权范围。

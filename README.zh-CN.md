# Academic Research Skills for Codex（简体中文说明）

这是基于原项目 [`Imbad0202/academic-research-skills`](https://github.com/Imbad0202/academic-research-skills) 维护的一个 **Codex 分发版 fork**，目标是让这套技能更方便地安装到 Codex，并作为稳定版本提供给自己或客户使用。

## 这个 fork 的定位

- 保留原项目的 4 个核心技能结构
- 作为 Codex 的稳定安装入口
- 增加 Codex 使用说明
- 保留本地已验证的轻量改动
  - 技能描述简体中文化
  - 面向 Codex 的安装与调用约定

默认推荐入口：`academic-pipeline`

## 包含的 4 个技能

- `deep-research`
  - 深度研究、文献回顾、事实核查、系统综述、研究问题收敛
- `academic-paper`
  - 学术论文写作、摘要、结构、大纲、修订、格式转换
- `academic-paper-reviewer`
  - 多视角审稿、复审、快速评估、方法学评审
- `academic-pipeline`
  - 全流程编排器，负责把上面 3 个技能串起来

## 安装到 Codex

在目标机器上执行：

```bash
python3 ~/.codex/skills/.system/skill-installer/scripts/install-skill-from-github.py \
  --repo 18651813481/academic-research-skills \
  --path deep-research academic-paper academic-paper-reviewer academic-pipeline
```

安装后重启 Codex。

## 中国大陆 / 客户交付建议

如果目标用户访问 GitHub 不稳定，建议不要让用户直接在线安装。

推荐做法：

- 使用离线安装包
- 按操作系统分发两个版本：
  - macOS
  - Windows
- 安装脚本自动识别路径：
  - macOS：`$CODEX_HOME/skills`，默认 `~/.codex/skills`
  - Windows：`%CODEX_HOME%\\skills`，默认 `%USERPROFILE%\\.codex\\skills`
- 安装、更新、卸载前都会先备份旧版本
- macOS 安装包提供可双击的 `.command` 入口
- Windows 安装包提供可双击的 `.bat` 入口

仓库中的安装包构建说明见：

- [`distribution/README.zh-CN.md`](distribution/README.zh-CN.md)

## 推荐使用方式

日常默认使用：

- `academic-pipeline`

按场景直调：

- 只做研究：`deep-research`
- 只写论文：`academic-paper`
- 只做审稿 / 复审：`academic-paper-reviewer`

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

## 更新策略

建议不要让最终用户直接从 upstream 安装。

推荐做法：

- 用户只从这个 fork 安装
- 你在本 fork 中跟踪 upstream
- 先验证，再合并，再发布稳定 tag
- 客户安装时优先使用经过验证的 tag，而不是直接追 `main`

## 许可证说明

原项目当前许可证是 **CC BY-NC 4.0**，本 fork 不改变许可证。

这意味着：

- 个人学习、研究、非商业内部使用相对直接
- 如果你要把它用于收费客户、商业交付、商业产品或商业服务，请先审查许可证并联系原作者确认授权范围

## 上游项目

- Upstream: [Imbad0202/academic-research-skills](https://github.com/Imbad0202/academic-research-skills)

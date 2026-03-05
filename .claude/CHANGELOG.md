# Academic Research Skills 更新紀錄

跨 skill 修復與更新歷史紀錄。同步自 [hei-skills-package](https://github.com/Imbad0202/hei-skills-package)。

---

## 2025-03-05

### v2.2 / v1.3 Cross-Agent Quality Alignment Update (4 skills)

**修改檔案**: 19 files across 4 skills (+550 lines)

**deep-research v2.2**:
- Added cross-agent quality alignment definitions (peer-reviewed, currency rule, CRITICAL severity, source tier, minimum source count, verification threshold)
- Synthesis anti-patterns, Socratic quantified thresholds & auto-end conditions
- Reference existence verification (DOI + WebSearch)
- Enhanced ethics reference integrity check (50% + Retraction Watch)
- Mode transition matrix

**academic-paper v2.2**:
- 4-level argument strength scoring with quantified thresholds
- Plagiarism & retraction screening protocol
- F11 Desk-Reject Recovery + F12 Conference-to-Journal Conversion failure paths
- Plan → Full mode conversion protocol

**academic-paper-reviewer v1.3**:
- DA vs R3 role boundaries with explicit responsibility tables
- CRITICAL finding criteria with concrete examples
- Consensus classification (CONSENSUS-4/3/SPLIT/DA-CRITICAL)
- Confidence Score weighting rules
- Asian & Regional Journals reference (TSSCI + Asia-Pacific + OA options)

**academic-pipeline v2.2**:
- Checkpoint confirmation semantics (6 user commands with precise actions)
- Mode switching rules (safe/dangerous/prohibited matrix)
- Skill failure fallback matrix (per-stage degradation strategies)
- State ownership protocol (single source of truth with write access control)
- Material version control (versioned artifacts with audit trail)

---

## 2026-03-01

### Simplify Academic Research Skills SKILL.md (4 files)

**動機**: 4 個 academic research skills 合計 2,254 行，含大量跨 skill 重複、內嵌但已有 template 檔的冗餘內容。

**修改檔案**:
- `academic-paper-reviewer/SKILL.md`（570→470, -100 行）
- `academic-pipeline/SKILL.md`（675→535, -140 行）
- `deep-research/SKILL.md`（469→435, -34 行）
- `academic-paper/SKILL.md`（540→443, -97 行）

**修改摘要**:
- A: Reviewer 移除內嵌模板，改引用 `templates/` 檔案（保留 Devil's Advocate 特殊格式說明）
- B: Pipeline 移除 ASCII state machine，改為精簡 9-stage 列表 + 引用 reference
- C: Pipeline 精簡 Two-Stage Review Protocol，只保留輸入/輸出/分支
- D: 3 個 skill 的 "Full Academic Pipeline" 改為一行引用 `academic-pipeline/SKILL.md`
- E: 4 個 skill 精簡路由表，移除已在根 CLAUDE.md 定義的 HEI 路由
- F+G: 移除 deep-research 和 academic-paper 的重複 Mode Selection 區塊
- H: academic-paper Handoff Protocol 精簡為概述 + 引用上游
- I: academic-paper Phase 0 Config 改引用 `agents/intake_agent.md`
- J: 4 個 skill Output Language 各精簡為 1 行
- K: 修復 revision loop cap 矛盾（pipeline 覆蓋 academic-paper 的 max 2 規則）

**結果**: 2,254→1,883 行（-371 行, -16.5%），371 項品質測試全通過

**教訓**: SKILL.md 內嵌完整 template 內容是不必要的冗餘——只要 template 檔案存在且路徑正確，一行引用即可

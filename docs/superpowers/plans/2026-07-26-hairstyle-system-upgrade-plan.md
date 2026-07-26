# 发型体系升级 Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** 将发型能力从 12 款零散预设升级为 6 维结构化词库 + 25+ 完整预设的系统，覆盖全部 11 个 Skill。

**Architecture:** 底层新建 `knowledge/hairstyles.md` 作为结构化发型知识库，中层通过预设标签（新娘/运动/魅力等）实现场景化子集，上层各 Skill 按自身定位以统一的"触发-选款-插入"模式接入。旧 `hairstyle-reference.md` 保留为兼容重定向。

**Tech Stack:** Markdown SKILL.md files, shared knowledge/reference pattern, mirror sync scripts

## Global Constraints

- 所有 Skill 输出格式不变，仅提升发型描述的质量和丰富度
- 默认静默原则：用户不提发型，不主动添加（结构化/创意类 Skill 除外，它们本身就是补全维度）
- 发型描述单款 15-30 字，不喧宾夺主
- 安全边界不变，不放松任何现有规则
- 保持 `../_shared/references/` 和 `../_shared/knowledge/` 相对路径引用模式
- 修改 skills/ 下 canonical 版本后，需同步到所有镜像目录（.opencode/skills/ 等）
- 镜像同步和元数据验证脚本必须通过

---

## Task 1: 构建结构化发型知识库（核心）

**Files:**
- Create: `skills/_shared/knowledge/hairstyles.md`
- Modify: `skills/_shared/references/hairstyle-reference.md`

**Interfaces:**
- Consumes: 现有 hairstyle-reference.md 中的 12 款发型作为基础素材
- Produces: 6 维词库（长度/卷度/刘海/发色/发质/造型手法）+ 25+ 完整发型预设 + 风格标签体系 + 脸型适配标签

- [ ] **Step 1: 创建 hairstyles.md 文件结构**

创建 `skills/_shared/knowledge/hairstyles.md`，包含以下章节结构：

```markdown
# 发型知识库

## 使用说明
（触发条件、用户指定优先、随机选款规则、与各 Skill 的集成方式说明）

## 一、六维词库

### 1. 长度维度（7 款）
### 2. 卷度纹理（8 款）
### 3. 刘海类型（10 款）
### 4. 发色（13 款）
### 5. 发质发量（6 款）
### 6. 造型手法（10 款）

每款格式：
- **中文名（English Name）**：详细描述，适合的气质/场景

## 二、完整发型预设（25+ 款）

### 基础剪发（5 款）
1. 直长发 Long Straight Hair
2. 波波头 Bob Cut
3. 长波波头 Lob
4. 精灵短发 Pixie Cut
5. 公主切 Hime Cut

### 扎发盘发（5 款）
6. 高马尾 High Ponytail
7. 低马尾 Low Ponytail
8. 半扎发 Half-Up Half-Down
9. 丸子头 Top Bun
10. 低盘发 Low Bun

### 编发系列（5 款）
11. 三股麻花辫 Classic Braid
12. 鱼骨辫 Fishtail Braid
13. 法式编发 French Braid
14. 荷兰编发 Dutch Braid
15. 花环编发 Crown Braid

### 刘海与纹理（5 款）
16. 八字刘海 Curtain Bangs
17. 齐刘海 Blunt Bangs
18. 侧分刘海 Side-Swept Bangs
19. 海浪卷 Beach Waves
20. 温柔大卷 Soft Curls

### 风格化发型（5 款）
21. 港风侧分大卷 Retro Hong Kong Waves
22. 法式慵懒卷 French Lazy Curls
23. 湿发造型 Wet Hair Look
24. 狼尾层次剪 Wolf Cut / Mullet
25. 锁骨内扣 Clavicle Inward Bob

每款格式：
- **中文名（English Name）**
  - 维度标签：长度 | 卷度 | 刘海 | 推荐发色 | 发质 | 造型
  - 完整描述：（15-30 字中文长句，可直接用于 prompt）
  - 风格标签：[风格1] [风格2]（从 24 种风格路线中选，如 "法式优雅" "复古港风" "街头酷飒"）
  - 场景标签：[场景1] [场景2]（如 "日常" "职场" "约会" "运动" "婚礼" "度假"）
  - 适合脸型：[脸型1] [脸型2]
  - 避雷脸型：[脸型1]（可选）

## 三、按风格路线推荐索引

（24 种风格路线 → 各推荐 2-3 款发型，快速查表用）

## 四、发型负面提示词集

- 假发感、发型不对称、刘海变形、发色不均
- 编发结构错误、发量异常、发际线不自然
- 头发融合背景、发丝粘连、发尾分叉过度
```

- [ ] **Step 2: 填充六维词库**

按上表 6 个维度逐一填充，每款包含中文名、英文名、1-2 句详细描述。确保用词专业、具体、可直接用于 Image2 prompt。

长度（7）：超短发、精灵短发、短 Bob（下巴长度）、锁骨发、中长发（齐肩到胸）、长发（胸到腰）、及腰长发

卷度纹理（8）：直发、内扣、微卷、波浪卷（大S型）、羊毛卷（小卷蓬松）、泡面卷（紧密小卷）、湿发（水润贴服）、自然蓬松（无明显卷度，有空气感）

刘海（10）：无刘海露额、中分、侧分（三七/四六）、八字刘海、法式刘海、空气刘海、齐刘海（漫画刘海）、眉上刘海、胎毛刘海、公主切（姬发式）

发色（13）：自然黑、黑茶色、深棕色、栗棕色、蜜茶棕、亚麻金、白金浅金、酒红色、灰蓝色（雾霾蓝）、粉棕色、挑染（highlight）、渐变 balayage、挂耳染

发质发量（6）：细软服帖、正常发质、粗硬浓密、自然卷（自来卷）、毛躁蓬松、贴头皮（发量少）

造型手法（10）：自然披散、低马尾（颈后）、高马尾（头顶）、半扎发（公主头）、丸子头（花苞头）、低盘发（发髻）、法式编发、鱼骨辫、麻花辫（三股）、花环编发

- [ ] **Step 3: 填充 25 款完整发型预设**

基于六维词库组合出 25 款预设，每款填写完整信息。从原有 12 款发型升级而来，确保覆盖：
- 基础剪发 5 款（直长发、Bob、Lob、Pixie、公主切）
- 扎发盘发 5 款（高马尾、低马尾、半扎发、丸子头、低盘发）
- 编发系列 5 款（三股辫、鱼骨辫、法式编、荷兰编、花环编）
- 刘海与纹理 5 款（八字刘海、齐刘海、侧分刘海、海浪卷、温柔大卷）
- 风格化发型 5 款（港风侧分大卷、法式慵懒卷、湿发造型、狼尾层次、锁骨内扣）

每款的"完整描述"必须是自然流畅的中文长句，可直接复制进 prompt，例如：
> 深黑色长直发，中分露额，发丝顺滑有丝绸光泽，发尾齐整及腰，清冷高级感。

- [ ] **Step 4: 填写风格路线推荐索引**

按仓库 24 种风格路线（甜美少女、清冷仙气、古典东方、明艳大女主、知性职场、法式优雅、复古港风、韩系温柔、日系清新、学院文艺、运动活力、街头酷飒、机能未来、暗黑哥特、甜酷辣妹、温柔居家、精致内衣、泳装度假、黑丝成熟、旗袍风情、汉服仙侠、洛丽塔、波西米亚、雨天文艺、婚纱纯净），每种推荐 2-3 款发型，做成快速查表。

- [ ] **Step 5: 升级旧 hairstyle-reference.md 为重定向文件**

将 `skills/_shared/references/hairstyle-reference.md` 内容替换为：

```markdown
# 发型参考（已迁移）

本文件已迁移到 `../knowledge/hairstyles.md`，包含 6 维结构化词库和 25+ 款完整发型预设。

## 兼容说明

- 原有 12 款发型预设已全部并入新知识库的 25+ 款中
- 调用方式不变：用户明确触发发型时，从 hairstyles.md 的预设中选择
- 触发规则、安全边界、使用方式与之前完全一致

请查阅 `../knowledge/hairstyles.md` 获取完整发型体系。
```

- [ ] **Step 6: 验证知识库完整性**

检查以下各项：
- [ ] 6 个维度的词条数量与清单一致（7+8+10+13+6+10 = 54 个维度词条）
- [ ] 25 款完整预设全部填写完毕，格式统一
- [ ] 每款预设都有完整描述（15-30 字中文长句）
- [ ] 每款预设都有风格标签和场景标签
- [ ] 24 种风格路线都在推荐索引中有对应推荐
- [ ] 发型负面提示词集完整（8-10 条）

- [ ] **Step 7: 提交**

```bash
git add skills/_shared/knowledge/hairstyles.md skills/_shared/references/hairstyle-reference.md
git commit -m "feat: 新增结构化发型知识库 hairstyles.md (6维词库+25款预设)"
```

---

## Task 2: 发型 × 脸型搭配指南

**Files:**
- Create: `skills/_shared/references/face-shape-hairstyle-guide.md`

**Interfaces:**
- Consumes: hairstyles.md 中的 25 款预设 + 现有 face-shape-reference.md 的 6 种脸型
- Produces: 6 种脸型 × 推荐/避雷发型对照表

- [ ] **Step 1: 读取现有脸型参考**

先读 `skills/_shared/references/face-shape-reference.md`，确认 6 种脸型的名称和描述（鹅蛋脸、圆形脸、方形脸、长形脸、心形脸、菱形脸），确保用词一致。

- [ ] **Step 2: 创建搭配指南文件**

创建 `skills/_shared/references/face-shape-hairstyle-guide.md`，内容结构：

```markdown
# 发型 × 脸型搭配指南

## 使用说明
（供 portrait-director 推荐时参考，供 risk-debugger 修复时参考；仅在用户明确提到脸型或需要推荐时使用，不默认添加）

## 脸型分类与发型搭配

### 鹅蛋脸 Oval Face
- 适合发型：几乎所有发型
- 推荐预设：（从 hairstyles.md 中选 5-8 款最适合的）
- 避雷：几乎无雷区

### 圆形脸 Round Face
- 修饰方向：拉长脸型、增加头顶高度、两侧收紧
- 推荐预设：（3-5 款，如高马尾、长直发、侧分大卷）
- 避雷：齐刘海、贴头皮直发、波波头

### 方形脸 Square Face
- 修饰方向：柔化下颚线条、增加柔和曲线、侧分
- 推荐预设：（3-5 款，如八字刘海长卷发、法式慵懒卷、侧分波浪）
- 避雷：利落短发、齐耳 Bob、齐刘海

### 长形脸 Long Face
- 修饰方向：增加横向宽度、齐刘海缩短脸长
- 推荐预设：（3-5 款，如齐刘海中长卷发、波波头、侧分短卷）
- 避雷：贴头皮长直、高马尾、露额超短发

### 心形脸 Heart Face
- 修饰方向：平衡上宽下窄、下颚蓬松、侧分
- 推荐预设：（3-5 款，如 Lob 长波波头、锁骨内扣、侧分中长卷）
- 避雷：露额高马尾、超短发、厚重齐刘海

### 菱形脸 Diamond Face
- 修饰方向：柔和颧骨、增加额头和下颚饱满度
- 推荐预设：（3-5 款，如八字刘海中长卷、法式刘海、侧分蓬松发）
- 避雷：贴头皮、中分长直、露额高马尾

## 快速查表

| 脸型 | 首选发型 | 避雷 |
|---|---|---|
| 鹅蛋脸 | 自由选择 | — |
| 圆形脸 | 高马尾 + 侧分长直 | 齐刘海 + 贴头皮 |
| 方形脸 | 八字刘海 + 大卷 | 利落短发 |
| 长形脸 | 齐刘海 + 蓬松卷发 | 长直 + 高马尾 |
| 心形脸 | 侧分 + 下颚蓬松 | 露额 + 超短发 |
| 菱形脸 | 侧分刘海 + 蓬松中长卷 | 中分贴头皮 |
```

- [ ] **Step 3: 验证一致性**

检查：
- [ ] 6 种脸型名称与 face-shape-reference.md 一致
- [ ] 推荐的预设名称与 hairstyles.md 完全一致
- [ ] 每种脸型至少有 3 款推荐预设

- [ ] **Step 4: 提交**

```bash
git add skills/_shared/references/face-shape-hairstyle-guide.md
git commit -m "feat: 新增发型×脸型搭配指南"
```

---

## Task 3: 参考词表新增发型专章

**Files:**
- Modify: `参考词表.md`

**Interfaces:**
- Consumes: hairstyles.md 中的维度词库、预设、风格路线推荐
- Produces: 参考词表.md 新增"发型造型速查表"章节

- [ ] **Step 1: 读取参考词表当前结构**

读取 `参考词表.md`，定位最后一个一级章节的位置（第十章「最实用的"关键词包"」），以及第十一章应该插入的位置。

注意：发型作为造型的核心维度，应该放在"衣着"之后、"按气质选择"之前最自然。但为了最小化改动（不重排所有章节号），直接在文末追加第十一章。

- [ ] **Step 2: 在参考词表末尾新增发型专章**

在 `参考词表.md` 末尾（使用说明之前）新增：

```markdown
## 十一、发型速查表

### 11.1 按长度选型

短发（下巴到耳下）：精灵短发、波波头、齐刘海短发
中发（肩到锁骨）：Lob 长波波头、锁骨内扣、法式慵懒卷
长发（胸到腰）：黑长直、大波浪卷发、港风侧分卷、鱼骨辫

### 11.2 按风格路线推荐发型

（与 hairstyles.md 的风格路线索引一致，做简化版表格，每风格列 1-2 款首选）

| 风格路线 | 推荐发型 |
|---|---|
| 清冷仙气 | 黑长直（中分）、低马尾 |
| 复古港风 | 港风侧分大卷、羊毛卷 |
| 法式优雅 | 法式慵懒卷、低盘发 |
| 知性职场 | 锁骨内扣、中长直（偏分） |
| 街头酷飒 | 狼尾层次、高马尾 |
| 运动活力 | 高马尾、丸子头、拳击辫 |
| 甜妹温柔 | 齐刘海长卷发、半扎发 |
| 婚纱纯净 | 低盘发、公主头半披发 |
| ... | ... |
（覆盖全部 24 种风格路线，各 1-2 款）

### 11.3 发色与气质对照表

| 发色 | 气质方向 | 适合风格 |
|---|---|---|
| 自然黑 | 清冷、古典、御姐 | 清冷仙气、古典东方、黑丝成熟 |
| 黑茶色 | 低调、知性、通勤 | 知性职场、韩系温柔 |
| 深棕色 | 温柔、亲和、日常 | 温柔居家、学院文艺 |
| 蜜茶棕 | 甜美、温暖、约会 | 甜美少女、韩系温柔 |
| 亚麻金 | 时尚、混血、度假 | 街头酷飒、泳装度假 |
| 酒红色 | 明艳、复古、女人味 | 明艳大女主、复古港风 |
| 灰蓝/雾霾蓝 | 酷飒、个性、未来感 | 街头酷飒、机能未来 |
| 粉棕色 | 甜酷、少女、浪漫 | 甜酷辣妹、洛丽塔 |

### 11.4 脸型适配速查

（简化版，来自 face-shape-hairstyle-guide.md）

| 脸型 | 首选 | 避雷 |
|---|---|---|
| 鹅蛋脸 | 自由选 | — |
| 圆形脸 | 高马尾/侧分长直 | 齐刘海+贴头皮 |
| 方形脸 | 八字刘海+大卷 | 利落短发 |
| 长形脸 | 齐刘海+蓬松卷 | 长直+高马尾 |
| 心形脸 | 侧分+下颚蓬松 | 露额超短发 |
| 菱形脸 | 侧分刘海+蓬松中长卷 | 中分贴头皮 |

### 11.5 发型关键词包

直接可套用的发型描述模板：
- 清冷黑长直：深黑色及腰长直发，中分露额，发丝顺滑有丝绸光泽
- 法式慵懒卷：深栗色中长发，八字刘海，自然蓬松微卷，浪漫知性
- 港风大波浪：深黑色侧分大波浪卷发，发尾蓬松浓密，90 年代复古感
- 高马尾元气：黑棕色高马尾，头顶蓬松，碎发自然垂落，青春活力
- 低盘发气质：黑棕色低盘发，发髻精致松散，碎发修饰脸型，高贵温柔
- 精灵短发：黑色精灵短发，利落有层次，耳侧微露，清冷高级
```

- [ ] **Step 3: 验证一致性**

检查：
- [ ] 发型名称与 hairstyles.md 完全一致
- [ ] 24 种风格路线全覆盖
- [ ] 发色气质表与发色维度一致
- [ ] 脸型速查与 face-shape-hairstyle-guide.md 一致

- [ ] **Step 4: 提交**

```bash
git add 参考词表.md
git commit -m "feat: 参考词表新增发型速查表专章"
```

---

## Task 4: 迁移原有 8 个 Skill 的发型引用

**Files:**
- Modify: `skills/image2-adult-glamour-studio/SKILL.md`
- Modify: `skills/image2-fashion-lingerie-lookbook/SKILL.md`
- Modify: `skills/image2-risk-debugger/SKILL.md`
- Modify: `skills/image2-aesthetic-rewriter/SKILL.md`
- Modify: `skills/image2-character-reference-sheet/SKILL.md`
- Modify: `skills/image2-character-poster-cover/SKILL.md`
- Modify: `skills/image2-structured-portrait-prompt/SKILL.md`
- Modify: `skills/image2-portrait-prompt-crafter/SKILL.md`

**Interfaces:**
- Consumes: `skills/_shared/knowledge/hairstyles.md`
- Produces: 8 个 Skill 的发型引用从 hairstyle-reference.md 升级到 hairstyles.md，并新增发型负面提示词

### 4.1 通用迁移模式

每个 Skill 需要改动的 3 处：
1. **Workflow 加载步骤**：把 `hairstyle-reference.md` 改为 `knowledge/hairstyles.md`（注意路径是 `../_shared/knowledge/hairstyles.md`）
2. **Defaults / 使用规则段落**：更新发型描述，将"从 12 款中选 1 款"改为"从 25+ 款预设中选 1 款"，并补充维度组合能力
3. **Output Format 或负面提示词**：增加发型相关负面提示词

每个 Skill 的具体改动：

- [ ] **Step 1: 迁移 adult-glamour-studio**

读 `skills/image2-adult-glamour-studio/SKILL.md`，找到：
- Workflow 中加载 hairstyle-reference.md 的那行 → 改为加载 `../_shared/knowledge/hairstyles.md`
- Defaults 中发型规则段落 → 更新为：发型从 hairstyles.md 的 25+ 款预设中选择，优先选带"魅力/成熟/高级"标签的（大波浪、低盘发、湿发、黑长直、港风侧分卷等）
- 负面限制词段落 → 追加发型负面词：假发感、发型不对称、刘海变形、发色不均、编发结构错误

提交：
```bash
git add skills/image2-adult-glamour-studio/SKILL.md
git commit -m "refactor: adult-glamour-studio 发型引用迁移到新知识库"
```

- [ ] **Step 2: 迁移 fashion-lingerie-lookbook**

读 `skills/image2-fashion-lingerie-lookbook/SKILL.md`，同样 3 处改动：
- Workflow 加载路径更新
- 发型规则：优先选带"内衣/泳装/度假"标签的（大波浪、低马尾、湿发、半扎发等）
- 负面提示词追加发型负面词

提交：
```bash
git add skills/image2-fashion-lingerie-lookbook/SKILL.md
git commit -m "refactor: fashion-lingerie-lookbook 发型引用迁移"
```

- [ ] **Step 3: 迁移 risk-debugger**

读 `skills/image2-risk-debugger/SKILL.md`：
- Workflow 加载路径更新
- 诊断维度中已有 "Hairstyle direction" → 升级描述：新增"发型画错/刘海变形/编发结构错误/发色不准"的专项诊断和修复策略
- 修复策略：当发型有问题时，从 hairstyles.md 中选择对应预设的精确描述作为修复方案
- 负面提示词增加发型负面词

提交：
```bash
git add skills/image2-risk-debugger/SKILL.md
git commit -m "feat: risk-debugger 新增发型专项诊断修复"
```

- [ ] **Step 4: 迁移 aesthetic-rewriter**

读 `skills/image2-aesthetic-rewriter/SKILL.md`：
- Workflow 加载路径更新
- 发型改写策略：低俗发型（如"双马尾""空气齐刘海"等幼态感强的）改写为成熟克制版本（如"低盘发""侧分大卷"）
- 负面提示词追加

提交：
```bash
git add skills/image2-aesthetic-rewriter/SKILL.md
git commit -m "refactor: aesthetic-rewriter 发型引用迁移"
```

- [ ] **Step 5: 迁移 character-reference-sheet**

读 `skills/image2-character-reference-sheet/SKILL.md`：
- Workflow 加载路径更新
- 发型一致性规则：从 25+ 预设中选 1 款锁定，三视图保持完全一致
- 可选 callout 面板：发型细节框（发色、发质、刘海细节）
- 负面提示词追加

提交：
```bash
git add skills/image2-character-reference-sheet/SKILL.md
git commit -m "refactor: character-reference-sheet 发型引用迁移"
```

- [ ] **Step 6: 迁移 character-poster-cover**

读 `skills/image2-character-poster-cover/SKILL.md`：
- Workflow 加载路径更新
- 发型规则：根据海报风格选款（杂志感→大波浪/极简→顺直短发/时尚→湿发造型等）
- 负面提示词追加

提交：
```bash
git add skills/image2-character-poster-cover/SKILL.md
git commit -m "refactor: character-poster-cover 发型引用迁移"
```

- [ ] **Step 7: 迁移 structured-portrait-prompt**

读 `skills/image2-structured-portrait-prompt/SKILL.md`：
- "发型方向"字段说明升级：支持直接使用预设名（如"法式慵懒卷"）或维度组合描述
- 可选变化参数中发型替换项从 1 个增加到 3 个，从预设池中选不同风格的
- 负面提示词追加发型负面词

提交：
```bash
git add skills/image2-structured-portrait-prompt/SKILL.md
git commit -m "feat: structured-portrait-prompt 发型字段升级"
```

- [ ] **Step 8: 迁移 portrait-prompt-crafter**

读 `skills/image2-portrait-prompt-crafter/SKILL.md`：
- 知识库中「发型发色」章节（原 5 款）升级为引用 hairstyles.md 六维词库的摘要版
- 结构化标签的「人物」维度中发型部分扩展
- 最终提示词生成时，发型描述从维度词库/预设中选取匹配项
- character-features.md 中的发型章节保留但做简化，标注以 hairstyles.md 为准

提交：
```bash
git add skills/image2-portrait-prompt-crafter/SKILL.md skills/_shared/knowledge/character-features.md
git commit -m "refactor: portrait-prompt-crafter 发型词库升级"
```

---

## Task 5: 为 portrait-director 新增发型路由

**Files:**
- Modify: `skills/image2-portrait-director/SKILL.md`

**Interfaces:**
- Consumes: hairstyles.md + face-shape-hairstyle-guide.md
- Produces: portrait-director 在调度时新增发型推荐和路由能力

- [ ] **Step 1: 读取 portrait-director 当前结构**

读 `skills/image2-portrait-director/SKILL.md`，了解完整 workflow、加载顺序、输出格式。

- [ ] **Step 2: 在 Workflow 中增加发型加载和处理步骤**

在 Workflow 步骤中增加：
- 加载 `../_shared/knowledge/hairstyles.md` 和 `../_shared/references/face-shape-hairstyle-guide.md`
- 发型路由逻辑：根据选定的风格路线，从 hairstyles.md 中推荐 1-2 款匹配发型
- 如果用户提到脸型，结合脸型搭配指南调整推荐
- 如果用户明确指定发型，保留用户指定并验证是否与风格匹配（不匹配时在导演扩展中提示）

- [ ] **Step 3: 在输出中增加发型部分**

在"导演扩展"或"造型建议"部分增加：
- 推荐发型：1-2 款（含名称和一句话理由）
- 可选：如果用户脸型已知，增加脸型适配说明

- [ ] **Step 4: 在参考知识库列表中增加发型相关条目**

在文件末尾的参考知识库列表中增加 hairstyles.md 和 face-shape-hairstyle-guide.md。

- [ ] **Step 5: 提交**

```bash
git add skills/image2-portrait-director/SKILL.md
git commit -m "feat: portrait-director 新增发型路由与推荐"
```

---

## Task 6: 为 wedding-portrait 新增新娘发型体系

**Files:**
- Modify: `skills/image2-wedding-portrait/SKILL.md`

**Interfaces:**
- Consumes: hairstyles.md 中标记为"婚礼/新娘"标签的预设子集
- Produces: wedding-portrait 新增完整发型逻辑

- [ ] **Step 1: 读取 wedding-portrait 当前结构**

读 `skills/image2-wedding-portrait/SKILL.md`，了解 workflow、defaults、输出格式。

- [ ] **Step 2: 新增发型加载和规则**

在 Workflow 中增加加载 `../_shared/knowledge/hairstyles.md`。

在 Defaults 段落新增发型规则：
- 默认发型策略：根据婚纱版型自动匹配（拖尾大拖尾→低盘发 / 轻纱 A 字裙→半披发公主头 / 中式→盘发配簪 / 鱼尾→侧分低盘发）
- 用户指定发型时完全保留
- 发型必须与头纱、头饰兼容

- [ ] **Step 3: 扩充新娘发型预设说明**

在 Guidance 或相关段落列出新娘向的 8+ 款发型（从 hairstyles.md 预设中筛选+补充新娘特有款）：
- 经典低盘发、法式低盘发、花苞头盘发、公主头半披发、侧分长卷披发、中式盘发（配簪）、编发盘发、低马尾配头纱

- [ ] **Step 4: 负面提示词增加发型相关**

在负面限制词段落追加发型负面词。

- [ ] **Step 5: 参考知识库列表增加 hairstyles.md**

在文件末尾参考知识库列表中增加发型知识库。

- [ ] **Step 6: 提交**

```bash
git add skills/image2-wedding-portrait/SKILL.md
git commit -m "feat: wedding-portrait 新增新娘发型体系"
```

---

## Task 7: 为 sports-venue-portrait 新增运动发型体系

**Files:**
- Modify: `skills/image2-sports-venue-portrait/SKILL.md`

**Interfaces:**
- Consumes: hairstyles.md 中标记为"运动/活力"标签的预设子集
- Produces: sports-venue-portrait 新增完整发型逻辑

- [ ] **Step 1: 读取 sports-venue-portrait 当前结构**

读 `skills/image2-sports-venue-portrait/SKILL.md`，了解 workflow、defaults、输出格式。

- [ ] **Step 2: 新增发型加载和规则**

在 Workflow 中增加加载 `../_shared/knowledge/hairstyles.md`。

在 Defaults 段落新增发型规则：
- 默认发型策略：从运动发型子集中随机选 1 款（高马尾、拳击辫/鱼骨辫、丸子头、发带造型、湿发感高马尾）
- 用户指定发型时完全保留
- 运动发型强调：利落、不挡脸、有运动感、碎发自然

- [ ] **Step 3: 扩充运动发型预设说明**

在 Guidance 或相关段落列出运动向的 6+ 款发型（从 hairstyles.md 预设中筛选）：
- 高马尾、拳击辫（双麻花辫）、丸子头、发带高马尾、湿发背头、低马尾

- [ ] **Step 4: 负面提示词增加发型相关**

- [ ] **Step 5: 参考知识库列表增加 hairstyles.md 和 character-features.md**

注意：当前 sports-venue-portrait 甚至没有加载 character-features.md，补上。

- [ ] **Step 6: 提交**

```bash
git add skills/image2-sports-venue-portrait/SKILL.md
git commit -m "feat: sports-venue-portrait 新增运动发型体系"
```

---

## Task 8: 镜像同步与回归验证

**Files:**
- 全部 11 个 Skill 的镜像目录（.opencode/skills/ 等）

**Interfaces:**
- Consumes: skills/ 下 canonical 版本的所有改动
- Produces: 所有镜像目录同步完成，验证脚本通过

- [ ] **Step 1: 找到镜像同步脚本或机制**

查看仓库中是否有同步脚本（package.json、Makefile、或 scripts/ 目录）。如果没有手动同步方式，参考现有镜像目录结构手动同步。

- [ ] **Step 2: 同步所有新增和修改的文件**

把 Task 1-7 中改动过的所有文件，同步到对应的镜像目录：
- `.opencode/skills/` 下的 11 个 Skill
- 共享文件同步到各镜像的 `_shared/` 目录（如果镜像有自己的 _shared）
- 参考词表.md 同步（如果在镜像中有副本）

注意：先确认镜像目录结构。有些镜像可能直接引用 skills/ 下的共享文件，需要逐一确认。

- [ ] **Step 3: 运行验证脚本**

如果有验证脚本（如 skill mirrors and metadata 验证），运行它：

```bash
# 找到并运行验证命令
```

预期：全部通过，无报错。

- [ ] **Step 4: 人工抽检 3 个 Skill**

从以下各选 1 个，人工检查镜像与 canonical 版本内容一致：
- adult-glamour-studio（原有发型引用，属于迁移类）
- wedding-portrait（新增发型逻辑，属于新增类）
- hairstyles.md 共享知识库文件

- [ ] **Step 5: 提交镜像同步**

```bash
git add .opencode/skills/
# 如有其他镜像目录也 add
git commit -m "sync: 同步发型体系升级到所有 skill 镜像"
```

---

## 自检清单

写完计划后检查：

- [ ] Spec 中每个需求都对应到了任务：6 维词库 ✓、25+ 预设 ✓、脸型搭配 ✓、参考词表 ✓、11 个 Skill 接入 ✓、发型负面词 ✓、risk-debugger 修复 ✓
- [ ] 没有占位符（TBD/TODO/"类似 Task N"等）
- [ ] 文件名和路径前后一致（hairstyles.md 路径在所有引用中一致）
- [ ] 每个 Task 有明确的产出和提交
- [ ] Task 顺序正确（知识库先于 Skill 迁移，新增类 Skill 在迁移之后，镜像同步在最后）

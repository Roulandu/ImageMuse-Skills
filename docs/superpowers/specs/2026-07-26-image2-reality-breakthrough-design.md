# Image2 Reality Breakthrough Skill 设计文档

**技能名**：`image2-reality-breakthrough`
**中文名**：破壁而出
**创建日期**：2026-07-26
**状态**：设计完成，待实现

---

## 一、概述

生成「人物从媒介中破壁而出」的超现实人像提示词。用户选择一个媒介（纸上、屏幕、社交 App、印刷品、艺术画作、复古媒介、数字界面、装置场景），技能输出 2D→3D 过渡错觉效果的完整 Image2 中文提示词。

核心视觉卖点：真实人物从某一平面媒介中"苏醒/走出/浮现"，形成强烈的虚实交错错觉。

定位为与 `image2-wedding-portrait`、`image2-cosplay-glamour` 平级的专项技能。

---

## 二、目标与非目标

### 目标

- 覆盖 8 大类媒介、37 条子路线的破壁视觉
- 每条子路线有独特过渡模板、默认主体气质、默认画幅
- 输出遵循共享 output-contract，增加"破壁设定卡"专属扩展
- 与现有 `_shared/core/` 和 `_shared/knowledge/` 体系完全兼容
- `image2-portrait-director` 可识别关键词并委托到本技能

### 非目标

- 不做图片生成（除非用户明确说"直接出图"）
- 不 delegate 给其他技能生成人物（复用知识库但不嵌套调用）
- 不做男性/儿童主体（默认成年女性，同其他人像技能一致）
- 不做视频/动效生成

---

## 三、路线总览

### 3.1 八大路线

| 大路线 ID | 中文名 | 子路线数 | 核心关键词 |
|-----------|--------|---------|-----------|
| `paper` | 纸上成真 | 4 | 纸上、设计稿、手稿、漫画、设定稿、插画、水墨画 |
| `screen` | 屏幕成真 | 3 | 手机里、电脑屏幕、平板、显示屏 |
| `social-app` | 社交App成真 | 6 | 朋友圈、小红书、微博、抖音、快手、淘宝 |
| `print` | 印刷品成真 | 7 | 杂志封面、海报、广告牌、明信片、邮票、书籍封面、老照片 |
| `art-painting` | 艺术画作成真 | 6 | 油画、水彩、水墨、素描、壁画、涂鸦 |
| `vintage-media` | 复古媒介成真 | 5 | 宝丽来、拍立得、胶片、底片、CRT、老电视、CD、录像带 |
| `digital-ui` | 数字界面成真 | 5 | 网页、弹窗、PS图层、PPT、游戏加载、代码 |
| `installation` | 装置场景成真 | 5 | 霓虹灯、橱窗、镜子、全息投影、立体贺卡 |

**合计 37 条子路线**。

### 3.2 子路线清单

#### paper（纸上成真）
- `fashion-sketch` — 时尚设计稿
- `comic-manga` — 漫画/动漫
- `design-sheet` — 服饰设定稿
- `chinese-painting` — 国画/水墨画

#### screen（屏幕成真）
- `phone-screen` — 手机屏幕
- `computer-screen` — 电脑屏幕
- `tablet-screen` — 平板屏幕

#### social-app（社交App成真）
- `wechat-moments` — 微信朋友圈
- `xiaohongshu` — 小红书
- `weibo` — 微博
- `douyin` — 抖音
- `kuaishou` — 快手
- `taobao` — 淘宝详情页

#### print（印刷品成真）
- `magazine-cover` — 杂志封面
- `movie-poster` — 电影海报
- `billboard` — 户外广告牌
- `postcard` — 明信片
- `postage-stamp` — 邮票
- `book-cover` — 书籍封面
- `old-photo` — 老照片冲印

#### art-painting（艺术画作成真）
- `oil-painting` — 油画
- `watercolor` — 水彩画
- `ink-painting` — 水墨国画
- `sketch` — 素描
- `mural` — 壁画
- `graffiti` — 涂鸦墙

#### vintage-media（复古媒介成真）
- `polaroid` — 宝丽来/拍立得
- `film-negative` — 胶片底片
- `crt-tv` — 显像管老电视
- `cd-cover` — CD/磁带封面
- `vhs-tape` — VHS录像带

#### digital-ui（数字界面成真）
- `webpage-popup` — 网页弹窗
- `photoshop-layers` — PS图层面板
- `ppt-slide` — PPT幻灯片
- `game-loading` — 游戏加载界面
- `code-editor` — 代码编辑器

#### installation（装置场景成真）
- `neon-sign` — 霓虹灯牌
- `showcase-window` — 橱窗模特
- `mirror-reflection` — 镜子倒影
- `hologram` — 全息投影
- `popup-card` — 立体贺卡

---

## 四、文件结构

```
image2-reality-breakthrough/
├── SKILL.md                      # 主技能文件
└── routes/
    ├── paper/
    │   ├── _registry.md          # 本子路线清单 + 触发关键词映射
    │   ├── fashion-sketch.md
    │   ├── comic-manga.md
    │   ├── design-sheet.md
    │   └── chinese-painting.md
    ├── screen/
    │   ├── _registry.md
    │   ├── phone-screen.md
    │   ├── computer-screen.md
    │   └── tablet-screen.md
    ├── social-app/
    │   ├── _registry.md
    │   ├── wechat-moments.md
    │   ├── xiaohongshu.md
    │   ├── weibo.md
    │   ├── douyin.md
    │   ├── kuaishou.md
    │   └── taobao.md
    ├── print/
    │   ├── _registry.md
    │   ├── magazine-cover.md
    │   ├── movie-poster.md
    │   ├── billboard.md
    │   ├── postcard.md
    │   ├── postage-stamp.md
    │   ├── book-cover.md
    │   └── old-photo.md
    ├── art-painting/
    │   ├── _registry.md
    │   ├── oil-painting.md
    │   ├── watercolor.md
    │   ├── ink-painting.md
    │   ├── sketch.md
    │   ├── mural.md
    │   └── graffiti.md
    ├── vintage-media/
    │   ├── _registry.md
    │   ├── polaroid.md
    │   ├── film-negative.md
    │   ├── crt-tv.md
    │   ├── cd-cover.md
    │   └── vhs-tape.md
    ├── digital-ui/
    │   ├── _registry.md
    │   ├── webpage-popup.md
    │   ├── photoshop-layers.md
    │   ├── ppt-slide.md
    │   ├── game-loading.md
    │   └── code-editor.md
    └── installation/
        ├── _registry.md
        ├── neon-sign.md
        ├── showcase-window.md
        ├── mirror-reflection.md
        ├── hologram.md
        └── popup-card.md
```

共 1 个 SKILL.md + 8 个 `_registry.md` + 37 个子路线文件 = **46 个文件**。

---

## 五、工作流

### 5.1 主流程

1. **加载核心契约**：读取 `../_shared/core/output-contract.md`、`../_shared/core/quality-gates.md`、`../_shared/core/parameter-schema.md`、`../_shared/core/conflict-resolution.md`、`../_shared/core/reference-image-policy.md`
2. **解析用户输入**：锁定所有安全明确参数（人物描述、服装、画幅、气质等）
3. **识别大路线**：根据关键词在 8 大路线中匹配一个
   - 匹配失败或模糊 → 返回 8 个大路线选项，中止生成
4. **加载大路线注册表**：读取对应 `routes/{routeId}/_registry.md`
5. **识别子路线**：根据关键词在子路线中匹配一个
   - 匹配失败或模糊 → 返回该大路线下所有子路线选项，中止生成
6. **加载子路线文件**：获取视觉指纹、过渡模板、默认主体、默认画幅、场景道具、负面词补充
7. **检查图片风格**：用户未指定时，让用户二选一（iPhone直出 / 单反质感）
8. **组装输出**：按输出契约生成六段式结果 + 破壁设定卡
9. **质量门检查**：通用质量门 + 破壁专项检查
10. **返回结果**

### 5.2 分步交互规则

- **大路线未确定**：只返回 8 个大路线选项（中文名 + 一句话描述）
- **大路线已确定、子路线未确定**：只返回该大路线下的子路线选项
- **子路线已确定、图片风格未选**：只返回图片风格二选一
- **全部确定**：返回完整输出

---

## 六、子路线文件格式

每条子路线文件遵循以下固定结构：

```markdown
# 子路线中文名

## 触发关键词
（逗号分隔，中英文混合，用于自动匹配）

## 视觉指纹
（一句话描述这条路线最核心的视觉特征）

## 过渡模板
（分点描述从媒介到真实的渐变方式，是这条路线的灵魂）
- 完全写实区域：...
- 过渡融合区域：...
- 纯媒介区域：...
- 过渡比例：（如 上40%写实 / 中20%融合 / 下40%媒介）

## 默认主体气质
（按路线匹配的默认人物描述，20岁及以上成年女性）

## 默认画幅
（比例 + 方向 + 画质描述）

## 场景与道具
（媒介周围的环境元素，营造真实感和叙事感）

## 负面词补充
（这条路线特有的避坑项，追加到通用负面词后）
```

---

## 七、输出契约

基于共享 output-contract 的六段式，增加"破壁设定卡"专属扩展段。

### 7.1 完整输出结构

```
1. 意图摘要
2. 已锁定参数
3. 破壁设定卡          ← 专属扩展
   - 大路线 / 子路线
   - 媒介材质
   - 过渡方式（简述）
   - 默认主体气质
4. 最终中文提示词
5. 负面限制词
6. 可选变化参数
```

### 7.2 最终中文提示词组成

最终提示词必须包含以下要素，顺序可根据流畅度调整：

1. 画幅参数（比例 + 方向 + 画质 + 数量）
2. 视角与构图描述
3. 媒介环境整体描述
4. 主体人物描述（原创成年女性，写实）
5. 服装与造型描述
6. 破壁过渡效果（从媒介到真实的渐变细节）
7. 媒介内的对应内容（与人物一致的 2D 版本）
8. 场景道具与环境细节
9. 光线与氛围
10. 质感与后期描述
11. 人物互动与眼神方向

### 7.3 负面限制词组成

- 通用负面词（同其他人像技能：幼态、学生、真人相似、塑料皮肤、解剖错误等）
- 破壁专项负面词（漂浮感、硬边缘过渡、媒介内人物与真人不一致等）
- 子路线专属负面词（从子路线文件的"负面词补充"读取）

---

## 八、默认值与覆盖规则

### 8.1 主体默认

- 每个子路线有自己的「默认主体气质」描述
- 用户明确指定人物时，覆盖默认值
- 未指定时使用子路线默认值
- 所有默认主体必须符合：`原创成年东方女性（或对应路线的人种），20岁及以上`

### 8.2 画幅默认

- 每个子路线有自己的「默认画幅」
- 用户明确指定时覆盖
- 未指定时使用子路线默认值
- 画幅格式遵循 `image2-canvas-parameters.md` 规范

### 8.3 图片风格

- 未指定时必须让用户二选一：
  1. iPhone 手机直出质感
  2. 专业单反相机写真质感
- 同 `image2-wedding-portrait` 和 `image2-cosplay-glamour` 的规则一致

### 8.4 服装默认

- 每个子路线有推荐的服装方向（隐含在视觉指纹/场景中）
- 用户指定服装时优先使用用户描述
- 未指定时根据子路线气质 + 知识库 `fashion.md` 生成一套完整服装描述

---

## 九、质量门

### 9.1 通用质量门（复用 _shared/core/quality-gates.md）

- 成年状态
- 构图安全
- 解剖正确
- 文字/水印安全
- 一致性
- 画幅完整性
- 无漂移

### 9.2 破壁专项质量门

1. **过渡自然**：媒介到真实的过渡是渐变的，没有硬切割边缘
2. **人物一致**：媒介内的 2D 人物与破壁的 3D 人物是同一个人（同一服装、同一发型、同一五官特征）
3. **物理接触真实**：人物与媒介有真实的接触阴影、压力形变（如纸张压痕、屏幕反光），没有漂浮感
4. **比例协调**：破壁人物与媒介的相对比例合理，不出现过大或过小
5. **媒介内容可信**：媒介内的内容符合真实媒介特征（如杂志有刊期、手机有状态栏、漫画有对话框）
6. **无品牌侵权风险**：社交 App、杂志、品牌名等使用虚构近似名，不使用真实 Logo 和品牌名

---

## 十、与现有技能体系的关系

### 10.1 复用资源

- `_shared/core/` 全部 5 个核心文件
- `_shared/knowledge/` 知识库（人物特征、发型、构图、光线、焦段、姿势、场景、服装、风格、后期）
- `_shared/references/image2-canvas-parameters.md`

### 10.2 Director 委托

在 `_shared/routes/route-registry.md` 的 "Specialty delegation" 段落追加：

> Delegate requests for "破壁而出"、"纸上成真"、"从屏幕里出来"、"从画里走出来"、"come to life"、"reality breakthrough" or any medium-emergence portrait concept to `image2-reality-breakthrough` (the reality-breakthrough specialty target).

### 10.3 不做嵌套委托

人物描述、服装描述等通过知识库补全，不调用其他技能（如 structured-portrait-prompt 或 wedding-portrait）做完整生成，避免多层嵌套复杂化。

---

## 十一、图片风格二选一选项

与 `image2-wedding-portrait` 和 `image2-cosplay-glamour` 保持完全一致的字面常量：

1. `整张照片必须呈现着iPhone手机直出的拍摄质感，不要出现AI痕迹，不要过度磨皮，不要美颜滤镜`
2. `整张照片必须呈现着专业单反相机的写真拍摄质感，不要出现AI痕迹，不要过度磨皮，不要过度美颜滤镜`

---

## 十二、可选变化参数

每条输出末尾提供 3-5 个可选变化方向，从以下维度中挑选与子路线相关的：

- 过渡程度变化（更偏媒介 / 更偏真实 / 对半融合）
- 姿势变体
- 画幅变体
- 光线变体
- 服装变体
- 媒介品牌/风格变体（如"换成复古杂志风"、"换成极简App界面"）

---

## 十三、边界与红线

- 不生成未成年主体
- 不生成露骨、性化、低机位身体凝视内容
- 不使用真实人物、真实品牌、真实 App 名称（使用虚构近似名）
- 不生成真实动漫/游戏/电影角色名（用 archetype 描述）
- 同 `_shared/core/quality-gates.md` 和 `adult-glamour-boundaries.md` 的全部约束

---

## 十四、实施优先级建议

第一阶段（核心验证）：SKILL.md + paper 大路线（4 条子路线）
第二阶段（高流量）：screen + social-app（9 条子路线）
第三阶段（扩展）：print + art-painting（13 条子路线）
第四阶段（特色）：vintage-media + digital-ui + installation（15 条子路线）

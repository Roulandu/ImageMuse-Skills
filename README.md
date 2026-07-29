# Image2 中文人像提示词 Skills

面向 Image2 / GPT Image 2 的中文人像提示词 Skill 集合。系统采用“艺术指导 → 摄影空间 → 提示词编译”三层引擎：先建立视觉命题、母题和决定性瞬间，再推导人物与场景、机位透视、动机光源、色彩材质关系，最后按视觉优先级编译成稳定、克制、可直接使用的生图提示词。

仓库当前提供 **13 个 Skill**，覆盖通用人像导演、创意提示词生成、固定字段 Prompt、成人魅力写真、Cosplay 魅惑、美学改写、服装 Lookbook、婚纱、体育场馆、人物海报、人物设定图、破壁超现实和失败修复。默认处理原创、成年、非露骨的人像需求；用户提供安全的明确设定时，优先保留用户设定。

## 快速开始

直接点名 Skill：

```text
使用 $image2-structured-portrait-prompt，把“复古港风、雨夜电车站、红色连衣裙、9:16”整理成固定字段清单和完整中文提示词。
```

不确定该选哪个 Skill 时，从人像导演开始：

```text
使用 $image2-portrait-director，为我的人像构想选择合适路线和专业 Skill：成年原创东方女性，篮球馆赛后氛围，球队蓝白配色，3:4。
```

默认只返回提示词文本。只有用户明确说出 **“直接出图”** 时，才进入图片生成流程；提供参考图、风格图或要求“生成提示词”不等于授权直接出图。

## 该选哪个 Skill

| Skill | 适合的需求 |
| --- | --- |
| [`$image2-portrait-director`](skills/image2-portrait-director/SKILL.md) | 不确定路线，希望先选择摄影风格、视觉 Route 或专业 Skill |
| [`$image2-portrait-prompt-crafter`](skills/image2-portrait-prompt-crafter/SKILL.md) | 一句话描述 → 创意人像提示词，含九大维度知识库与专业摄影参数 |
| [`$image2-structured-portrait-prompt`](skills/image2-structured-portrait-prompt/SKILL.md) | 把完整或零散方向整理成固定 16 字段清单和一段完整 Prompt |
| [`$image2-adult-glamour-studio`](skills/image2-adult-glamour-studio/SKILL.md) | 高级女性人像、魅力写真、时尚 editorial、商业肖像、电影感人像 |
| [`$image2-cosplay-glamour`](skills/image2-cosplay-glamour/SKILL.md) | 游戏角色、国风妖媚、动漫萌系、科幻御姐等性感魅惑 cosplay 正片 |
| [`$image2-aesthetic-rewriter`](skills/image2-aesthetic-rewriter/SKILL.md) | 把粗糙、低俗、风险高或容易失败的想法改成成熟高级版本 |
| [`$image2-fashion-lingerie-lookbook`](skills/image2-fashion-lingerie-lookbook/SKILL.md) | 内衣、泳装、试穿确认、fit check、商品展示和服装 Lookbook |
| [`$image2-wedding-portrait`](skills/image2-wedding-portrait/SKILL.md) | 婚纱照、bridal portrait、婚礼纪实和婚纱时尚 editorial |
| [`$image2-sports-venue-portrait`](skills/image2-sports-venue-portrait/SKILL.md) | 体育馆、球场、球队配色、赛事故事和运动场馆主题人像 |
| [`$image2-character-poster-cover`](skills/image2-character-poster-cover/SKILL.md) | 杂志封面、人物海报、宣传主视觉和带虚构标题的成品版式 |
| [`$image2-character-reference-sheet`](skills/image2-character-reference-sheet/SKILL.md) | 人物三视图、全身转面、面部特写和服装材质设定板 |
| [`$image2-reality-breakthrough`](skills/image2-reality-breakthrough/SKILL.md) | 人物从纸/屏幕/画作/印刷品等媒介「破壁而出」的超现实人像 |
| [`$image2-risk-debugger`](skills/image2-risk-debugger/SKILL.md) | 提示词被拒、结果太保守、脸偏幼、构图太擦边、身体或手部变形 |

## 13 个 Skill

### `$image2-portrait-director`｜人像导演

统一解析主体、服装、场景、动作、镜头、光线、画幅和用途，从 clean lifestyle、都市时尚、复古港风、旅行、棚拍等 Route 中选择一个主路线，并在需要时委派给专业 Skill。

```text
使用 $image2-portrait-director，为“清冷书店阅读生活照”选择合适路线，要求落地窗自然光、半身到大腿、9:16。
```

### `$image2-portrait-prompt-crafter`｜创意人像提示词生成

根据一句话描述或零散灵感，结合专业摄影知识库，将九大维度沿“命题 → 场景骨架 → 人物受力 → 机位透视 → 景别焦段 → 动机光 → 色彩材质 → 可见造型”的因果链推导。输出包含艺术指导 Brief、完整 Image2 提示词和负面提示词。

```text
使用 $image2-portrait-prompt-crafter，生成一张穿白裙的女生在樱花树下的人像提示词。
```

### `$image2-structured-portrait-prompt`｜结构化人像提示词

把逐字段输入或自然语言需求整理成固定 16 字段清单，再生成最终中文提示词、负面限制词和 3–6 个可选变化参数。适合需要统一格式、反复修改或批量整理人像方向的场景。

```text
使用 $image2-structured-portrait-prompt，生成冷白清透 CCD 书店生活照：湖蓝针织上衣、米白中裙、清冷淡颜、弯腰找书、9:16。
```

这个 Skill 的固定字段顺序为：

```text
摄影风格
写真方向
场景方向
服装方向
气质标签
五官方向
五官细节
发型方向
身形方向
线条强调
镜头方向
姿态动作
光线氛围
滤镜效果
画幅比例
补充要求
```

关键规则：

- 16 个字段是完整、可修改的生产 Brief；最终 Prompt 不再逐字段等权复述，而是按视觉因果和阅读优先级精炼。
- 身形未指定时使用中性、与任务相容的描述，不跨题材随机注入固定身形；胸腰肩颈等版型语言仅在用户明确要求或服装展示确有需要时使用。
- 用户锁定的主体、服装、场景、动作、镜头、光线和画幅始终拥有最高优先级。
- 未指定画幅比例时默认 `9:16`；书店 CCD 只是示例，不是全局默认预设。

### `$image2-adult-glamour-studio`｜成人魅力写真

生成成熟、原创、非露骨的高级人像 Prompt，重点处理五官记忆点、姿态、服装版型、整体身形、灯光和商业审美，不把画面导向身体局部凝视。

```text
使用 $image2-adult-glamour-studio，生成一张原创成年东方女性高级人像，清冷成熟、银灰低饱和、窗边自然光、三分之四身、9:16。
```

### `$image2-cosplay-glamour`｜Cosplay 魅惑写真

生成游戏女角色、国风妖媚、动漫萌系、科幻御姐四条路线的性感魅惑 cosplay 正片提示词，主打精致服化道、高级光影和魅惑气质，避免真实 IP 角色名、幼态审美和露骨内容。

```text
使用 $image2-cosplay-glamour，生成一张原创成年东方女性的游戏角色 cos 正片，魅惑狐妖风格，古风庭院夜景，红黑配色，3:4。
```

### `$image2-aesthetic-rewriter`｜美学改写器

把表达粗糙、审美低、风险高或容易触发拒绝的想法，改写成服装、姿态、灯光、构图和氛围更成熟的版本。支持保守、平衡和表现力三个安全变体。

```text
使用 $image2-aesthetic-rewriter，把“性感美女，身材火辣，氛围暧昧”改成高级、克制、成熟的时尚 editorial 中文提示词。
```

### `$image2-fashion-lingerie-lookbook`｜时尚服装 Lookbook

用于成年内衣、bralette、泳装、试衣间确认照、fit check 和商品展示。画面以服装版型、面料、覆盖度、支撑结构、搭配和商业展示语境为核心。

```text
使用 $image2-fashion-lingerie-lookbook，生成原创成年东方女性的高级泳装 Lookbook，度假酒店泳池边，突出泳装版型、面料和清爽夏日氛围。
```

### `$image2-wedding-portrait`｜婚纱人像

用于婚纱摄影、bridal portrait、婚礼纪实、旅拍和婚纱时尚 editorial。支持自定义主体、表情、身形、婚纱和图片风格；未指定婚纱时可自动补全礼服版型、领口、面料、刺绣、头纱、配饰和拖尾。

```text
使用 $image2-wedding-portrait，生成缎面一字肩鱼尾婚纱写真，温婉成熟的中国新娘，含蓄微笑，专业 DSLR 质感，3:4，8K。
```

### `$image2-sports-venue-portrait`｜体育场馆人像

根据运动类型、场馆、球队配色和赛前／赛中／赛后故事，生成成年原创的体育主题人像。默认保持脸、服装、姿态和场馆可见，避免低机位身体凝视。

```text
使用 $image2-sports-venue-portrait，生成篮球馆赛后人像，原创成年东方女性，蓝白球队配色，记分牌虚化，专业体育摄影质感，3:4，8K。
```

### `$image2-character-poster-cover`｜人物海报封面

生成带完整排版意图的人物海报、杂志封面、editorial cover 或宣传主视觉。可自动设计虚构刊名、原创标题、封面线、日期、期号、价格样式和宣传语，不使用真实品牌或真实杂志标识。

```text
使用 $image2-character-poster-cover，生成原创成年东方女性高级时尚杂志封面，冷白摄影棚、银灰色调、成熟自信、原创标题和封面线、3:4。
```

### `$image2-character-reference-sheet`｜人物设定图

在一张横向设计板中组织全身正面、侧面、背面视图，以及面部、发型、服装材质、配件和鞋履细节，保持人物身份、比例和服装结构一致。

```text
使用 $image2-character-reference-sheet，生成原创成年东方女性角色设定图，包含全身正面、侧面、背面和面部服装细节框，浅灰设计板背景，16:9。
```

### `$image2-reality-breakthrough`｜破壁超现实人像

生成「人物从 2D 媒介破壁进入现实世界」的超现实人像提示词，覆盖纸上成真、屏幕成真、社交 App、印刷品、艺术画作、复古媒介、数字界面、装置场景八大路线，制造 2D→3D 过渡错觉与真实人物质感融合。

```text
使用 $image2-reality-breakthrough，生成一张从杂志封面破壁而出的超现实人像，人物一半在纸面内一半在纸面外，强烈视觉冲击，3:4。
```

### `$image2-risk-debugger`｜风险调试器

诊断提示词被拒、过度保守、人物偏幼、构图太擦边、风格丢失、身体结构错误、手指畸形或摄影质感不足的原因，并给出可直接重试的修复提示词。

```text
使用 $image2-risk-debugger，诊断并修复下面的提示词：生成结果太保守，脸偏幼，手部变形，也不够像真实摄影。
……
```

## 常见输出格式

多数 Skill 使用以下完整模式：

```text
意图摘要
已锁定参数
导演扩展或风险/质量说明
最终中文提示词
负面限制词
可选变化参数
```

特殊输出：

- `$image2-portrait-prompt-crafter`：画面构想 + 结构化标签（8 维度）+ 完整 Image2 提示词 + 负面提示词。
- `$image2-structured-portrait-prompt`：固定 16 字段清单 + 最终中文提示词 + 负面限制词 + 可选变化参数。
- `$image2-aesthetic-rewriter`：在导演扩展中提供保守、平衡、表现力三个变体。
- `$image2-risk-debugger`：增加诊断结果与修复策略。
- `$image2-character-poster-cover`：增加原创海报／封面文字和版式说明。
- `$image2-character-reference-sheet`：增加设定图版面说明。
- `$image2-cosplay-glamour`：增加角色设定卡与服装/妆容/道具拆解。
- `$image2-reality-breakthrough`：增加破壁设定卡与过渡效果描述。

其中“最终中文提示词”可直接复制到 Image2 / GPT Image 2 使用。

## 怎样提供需求

可以只写一句自然语言：

```text
清冷知性书店生活照，湖蓝针织上衣，落地窗冷白自然光，9:16。
```

也可以提供更稳定的组合：

```text
主体 + 五官 + 身形 + 服装 + 气质 + 场景 + 动作 + 镜头 + 光线 + 色调 + 画幅
```

示例：

```text
原创成年东方女性 + 清冷鹅蛋脸 + 轻盈纤细 + 湖蓝针织上衣与米白中裙 + 知性安静 + 现代书店 + 弯腰找书 + 半身到大腿 + 冷白窗光 + CCD 轻颗粒 + 9:16
```

未提供的字段会按已锁定主题进行一致性补全；明确且安全的参数不会被默认值静默替换。

## 参考词表

仓库中的 [参考词表.md](参考词表.md) 提供风格、服装、气质和场景速查词。可以先挑选关键词，再交给对应 Skill 整理：

```text
使用 $image2-structured-portrait-prompt，参考“清冷淡颜 + 修长体态 + 白色长裙 + 高级疏离感 + 雪景”，生成固定字段清单和完整提示词。
```

常用方向包括：

- 风格：清冷仙气、古典东方、明艳大女主、法式优雅、复古港风、街头酷飒。
- 服装：连衣裙、旗袍、汉服、西装套裙、针织裙、婚纱、泳装、运动服。
- 气质：温柔、知性、成熟、清冷、明艳、优雅、健康、文艺、复古。
- 场景：窗边、书店、咖啡馆、办公室、晚宴、海边、泳池、体育馆、城市夜景、古风庭院。

## 统一边界

所有 Skill 面向原创、成年、非露骨的人像摄影、时尚展示、商业视觉和角色设计。不会帮助生成或保留以下方向：

- 露骨色情、软色情或以性可得性为中心的画面。
- 未成年感、幼态、学生元素与性感表达的组合。
- 对真实人物、明星、网红、上传照片或私人形象进行性化。
- 偷拍、泄露、隐藏镜头、窥视、胁迫、醉酒或非自愿语境。
- 身体局部主导构图、低机位身体凝视、透明裸露或私密暴露。
- 绕过审查、规避安全系统或恢复已被移除的风险意图。

遇到不支持的部分时，Skill 会拒绝或改写相关内容，并尽量保留可支持的服装、场景、光线、镜头和整体审美目标。

## 仓库结构

- `skills/`：canonical Skill 与共享规则。
- `.agents/skills/`、`.claude/skills/`、`.codex/skills/`、`.cursor/`、`.opencode/skills/`：不同运行时使用的同步镜像。
- `参考词表.md`：人像风格与造型关键词速查。
- `docs/`：人像摄影与 Prompt 工程参考资料。

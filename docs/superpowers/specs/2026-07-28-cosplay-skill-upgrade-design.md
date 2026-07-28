# Cosplay 魅惑写真技能升级设计

## 概述

升级 `image2-cosplay-glamour` 技能，解决当前提示词在角色还原度、服装细节、面部多样性、光影氛围四方面不足的问题，并新增上传参考人物生成提示词的能力。

## 现状问题

- A. 生成的人物不像 cosplay，缺乏角色辨识度
- B. 服装细节不够精准，出图后质感/版型不对
- C. 面部/五官千篇一律
- D. 光影/场景/氛围不够精致，不像正片质感

## 整体架构

### 当前结构

```
用户输入 → 选路线(4选1) → 读 route 文件 → 拼 prompt → 输出
```

### 新结构

```
用户输入 → 选路线(4选1) → 选子模板(3-5个/路线)
  → 参数化填充(占位符替换)
  → [如有参考图: 特征提取 → 映射到参数]
  → 细节增强引擎(知识库补充面料/光线/配饰/妆容/场景)
  → 输出
```

### 新增/变更文件

| 文件 | 类型 | 说明 |
|------|------|------|
| `SKILL.md` | 修改 | 工作流增加子模板选择、参数化填充、参考图处理、细节增强步骤 |
| `routes/{routeId}/` | 新建 | 每个路线从单文件改为目录，内含多个子模板 `.md` 文件 |
| `references/parameter-mappings.md` | 新建 | 占位符定义 + 默认值 + 参考图映射规则 |
| `references/detail-enhancer.md` | 新建 | 细节增强引擎，按路线/子模板定义增强内容 |

## 子模板系统

### 目录结构

```
routes/
  game-vixen/
    game-warrior.md    # 战士系
    game-mage.md       # 法师系
    game-assassin.md   # 刺客系
    game-archer.md     # 弓手系
    game-queen.md      # 女王系
  gufeng-seductress/
    gufeng-huli.md     # 狐妖系
    gufeng-xianzi.md   # 仙子系
    gufeng-mo-nv.md    # 魔女系
    gufeng-guan-jue.md # 宫廷贵女系
  anime-vixen/
    anime-bunny.md     # 兔女郎系
    anime-maid.md      # 女仆系
    anime-magical.md   # 魔女系
    anime-idol.md      # 偶像系
    anime-nekomimi.md  # 猫耳系
  scifi-domina/
    scifi-cyber.md     # 赛博系
    scifi-mecha.md     # 机甲系
    scifi-agent.md     # 特工系
    scifi-lab.md       # 实验室机械姬系
```

### 子模板文件格式

每个子模板文件包含以下字段：

```yaml
---
id: game-mage
route: game-vixen
name: 法师系
keywords: 法师、法杖、魔法阵、符文、法力
---
Fingerprint: [固定描述，定义该子模板的视觉DNA]
Palette: [固定配色方案]
Materials: [固定面料清单]
Camera: [固定镜头参数]
Light: [光线方案，含占位符]
Default outfit: [服装模板，含占位符]
Signature elements: [标志性元素清单，含占位符]
Scenes: [场景清单，含占位符]
Makeup: [预设妆容描述]
Enhancement-override: [可选，覆盖细节增强引擎的默认增强内容]
Exclusions: [排除风格清单]
```

### 占位符系统

提示词中使用 `[[占位符]]` 标记可替换参数：

| 占位符 | 默认值 | 参考图映射 |
|--------|--------|-----------|
| `[[face]]` | 路线默认面部特征 | 参考图面部特征 |
| `[[hairstyle]]` | 路线默认发型（从知识库选） | 参考图发型 |
| `[[haircolor]]` | 路线默认发色 | 参考图发色 |
| `[[eyecolor]]` | 路线默认瞳色 | 参考图瞳色 |
| `[[outfit-color]]` | 路线默认主色调 | 参考图服装主色 |
| `[[outfit-material]]` | 路线默认面料 | 参考图服装材质 |
| `[[scene-detail]]` | 路线默认场景 | 参考图场景氛围 |
| `[[prop]]` | 路线默认道具 | 参考图标志性物品 |
| `[[light-mood]]` | 路线默认光线氛围 | 参考图整体色调 |
| `[[body-type]]` | 路线默认身形 | - |

## 参考图处理机制

### 工作流

```
上传参考图 → 用户指定用途(可选) → 特征提取(5维) → 映射到占位符 → 填入子模板
```

### 特征提取维度

| 维度 | 提取内容 | 映射到占位符 |
|------|---------|-------------|
| 面部特征 | 脸型、五官风格、气质 | `[[face]]` |
| 发型发色 | 发型类型、长度、颜色 | `[[hairstyle]]` + `[[haircolor]]` |
| 服装造型 | 服装类型、配色、材质、层次 | `[[outfit-color]]` + `[[outfit-material]]` |
| 道具配饰 | 标志性物品 | `[[prop]]` |
| 整体色调 | 主色调、氛围色 | 注入光影/场景描述 |

### 处理规则

- 用户不指定用途时，默认全部参考（服装+面部+发型）
- 用户可指定单一用途（如"只参考服装，面部自己描述"）
- 参考图不覆盖用户显式输入的参数——用户输入优先级高于参考图提取
- 动漫角色参考图 → 描述为"类动漫风格的高品质真人cos"，保留原角色特征但转真人质感
- 真人参考图 → 保留面部特征，换装为子模板的cosplay造型
- 始终遵守原创性守卫：不生成真实角色名、不复制真实名人

### 用户交互

- 用户上传参考图时，技能提示可指定用途范围
- 默认全参考，用户可用"只参考[服装/面部/发型/道具]"限定
- 用户可同时提供参考图 + 文字描述，文字描述优先

## 细节增强引擎

### 增强维度

| 维度 | 来源 | 增强方式 |
|------|------|---------|
| 面料质感 | `_shared/knowledge/fashion.md` + `参考词表.md` | 根据 `[[outfit-material]]` 匹配面料细节 |
| 光线氛围 | `_shared/knowledge/lighting.md` | 根据 `[[light-mood]]` 匹配光线参数 |
| 配饰细节 | 子模板 signature elements | 自动扩展为完整中文描述 |
| 场景氛围 | `_shared/knowledge/scenes.md` | 补充环境细节描述 |
| 妆容细节 | 子模板预设 | 每子模板预设 1 组妆容描述 |
| 发型细节 | `_shared/knowledge/hairstyles.md` | 根据 `[[hairstyle]]` 匹配完整发型预设 |

### 增强规则

- 增强内容不覆盖用户显式输入的参数
- 增强内容不覆盖子模板中已固定的指纹描述
- 增强内容可被子模板的 `enhancement-override` 字段覆盖
- 增强内容在最终提示词中按固定位置插入，不破坏整体结构

### 实现方式

在 `references/detail-enhancer.md` 中为每个路线定义增强对照表，格式为：

```yaml
route-id:
  sub-template-id:
    fabric-enhance: "面料细节描述"
    light-enhance: "光线细节描述"
    makeup-enhance: "妆容细节描述"
    scene-enhance: "场景细节描述"
```

## 关键约束

- 所有子模板和增强内容保持原创性——不引用真实 IP 角色名、作品名、名人
- 子模板数量控制：每条路线 3-5 个，避免选择超载
- 占位符默认值必须安全、成熟、非露骨
- 参考图处理遵循已有的 `reference-image-policy.md`
- 细节增强不改变已锁定参数
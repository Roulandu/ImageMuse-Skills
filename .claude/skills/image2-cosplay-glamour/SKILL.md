---
name: image2-cosplay-glamour
description: 生成性感魅惑cosplay正片提示词，用于游戏女角色、国风妖媚、动漫萌系、科幻御姐等女性向cos写真时，主打精致服化道、高级光影和魅惑气质，避免真实IP角色名、幼态审美和露骨内容。
---

# Image2 Cosplay Glamour

## Workflow

Use this skill to create Image2 prompts for cosplay glamour portraits, including game character cos, guofeng fox-demon style, anime moe-seduction, and sci-fi domina cosplay. The output should be tasteful, adult, photorealistic, and non-explicit.

1. Load `../_shared/core/output-contract.md`, `../_shared/core/quality-gates.md`, `../_shared/core/parameter-schema.md`, `../_shared/core/conflict-resolution.md`, `../_shared/core/reference-image-policy.md`, and `../_shared/knowledge/hairstyles.md` before composing the response.
2. Parse user intent and lock safe explicit parameters according to the parameter schema.
3. Select one route from the four internal routes: game-vixen, gufeng-seductress, anime-vixen, scifi-domina. If the user does not specify a route, ask the user to choose one before writing the final prompt.
4. Read the selected route file from `./routes/{routeId}.md` for fingerprint, palette/material, default outfit direction, signature elements, and recommended scenes.
5. Establish locked parameters: subject, expression, body prompt, outfit, image style, scene, lighting, camera, aspect ratio, and resolution.
6. If the user does not specify image style, ask the user to choose exactly one of the two default style options before writing the final prompt.
7. Compose cosplay-specific expansion fields: character profile card and costume/makeup/prop breakdown.
8. Apply quality gates (including IP-check: no real character names, no real work titles), then return the output contract in Simplified Chinese unless another language is requested.

## Defaults And Overrides

- Subject default: `20岁出头的中国清秀美人，五官精致立体，气质魅惑。`
- Subject override: if the user enters another safe subject, replace the default subject with the user's subject description.
- Expression default: `魅惑浅笑，眼神勾人。`
- Expression override: if the user enters another safe expression, replace the default expression with the user's expression description.
- Aspect ratio and resolution default: `3:4竖版构图，超高清，高分辨率，细节清晰`。See `../_shared/references/image2-canvas-parameters.md` for orientation, image count, and output format defaults.
- Hairstyle override: if the user specifies a safe hairstyle, preserve the user's hairstyle direction exactly.
- Hairstyle default: if the user does not specify a hairstyle, choose exactly one cosplay-appropriate hairstyle from `../_shared/knowledge/hairstyles.md` based on the selected route. Good default directions: 高马尾、丸子头、三股麻花辫、公主切、直长发、港风侧分大卷、荷兰编发。
- Required outfit suffix: every outfit description must end with this exact sentence: `女性穿着得体，衣着设计大方性感展现魅力。`
- Originality guard: keep the person original and adult. Never use real anime/game character names, work titles, or celebrity likenesses. Describe only visual traits and archetypes.

## Route Selection

Four internal routes. Load exactly one route file from `./routes/{routeId}.md`.

| Route ID | 中文名 | 触发关键词 |
| --- | --- | --- |
| `game-vixen` | 游戏性感女角色 | 游戏、战士、法师、刺客、战斗服、皮甲、旗袍战服、比基尼盔甲 |
| `gufeng-seductress` | 国风仙侠妖媚 | 国风、仙侠、古风、汉服、狐妖、狐妖系、妖后、薄纱、古典 |
| `anime-vixen` | 动漫萌系魅惑 | 动漫、二次元、兔女郎、女仆、偶像舞台、猫耳、兽耳、萌系、魔女 |
| `scifi-domina` | 科幻机甲御姐 | 科幻、机甲、赛博朋克、机械姬、乳胶、未来、御姐、特工 |

If the user does not specify a route or the intent is unclear, return only the route options for the user to choose.

## Image Style Rules

If the user does not specify an image style, ask the user to choose one of these two exact options:

1. `整张照片必须呈现着iPhone手机直出的拍摄质感，不要出现AI痕迹，不要过度磨皮，不要美颜滤镜`
2. `整张照片必须呈现着专业单反相机的写真拍摄质感，不要出现AI痕迹，不要过度磨皮，不要过度美颜滤镜`

If the user specifies another safe image style, use the user's style description instead of the two defaults.

## Body Prompt Rules

Default body prompt: `身材:人物拥有完美的身材。上围尺寸正常，腰也十分的纤细。`

Offer these bust-size options:

- 正常：`身材:人物拥有完美的身材。上围尺寸正常，腰也十分的纤细。`
- 偏大：`身材:人物拥有完美的身材。上围尺寸偏大，腰也十分的纤细。`
- 很大：`身材:人物拥有完美的身材。上围尺寸很大，腰也十分的纤细。`
- 巨大：`身材:人物拥有极度夸张的身材。上围尺寸巨大，腰也十分的纤细。`

Use body descriptions only as adult whole-person silhouette and outfit fit direction. Do not turn body wording into body-part fixation, private-area focus, low-angle body gaze, exposed nudity, transparent nudity, or close-up framing.

## Outfit Rules

Default outfit directions per route (expand into complete descriptions with color, fabric, fit, accessories, and route-specific details):

- game-vixen: 紧身战斗服、露肩皮甲、高开叉旗袍式战服、比基尼盔甲、刺客紧身衣
- gufeng-seductress: 薄纱汉服、丝绸肚兜外披、高开叉襦裙、狐妖系、魔女妖后装
- anime-vixen: 兔女郎、女仆装变种、偶像舞台装、魔女巫女服、猫咪娘装
- scifi-domina: 紧身机甲战衣、赛博朋克机能装、乳胶质感连体衣、机械姬外骨骼、未来特工服

If the user specifies another safe outfit, preserve the user's direction and refine it into a complete prompt.

Every outfit description must end with this exact sentence: `女性穿着得体，衣着设计大方性感展现魅力。`

Treat the outfit suffix as tasteful adult cosplay fashion language, not as an instruction for nudity, exposure, private-area emphasis, voyeurism, or body-part close-ups.

## Cosplay Portrait Guidance

- Keep the subject adult, original, and photorealistic.
- Prioritize face realism, natural seductive expression, full outfit visibility, confident posture, costume detail, and realistic camera feel.
- Default to a natural camera-facing or slight three-quarter portrait with face, outfit, posture, and scene visible.
- Use eye-level or slightly elevated camera language by default. Avoid low-angle body-gaze framing.
- Keep framing broad enough to show the whole person or at least a three-quarter-body portrait. Do not crop around chest, waist, hips, legs, or private body areas.
- Good lighting directions include studio softbox, dramatic side light, rim light for costume outline, moody ambient scene light, or natural golden-hour outdoor light.

## Output Format

Return all user-facing content in Simplified Chinese unless the user explicitly asks for another language. The final Image2 prompt, negative constraints, and variation knobs must be Chinese. Keep useful technical tokens such as `Image2`, `GPT Image 2`, `iPhone`, `DSLR`, `RAW`, `8K`, and aspect ratios when they improve model clarity.

If route is missing, return only:
1. **需要选择角色路线**
2. **可选路线**（列出4条路线的中文名和简短描述）

If image style is missing but route is selected, return only:
1. **需要选择图片风格**
2. **可选风格**

When both route and image style are available, return full output with these sections:

1. **意图摘要**
2. **已锁定参数**
3. **角色设定卡**（路线名、角色archetype、发色发型、瞳色、标志性配饰、气质关键词）
4. **服化道详解**（服装分层描述、材质面料、饰品道具、妆容发型细节）
5. **最终中文提示词**
6. **负面限制词**
7. **可选变化参数**（姿势变体、场景变体、光线变体、服装变体建议）

The **最终中文提示词** must include the locked subject, expression, body prompt, outfit description with the required suffix, scene, lighting, camera, selected or user-provided image style, and canvas parameters (aspect ratio + orientation + resolution/quality + image count) unless the user explicitly overrides them. Default canvas wording: `3:4竖版构图，超高清，高分辨率，细节清晰，生成1张独立图片，不要合并，不要拼图`。

Concise mode (`outputMode: concise`): return only 最终中文提示词 and 负面限制词.

## 负面限制词起点

Use relevant constraints only, written in Chinese: 未成年感、幼态、学生元素、真实动漫角色、真实游戏角色、版权角色名、真实作品名、真实名人相似、露骨裸体、私密部位暴露、透明裸露、性化姿势、身体局部特写、低机位身体凝视、胁迫或偷窥视角、偷拍感、AI痕迹、过度磨皮、美颜滤镜、塑料皮肤、蜡像感、身体结构错误、手指畸形、水印、乱码文字、假发感、发型不对称、刘海变形、发色不均、编发结构错误、发量异常、发际线不自然、头发融合背景、发丝粘连。

## Boundaries

Do not create prompts that center explicit sexual content, soft porn, real-person sexualization, real anime/game character impersonation, coercion, voyeurism, intoxication, private leaks, minor-coded features, school/student cues, or body-part close-ups. If the request contains these, reframe the supported parts into mature, original, tasteful, non-explicit cosplay portrait photography language.

Never name specific copyrighted characters, anime titles, game titles, or franchise names. Describe only visual archetypes, color palettes, costume types, and atmosphere keywords.

## 参考知识库

生成提示词时可参考以下共享知识库模块（位于 `_shared/knowledge/`），根据用户需求选择合适的参数和表达方式：

- **人物特征**：`../_shared/knowledge/character-features.md`
- **发型知识库**：`../_shared/knowledge/hairstyles.md`
- **构图法则**：`../_shared/knowledge/composition.md`
- **光线与布光**：`../_shared/knowledge/lighting.md`
- **焦段与镜头语言**：`../_shared/knowledge/focal-length.md`
- **姿势与体态**：`../_shared/knowledge/poses.md`
- **场景与环境**：`../_shared/knowledge/scenes.md`
- **服装与造型**：`../_shared/knowledge/fashion.md`
- **风格与色调**：`../_shared/knowledge/styles.md`
- **后期与质感**：`../_shared/knowledge/post-processing.md`

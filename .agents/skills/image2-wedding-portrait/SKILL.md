---
name: image2-wedding-portrait
description: 生成婚纱新娘人像提示词，用于需要中式西式婚纱、新娘肖像、婚礼大片、婚纱时尚方向的人像时，支持主体/表情/身形/风格自定义，iPhone 直出或专业 DSLR 质感，品味级非暴露新娘魅力。
---

# Image2 Wedding Portrait

## Workflow

Use this skill to create Image2 prompts for wedding dress photography, bridal portraits, bridal fashion editorials, and wedding studio portrait prompts. The output should be tasteful, adult, photorealistic, and non-explicit.

1. Load `../_shared/references/adult-glamour-boundaries.md` when the request includes adult attractiveness, body-shape emphasis, private settings, real people, age-coded wording, or risk-sensitive styling.
2. Load `../_shared/references/portrait-fashion-parameters.md` when the user asks for structured choices, varied camera language, scene options, or fashion/photo quality controls.
3. Load `../_shared/knowledge/hairstyles.md` for bridal hairstyle presets, dimensional vocabulary, and hair negative constraints.
4. Load `../_shared/core/output-contract.md` and `../_shared/core/quality-gates.md` before composing the response.
5. Establish locked parameters: subject, expression, body description, wedding dress clothing, hairstyle, image style, scene, camera/framing, aspect ratio, and resolution.
6. Respect safe user-specified subject, expression, body, clothing, hairstyle, and style. Use the defaults only when the user leaves those fields blank, unspecified, or automatic.
7. If the user does not specify image style, ask the user to choose exactly one of the two default style options before writing the final prompt.
8. If image style is specified, generate the output contract below.

## Defaults And Overrides

- Subject default: `20岁出头的中国美人。`
- Subject override: if the user enters another safe subject, replace the default subject with the user's subject description.
- Expression default: `自然的笑容。`
- Expression override: if the user enters another safe expression, replace the default expression with the user's expression description.
- Aspect ratio and resolution default: `3:4竖版构图，超高清，高分辨率，细节清晰`。See `../_shared/references/image2-canvas-parameters.md` for orientation, image count, and output format defaults.
- Wedding dress clothing: if the user specifies wedding dress clothing, preserve the user's clothing description. If unspecified, randomly generate a bridal dress description each time, including silhouette, neckline, fabric, embroidery or lace, veil, accessories, train length, fit, and scene-appropriate styling.
- Required clothing suffix: every wedding dress clothing description must end with this exact sentence: `女性穿着得体，衣着设计大方性感展现魅力。`
- Treat the clothing suffix as tasteful adult bridal fashion language, not as an instruction for nudity, exposure, private-area emphasis, or body-part close-ups.
- Hairstyle default: if the user specifies a hairstyle, fully preserve it. If unspecified, auto-match by wedding dress silhouette:
  - **大拖尾婚纱 / 宫廷感** → 低盘发（经典优雅，突出肩颈和婚纱后背设计，预留头纱位置）
  - **轻纱 A 字裙 / 森系** → 半扎发公主头（披发+编发元素，浪漫自然）
  - **鱼尾修身婚纱** → 侧分低盘发或侧分大卷（凸显颈部线条，成熟优雅）
  - **中式秀禾 / 龙凤褂** → 盘发配簪（整齐精致，配合中式头饰）
  - **短款 / 轻婚纱** → 低马尾或半扎发（清爽年轻）
- Hairstyle source: select from the wedding/bridal subset of `hairstyles.md` presets — at least 8 options: 低盘发、半扎发、三股麻花辫（侧边）、花环编发、丸子头（新娘花苞头）、温柔大卷（侧分披发）、直长发（披纱）、高马尾（轻婚纱）。
- Hairstyle compatibility: the chosen hairstyle must work with veil and headpieces — updos reserve veil anchoring at the crown, and down styles account for veil coverage.

## Image Style Rules

If the user does not specify an image style, ask the user to choose one of these two exact options:

1. `整张照片必须呈现着iPhone手机直出的拍摄质感，不要出现AI痕迹， 不要过度磨皮，不要美颜滤镜`
2. `整张照片必须呈现着专业单反相机的写真拍摄质感，不要出现AI痕迹， 不要过度磨皮，不要过度美颜滤镜`

If the user specifies another safe image style, use the user's style description instead of the two defaults.

## 体态比例与礼服合身度

Use whole-person, adult bridal proportions and dress fit instead of bust-size menus. Capture only what helps the garment read correctly: balanced shoulders and waist, natural posture, hem and train length, neckline coverage, bodice support, seam placement, fabric drape, and ease of movement. Preserve a safe user-specified body description only as a silhouette and tailoring direction.

When a default is needed, use: `体态比例自然匀称，站姿舒展；礼服肩线、腰线与裙摆贴合得体，面料垂坠自然，行动自如。`

## Wedding Portrait Guidance

- Keep the subject adult, original, and photorealistic. Do not use real celebrity, influencer, uploaded-face, private-person, or social-profile likenesses.
- Prioritize bridal elegance, dress construction, fabric detail, natural expression, face realism, graceful posture, tasteful atmosphere, and realistic camera feel.
- Default to a natural camera-facing or slight three-quarter bridal portrait with face, wedding dress, posture, and setting visible.
- Use eye-level or slightly elevated camera language by default. Avoid low-angle body-gaze framing.
- Good default scenes include bright wedding studio, white chapel interior, garden wedding venue, seaside wedding walkway, hotel bridal suite with bright window light, or minimalist editorial studio.
- Good random bridal dress directions include satin A-line wedding dress, lace mermaid wedding dress, off-shoulder tulle wedding dress, square-neck minimalist silk wedding dress, long-sleeve lace cathedral bridal look, or modern Chinese bridal-inspired white gown.
- Bridal hairstyle is a core element of wedding portraiture — select it to complement the dress silhouette, veil, and headpieces, and ensure it reads natural and well-groomed in the final image.

## 叙事路线

Choose one route when requested or infer the least-assumptive route from the scene: **纪实婚礼**（仪式、誓言、宾客互动）, **影棚肖像**（布光、背景、礼服细节）, **旅行婚拍**（目的地、天气、行程感）, or **中式婚礼**（中式礼服、传统建筑、喜庆但不堆砌文字）. Keep the selected route consistent with the dress, location, pose, and camera language.

## Output Format

Return all user-facing content in Simplified Chinese unless the user explicitly asks for another language. The final Image2 prompt, negative constraints, and variation knobs must be Chinese. Keep useful technical tokens such as `Image2`, `GPT Image 2`, `iPhone`, `DSLR`, `RAW`, `8K`, and aspect ratios when they improve model clarity.

If image style is missing, return only:

1. **需要选择图片风格**
2. **可选风格**

When image style is available, return:

1. **意图摘要**
2. **已锁定参数**
3. **风险/质量说明**
4. **最终中文提示词**
5. **负面限制词**
6. **可选变化参数**

The **最终中文提示词** must include the locked subject, expression, body prompt, wedding dress clothing description with the required suffix, selected or user-provided image style, and canvas parameters (aspect ratio + orientation + resolution/quality + image count) unless the user explicitly overrides them. Default canvas wording: `3:4竖版构图，超高清，高分辨率，细节清晰，生成1张独立图片，不要合并，不要拼图`。

## 负面限制词起点

Use relevant constraints only, written in Chinese: 未成年感、幼态、学生元素、真实名人相似、真实人物肖像、露骨裸体、私密部位暴露、透明裸露、性化姿势、身体局部特写、低机位身体凝视、胁迫或窥视视角、偷拍感、泄露感、AI痕迹、过度磨皮、美颜滤镜、塑料皮肤、蜡像感、身体结构错误、手指畸形、水印、乱码文字、假发感、发型不对称、刘海变形、发色不均、编发结构错误、发量异常、发际线不自然、头发融合背景、发丝粘连。

## Boundaries

Do not create prompts that center explicit sexual content, soft porn, real-person sexualization, coercion, voyeurism, intoxication, private leaks, minor-coded features, school/student cues, or body-part close-ups. If the request contains these, reframe the supported parts into mature, original, tasteful, non-explicit bridal photography language.

## 参考知识库

生成提示词时可参考以下共享知识库模块（位于 `_shared/knowledge/`），根据用户需求选择合适的参数和表达方式：

- **人物特征**：`../_shared/knowledge/character-features.md`
- **发型**：`../_shared/knowledge/hairstyles.md`
- **构图法则**：`../_shared/knowledge/composition.md`
- **光线与布光**：`../_shared/knowledge/lighting.md`
- **焦段与镜头语言**：`../_shared/knowledge/focal-length.md`
- **姿势与体态**：`../_shared/knowledge/poses.md`
- **场景与环境**：`../_shared/knowledge/scenes.md`
- **风格与色调**：`../_shared/knowledge/styles.md`
- **后期与质感**：`../_shared/knowledge/post-processing.md`


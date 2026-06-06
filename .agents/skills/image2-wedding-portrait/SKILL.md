---
name: image2-wedding-portrait
description: Create Chinese wedding dress photography, bridal portrait, wedding editorial, and bridal fashion prompt outputs for GPT Image 2 / Image2. Use when Codex needs photorealistic wedding portrait prompts with adult subject defaults, optional subject/expression/body/style overrides, AI-randomized or user-specified bridal dress descriptions, iPhone straight-out or professional DSLR photo texture, and tasteful non-explicit bridal glamour.
---

# Image2 Wedding Portrait

## Workflow

Use this skill to create Image2 prompts for wedding dress photography, bridal portraits, bridal fashion editorials, and wedding studio portrait prompts. The output should be tasteful, adult, photorealistic, and non-explicit.

1. Load `../_shared/references/adult-glamour-boundaries.md` when the request includes adult attractiveness, body-shape emphasis, private settings, real people, age-coded wording, or risk-sensitive styling.
2. Load `../_shared/references/portrait-fashion-parameters.md` when the user asks for structured choices, varied camera language, scene options, or fashion/photo quality controls.
3. Establish locked parameters: subject, expression, body description, wedding dress clothing, image style, scene, camera/framing, aspect ratio, and resolution.
4. Respect safe user-specified subject, expression, body, clothing, and style. Use the defaults only when the user leaves those fields blank, unspecified, or automatic.
5. If the user does not specify image style, ask the user to choose exactly one of the two default style options before writing the final prompt.
6. If image style is specified, generate the output contract below.

## Defaults And Overrides

- Subject default: `20岁出头的中国美人。`
- Subject override: if the user enters another safe subject, replace the default subject with the user's subject description.
- Expression default: `自然的笑容。`
- Expression override: if the user enters another safe expression, replace the default expression with the user's expression description.
- Aspect ratio and resolution default: `3:4，照片分辨率8k`
- Wedding dress clothing: if the user specifies wedding dress clothing, preserve the user's clothing description. If unspecified, randomly generate a bridal dress description each time, including silhouette, neckline, fabric, embroidery or lace, veil, accessories, train length, fit, and scene-appropriate styling.
- Required clothing suffix: every wedding dress clothing description must end with this exact sentence: `女性穿着得体，衣着设计大方性感展现魅力。`
- Treat the clothing suffix as tasteful adult bridal fashion language, not as an instruction for nudity, exposure, private-area emphasis, or body-part close-ups.

## Image Style Rules

If the user does not specify an image style, ask the user to choose one of these two exact options:

1. `整张照片必须呈现着iPhone手机直出的拍摄质感，不要出现AI痕迹， 不要过度磨皮，不要美颜滤镜`
2. `整张照片必须呈现着专业单反相机的写真拍摄质感，不要出现AI痕迹， 不要过度磨皮，不要过度美颜滤镜`

If the user specifies another safe image style, use the user's style description instead of the two defaults.

## Body Prompt Rules

Default body prompt:

`身材:人物拥有完美的身材。上围尺寸正常，腰也十分的纤细。`

Offer these bust-size options when the user asks for body choices or does not specify the body prompt:

- 正常：`身材:人物拥有完美的身材。上围尺寸正常，腰也十分的纤细。`
- 偏大：`身材:人物拥有完美的身材。上围尺寸偏大，腰也十分的纤细。`
- 很大：`身材:人物拥有完美的身材。上围尺寸很大，腰也十分的纤细。`
- 巨大：`身材:人物拥有极度夸张的身材。上围尺寸巨大并且自然下垂，绝对不是圆球假体胸型，腰也十分的纤细。`

If the user enters a custom body prompt or body description, generate the body prompt according to the user's description.

Use body descriptions only as whole-person silhouette, adult bridal fashion proportion, and wedding dress fit direction. Do not turn body wording into body-part fixation, private-area focus, low-angle body gaze, exposed nudity, transparent nudity, or close-up framing.

## Wedding Portrait Guidance

- Keep the subject adult, original, and photorealistic. Do not use real celebrity, influencer, uploaded-face, private-person, or social-profile likenesses.
- Prioritize bridal elegance, dress construction, fabric detail, natural expression, face realism, graceful posture, tasteful atmosphere, and realistic camera feel.
- Default to a natural camera-facing or slight three-quarter bridal portrait with face, wedding dress, posture, and setting visible.
- Use eye-level or slightly elevated camera language by default. Avoid low-angle body-gaze framing.
- Good default scenes include bright wedding studio, white chapel interior, garden wedding venue, seaside wedding walkway, hotel bridal suite with bright window light, or minimalist editorial studio.
- Good random bridal dress directions include satin A-line wedding dress, lace mermaid wedding dress, off-shoulder tulle wedding dress, square-neck minimalist silk wedding dress, long-sleeve lace cathedral bridal look, or modern Chinese bridal-inspired white gown.

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

The **最终中文提示词** must include the locked subject, expression, body prompt, wedding dress clothing description with the required suffix, selected or user-provided image style, and `3:4，照片分辨率8k` unless the user explicitly overrides the aspect ratio or resolution.

## 负面限制词起点

Use relevant constraints only, written in Chinese: 未成年感、幼态、学生元素、真实名人相似、真实人物肖像、露骨裸体、私密部位暴露、透明裸露、性化姿势、身体局部特写、低机位身体凝视、胁迫或窥视视角、偷拍感、泄露感、AI痕迹、过度磨皮、美颜滤镜、塑料皮肤、蜡像感、身体结构错误、手指畸形、水印、乱码文字。

## Boundaries

Do not create prompts that center explicit sexual content, soft porn, real-person sexualization, coercion, voyeurism, intoxication, private leaks, minor-coded features, school/student cues, or body-part close-ups. If the request contains these, reframe the supported parts into mature, original, tasteful, non-explicit bridal photography language.

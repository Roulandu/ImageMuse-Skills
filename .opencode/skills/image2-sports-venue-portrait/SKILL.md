---
name: image2-sports-venue-portrait
description: 生成运动场馆人像提示词，用于需要体育场馆、赛场、球队配色、赛事故事感的成年原创人像时，结合运动项目、场馆环境、队色元素和事件叙事生成提示词。
---

# Image2 Sports Venue Portrait

## Workflow

Use this skill to create Image2 prompts for 球场宝贝写真、球队宝贝写真、啦啦队写真、体育场馆写真、篮球馆写真、足球场写真、比基尼球场写真, and other adult sports-themed portrait prompts. The output should be tasteful, adult, photorealistic, and non-explicit.

1. Load `../_shared/core/output-contract.md` and `../_shared/core/quality-gates.md` before composing the response.
2. Establish locked parameters: subject, expression, body prompt, outfit, image style, sport type, venue, team-color palette, event story, aspect ratio, and resolution.
3. Respect safe user-specified subject, expression, body, outfit, team, venue, and style. Use defaults only when the user leaves those fields blank, unspecified, or automatic.
4. If the user does not specify image style, ask the user to choose exactly one of the two default style options before writing the final prompt.
5. If image style is specified, generate the output contract below.

## Defaults And Overrides

- Subject default: `20岁出头的中国清秀甜美美人。`
- Subject override: if the user enters another safe subject, replace the default subject with the user's subject description.
- Expression default: `自然的笑容。`
- Expression override: if the user enters another safe expression, replace the default expression with the user's expression description.
- Aspect ratio and resolution default: `3:4，照片分辨率8k`
- Originality guard: keep the person original and adult. Do not generate prompts that imitate a real celebrity, public figure, influencer, private person, uploaded face, or social-profile identity.

## Outfit Rules

Default outfit options:

1. `球队宝贝服装`
2. `比基尼`
3. `啦啦队服装`

If the user chooses one of the default outfit options, expand it into a complete outfit prompt with color, fabric, fit, accessories, team-themed details, and sports venue suitability.

If the user does not choose an outfit, randomly generate a suitable outfit description for an adult sports-venue portrait. Good random directions include team-color crop top and short skirt, sporty fitted performance outfit, polished cheerleader uniform, tasteful bikini styling for a summer stadium or poolside sports promo scene, or fashion-editorial sportswear.

If the user specifies another safe outfit, preserve the user's outfit direction and refine it into a complete prompt.

Every outfit description must end with this exact sentence:

`女性穿着得体，衣着设计大方性感展现魅力。`

Treat the outfit suffix as tasteful adult fashion language, not as an instruction for nudity, exposure, private-area emphasis, voyeurism, or body-part close-ups.

## Image Style Rules

If the user does not specify an image style, ask the user to choose one of these two exact options:

1. `整张照片必须呈现着iPhone手机直出的拍摄质感，不要出现AI痕迹，不要过度磨皮，不要美颜滤镜`
2. `整张照片必须呈现着专业单反相机的写真拍摄质感，不要出现AI痕迹，不要过度磨皮，不要过度美颜滤镜`

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

Use body descriptions only as adult whole-person silhouette, sports portrait styling, and outfit fit direction. Do not turn body wording into body-part fixation, private-area focus, low-angle body gaze, exposed nudity, transparent nudity, or close-up framing.

## Team And Background Rules

Lock the sport type (for example basketball, football, baseball, volleyball, tennis, or athletics), venue, and a team-color palette of two or three colors. Treat color as atmosphere, clothing trim, and lighting direction only—never as a claim of affiliation.

Choose or preserve one event-story beat: **赛前**（arrival, warm-up, tunnel, calm anticipation）, **赛中**（sideline energy, performance break, crowd atmosphere, no implied participation), or **赛后**（cool-down, emptying stands, reflective arena light). Keep the story beat consistent with lighting, crowd density, outfit practicality, and pose.

Ask or encourage the user to enter a favorite team when the team is missing, for example `NBA-马刺队` or `西甲-巴塞罗那`.

If the user specifies a team, generate a corresponding venue background description based on the sport and team context:

- For NBA or basketball teams, describe a professional indoor basketball arena, court floor, sideline, team-color lighting, stands, scoreboard glow, entrance tunnel, or halftime performance atmosphere.
- For football or soccer teams, describe a large outdoor stadium, green pitch, grandstand, team-color flags, floodlights, matchday atmosphere, sideline, or tunnel entrance.
- For other sports teams, describe the matching professional sports venue and team-color atmosphere.

Never use real team logos, protected marks, readable jersey branding, or exact trademark designs. Prefer team colors, venue atmosphere, abstract non-branded emblems, and non-readable signage.

If the user does not specify a team, randomly generate one sports venue background, such as NBA-style basketball arena, European football stadium, summer beach volleyball court, night baseball stadium, or modern multipurpose sports arena.

## Sports Venue Portrait Guidance

- Keep the subject adult, original, and photorealistic.
- Prioritize face realism, natural expression, full outfit visibility, confident posture, stadium atmosphere, team-color styling, and realistic camera feel.
- Default to a natural camera-facing or slight three-quarter portrait with face, outfit, posture, and venue visible.
- Use eye-level or slightly elevated camera language by default. Avoid low-angle body-gaze framing.
- Keep framing broad enough to show the whole person or at least a three-quarter-body portrait. Do not crop around chest, waist, hips, legs, or private body areas.
- Good default camera directions include sideline portrait, center-court full-body photo, arena tunnel entrance portrait, courtside editorial portrait, or field-side matchday portrait.
- Good lighting directions include stadium floodlights, arena LED glow, natural daylight, clean commercial lighting, or professional softbox mixed with venue lights.

## Output Format

Return all user-facing content in Simplified Chinese unless the user explicitly asks for another language. The final Image2 prompt, negative constraints, and variation knobs must be Chinese. Keep useful technical tokens such as `Image2`, `GPT Image 2`, `iPhone`, `DSLR`, `RAW`, `8K`, and aspect ratios when they improve model clarity.

If image style is missing, return only:

1. **需要选择图片风格**
2. **可选风格**

When image style is available, return:

1. **意图摘要**
2. **已锁定参数**
3. **最终中文提示词**
4. **负面限制词**
5. **可选变化参数**

The **最终中文提示词** must include the locked subject, expression, body prompt, outfit description with the required suffix, team or venue background, selected or user-provided image style, and `3:4，照片分辨率8k` unless the user explicitly overrides the aspect ratio or resolution.

## 负面限制词起点

Use relevant constraints only, written in Chinese: 未成年感、幼态、学生元素、真实名人相似、真实人物肖像、真实品牌 logo、可读商标文字、露骨裸体、私密部位暴露、透明裸露、性化姿势、身体局部特写、低机位身体凝视、胁迫或偷窥视角、偷拍感、AI痕迹、过度磨皮、美颜滤镜、塑料皮肤、蜡像感、身体结构错误、手指畸形、水印、乱码文字。

## Boundaries

Do not create prompts that center explicit sexual content, soft porn, real-person sexualization, coercion, voyeurism, intoxication, private leaks, minor-coded features, school/student cues, or body-part close-ups. If the request contains these, reframe the supported parts into mature, original, tasteful, non-explicit sports portrait photography language.

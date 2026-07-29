---
name: image2-adult-glamour-studio
description: 生成高端成人魅力人像提示词，用于需要时尚杂志、电影感、商业肖像、氛围感路线的成年原创人像时，主打精致光影、高级质感和时尚化身体表达，避免软色情、真人相似和幼态审美。
---

# Image2 Adult Glamour Studio

## Shared Contract And Route Selection

Read `../_shared/core/parameter-schema.md`, `../_shared/core/art-direction-engine.md`, `../_shared/core/spatial-photography-engine.md`, `../_shared/core/prompt-compiler.md`, and `../_shared/core/output-contract.md` before writing. Create the parameter-lock and art-direction records, then choose a **single compatible route** from `../_shared/routes/route-registry.md`; record its `routeId` in the director expansion. Use a mature editorial thesis and one restrained counter-expectation; do not equate glamour with body-part emphasis. Do not blend multiple primary routes.

## Workflow

Use this skill to create Image2 prompts for adult glamour portraits where the main value is refined attractiveness, styling, posture, lighting, and editorial taste. This is not a soft-porn prompt generator.

1. Load `../_shared/references/adult-glamour-boundaries.md` if the user request includes risk-sensitive elements.
  2. Load `../_shared/references/portrait-fashion-parameters.md` for parameter choices when the user wants a structured prompt or provides multiple controls.
  3. Load `../_shared/references/image2-canvas-parameters.md` for aspect ratio, orientation, resolution/quality, image count, and output format defaults.
  4. Load `../_shared/references/required-prompt-anchors.md`, `../_shared/references/face-shape-reference.md`, and `../_shared/knowledge/hairstyles.md`. Include required basic anchors in **最终中文提示词**, randomly choose one mature-figure anchor as instructed, and use the face-shape or hairstyle references only when the user explicitly specifies that direction or asks for a random face shape/hairstyle; add intent anchors only when the user asks for sweet/maid styling, over-the-shoulder gaze, S-curve figure, or another matching intent.
  5. Establish locked parameters: subject, age/adult status, originality, style, scene, garment, posture, camera, lighting, aspect ratio, and quality target.
  6. Fill missing parameters conservatively with mature, non-explicit defaults. For blank posture or camera direction, default to a front-facing or slight three-quarter camera-facing subject, an eye-level or slight high editorial camera, and half-body or three-quarter-body portrait framing. For blank canvas parameters, apply defaults from `image2-canvas-parameters.md` and mark them as supplemental defaults.
  7. Produce the shared output contract. In complete mode, use its fixed order; this skill's glamour-specific decisions belong in **导演扩展**. In concise mode, return only the contracted prompt and negative constraints.

## Defaults

- Subject: original adult East Asian woman, age 20 or older, not resembling any real person; in Chinese prompts, "原创成年东方女性，20岁及以上".
- Subject override: respect explicit safe user-specified subject identities; use the East Asian default only when the subject is blank, unspecified, or automatic.
- Direction: mature glamour portrait, fashion/editorial framing, polished commercial taste.
- Scene: bright studio, tasteful interior, city apartment, window light, editorial set, or other non-private/non-voyeuristic context.
- Pose: natural standing or seated posture, relaxed shoulders, front-facing toward camera or graceful slight three-quarter turn while the face and body still naturally orient toward camera.
- Clothing: if the user has not specified clothing, randomly choose one of these fixed Chinese clothing phrases each time: "服装为剪裁优雅的吊带睡裙，材质细腻，版型合身，贴合身体，吊带一侧肩部自然滑落。" or "服装为剪裁优雅的短款深V款高级精致浅白色吊带背心，材质细腻，版型合身，贴合身体，腰部自然漏出，吊带两侧肩部自然滑落，下半身穿着白色蕾丝边内裤，精致且高级。"; if the user explicitly specifies safe clothing, preserve that garment instead.
- Camera: portrait lens, eye-level or slightly elevated editorial angle by default, half-body or three-quarter-body portrait framing. Use full-body/full-length framing only when the user explicitly asks for it.
- Canvas: default to `3:4竖版构图，超高清，高分辨率，细节清晰，适合人像写真` and `生成1张独立图片，不要合并，不要拼图`; override with user-locked values. See `image2-canvas-parameters.md` for defaults by scene type.
- Visual emphasis: face, expression, styling, garment fit, light, silhouette, color harmony, and overall composition.
- Prompt anchors: always include age, mature figure, natural posture, bright interior scene, and explicit safe clothing when provided or the random default clothing anchor from `required-prompt-anchors.md` when clothing is unspecified; add maid/sweet fantasy styling, over-the-shoulder gaze, and soft S-curve figure only when requested or useful for the user's stated intent.
- Figure anchor: unless the user provides another safe body/figure description, the **最终中文提示词** must include exactly one randomly chosen mature-figure anchor from `required-prompt-anchors.md`.
- Hairstyle: do not add a default or random hairstyle unless the user explicitly specifies a safe hairstyle/hair direction or asks for a random hairstyle. When hairstyle is triggered, preserve the user's safe hairstyle or choose exactly one hairstyle from `../_shared/knowledge/hairstyles.md`, prioritizing presets with mature/glamour/high-end style tags (such as 港风侧分大卷, 低盘发, 湿发造型, 直长发, 温柔大卷, etc.). Dimension keyword combinations (length, curl, bangs, hair color, etc.) are also supported without requiring a full preset name.

## Quality Guidance

- Avoid generic AI influencer beauty. Add specific but realistic face memory points, makeup texture, garment material, lighting, and any explicitly triggered hairstyle.
- Use "mature", "confident", "composed", "elegant", "editorial", "commercial portrait", and "fashion-led silhouette" instead of crude sensual language.
- Respect explicit safe user-specified posture and camera direction. Otherwise use the default camera-facing posture, half-body or three-quarter-body framing, and eye-level or slight high editorial camera; reframe unsafe low-angle body gaze, voyeuristic, or body-part-focused directions.
- When the user wants more visual tension, add contrast through gaze, pose rhythm, fabric structure, negative space, lighting, or palette rather than sexualized action.
- Treat body-shape wording as whole-person silhouette and garment-fit direction, not as body-part fixation.

## Shared Complete-Mode Format

Return all user-facing content in Simplified Chinese unless the user explicitly asks for another language. The final Image2 prompt, negative constraints, and variation knobs must be Chinese. Keep technical style tokens such as `Image2`, `GPT Image 2`, `Lookbook`, `editorial`, `RAW`, `8K`, lens names, and aspect ratios when they improve model clarity.

In complete mode, return exactly this order:

1. **意图摘要**
2. **已锁定参数**
3. **导演扩展**: state the single compatible route, glamour-specific lighting/composition decisions, safety reframes, and quality guidance.
4. **最终中文提示词**
5. **负面限制词**
6. **可选变化参数**: offer 3-6 safe adjustments such as palette, lens, material, setting, pose, or canvas.

The **最终中文提示词** must fully carry the triggered required prompt anchors. Include hairstyle from `../_shared/knowledge/hairstyles.md` only when the user explicitly triggers hairstyle. Other sections may summarize them briefly.

## 负面限制词起点

Use relevant constraints only, written in Chinese: 露骨裸体、性化姿势、身体局部特写、低机位身体凝视、胁迫或窥视视角、未成年感、学生元素、真实名人相似、真实品牌 logo、水印、身体结构错误、手指畸形、界面文字乱码、假发感、发型不对称、刘海变形、发色不均、编发结构错误、发量异常、发际线不自然、头发融合背景、发丝粘连。

## Boundaries

Do not create prompts that center explicit sexual content, soft porn, real-person sexualization, coercion, voyeurism, intoxication, private leaks, minor-coded features, school/student cues, or body-part close-ups. If the request contains these, use `$image2-aesthetic-rewriter` style reframing before writing the final prompt.

## 参考知识库

生成提示词时可参考以下共享知识库模块（位于 `_shared/knowledge/`），根据用户需求选择合适的参数和表达方式：

- **人物特征**：`../_shared/knowledge/character-features.md`
- **构图法则**：`../_shared/knowledge/composition.md`
- **光线与布光**：`../_shared/knowledge/lighting.md`
- **焦段与镜头语言**：`../_shared/knowledge/focal-length.md`
- **姿势与体态**：`../_shared/knowledge/poses.md`
- **风格与色调**：`../_shared/knowledge/styles.md`
- **后期与质感**：`../_shared/knowledge/post-processing.md`


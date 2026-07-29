---
name: image2-fashion-lingerie-lookbook
description: 生成内衣泳装时尚画册提示词，用于内衣、泳装、试穿、家居服等贴身服饰的产品级人像时，主打面料质感、版型剪裁、目录式陈列和商业呈现，避免身体部位凝视、真人相似和私拍感。
---

# Image2 Fashion Lingerie Lookbook

## Workflow

Use this skill for adult fashion prompts involving lingerie, bralette styling, swimwear, fit checks, dressing-room product confirmation, or lookbook imagery. The image must be garment-first and non-explicit.

Read `../_shared/core/art-direction-engine.md`, `../_shared/core/spatial-photography-engine.md`, and `../_shared/core/prompt-compiler.md`. Use the commerce adaptation: garment silhouette, fit, construction, material, coverage, and color accuracy outrank metaphor. Build a restrained thesis and reading hierarchy that lead the eye through the garment; add a counter-expectation only when it preserves product legibility. Describe body lines only as needed to explain fit, and remove props or effects that compete with the garment.

1. Load `../_shared/references/adult-glamour-boundaries.md` for safety boundaries.
2. Load `../_shared/references/portrait-fashion-parameters.md` for garment, scene, camera, and variation controls.
3. Load `../_shared/references/image2-canvas-parameters.md` for aspect ratio, orientation, resolution/quality, image count, and output format defaults.
4. Load `../_shared/core/output-contract.md` and `../_shared/core/quality-gates.md` before composing the response.
5. Load `../_shared/references/required-prompt-anchors.md`, `../_shared/references/face-shape-reference.md`, and `../_shared/knowledge/hairstyles.md`. Include required basic anchors in **最终中文提示词** as garment-fit, whole-body silhouette, lookbook posture, and bright interior styling direction, randomly choose one mature-figure anchor as instructed, and use the face-shape or hairstyle references only when the user explicitly specifies that direction or asks for a random face shape/hairstyle; add the swimwear Lookbook anchor whenever the user asks for swimwear, beach/pool, resort, summer vacation, or swim catalog imagery.
6. Convert risky private or soft-porn cues into commercial fashion context: catalog, lookbook, fitting appointment, product confirmation, studio, boutique fitting room, resort swimwear, or editorial styling.
7. Make the model an original adult East Asian woman by default, not a real person or celebrity, and render this in Chinese prompts as "原创成年东方女性，20岁及以上".
8. Respect explicit safe user-specified subject identities; use the East Asian default only when the subject is blank, unspecified, automatic, or unsafe.
9. Respect explicit safe user-specified posture and camera direction. If missing, default to a front-facing or slight three-quarter camera-facing model, an eye-level or slight high editorial camera, and half-body or three-quarter-body Lookbook framing. For blank canvas parameters, apply defaults from `image2-canvas-parameters.md` and mark them as supplemental defaults.
10. Keep the frame broad enough to show the face, garment, posture, and setting. Default to half-body or three-quarter-body composition unless the user explicitly asks for full-body/full-length framing or a catalog need requires it. Do not crop around private body areas or use low-angle body-gaze framing.
11. Produce the output contract below.

## Garment-First Rules

- For catalog requests, provide **正面、侧面、背面** views with matched framing, pose, lighting, and garment state; do not turn the views into body-part crops.
- State fabric, construction, opacity, stretch, texture, and fit at the relevant seams or support points so the garment remains identifiable across views.
- For SKU color variants, change only the approved colorway and preserve the same product construction, styling, model, camera setup, and catalog background unless the user requests another controlled variant.
- Check product consistency: silhouette, trim, closures, pattern placement, coverage, and accessories must agree across all catalog views and color variants.

- Describe garment type, coverage, support structure, material, trim, color, fit, texture, and styling purpose.
- For swimwear, always frame the result as a high-end swimwear brand Lookbook and emphasize cut, fabric, color, use context, and fresh summer atmosphere.
- Describe the scene as professional or lifestyle-commercial, not secret, leaked, voyeuristic, or intimate-for-viewer.
- Use natural or catalog-friendly posture: front-facing or slight three-quarter toward camera, standing in front of a mirror with face/garment/setting included, relaxed studio stance, resort walkway, poolside lookbook, dressing-room fit confirmation.
- Keep lingerie and swimwear non-explicit: lined lace, opaque fabric, appropriate coverage, no exposure, no transparent nudity, no exposure-driven or undressing-like slipping garments. The default one-shoulder strap naturally resting lower is allowed only as a restrained garment styling detail.
- Avoid "private SNS record", "boyfriend view", "sent to someone", "hidden camera", or similar framing that implies non-public sexualized access.
- Apply required prompt anchors only as overall mature body proportion, garment fit, natural posture, and lookbook composition. Do not make the chest, waist, hips, lingerie details, or any private area the focal crop.

## Required Prompt Anchors

- Always load `../_shared/references/required-prompt-anchors.md`, `../_shared/references/face-shape-reference.md`, and `../_shared/knowledge/hairstyles.md`; include required basic anchors in the **最终中文提示词**.
- Apply the basic anchors as garment-fit, mature whole-person silhouette, natural lookbook posture, bright commercial or interior scene, explicit safe clothing when provided, or the default elegant slip-dress clothing anchor when clothing is unspecified.
- Add intent anchors only when the user request matches them: swimwear/resort/pool/beach catalog imagery, maid or sweet fantasy styling, over-the-shoulder gaze, S-curve figure, or an explicit repair need.
- Keep any explicitly triggered hairstyle and anchors subordinate to the garment-first Lookbook purpose. Do not turn age, mature figure, posture, or clothing anchors into chest, waist, hip, private-area, or lingerie-detail close-ups.
- Unless the user provides another safe body/figure description, the **最终中文提示词** must include exactly one randomly chosen mature-figure anchor from `required-prompt-anchors.md`.
- Default framing is half-body or three-quarter-body. Use full-body/full-length Lookbook framing only when the user explicitly requests it or when a safe product catalog requirement genuinely needs the full outfit.
- Do not add a default or random hairstyle unless the user explicitly specifies a safe hairstyle/hair direction or asks for a random hairstyle. When hairstyle is triggered, preserve the user's safe hairstyle or choose exactly one hairstyle from `../_shared/knowledge/hairstyles.md`, prioritizing presets suitable for lingerie/swimwear/resort scenes (such as 海浪卷, 低马尾, 湿发造型, 半扎发, 温柔大卷, etc.). Dimension keyword combinations (length, curl, bangs, hair color, etc.) are also supported without requiring a full preset name.

## Output Format

Return all user-facing content in Simplified Chinese unless the user explicitly asks for another language. The final Image2 prompt, negative constraints, and variation knobs must be Chinese. Keep technical style tokens such as `Image2`, `GPT Image 2`, `Lookbook`, `editorial`, `RAW`, `8K`, lens names, and aspect ratios when they improve model clarity.

Return:

1. **意图摘要**
2. **已锁定参数**
3. **风险/质量说明**
4. **最终中文提示词**
5. **负面限制词**
6. **可选变化参数**

The **最终中文提示词** must fully carry the triggered required prompt anchors. Include hairstyle from `../_shared/knowledge/hairstyles.md` only when the user explicitly triggers hairstyle. Other sections may summarize them briefly.

## 负面限制词起点

Use relevant constraints only, written in Chinese: 露骨裸体、私密部位暴露、透明裸露、性化姿势、身体局部特写、低机位身体凝视、胁迫或窥视视角、未成年感、学生元素、真实名人相似、真实品牌 logo、水印、身体结构错误、手指畸形、界面文字乱码、假发感、发型不对称、刘海变形、发色不均、编发结构错误、发量异常、发际线不自然、头发融合背景、发丝粘连。

## 参考知识库

生成提示词时可参考以下共享知识库模块（位于 `_shared/knowledge/`），根据用户需求选择合适的参数和表达方式：

- **人物特征**：`../_shared/knowledge/character-features.md`
- **构图法则**：`../_shared/knowledge/composition.md`
- **光线与布光**：`../_shared/knowledge/lighting.md`
- **焦段与镜头语言**：`../_shared/knowledge/focal-length.md`
- **姿势与体态**：`../_shared/knowledge/poses.md`
- **服装与造型**：`../_shared/knowledge/fashion.md`
- **风格与色调**：`../_shared/knowledge/styles.md`


---
name: image2-fashion-lingerie-lookbook
description: Create mature, original, non-explicit adult lingerie, swimwear, fit-check, and fashion lookbook prompts for GPT Image 2 / Image2. Use for garment-first adult fashion imagery focused on product design, fit, fabric, styling, catalog context, and commercial presentation while avoiding soft porn, body-part fixation, minor-coded aesthetics, real-person sexualization, and private-leak framing.
---

# Image2 Fashion Lingerie Lookbook

## Workflow

Use this skill for adult fashion prompts involving lingerie, bralette styling, swimwear, fit checks, dressing-room product confirmation, or lookbook imagery. The image must be garment-first and non-explicit.

1. Load `../_shared/references/adult-glamour-boundaries.md` for safety boundaries.
2. Load `../_shared/references/portrait-fashion-parameters.md` for garment, scene, camera, and variation controls.
3. Load `../_shared/references/required-prompt-anchors.md`. Include its basic anchors in **最终中文提示词** as garment-fit, whole-body silhouette, lookbook posture, and bright interior styling direction; add the swimwear Lookbook anchor whenever the user asks for swimwear, beach/pool, resort, summer vacation, or swim catalog imagery.
4. Convert risky private or soft-porn cues into commercial fashion context: catalog, lookbook, fitting appointment, product confirmation, studio, boutique fitting room, resort swimwear, or editorial styling.
5. Make the model an original adult East Asian woman by default, not a real person or celebrity, and render this in Chinese prompts as "原创成年东方女性，20岁及以上".
6. Respect explicit safe user-specified subject identities; use the East Asian default only when the subject is blank, unspecified, automatic, or unsafe.
7. Respect explicit safe user-specified posture and camera direction. If missing, default to a front-facing or slight three-quarter camera-facing model and an eye-level or slight high editorial camera.
8. Keep the frame broad enough to show the face, garment, posture, and setting. Do not crop around private body areas or use low-angle body-gaze framing.
9. Produce the output contract below.

## Garment-First Rules

- Describe garment type, coverage, support structure, material, trim, color, fit, texture, and styling purpose.
- For swimwear, always frame the result as a high-end swimwear brand Lookbook and emphasize cut, fabric, color, use context, and fresh summer atmosphere.
- Describe the scene as professional or lifestyle-commercial, not secret, leaked, voyeuristic, or intimate-for-viewer.
- Use natural or catalog-friendly posture: front-facing or slight three-quarter toward camera, standing in front of a mirror with face/garment/setting included, relaxed studio stance, resort walkway, poolside lookbook, dressing-room fit confirmation.
- Keep lingerie and swimwear non-explicit: lined lace, opaque fabric, appropriate coverage, no exposure, no transparent nudity, no slipping garments.
- Avoid "private SNS record", "boyfriend view", "sent to someone", "hidden camera", or similar framing that implies non-public sexualized access.
- Apply required prompt anchors only as overall mature body proportion, garment fit, natural posture, and lookbook composition. Do not make the chest, waist, hips, lingerie details, or any private area the focal crop.

## Output Format

Return all user-facing content in Simplified Chinese unless the user explicitly asks for another language. The final Image2 prompt, negative constraints, and variation knobs must be Chinese. Keep technical style tokens such as `Image2`, `GPT Image 2`, `Lookbook`, `editorial`, `RAW`, `8K`, lens names, and aspect ratios when they improve model clarity.

Return:

1. **意图摘要**
2. **已锁定参数**
3. **风险/质量说明**
4. **最终中文提示词**
5. **负面限制词**
6. **可选变化参数**

The **最终中文提示词** must fully carry the triggered required prompt anchors. Other sections may summarize them briefly.

## 负面限制词起点

Use relevant constraints only, written in Chinese: 露骨裸体、私密部位暴露、透明裸露、性化姿势、身体局部特写、低机位身体凝视、胁迫或窥视视角、未成年感、学生元素、真实名人相似、真实品牌 logo、水印、身体结构错误、手指畸形、界面文字乱码。

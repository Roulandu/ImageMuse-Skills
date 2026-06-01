---
name: image2-character-reference-sheet
description: Create professional photorealistic character reference sheet, full-body turnaround, three-view character sheet, outfit detail sheet, and realistic face-detail prompt outputs for GPT Image 2 / Image2. Use when Codex needs one large image containing an original adult character's full-body front view, side view, back view, mandatory face close-up callout, consistent clothing, hairstyle, proportions, materials, accessories, and readable design-board layout while preserving the same adult, safe, non-explicit Image2 glamour/fashion defaults and anchors used by the existing skills.
---

# Image2 Character Reference Sheet

## Workflow

Use this skill to create Image2 prompts for a professional photorealistic character reference sheet in one large image. The image should show a consistent character across full-body front, side, and back views, with a mandatory face close-up callout and optional garment/detail callouts.

1. Load `../_shared/references/adult-glamour-boundaries.md` when the request includes sexuality, lingerie, swimwear, private settings, real people, celebrity likeness, age-coded wording, coercive framing, or platform/social identity.
2. Load `../_shared/references/portrait-fashion-parameters.md` for subject, garment, scene, camera, lighting, style, and aspect-ratio choices.
3. Load `../_shared/references/required-prompt-anchors.md`. Include its basic anchors in **最终中文提示词**, then add intent anchors only when the user asks for swimwear, maid/sweet fantasy styling, S-curve figure, or another matching intent.
4. Establish locked parameters: subject, age/adult status, originality, character genre, outfit, hairstyle, photoreal face memory points, body proportion, views, detail panels, background, aspect ratio, and quality target.
5. Default to a single horizontal photorealistic studio reference sheet with full-body front view, full-body side view, full-body back view, and 3-5 detail callout panels. One callout must be a clear face close-up used to lock the same face, hairstyle, makeup, and expression across all views.
6. Respect explicit safe user-specified subject identities; use the East Asian default only when the subject is blank, unspecified, automatic, or unsafe.
7. Respect explicit safe user-specified clothing; when unspecified, use the existing default elegant slip-dress clothing anchor.
8. Produce the output contract below.

## Defaults

- Subject: original adult East Asian woman, age 20 or older, not resembling any real person; in Chinese prompts, "原创成年东方女性，20岁及以上".
- Output type: professional character reference sheet, one large image, full-body turnaround and detail board.
- Direction: mature photorealistic studio reference sheet, realistic fashion fitting reference, commercial photography feel, polished but non-explicit.
- Realism target: prioritize a life-like adult face over illustration polish: realistic adult facial structure, subtle natural asymmetry, real skin texture, visible pores, light skin imperfections, natural makeup texture, believable eyes, and a calm natural expression.
- Default face direction override: for this reference-sheet skill, replace generic cute-sweet face defaults with "成熟自然的成年东方女性面部结构，非幼态，非网红模板脸，具有可记忆但原创的五官特征，真实皮肤纹理，自然不对称，眼神自然有生活感". Keep any safe user-specified face direction if provided.
- Layout: wide canvas with three full-body views arranged left to right: front view, side view, back view; add small detail panels around the views without covering the character.
- Background: white, pale gray, or light neutral design-board background with subtle guide lines or labels; no busy environment unless requested.
- Pose: stable neutral A-pose or relaxed natural standing posture for all views, feet visible, arms readable, body proportions aligned across views.
- Clothing: if the user has not specified clothing, randomly choose one of these fixed Chinese clothing phrases each time: "服装为剪裁优雅的吊带睡裙，材质细腻，版型合身，贴合身体，吊带一侧肩部自然滑落。" or "服装为剪裁优雅的短款深V款高级精致浅白色吊带背心，材质细腻，版型合身，贴合身体，腰部自然漏出，吊带两侧肩部自然滑落，下半身穿着白色蕾丝边内裤，精致且高级。"; if the user explicitly specifies safe clothing, preserve that garment instead.
- Camera: orthographic or near-orthographic design-sheet view, full-body framing, consistent scale across views, no dramatic perspective distortion.
- Aspect ratio: default to horizontal `16:9` or `4:3`; use vertical only if the user explicitly asks.
- Visual emphasis: character consistency, full-body proportions, photoreal face design, skin texture, hairstyle, outfit construction, fabric, accessories, back details, side silhouette, readable detail panels.
- Prompt anchors: always include age, mature figure, natural posture, bright interior/light neutral background, and explicit safe clothing when provided or the random default clothing anchor when clothing is unspecified.
- Final prompt face requirement: the **最终中文提示词** must explicitly include a clear face close-up callout outside the three full-body views, and must state that all views share the same face, hairstyle, makeup, expression logic, body proportions, outfit, colors, materials, and accessories.
- Verbatim figure anchor: unless the user provides another safe body/figure description, the **最终中文提示词** must include this sentence exactly as written: "上半身身形丰腴，胸部轮廓自然饱满，整体身形纤细匀称，身体比例协调，腰肩线条自然，曲线流畅，整体凸显轻盈健康的女性体态。"

## Reference Sheet Rules

- Make the prompt explicitly request one single large image containing multiple views, not separate images.
- Use "front view, side view, back view" language in Chinese and, when helpful, add English labels as design-board labels: `FRONT`, `SIDE`, `BACK`.
- Keep the same character identity across all views: same face, hairstyle, body proportions, outfit, colors, materials, and accessories.
- Use full-body framing by default. This skill intentionally overrides the half-body or three-quarter-body default used by portrait skills.
- Add detail callouts only for design clarity. Always include a face close-up callout for identity locking; optional callouts may include hair ornament, neckline, fabric texture, sleeve, waist detail, accessory, shoes, back construction, seam line, or color palette swatches.
- Keep detail panels professional and non-voyeuristic. Do not crop private areas, isolate sexualized anatomy, or turn clothing details into lingerie/body-part fixation.
- Avoid dynamic action poses, extreme twisting, low-angle body gaze, poster lighting, or atmospheric scenes that weaken the turnaround-sheet purpose.

## Quality Guidance

- Prioritize clean silhouettes, consistent scale, symmetrical alignment, readable clothing construction, and believable anatomy.
- Add exact design language when useful: photorealistic studio reference sheet, realistic character turnaround, commercial photography feel, clean line organization, neutral standing pose, near-orthographic full-body views, material callouts.
- For realistic prompts, ask for a photorealistic studio reference sheet or realistic fashion fitting reference, not candid photography, private-leak framing, polished fashion concept art, or painterly design-board rendering.
- Make face realism explicit in the final prompt: real skin texture, pores, subtle skin imperfections, natural makeup texture, believable eye reflections, adult bone structure, natural facial asymmetry, and no generic AI influencer beauty.
- Use labels sparingly and simply; Image2 may distort long text, so prefer short labels and visual callouts over paragraphs.
- Treat body-shape wording as whole-person proportion and garment-fit direction, not as body-part emphasis.

## Output Format

Return all user-facing content in Simplified Chinese unless the user explicitly asks for another language. The final Image2 prompt, negative constraints, and variation knobs must be Chinese. Keep technical style tokens such as `Image2`, `GPT Image 2`, `Lookbook`, `editorial`, `RAW`, `8K`, labels such as `FRONT/SIDE/BACK`, and aspect ratios when they improve model clarity.

Return:

1. **意图摘要**
2. **已锁定参数**
3. **设定图版面说明**
4. **风险/质量说明**
5. **最终中文提示词**
6. **负面限制词**
7. **可选变化参数**

The **最终中文提示词** must fully carry the triggered required prompt anchors, the one-image full-body front/side/back reference-sheet layout, the mandatory face close-up callout, and the photoreal face requirements. It should explicitly include Chinese wording equivalent to: 写实参考表、真实面部、皮肤纹理、脸部近景 callout、同一张脸一致性. Other sections may summarize them briefly.

The **负面限制词** must include relevant safety and quality constraints, including: 塑料皮肤、蜡像感、AI 网红脸、过度磨皮、动漫脸、插画脸、娃娃脸、五官过度对称、眼睛过大、脸部细节缺失.

## Boundaries

Do not create prompts that center explicit sexual content, soft porn, real-person sexualization, coercion, voyeurism, intoxication, private leaks, minor-coded features, school/student cues, or body-part close-ups. If the request contains these, use `$image2-aesthetic-rewriter` style reframing before writing the final prompt.

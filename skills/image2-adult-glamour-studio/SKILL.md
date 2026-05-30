---
name: image2-adult-glamour-studio
description: Create mature, original, non-explicit adult glamour portrait prompts for GPT Image 2 / Image2 with fashion, editorial, cinematic, or commercial portrait framing. Use for adult glamour photos, high-end female portraits, mature beauty, refined attractiveness, fashion-led body silhouette, and polished visual direction that avoids soft porn, real-person sexualization, non-consensual framing, and minor-coded aesthetics.
---

# Image2 Adult Glamour Studio

## Workflow

Use this skill to create Image2 prompts for adult glamour portraits where the main value is refined attractiveness, styling, posture, lighting, and editorial taste. This is not a soft-porn prompt generator.

1. Load `../_shared/references/adult-glamour-boundaries.md` if the user request includes risk-sensitive elements.
2. Load `../_shared/references/portrait-fashion-parameters.md` for parameter choices when the user wants a structured prompt or provides multiple controls.
3. Load `../_shared/references/required-prompt-anchors.md`. Include its basic anchors in **最终中文提示词**, then add intent anchors only when the user asks for sweet/maid styling, over-the-shoulder gaze, S-curve figure, or another matching intent.
4. Establish locked parameters: subject, age/adult status, originality, style, scene, garment, posture, camera, lighting, aspect ratio, and quality target.
5. Fill missing parameters conservatively with mature, non-explicit defaults.
6. Produce the output contract below.

## Defaults

- Subject: original adult East Asian woman, age 20 or older, not resembling any real person; in Chinese prompts, "原创成年东方女性，20岁及以上".
- Subject override: respect explicit safe user-specified subject identities; use the East Asian default only when the subject is blank, unspecified, or automatic.
- Direction: mature glamour portrait, fashion/editorial framing, polished commercial taste.
- Scene: bright studio, tasteful interior, city apartment, window light, editorial set, or other non-private/non-voyeuristic context.
- Pose: natural standing or seated posture, relaxed shoulders, graceful three-quarter turn, eye-level camera.
- Clothing: tailored dress, knitwear, structured top, fashion separates, eveningwear, or other stylish non-explicit wardrobe unless the user chooses another supportable fashion context.
- Camera: portrait lens, eye-level or slightly elevated editorial angle, half-body to full-body framing.
- Visual emphasis: face, expression, styling, garment fit, light, silhouette, color harmony, and overall composition.
- Prompt anchors: always include age, mature figure, natural posture, bright interior scene, and elegant clothing from `required-prompt-anchors.md`; add maid/sweet fantasy styling, over-the-shoulder gaze, and soft S-curve figure only when requested or useful for the user's stated intent.

## Quality Guidance

- Avoid generic AI influencer beauty. Add specific but realistic face memory points, hair styling, makeup texture, garment material, and lighting.
- Use "mature", "confident", "composed", "elegant", "editorial", "commercial portrait", and "fashion-led silhouette" instead of crude sensual language.
- When the user wants more visual tension, add contrast through gaze, pose rhythm, fabric structure, negative space, lighting, or palette rather than sexualized action.
- Treat body-shape wording as whole-person silhouette and garment-fit direction, not as body-part fixation.

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

## Boundaries

Do not create prompts that center explicit sexual content, soft porn, real-person sexualization, coercion, voyeurism, intoxication, private leaks, minor-coded features, school/student cues, or body-part close-ups. If the request contains these, use `$image2-aesthetic-rewriter` style reframing before writing the final prompt.

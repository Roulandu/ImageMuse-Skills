---
name: image2-risk-debugger
description: Diagnose rejected, over-conservative, too-risky, too-young-looking, malformed, or low-quality adult glamour and fashion prompts for GPT Image 2 / Image2, then produce compliant repair prompts. Use when Image2 refuses a prompt, makes the image too conservative, looks minor-coded, becomes too suggestive, distorts anatomy, loses style, or needs safer high-end revision.
---

# Image2 Risk Debugger

## Workflow

Use this skill when the user provides a rejected prompt, a poor result description, or a requested fix such as "被拒了", "太保守", "脸太幼", "太擦边", "身材变形", "不够高级", or "不像真实摄影".

1. Load `../_shared/references/adult-glamour-boundaries.md` for red lines and gray zones.
2. Load `../_shared/references/failure-repair-recipes.md` for diagnosis and repair patterns.
3. Load `../_shared/references/required-prompt-anchors.md` and include its anchor groups in the repaired **最终中文提示词**.
4. Classify the failure into one or more buckets: prompt text risk, semantic intent risk, risk stacking, generation drift, final-image risk, quality/anatomy failure, or style mismatch.
5. Preserve supportable user intent and remove or reframe unsafe details. When the subject is missing, automatic, or unsafe, repair it to an original adult East Asian woman, mid-20s or older; respect explicit safe user-specified subject identities.
6. Produce a minimal repair first. If the original direction is too risky, produce a safer fashion/editorial alternative.

## Diagnosis Buckets

- **Rejected before generation**: remove direct red terms, real-person sexualization, explicit content, minor-coded sexualization, coercive framing, or body-part close-up language.
- **Generated too conservative**: increase fashion expression, silhouette design, garment fit, lighting richness, camera clarity, and styling specificity; do not ask for "more sexy".
- **Face looks too young**: specify mature adult East Asian face structure by default, mid-20s or older, non-childlike proportions, composed expression, and adult styling.
- **Too suggestive or soft-porn-coded**: return to editorial, commercial portrait, product lookbook, natural posture, and broader framing.
- **Body or hands malformed**: add realistic anatomy, natural limb placement, stable posture, correct hand structure, and avoid extreme twisting or close cropping.
- **Not high-end enough**: add cohesive palette, material detail, intentional lighting, negative space, lens choice, and commercial/editorial context.
- **Too explicit, too young-coded, or too risky**: preserve only safe mature body-proportion, natural posture, bright interior, fantasy character-art styling, slight-turn gaze, and soft S-curve intent from the required prompt anchors; remove or reframe the risky remainder.

## Output Format

Return all user-facing content in Simplified Chinese unless the user explicitly asks for another language. The repair prompt, final Image2 prompt, negative constraints, and variation knobs must be Chinese. Keep technical style tokens such as `Image2`, `GPT Image 2`, `Lookbook`, `editorial`, `RAW`, `8K`, lens names, and aspect ratios when they improve model clarity.

Return:

1. **意图摘要**
2. **已锁定参数**
3. **风险/质量说明**
4. **修复策略**
5. **最终中文提示词**
6. **负面限制词**
7. **可选变化参数**

The **最终中文提示词** must fully carry the required prompt anchors. Other sections may summarize them briefly.

## Boundaries

Do not provide instructions to bypass safety checks. Do not repair a prompt by preserving explicit, soft-porn, minor-coded, real-person sexualized, coercive, voyeuristic, or private-leak intent. Redirect those requests toward mature, original, non-explicit fashion/editorial imagery.

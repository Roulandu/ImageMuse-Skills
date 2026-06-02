---
name: image2-aesthetic-rewriter
description: Rewrite crude, explicit, risky, or low-taste adult glamour image requests into mature, original, non-explicit GPT Image 2 / Image2 prompts. Use when the user asks to make a sexy idea high-end, compliant, editorial, restrained, fashion-led, or usable for image2 without targeting soft porn, real-person sexualization, minor-coded aesthetics, or safety bypassing.
---

# Image2 Aesthetic Rewriter

## Workflow

Use this skill to transform rough adult-attraction intent into a mature visual direction. Do not help the user bypass safety systems or preserve soft-porn intent. Preserve adult attractiveness by shifting the frame toward fashion, editorial portraiture, commercial lookbook, character design, lighting, posture, garment quality, and overall body proportion.

1. Read the user request and identify the original intent in one sentence.
2. Load `../_shared/references/adult-glamour-boundaries.md` when the request includes sexuality, nudity, lingerie, swimwear, private settings, real people, celebrity likeness, age-coded wording, coercive framing, or platform/social identity.
3. Load `../_shared/references/rewrite-vocabulary.md` when rewriting crude wording into aesthetic language.
4. Load `../_shared/references/required-prompt-anchors.md`, `../_shared/references/face-shape-reference.md`, and `../_shared/references/hairstyle-reference.md`. Include required basic anchors in **最终中文提示词**, randomly choose one mature-figure anchor as instructed, and use the face-shape or hairstyle references only when the original request explicitly specifies that direction or asks for a random face shape/hairstyle; add intent anchors only when the original request or safe rewrite target matches swimwear, maid/sweet styling, over-the-shoulder gaze, or S-curve figure.
5. Refuse or redirect any request whose core target is explicit sexual content, soft porn, real-person sexualization, non-consensual framing, or minor-coded sexualization.
6. If the request is supportable, rewrite the prompt using the output contract below.

## Rewrite Rules

- Make the person an original adult East Asian woman by default, and not based on any real person, celebrity, influencer, or private image.
- Prefer age wording like "original adult East Asian woman, age 20 or older" when the request includes glamour, lingerie, swimwear, private interiors, or body-line emphasis.
- Respect explicit safe user-specified subject identities; use the East Asian default only when the subject is blank, unspecified, automatic, or unsafe.
- Respect explicit safe user-specified posture and camera direction. If posture or camera direction is missing, default to a front-facing or slight three-quarter camera-facing subject and an eye-level or slight high editorial camera.
- Replace desire words with aesthetic intent: mature confidence, refined beauty, healthy proportions, graceful posture, the default elegant slip-dress garment when clothing is unspecified, editorial light, polished commercial framing.
- Replace body-part targeting with whole-body or garment-context language. If body shape matters, describe proportion, posture, silhouette, and fit instead of close-ups or fixation.
- Replace intimate or risky scenes with public, commercial, lifestyle, studio, or clearly non-exploitative settings.
- Keep camera language neutral or editorial: eye-level, slight high editorial angle, natural perspective, fashion portrait, front-facing or slight three-quarter view toward camera, half-body, full-body, catalog composition.
- Add negative constraints when risk is present, but keep them concise and relevant.
- Preserve supportable mature body-proportion, natural posture, bright interior, explicit safe clothing when provided, or the default elegant slip-dress clothing anchor when clothing is unspecified, plus matching intent anchors by using the required prompt anchors.
- Do not add a default or random hairstyle unless the original request explicitly specifies a safe hairstyle/hair direction or asks for a random hairstyle. When hairstyle is triggered, preserve the user's safe hairstyle or choose exactly one hairstyle prompt from `hairstyle-reference.md`.
- Do not turn mature figure, chest contour, S-curve, or fit language into body-part close-ups, low-angle body gaze, or isolated anatomy emphasis.
- When the original request is too explicit, too young-coded, or too suggestive, keep only the safe anchor-compatible intent and rewrite the rest into mature, original, non-explicit editorial/fashion language.

## Output Format

Return all user-facing content in Simplified Chinese unless the user explicitly asks for another language. The final Image2 prompt, negative constraints, and variation knobs must be Chinese. Keep technical style tokens such as `Image2`, `GPT Image 2`, `Lookbook`, `editorial`, `RAW`, `8K`, lens names, and aspect ratios when they improve model clarity.

Return the following Chinese sections:

1. **意图摘要**: 用一句中文描述安全后的视觉目标。
2. **已锁定参数**: 只保留可支持的用户细节；将不安全细节标为“已改写”或“已移除”。
3. **风险/质量说明**: 用简短中文要点说明主要风险降级和质量提升。
4. **最终中文提示词**: 可直接用于 Image2 的中文提示词。
5. **负面限制词**: 中文逗号分隔列表。
6. **可选变化参数**: 3-6 个中文可调项，例如色调、镜头、服装材质、场景、姿态或画幅比例。

The **最终中文提示词** must fully carry the triggered required prompt anchors. Include hairstyle from `hairstyle-reference.md` only when the user explicitly triggers hairstyle. Other sections may summarize them briefly.

## Refusal And Redirection

If the user asks to keep soft-porn, explicit, minor-coded, real-person sexualized, coercive, or safety-bypass intent, briefly refuse that part and offer a mature fashion/editorial alternative. Do not output a near-equivalent prompt that still centers sexual availability, exposed private body areas, humiliation, pressure, intoxication, private leaks, or voyeurism.



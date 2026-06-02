---
name: image2-character-poster-cover
description: Create complete original character poster, magazine cover, editorial cover, campaign key visual, and promotional poster prompts for GPT Image 2 / Image2. Use when Codex needs a finished poster or magazine-cover image with an original adult character, random fictional title text, cover lines, issue/date/price-like details, commercial layout, and mature non-explicit fashion/editorial styling while avoiding real brands, real magazine names, real logos, real copyright identifiers, real-person sexualization, minor-coded aesthetics, and soft-porn framing.
---

# Image2 Character Poster Cover

## Workflow

Use this skill to create Image2 prompts whose final image is a finished character poster or magazine cover, not a plain portrait with empty title space.

1. Load `../_shared/references/adult-glamour-boundaries.md` when the request includes sexuality, lingerie, swimwear, private settings, real people, celebrity likeness, age-coded wording, coercive framing, or platform/social identity.
2. Load `../_shared/references/portrait-fashion-parameters.md` for subject, garment, scene, camera, lighting, style, and aspect-ratio choices.
3. Load `../_shared/references/required-prompt-anchors.md`, `../_shared/references/face-shape-reference.md`, and `../_shared/references/hairstyle-reference.md`. Include required basic anchors in **最终中文提示词**, randomly choose one mature-figure anchor as instructed, and use the face-shape or hairstyle references only when the user explicitly specifies that direction or asks for a random face shape/hairstyle; add intent anchors only when the user asks for swimwear, maid/sweet fantasy styling, over-the-shoulder gaze, S-curve figure, or another matching intent.
4. Establish locked parameters: output type, subject, age/adult status, originality, poster/cover genre, garment, posture, camera, lighting, text system, layout density, aspect ratio, and quality target.
5. When the user has not specified cover/poster text, generate random original text: fictional magazine or poster name, main title, subtitle, cover lines, column tags, issue number, date, price-like decorative string, and a short slogan. Do not leave blank title areas.
6. Make all text fictional and copyright-safe. Do not use real magazine names, real brand names, real logos, real copyright IDs, real ISSN/ISBN numbers, real celebrity names, or real campaign slogans.
7. Respect explicit safe user-specified subject identities; use the East Asian default only when the subject is blank, unspecified, automatic, or unsafe.
8. Respect explicit safe user-specified posture and camera direction. If missing, default to a front-facing or slight three-quarter camera-facing subject and an eye-level or slight high editorial camera.
9. Produce the output contract below.

## Defaults

- Subject: original adult East Asian woman, age 20 or older, not resembling any real person; in Chinese prompts, "原创成年东方女性，20岁及以上".
- Output type: finished character poster or finished magazine cover with complete typography and layout.
- Direction: mature fashion/editorial cover image, commercial poster polish, high-end character key visual.
- Text: if unspecified, invent random original Chinese/English text such as a fictional masthead, main title, subtitle, several short cover lines, issue/date/price-like decorative details, and slogan.
- Scene: bright studio, tasteful interior, city apartment, editorial set, campaign backdrop, fashion studio, or other non-private/non-voyeuristic context.
- Clothing: if the user has not specified clothing, randomly choose one of these fixed Chinese clothing phrases each time: "服装为剪裁优雅的吊带睡裙，材质细腻，版型合身，贴合身体，吊带一侧肩部自然滑落。" or "服装为剪裁优雅的短款深V款高级精致浅白色吊带背心，材质细腻，版型合身，贴合身体，腰部自然漏出，吊带两侧肩部自然滑落，下半身穿着白色蕾丝边内裤，精致且高级。"; if the user explicitly specifies safe clothing, preserve that garment instead.
- Camera: portrait lens, eye-level or slightly elevated editorial angle by default, half-body or three-quarter-body cover framing unless a full-body poster is requested.
- Aspect ratio: default to vertical `2:3` or `3:4`; use `9:16`, `1:1`, `16:9`, or other ratios only when requested or useful for the poster format.
- Visual emphasis: face, expression, styling, garment fit, silhouette, cover hierarchy, readable fictional typography, color harmony, and finished print-design composition.
- Prompt anchors: always include age, mature figure, natural posture, bright interior scene, and explicit safe clothing when provided or the random default clothing anchor when clothing is unspecified.
- Figure anchor: unless the user provides another safe body/figure description, the **最终中文提示词** must include exactly one randomly chosen mature-figure anchor from `required-prompt-anchors.md`.
- Hairstyle: do not add a default or random hairstyle unless the user explicitly specifies a safe hairstyle/hair direction or asks for a random hairstyle. When hairstyle is triggered, preserve the user's safe hairstyle or choose exactly one hairstyle prompt from `hairstyle-reference.md`.

## Poster And Cover Text Rules

- Generate actual visible text content by default. Do not ask the image model to reserve blank space for later typography unless the user explicitly requests a blank template.
- Make the text short enough to render cleanly: one masthead or poster name, one main title, one subtitle, 3-6 short cover lines or feature tags, and small decorative issue/date/price-like marks.
- Use fictional names and invented copy, for example: "LUMINA", "AURA MODE", "晨光特辑", "CITY MUSE", "No. 07", "2026 SPRING", "RMB 28" as decorative invented magazine language. Avoid real magazine mastheads and real identifiers.
- Prefer clear typography instructions: large masthead, bold main title, smaller cover lines, balanced margins, layered editorial layout, clean type hierarchy, high-end print design.
- If the user asks for a movie poster, game poster, event poster, or album-poster feel, generate a fictional original title and tagline instead of magazine masthead language.
- Do not include copyrighted logos, exact real brand typography, real magazine covers, real product packaging, watermarks, QR codes, barcodes, legal marks, or exact official-looking registration numbers.

## Quality Guidance

- The result should read immediately as a finished poster or magazine cover: cover typography, designed title hierarchy, character focal point, print-layout balance, and polished commercial color grading.
- Avoid generic AI influencer beauty. Add specific but realistic face memory points, makeup texture, garment material, lighting, cover-design rhythm, and any explicitly triggered hairstyle.
- Keep text prompts model-friendly: specify clean readable typography and original fictional wording, but avoid long paragraphs that encourage garbled text.
- Treat body-shape wording as whole-person silhouette and garment-fit direction, not as body-part fixation.
- Reframe unsafe low-angle body gaze, voyeuristic framing, explicit sexual wording, or private-access cues into mature editorial poster language.

## Output Format

Return all user-facing content in Simplified Chinese unless the user explicitly asks for another language. The final Image2 prompt, negative constraints, and variation knobs must be Chinese. Keep technical style tokens such as `Image2`, `GPT Image 2`, `Lookbook`, `editorial`, `RAW`, `8K`, lens names, and aspect ratios when they improve model clarity.

Return:

1. **意图摘要**
2. **已锁定参数**
3. **随机封面/海报文字**
4. **风险/质量说明**
5. **最终中文提示词**
6. **负面限制词**
7. **可选变化参数**

The **最终中文提示词** must fully carry the triggered required prompt anchors and the generated fictional poster/cover text. Include hairstyle from `hairstyle-reference.md` only when the user explicitly triggers hairstyle. Other sections may summarize them briefly.

## Boundaries

Do not create prompts that center explicit sexual content, soft porn, real-person sexualization, coercion, voyeurism, intoxication, private leaks, minor-coded features, school/student cues, or body-part close-ups. Do not use real magazine names, real brand names, real logos, real copyright IDs, real public figures, or real campaign slogans. If the request contains these, use `$image2-aesthetic-rewriter` style reframing before writing the final prompt.



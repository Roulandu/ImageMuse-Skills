---
name: image2-character-poster-cover
description: 生成角色海报与杂志封面提示词，用于需要完整原创角色海报、杂志封面、时尚大片封面、商业主视觉时，包含虚构标题文字、封面文案、刊期价格等商业版式元素，避免真实品牌、真实杂志名和真人相似。
---

# Image2 Character Poster Cover

## Shared Contract And Delivery Alternatives

Read `../_shared/core/parameter-schema.md` and `../_shared/core/output-contract.md` before writing. Create the parameter-lock record and select one compatible `routeId` from `../_shared/routes/route-registry.md`. In complete mode, **导演扩展** must provide two clearly labelled deliverables: a copy-bearing poster prompt with fictional readable copy, and a **text-free blank-layout** alternative that preserves the hierarchy, safe margins, and reserved text zones but contains no text. In concise mode, return only the contracted final prompt and negative constraints; default to the copy-bearing version unless the user explicitly requests the blank layout.

## Workflow

Use this skill to create Image2 prompts whose final image is a finished character poster or magazine cover, not a plain portrait with empty title space.

1. Load `../_shared/references/adult-glamour-boundaries.md` when the request includes sexuality, lingerie, swimwear, private settings, real people, celebrity likeness, age-coded wording, coercive framing, or platform/social identity.
2. Load `../_shared/references/portrait-fashion-parameters.md` for subject, garment, scene, camera, lighting, style, and aspect-ratio choices.
3. Load `../_shared/references/image2-canvas-parameters.md` for aspect ratio, orientation, resolution/quality, image count, and output format defaults.
4. Load `../_shared/references/required-prompt-anchors.md`, `../_shared/references/face-shape-reference.md`, and `../_shared/knowledge/hairstyles.md`. Include required basic anchors in **最终中文提示词**, randomly choose one mature-figure anchor as instructed, and use the face-shape or hairstyle references only when the user explicitly specifies that direction or asks for a random face shape/hairstyle; add intent anchors only when the user asks for swimwear, maid/sweet fantasy styling, over-the-shoulder gaze, S-curve figure, or another matching intent.
5. Establish locked parameters: output type, subject, age/adult status, originality, poster/cover genre, garment, posture, camera, lighting, text system, layout density, aspect ratio, and quality target.
6. When the user has not specified cover/poster text, generate random original text: fictional magazine or poster name, main title, subtitle, cover lines, column tags, issue number, date, price-like decorative string, and a short slogan. Do not leave blank title areas.
7. Make all text fictional and copyright-safe. Do not use real magazine names, real brand names, real logos, real copyright IDs, real ISSN/ISBN numbers, real celebrity names, or real campaign slogans.
8. Respect explicit safe user-specified subject identities; use the East Asian default only when the subject is blank, unspecified, automatic, or unsafe.
9. Respect explicit safe user-specified posture and camera direction. If missing, default to a front-facing or slight three-quarter camera-facing subject and an eye-level or slight high editorial camera. For blank canvas parameters, apply defaults from `image2-canvas-parameters.md` and mark them as supplemental defaults.
10. Produce the shared output contract, including both delivery alternatives when `outputMode` is `complete`.

## Defaults

- Subject: original adult East Asian woman, age 20 or older, not resembling any real person; in Chinese prompts, "原创成年东方女性，20岁及以上".
- Output type: finished character poster or finished magazine cover with complete typography and layout.
- Direction: mature fashion/editorial cover image, commercial poster polish, high-end character key visual.
- Text: if unspecified, invent random original Chinese/English text such as a fictional masthead, main title, subtitle, several short cover lines, issue/date/price-like decorative details, and slogan.
- Scene: bright studio, tasteful interior, city apartment, editorial set, campaign backdrop, fashion studio, or other non-private/non-voyeuristic context.
- Clothing: if the user has not specified clothing, randomly choose one of these fixed Chinese clothing phrases each time: "服装为剪裁优雅的吊带睡裙，材质细腻，版型合身，贴合身体，吊带一侧肩部自然滑落。" or "服装为剪裁优雅的短款深V款高级精致浅白色吊带背心，材质细腻，版型合身，贴合身体，腰部自然漏出，吊带两侧肩部自然滑落，下半身穿着白色蕾丝边内裤，精致且高级。"; if the user explicitly specifies safe clothing, preserve that garment instead.
- Camera: portrait lens, eye-level or slightly elevated editorial angle by default, half-body or three-quarter-body cover framing unless a full-body poster is requested.
- Aspect ratio: default to vertical `2:3` or `3:4`; use `9:16`, `1:1`, `16:9`, or other ratios only when requested or useful for the poster format. Always pair aspect ratio with orientation wording (e.g. `3:4竖版构图`, `16:9横版电影级宽画幅`). Add resolution/quality wording (`超高清，高分辨率，细节清晰`), image count (`生成1张独立图片，不要合并，不要拼图`), and format/purpose when relevant. See `image2-canvas-parameters.md`.
- Visual emphasis: face, expression, styling, garment fit, silhouette, cover hierarchy, readable fictional typography, color harmony, and finished print-design composition.
- Prompt anchors: always include age, mature figure, natural posture, bright interior scene, and explicit safe clothing when provided or the random default clothing anchor when clothing is unspecified.
- Figure anchor: unless the user provides another safe body/figure description, the **最终中文提示词** must include exactly one randomly chosen mature-figure anchor from `required-prompt-anchors.md`.
- Hairstyle: do not add a default or random hairstyle unless the user explicitly specifies a safe hairstyle/hair direction or asks for a random hairstyle. When hairstyle is triggered, preserve the user's safe hairstyle or choose exactly one hairstyle from `../_shared/knowledge/hairstyles.md`, matching the hairstyle to the poster/cover style (magazine feel → 港风侧分大卷 or 温柔大卷; minimalist → 精灵短发 or 锁骨内扣; fashion editorial → 湿发造型; retro → 港风侧分大卷; etc.). Dimension keyword combinations (length, curl, bangs, hair color, etc.) are also supported without requiring a full preset name.

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

## Shared Complete-Mode Format

Return all user-facing content in Simplified Chinese unless the user explicitly asks for another language. The final Image2 prompt, negative constraints, and variation knobs must be Chinese. Keep technical style tokens such as `Image2`, `GPT Image 2`, `Lookbook`, `editorial`, `RAW`, `8K`, lens names, and aspect ratios when they improve model clarity.

In complete mode, return exactly this order:

1. **意图摘要**
2. **已锁定参数**
3. **导演扩展**: include fictional copy, layout and quality decisions, plus the copy-bearing version and the text-free blank-layout alternative.
4. **最终中文提示词**
5. **负面限制词**
6. **可选变化参数**: offer 3-6 safe adjustments such as hierarchy, palette, lens, setting, pose, or canvas.

The **最终中文提示词** must fully carry the triggered required prompt anchors and the generated fictional poster/cover text. Include hairstyle from `../_shared/knowledge/hairstyles.md` only when the user explicitly triggers hairstyle. Other sections may summarize them briefly.

## 负面限制词起点

Use relevant constraints only, written in Chinese: 露骨裸体、性化姿势、身体局部特写、低机位身体凝视、胁迫或窥视视角、未成年感、学生元素、真实名人相似、真实品牌 logo、真实杂志名、真实 ISSN/ISBN、水印、身体结构错误、手指畸形、界面文字乱码、假发感、发型不对称、刘海变形、发色不均、编发结构错误、发量异常、发际线不自然、头发融合背景、发丝粘连。

## Boundaries

Do not create prompts that center explicit sexual content, soft porn, real-person sexualization, coercion, voyeurism, intoxication, private leaks, minor-coded features, school/student cues, or body-part close-ups. Do not use real magazine names, real brand names, real logos, real copyright IDs, real public figures, or real campaign slogans. If the request contains these, use `$image2-aesthetic-rewriter` style reframing before writing the final prompt.

## 参考知识库

生成提示词时可参考以下共享知识库模块（位于 `_shared/knowledge/`），根据用户需求选择合适的参数和表达方式：

- **人物特征**：`../_shared/knowledge/character-features.md`
- **构图法则**：`../_shared/knowledge/composition.md`
- **光线与布光**：`../_shared/knowledge/lighting.md`
- **焦段与镜头语言**：`../_shared/knowledge/focal-length.md`
- **风格与色调**：`../_shared/knowledge/styles.md`
- **后期与质感**：`../_shared/knowledge/post-processing.md`


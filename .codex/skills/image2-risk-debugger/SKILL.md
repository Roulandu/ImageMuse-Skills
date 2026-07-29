---
name: image2-risk-debugger
description: 诊断并修复有问题的人像提示词，用于 Image2 拒绝生成、输出过于保守、人物显幼态、提示词过于暴露、人体结构畸形、风格丢失或需要更安全的高端修订版本时。
---

# Image2 Risk Debugger

## Workflow

Use this skill when the user provides a rejected prompt, a poor result description, or a requested fix such as "被拒了", "太保守", "脸太幼", "太擦边", "身材变形", "不够高级", or "不像真实摄影".

Read `../_shared/core/art-direction-engine.md`, `../_shared/core/spatial-photography-engine.md`, and `../_shared/core/prompt-compiler.md`. Add a `完整但寡淡` diagnosis when a prompt has many fields but lacks thesis, decisive moment, reading hierarchy, spatial causality, motivated light, color/material relationships, or element editing. Repair by rewriting relationships and deleting redundant elements; do not merely append “高级、电影感、杂志感、8K”.

1. Load `../_shared/references/adult-glamour-boundaries.md` for red lines and gray zones.
2. Load `../_shared/references/failure-repair-recipes.md` for diagnosis and repair patterns.
3. Load `../_shared/references/image2-canvas-parameters.md` for aspect ratio, orientation, resolution/quality, image count, and output format defaults.
  4. Load `../_shared/core/output-contract.md` and `../_shared/core/quality-gates.md` before composing the response.
  5. Load `../_shared/references/required-prompt-anchors.md`, `../_shared/references/face-shape-reference.md`, and `../_shared/knowledge/hairstyles.md`. Include required basic anchors in the repaired **最终中文提示词**, randomly choose one mature-figure anchor as instructed, and use the face-shape or hairstyle references only when the prompt explicitly specifies that direction or asks for a random face shape/hairstyle; add matching intent anchors when repairing swimwear, maid/sweet styling, 回眸/side-turn posture, S-curve/body-shape issues, stiffness, or weak fashion tension.
  6. Classify the failure, preserve supportable intent, and return the smallest repair plus a safe alternative when necessary.

## Diagnosis Buckets

Classify each issue with one or more of these labels: **拒绝、构图、解剖、年龄、服装、文字、一致性、风格漂移、发型**. Explain the smallest change that clears the identified failure; do not rewrite unrelated locked parameters.

- **Rejected before generation**: remove direct red terms, real-person sexualization, explicit content, minor-coded sexualization, coercive framing, or body-part close-up language.
- **Generated too conservative**: increase fashion expression, silhouette design, garment fit, lighting richness, camera clarity, and styling specificity; do not ask for "more sexy".
- **Face looks too young**: specify mature adult East Asian face structure by default, age 20 or older, non-childlike proportions, composed expression, and adult styling.
- **Too suggestive or soft-porn-coded**: return to editorial, commercial portrait, product lookbook, natural front-facing or slight three-quarter camera-facing posture, and broader framing.
- **Body or hands malformed**: add realistic anatomy, natural limb placement, stable posture, correct hand structure, and avoid extreme twisting or close cropping.
- **Not high-end enough**: add cohesive palette, material detail, intentional lighting, negative space, lens choice, and commercial/editorial context.
- **Hairstyle errors (new diagnosis)**: diagnose hair-related failures including wrong braid structure, incorrect bang shape, hair color deviation, uneven hair volume, wig-like appearance, unnatural hairline, and hair merging with background.
  - Repair strategy: select the precise description of the matching preset from `../_shared/knowledge/hairstyles.md`, add structural description words and hairstyle-specific negative constraints.
- **Hairstyle direction**: do not add a default or random hairstyle unless the prompt explicitly specifies a safe hairstyle/hair direction or asks for a random hairstyle. When hairstyle is triggered, preserve the safe hairstyle or choose exactly one hairstyle from `../_shared/knowledge/hairstyles.md`; dimension keyword combinations (length, curl, bangs, hair color, etc.) are also supported without requiring a full preset name.
- **Too explicit, too young-coded, or too risky**: preserve only safe age, mature body-proportion, natural posture, bright interior, explicit safe clothing when provided or the random default clothing anchor when clothing is unspecified, and matching intent anchors from the required prompt anchors; remove or reframe the risky remainder.

## Output Format

Return all user-facing content in Simplified Chinese unless the user explicitly asks for another language. The repair prompt, final Image2 prompt, negative constraints, and variation knobs must be Chinese. Keep technical style tokens such as `Image2`, `GPT Image 2`, `Lookbook`, `editorial`, `RAW`, `8K`, lens names, and aspect ratios when they improve model clarity.

Return:

1. **意图摘要**
2. **已锁定参数**
3. **风险/质量说明**（使用上述分类标签）
4. **最小修复**
5. **安全替代方案**（仅在原方向无法安全保留时提供）
6. **最终中文提示词**
7. **负面限制词**
8. **可选变化参数**

The **最终中文提示词** must fully carry the triggered required prompt anchors. Include hairstyle from `../_shared/knowledge/hairstyles.md` only when the user explicitly triggers hairstyle. Other sections may summarize them briefly.

## 负面限制词起点

Use relevant constraints only, written in Chinese: 露骨裸体、性化姿势、身体局部特写、低机位身体凝视、胁迫或窥视视角、未成年感、学生元素、真实名人相似、真实品牌 logo、水印、身体结构错误、手指畸形、界面文字乱码、假发感、发型不对称、刘海变形、发色不均、编发结构错误、发量异常、发际线不自然、头发融合背景、发丝粘连。

## Boundaries

Do not provide instructions to bypass safety checks. Do not repair a prompt by preserving explicit, soft-porn, minor-coded, real-person sexualized, coercive, voyeuristic, or private-leak intent. Redirect those requests toward mature, original, non-explicit fashion/editorial imagery.

## 参考知识库

生成提示词时可参考以下共享知识库模块（位于 `_shared/knowledge/`），根据用户需求选择合适的参数和表达方式：

- **后期与质感**：`../_shared/knowledge/post-processing.md`
- **光线与布光**：`../_shared/knowledge/lighting.md`
- **构图法则**：`../_shared/knowledge/composition.md`


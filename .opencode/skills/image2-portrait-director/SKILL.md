---
name: image2-portrait-director
description: 调度 Image2 人像请求到对应视觉路线并生成合规中文结果，用于用户提出人像摄影需求但未明确具体风格或路线时，统一识别需求、选择最佳生成路径并输出合同级提示词。
---

# Image2 Portrait Director

## Required load order

Before making a decision, load these documents in order:

1. `../_shared/core/parameter-schema.md`
2. `../_shared/core/reference-image-policy.md`
3. `../_shared/core/conflict-resolution.md`
4. `../_shared/core/quality-gates.md`
5. `../_shared/core/output-contract.md`
6. `../_shared/references/image2-canvas-parameters.md`
7. `../_shared/routes/route-registry.md`
8. Exactly one matching file from `../_shared/routes/{routeId}.md`.

## Direction workflow

1. Parse user intent and lock safe explicit parameters according to the parameter schema.
2. Apply reference-image roles and conflict precedence before visual choices.
3. Select **一个 Route** (one primary Route) from the registry. Do not blend two main routes; compatible overlays may only add detail under the conflict-resolution contract.
4. Read the selected route and use its fingerprint, palette/material, camera, light, photographed-moment rule, and exclusions.
5. Delegate requests that explicitly ask for a fixed Chinese field list, structured portrait brief, or the field sequence "摄影风格 / 写真方向 / 场景方向 / 服装方向" to `image2-structured-portrait-prompt`. This specialist uses its own fixed output contract instead of the shared six-section contract.
6. Delegate other specialty work that the registry marks to `image2-wedding-portrait`, `image2-fashion-lingerie-lookbook`, `image2-sports-venue-portrait`, `image2-cosplay-glamour`, `image2-character-poster-cover`, `image2-character-reference-sheet`, or `image2-risk-debugger`. Their constraints outrank route styling.
7. Apply quality gates, then return the selected skill's output contract in Simplified Chinese unless another language is requested.

## Image generation gate

Generate an image only when `interactionMode: direct-image` and the user explicitly says **直接出图**. Otherwise return prompt text only. Reference images authorise only role-locked inputs; they do not authorise image generation.

## 参考知识库

生成提示词时可参考以下共享知识库模块（位于 `_shared/knowledge/`），根据用户需求选择合适的参数和表达方式：

- **人物特征**：`../_shared/knowledge/character-features.md`
- **构图法则**：`../_shared/knowledge/composition.md`
- **光线与布光**：`../_shared/knowledge/lighting.md`
- **焦段与镜头语言**：`../_shared/knowledge/focal-length.md`
- **姿势与体态**：`../_shared/knowledge/poses.md`
- **场景与环境**：`../_shared/knowledge/scenes.md`
- **服装与造型**：`../_shared/knowledge/fashion.md`
- **风格与色调**：`../_shared/knowledge/styles.md`
- **后期与质感**：`../_shared/knowledge/post-processing.md`


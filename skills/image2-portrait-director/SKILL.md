---
name: image2-portrait-director
description: 璋冨害 Image2 浜哄儚璇锋眰鍒板搴旇瑙夎矾绾垮苟鐢熸垚鍚堣涓枃缁撴灉锛岀敤浜庣敤鎴锋彁鍑轰汉鍍忔憚褰遍渶姹備絾鏈槑纭叿浣撻鏍兼垨璺嚎鏃讹紝缁熶竴璇嗗埆闇€姹傘€侀€夋嫨鏈€浣崇敓鎴愯矾寰勫苟杈撳嚭鍚堝悓绾ф彁绀鸿瘝銆?
---

# Image2 Portrait Director

## Required load order

Before making a decision, load these documents in order:

1. `../_shared/core/parameter-schema.md`
2. `../_shared/core/reference-image-policy.md`
3. `../_shared/core/conflict-resolution.md`
4. `../_shared/core/quality-gates.md`
5. `../_shared/core/output-contract.md`
6. `../_shared/routes/route-registry.md`
7. Exactly one matching file from `../_shared/routes/{routeId}.md`.

## Direction workflow

1. Parse user intent and lock safe explicit parameters according to the parameter schema.
2. Apply reference-image roles and conflict precedence before visual choices.
3. Select **娑撯偓娑擃亙瀵?Route** (one primary Route) from the registry. Do not blend two main routes; compatible overlays may only add detail under the conflict-resolution contract.
4. Read the selected route and use its fingerprint, palette/material, camera, light, photographed-moment rule, and exclusions.
5. Delegate requests that explicitly ask for a fixed Chinese field list, structured portrait brief, or the field sequence 鈥滄憚褰遍鏍?/ 鍐欑湡鏂瑰悜 / 鍦烘櫙鏂瑰悜 / 鏈嶈鏂瑰悜鈥?to `image2-structured-portrait-prompt`. This specialist uses its own fixed output contract instead of the shared six-section contract.
6. Delegate other specialty work that the registry marks to `image2-wedding-portrait`, `image2-fashion-lingerie-lookbook`, `image2-sports-venue-portrait`, `image2-character-poster-cover`, `image2-character-reference-sheet`, or `image2-risk-debugger`. Their constraints outrank route styling.
7. Apply quality gates, then return the selected skill's output contract in Simplified Chinese unless another language is requested.

## Image generation gate

Generate an image only when `interactionMode: direct-image` and the user explicitly says **鐩存帴鍑哄浘**. Otherwise return prompt text only. Reference images authorise only role-locked inputs; they do not authorise image generation.

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


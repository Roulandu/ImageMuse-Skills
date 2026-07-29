# Output Contract

All final user-facing output is Simplified Chinese unless the user asks otherwise. Preserve useful technical tokens such as Image2, DSLR, RAW, 8K, and aspect ratios.

## Complete mode

`outputMode: complete` uses this fixed section order, with no reordering:

1. `意图摘要`
2. `已锁定参数`
3. `导演扩展`
4. `最终中文提示词`
5. `负面限制词`
6. `可选变化参数`

The final prompt includes all locked safe parameters and only the route additions or supplemental defaults that affect the visible image. Negative constraints are relevant, concise, and written in Chinese.

`导演扩展` is a concise art-direction brief derived from `art-direction-engine.md`. Summarize the visual thesis, motif, decisive moment, viewer position, spatial plan, three-level reading, color/material relationship, counter-expectation, and the element removed. Do not dump raw identifiers or repeat the final prompt.

The final Chinese prompt (最终中文提示词) uses `prompt-compiler.md`. It must start with a compact canvas parameters block that covers five dimensions: aspect ratio, orientation, resolution/image quality, image count, and output format/purpose. Use the template from `../references/image2-canvas-parameters.md`. At minimum, include 比例 + 方向 + 画质描述 + 图片数量；根据场景补充用途/格式说明。After that compact prefix, order visual content by thesis/moment, subject-environment relation, spatial camera logic, motivated light, color/material, and visible styling detail. Do not mechanically replay every brief field.

Machine-readable fixed-order identifiers are `intent-summary`, `locked-parameters`, `director-expansion`, `final-chinese-prompt`, `negative-constraints`, and `variation-knobs`.

## Concise mode

`outputMode: concise` contains only these two sections, in order:

1. `最终中文提示词`
2. `负面限制词`

Do not include analysis, route names, lock records, or variation controls in concise mode.

## Direct-image gate

The output contract permits image generation only for interaction mode `direct-image` when the user explicitly says `直接出图`. All other requests, including `prompt` and `reference-image`, return text according to complete or concise mode. A reference image changes only authorised, role-locked prompt inputs; it is not permission to generate an image.

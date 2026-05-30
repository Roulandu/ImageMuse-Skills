# Portrait And Fashion Parameters

Use this reference when building structured adult glamour, portrait, lingerie, swimwear, or lookbook prompts.

## Language Policy

Generate all user-facing sections, final prompts, negative constraints, repair prompts, and variation knobs in Simplified Chinese unless the user explicitly requests another language. Keep useful technical or style tokens such as `Image2`, `GPT Image 2`, `Lookbook`, `editorial`, `RAW`, `8K`, focal lengths, lens names, and aspect ratios when they improve image-model clarity. Do not translate user-locked brandless style tokens if translation would weaken the prompt; instead, explain them in Chinese context.

## Parameter Locking

Respect safe user-specified parameters. Only auto-fill fields that are blank, unspecified, or explicitly set to automatic. If a locked parameter is unsafe, mark it as reframed or removed in the output instead of silently preserving it.
Use the default East Asian subject only for blank, unspecified, or automatic subject fields. Do not overwrite explicit safe user-specified subject identities.
Respect safe user-specified posture and camera direction. When posture or camera direction is blank, unspecified, or automatic, default to a camera-facing subject and an eye-level or slight high editorial camera.

## Core Fields

- Subject: original adult East Asian woman, age 20 or older; in Chinese prompts, "原创成年东方女性，20岁及以上".
- Identity guard: not a celebrity, influencer, public figure, private person, uploaded face, or real social profile.
- Style: glamour portrait, fashion editorial, commercial portrait, brand lookbook, fitting-room product confirmation, resort swimwear catalog, cinematic lifestyle portrait.
- Subject orientation: front-facing toward camera, or slight three-quarter turn while the face and body still naturally orient toward camera; use back-facing, looking away, or strong side-facing only when explicitly requested.
- Face direction: mature oval face, natural round face, elegant angular face, cinematic story face, refined East Asian features, natural life-like face; avoid childlike proportions and generic AI influencer face.
- Mood: composed, confident, calm, relaxed, elegant, softly expressive, cinematic, polished.
- Body direction: healthy proportions, balanced silhouette, soft mature figure, natural waistline, graceful posture, realistic anatomy.
- Garment: tailored dress, knitwear, blouse, structured top, fashion separates, evening dress, lined bralette, non-explicit lingerie set, one-piece swimwear, resort cover-up, product-focused swimwear.
- Garment details: material, lining, coverage, support, seams, trim, color, texture, fit, styling purpose.
- Scene: studio, bright interior, window seat, city apartment, boutique fitting room, product studio, resort poolside, fashion set, lifestyle editorial location.
- Camera: eye-level portrait or slight high editorial angle by default, half-body, three-quarter, full-body, catalog view, mirror view with face/garment/setting included.
- Lighting: soft window light, natural daylight, low-contrast studio light, warm fitting-room light, cinematic softbox, clean commercial lighting.
- Palette: low-saturation neutrals, cream and gray, rose and ivory, cool gray-blue, black and white, resort blue and white, jewel-tone evening palette.
- Output ratio: 9:16, 3:4, 2:3, 1:1, 16:9.

## Quality Additions

- Add a distinctive face memory point without referencing a real person.
- Add real skin texture, fabric texture, natural folds, and plausible garment construction.
- Specify stable posture and realistic anatomy when body shape or fashion fit matters.
- For photoreal prompts, mention realistic camera feel but avoid private-leak, hidden-camera, or intimate-access framing.

## 可选变化参数

色调、光线方向、镜头距离、场景类型、服装面料、服装颜色、妆容强度、发型、面部表情、画幅比例、真实感等级、editorial 与目录感的平衡。

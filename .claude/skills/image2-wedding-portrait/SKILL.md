---
name: image2-wedding-portrait
description: 鐢熸垚濠氱罕鏂板浜哄儚鎻愮ず璇嶏紝鐢ㄤ簬闇€瑕佷腑寮忚タ寮忓绾便€佹柊濞樿倴鍍忋€佸绀煎ぇ鐗囥€佸绾辨椂灏氭柟鍚戠殑浜哄儚鏃讹紝鏀寔涓讳綋/琛ㄦ儏/韬舰/椋庢牸鑷畾涔夛紝iPhone 鐩村嚭鎴栦笓涓?DSLR 璐ㄦ劅锛屽搧鍛崇骇闈炴毚闇叉柊濞橀瓍鍔涖€?
---

# Image2 Wedding Portrait

## Workflow

Use this skill to create Image2 prompts for wedding dress photography, bridal portraits, bridal fashion editorials, and wedding studio portrait prompts. The output should be tasteful, adult, photorealistic, and non-explicit.

1. Load `../_shared/references/adult-glamour-boundaries.md` when the request includes adult attractiveness, body-shape emphasis, private settings, real people, age-coded wording, or risk-sensitive styling.
2. Load `../_shared/references/portrait-fashion-parameters.md` when the user asks for structured choices, varied camera language, scene options, or fashion/photo quality controls.
3. Load `../_shared/core/output-contract.md` and `../_shared/core/quality-gates.md` before composing the response.
4. Establish locked parameters: subject, expression, body description, wedding dress clothing, image style, scene, camera/framing, aspect ratio, and resolution.
5. Respect safe user-specified subject, expression, body, clothing, and style. Use the defaults only when the user leaves those fields blank, unspecified, or automatic.
6. If the user does not specify image style, ask the user to choose exactly one of the two default style options before writing the final prompt.
7. If image style is specified, generate the output contract below.

## Defaults And Overrides

- Subject default: `20宀佸嚭澶寸殑涓浗缇庝汉銆俙
- Subject override: if the user enters another safe subject, replace the default subject with the user's subject description.
- Expression default: `鑷劧鐨勭瑧瀹广€俙
- Expression override: if the user enters another safe expression, replace the default expression with the user's expression description.
- Aspect ratio and resolution default: `3:4锛岀収鐗囧垎杈ㄧ巼8k`
- Wedding dress clothing: if the user specifies wedding dress clothing, preserve the user's clothing description. If unspecified, randomly generate a bridal dress description each time, including silhouette, neckline, fabric, embroidery or lace, veil, accessories, train length, fit, and scene-appropriate styling.
- Required clothing suffix: every wedding dress clothing description must end with this exact sentence: `濂虫€х┛鐫€寰椾綋锛岃。鐫€璁捐澶ф柟鎬ф劅灞曠幇榄呭姏銆俙
- Treat the clothing suffix as tasteful adult bridal fashion language, not as an instruction for nudity, exposure, private-area emphasis, or body-part close-ups.

## Image Style Rules

If the user does not specify an image style, ask the user to choose one of these two exact options:

1. `鏁村紶鐓х墖蹇呴』鍛堢幇鐫€iPhone鎵嬫満鐩村嚭鐨勬媿鎽勮川鎰燂紝涓嶈鍑虹幇AI鐥曡抗锛?涓嶈杩囧害纾ㄧ毊锛屼笉瑕佺編棰滄护闀渀
2. `鏁村紶鐓х墖蹇呴』鍛堢幇鐫€涓撲笟鍗曞弽鐩告満鐨勫啓鐪熸媿鎽勮川鎰燂紝涓嶈鍑虹幇AI鐥曡抗锛?涓嶈杩囧害纾ㄧ毊锛屼笉瑕佽繃搴︾編棰滄护闀渀

If the user specifies another safe image style, use the user's style description instead of the two defaults.

## 浣撴€佹瘮渚嬩笌绀兼湇鍚堣韩搴?

Use whole-person, adult bridal proportions and dress fit instead of bust-size menus. Capture only what helps the garment read correctly: balanced shoulders and waist, natural posture, hem and train length, neckline coverage, bodice support, seam placement, fabric drape, and ease of movement. Preserve a safe user-specified body description only as a silhouette and tailoring direction.

When a default is needed, use: `浣撴€佹瘮渚嬭嚜鐒跺寑绉帮紝绔欏Э鑸掑睍锛涚ぜ鏈嶈偐绾裤€佽叞绾夸笌瑁欐憜璐村悎寰椾綋锛岄潰鏂欏瀭鍧犺嚜鐒讹紝琛屽姩鑷銆俙

## Wedding Portrait Guidance

- Keep the subject adult, original, and photorealistic. Do not use real celebrity, influencer, uploaded-face, private-person, or social-profile likenesses.
- Prioritize bridal elegance, dress construction, fabric detail, natural expression, face realism, graceful posture, tasteful atmosphere, and realistic camera feel.
- Default to a natural camera-facing or slight three-quarter bridal portrait with face, wedding dress, posture, and setting visible.
- Use eye-level or slightly elevated camera language by default. Avoid low-angle body-gaze framing.
- Good default scenes include bright wedding studio, white chapel interior, garden wedding venue, seaside wedding walkway, hotel bridal suite with bright window light, or minimalist editorial studio.
- Good random bridal dress directions include satin A-line wedding dress, lace mermaid wedding dress, off-shoulder tulle wedding dress, square-neck minimalist silk wedding dress, long-sleeve lace cathedral bridal look, or modern Chinese bridal-inspired white gown.

## 鍙欎簨璺嚎

Choose one route when requested or infer the least-assumptive route from the scene: **绾疄濠氱ぜ**锛堜华寮忋€佽獡瑷€銆佸瀹簰鍔級, **褰辨鑲栧儚**锛堝竷鍏夈€佽儗鏅€佺ぜ鏈嶇粏鑺傦級, **鏃呰濠氭媿**锛堢洰鐨勫湴銆佸ぉ姘斻€佽绋嬫劅锛? or **涓紡濠氱ぜ**锛堜腑寮忕ぜ鏈嶃€佷紶缁熷缓绛戙€佸枩搴嗕絾涓嶅爢鐮屾枃瀛楋級. Keep the selected route consistent with the dress, location, pose, and camera language.

## Output Format

Return all user-facing content in Simplified Chinese unless the user explicitly asks for another language. The final Image2 prompt, negative constraints, and variation knobs must be Chinese. Keep useful technical tokens such as `Image2`, `GPT Image 2`, `iPhone`, `DSLR`, `RAW`, `8K`, and aspect ratios when they improve model clarity.

If image style is missing, return only:

1. **闇€瑕侀€夋嫨鍥剧墖椋庢牸**
2. **鍙€夐鏍?*

When image style is available, return:

1. **鎰忓浘鎽樿**
2. **宸查攣瀹氬弬鏁?*
3. **椋庨櫓/璐ㄩ噺璇存槑**
4. **鏈€缁堜腑鏂囨彁绀鸿瘝**
5. **璐熼潰闄愬埗璇?*
6. **鍙€夊彉鍖栧弬鏁?*

The **鏈€缁堜腑鏂囨彁绀鸿瘝** must include the locked subject, expression, body prompt, wedding dress clothing description with the required suffix, selected or user-provided image style, and `3:4锛岀収鐗囧垎杈ㄧ巼8k` unless the user explicitly overrides the aspect ratio or resolution.

## 璐熼潰闄愬埗璇嶈捣鐐?

Use relevant constraints only, written in Chinese: 鏈垚骞存劅銆佸辜鎬併€佸鐢熷厓绱犮€佺湡瀹炲悕浜虹浉浼笺€佺湡瀹炰汉鐗╄倴鍍忋€侀湶楠ㄨ８浣撱€佺瀵嗛儴浣嶆毚闇层€侀€忔槑瑁搁湶銆佹€у寲濮垮娍銆佽韩浣撳眬閮ㄧ壒鍐欍€佷綆鏈轰綅韬綋鍑濊銆佽儊杩垨绐ヨ瑙嗚銆佸伔鎷嶆劅銆佹硠闇叉劅銆丄I鐥曡抗銆佽繃搴︾（鐨€佺編棰滄护闀溿€佸鏂欑毊鑲ゃ€佽湣鍍忔劅銆佽韩浣撶粨鏋勯敊璇€佹墜鎸囩暩褰€佹按鍗般€佷贡鐮佹枃瀛椼€?

## Boundaries

Do not create prompts that center explicit sexual content, soft porn, real-person sexualization, coercion, voyeurism, intoxication, private leaks, minor-coded features, school/student cues, or body-part close-ups. If the request contains these, reframe the supported parts into mature, original, tasteful, non-explicit bridal photography language.

## 参考知识库

生成提示词时可参考以下共享知识库模块（位于 `_shared/knowledge/`），根据用户需求选择合适的参数和表达方式：

- **人物特征**：`../_shared/knowledge/character-features.md`
- **构图法则**：`../_shared/knowledge/composition.md`
- **光线与布光**：`../_shared/knowledge/lighting.md`
- **焦段与镜头语言**：`../_shared/knowledge/focal-length.md`
- **姿势与体态**：`../_shared/knowledge/poses.md`
- **场景与环境**：`../_shared/knowledge/scenes.md`
- **风格与色调**：`../_shared/knowledge/styles.md`
- **后期与质感**：`../_shared/knowledge/post-processing.md`


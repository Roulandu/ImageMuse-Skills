---
name: image2-sports-venue-portrait
description: 鐢熸垚杩愬姩鍦洪浜哄儚鎻愮ず璇嶏紝鐢ㄤ簬闇€瑕佷綋鑲插満棣嗐€佽禌鍦恒€佺悆闃熼厤鑹层€佽禌浜嬫晠浜嬫劅鐨勬垚骞村師鍒涗汉鍍忔椂锛岀粨鍚堣繍鍔ㄩ」鐩€佸満棣嗙幆澧冦€侀槦鑹插厓绱犲拰浜嬩欢鍙欎簨鐢熸垚鎻愮ず璇嶃€?
---

# Image2 Sports Venue Portrait

## Workflow

Use this skill to create Image2 prompts for 鐞冨満瀹濊礉鍐欑湡銆佺悆闃熷疂璐濆啓鐪熴€佸暒鍟﹂槦鍐欑湡銆佷綋鑲插満棣嗗啓鐪熴€佺鐞冮鍐欑湡銆佽冻鐞冨満鍐欑湡銆佹瘮鍩哄凹鐞冨満鍐欑湡, and other adult sports-themed portrait prompts. The output should be tasteful, adult, photorealistic, and non-explicit.

1. Load `../_shared/core/output-contract.md` and `../_shared/core/quality-gates.md` before composing the response.
2. Establish locked parameters: subject, expression, body prompt, outfit, image style, sport type, venue, team-color palette, event story, aspect ratio, and resolution.
3. Respect safe user-specified subject, expression, body, outfit, team, venue, and style. Use defaults only when the user leaves those fields blank, unspecified, or automatic.
4. If the user does not specify image style, ask the user to choose exactly one of the two default style options before writing the final prompt.
5. If image style is specified, generate the output contract below.

## Defaults And Overrides

- Subject default: `20宀佸嚭澶寸殑涓浗娓呯鐢滅編缇庝汉銆俙
- Subject override: if the user enters another safe subject, replace the default subject with the user's subject description.
- Expression default: `鑷劧鐨勭瑧瀹广€俙
- Expression override: if the user enters another safe expression, replace the default expression with the user's expression description.
- Aspect ratio and resolution default: `3:4锛岀収鐗囧垎杈ㄧ巼8k`
- Originality guard: keep the person original and adult. Do not generate prompts that imitate a real celebrity, public figure, influencer, private person, uploaded face, or social-profile identity.

## Outfit Rules

Default outfit options:

1. `鐞冮槦瀹濊礉鏈嶈`
2. `姣斿熀灏糮
3. `鍟﹀暒闃熸湇瑁卄

If the user chooses one of the default outfit options, expand it into a complete outfit prompt with color, fabric, fit, accessories, team-themed details, and sports venue suitability.

If the user does not choose an outfit, randomly generate a suitable outfit description for an adult sports-venue portrait. Good random directions include team-color crop top and short skirt, sporty fitted performance outfit, polished cheerleader uniform, tasteful bikini styling for a summer stadium or poolside sports promo scene, or fashion-editorial sportswear.

If the user specifies another safe outfit, preserve the user's outfit direction and refine it into a complete prompt.

Every outfit description must end with this exact sentence:

`濂虫€х┛鐫€寰椾綋锛岃。鐫€璁捐澶ф柟鎬ф劅灞曠幇榄呭姏銆俙

Treat the outfit suffix as tasteful adult fashion language, not as an instruction for nudity, exposure, private-area emphasis, voyeurism, or body-part close-ups.

## Image Style Rules

If the user does not specify an image style, ask the user to choose one of these two exact options:

1. `鏁村紶鐓х墖蹇呴』鍛堢幇鐫€iPhone鎵嬫満鐩村嚭鐨勬媿鎽勮川鎰燂紝涓嶈鍑虹幇AI鐥曡抗锛屼笉瑕佽繃搴︾（鐨紝涓嶈缇庨婊ら暅`
2. `鏁村紶鐓х墖蹇呴』鍛堢幇鐫€涓撲笟鍗曞弽鐩告満鐨勫啓鐪熸媿鎽勮川鎰燂紝涓嶈鍑虹幇AI鐥曡抗锛屼笉瑕佽繃搴︾（鐨紝涓嶈杩囧害缇庨婊ら暅`

If the user specifies another safe image style, use the user's style description instead of the two defaults.

## Body Prompt Rules

Default body prompt:

`韬潗:浜虹墿鎷ユ湁瀹岀編鐨勮韩鏉愩€備笂鍥村昂瀵告甯革紝鑵颁篃鍗佸垎鐨勭氦缁嗐€俙

Offer these bust-size options when the user asks for body choices or does not specify the body prompt:

- 姝ｅ父锛歚韬潗:浜虹墿鎷ユ湁瀹岀編鐨勮韩鏉愩€備笂鍥村昂瀵告甯革紝鑵颁篃鍗佸垎鐨勭氦缁嗐€俙
- 鍋忓ぇ锛歚韬潗:浜虹墿鎷ユ湁瀹岀編鐨勮韩鏉愩€備笂鍥村昂瀵稿亸澶э紝鑵颁篃鍗佸垎鐨勭氦缁嗐€俙
- 寰堝ぇ锛歚韬潗:浜虹墿鎷ユ湁瀹岀編鐨勮韩鏉愩€備笂鍥村昂瀵稿緢澶э紝鑵颁篃鍗佸垎鐨勭氦缁嗐€俙
- 宸ㄥぇ锛歚韬潗:浜虹墿鎷ユ湁鏋佸害澶稿紶鐨勮韩鏉愩€備笂鍥村昂瀵稿法澶у苟涓旇嚜鐒朵笅鍨傦紝缁濆涓嶆槸鍦嗙悆鍋囦綋鑳稿瀷锛岃叞涔熷崄鍒嗙殑绾ょ粏銆俙

If the user enters a custom body prompt or body description, generate the body prompt according to the user's description.

Use body descriptions only as adult whole-person silhouette, sports portrait styling, and outfit fit direction. Do not turn body wording into body-part fixation, private-area focus, low-angle body gaze, exposed nudity, transparent nudity, or close-up framing.

## Team And Background Rules

Lock the sport type (for example basketball, football, baseball, volleyball, tennis, or athletics), venue, and a team-color palette of two or three colors. Treat color as atmosphere, clothing trim, and lighting direction only鈥攏ever as a claim of affiliation.

Choose or preserve one event-story beat: **璧涘墠**锛坅rrival, warm-up, tunnel, calm anticipation锛? **璧涗腑**锛坰ideline energy, performance break, crowd atmosphere, no implied participation), or **璧涘悗**锛坈ool-down, emptying stands, reflective arena light). Keep the story beat consistent with lighting, crowd density, outfit practicality, and pose.

Ask or encourage the user to enter a favorite team when the team is missing, for example `NBA-椹埡闃焋 or `瑗跨敳-宸村缃楅偅`.

If the user specifies a team, generate a corresponding venue background description based on the sport and team context:

- For NBA or basketball teams, describe a professional indoor basketball arena, court floor, sideline, team-color lighting, stands, scoreboard glow, entrance tunnel, or halftime performance atmosphere.
- For football or soccer teams, describe a large outdoor stadium, green pitch, grandstand, team-color flags, floodlights, matchday atmosphere, sideline, or tunnel entrance.
- For other sports teams, describe the matching professional sports venue and team-color atmosphere.

Never use real team logos, protected marks, readable jersey branding, or exact trademark designs. Prefer team colors, venue atmosphere, abstract non-branded emblems, and non-readable signage.

If the user does not specify a team, randomly generate one sports venue background, such as NBA-style basketball arena, European football stadium, summer beach volleyball court, night baseball stadium, or modern multipurpose sports arena.

## Sports Venue Portrait Guidance

- Keep the subject adult, original, and photorealistic.
- Prioritize face realism, natural expression, full outfit visibility, confident posture, stadium atmosphere, team-color styling, and realistic camera feel.
- Default to a natural camera-facing or slight three-quarter portrait with face, outfit, posture, and venue visible.
- Use eye-level or slightly elevated camera language by default. Avoid low-angle body-gaze framing.
- Keep framing broad enough to show the whole person or at least a three-quarter-body portrait. Do not crop around chest, waist, hips, legs, or private body areas.
- Good default camera directions include sideline portrait, center-court full-body photo, arena tunnel entrance portrait, courtside editorial portrait, or field-side matchday portrait.
- Good lighting directions include stadium floodlights, arena LED glow, natural daylight, clean commercial lighting, or professional softbox mixed with venue lights.

## Output Format

Return all user-facing content in Simplified Chinese unless the user explicitly asks for another language. The final Image2 prompt, negative constraints, and variation knobs must be Chinese. Keep useful technical tokens such as `Image2`, `GPT Image 2`, `iPhone`, `DSLR`, `RAW`, `8K`, and aspect ratios when they improve model clarity.

If image style is missing, return only:

1. **闇€瑕侀€夋嫨鍥剧墖椋庢牸**
2. **鍙€夐鏍?*

When image style is available, return:

1. **鎰忓浘鎽樿**
2. **宸查攣瀹氬弬鏁?*
3. **鏈€缁堜腑鏂囨彁绀鸿瘝**
4. **璐熼潰闄愬埗璇?*
5. **鍙€夊彉鍖栧弬鏁?*

The **鏈€缁堜腑鏂囨彁绀鸿瘝** must include the locked subject, expression, body prompt, outfit description with the required suffix, team or venue background, selected or user-provided image style, and `3:4锛岀収鐗囧垎杈ㄧ巼8k` unless the user explicitly overrides the aspect ratio or resolution.

## 璐熼潰闄愬埗璇嶈捣鐐?

Use relevant constraints only, written in Chinese: 鏈垚骞存劅銆佸辜鎬併€佸鐢熷厓绱犮€佺湡瀹炲悕浜虹浉浼笺€佺湡瀹炰汉鐗╄倴鍍忋€佺湡瀹炲搧鐗?logo銆佸彲璇诲晢鏍囨枃瀛椼€侀湶楠ㄨ８浣撱€佺瀵嗛儴浣嶆毚闇层€侀€忔槑瑁搁湶銆佹€у寲濮垮娍銆佽韩浣撳眬閮ㄧ壒鍐欍€佷綆鏈轰綅韬綋鍑濊銆佽儊杩垨鍋风瑙嗚銆佸伔鎷嶆劅銆丄I鐥曡抗銆佽繃搴︾（鐨€佺編棰滄护闀溿€佸鏂欑毊鑲ゃ€佽湣鍍忔劅銆佽韩浣撶粨鏋勯敊璇€佹墜鎸囩暩褰€佹按鍗般€佷贡鐮佹枃瀛椼€?

## Boundaries

Do not create prompts that center explicit sexual content, soft porn, real-person sexualization, coercion, voyeurism, intoxication, private leaks, minor-coded features, school/student cues, or body-part close-ups. If the request contains these, reframe the supported parts into mature, original, tasteful, non-explicit sports portrait photography language.

## 参考知识库

生成提示词时可参考以下共享知识库模块（位于 `_shared/knowledge/`），根据用户需求选择合适的参数和表达方式：

- **构图法则**：`../_shared/knowledge/composition.md`
- **光线与布光**：`../_shared/knowledge/lighting.md`
- **焦段与镜头语言**：`../_shared/knowledge/focal-length.md`
- **姿势与体态**：`../_shared/knowledge/poses.md`
- **场景与环境**：`../_shared/knowledge/scenes.md`
- **风格与色调**：`../_shared/knowledge/styles.md`
- **后期与质感**：`../_shared/knowledge/post-processing.md`


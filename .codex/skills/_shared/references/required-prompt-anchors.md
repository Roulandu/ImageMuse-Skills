# Required Prompt Anchors

Use this reference for all four Image2 adult glamour/fashion skills when producing the final Chinese prompt.

## Inclusion Rule

- Include the **basic anchors** in every **最终中文提示词**: age, mature figure, natural posture, bright interior scene, and explicit safe clothing when provided or the random default clothing anchor when clothing is unspecified.
- Include the **intent anchors** only when the user request, rewrite target, or repair need matches that intent: swimwear, maid/sweet fantasy styling, over-the-shoulder gaze, or S-curve figure.
- Keep all anchors as whole-person, garment-fit, editorial portrait, lookbook, or character-design language.
- When the user has not specified a corresponding face direction, default to `柔和方圆鹅蛋脸 / 东方自然系亲和脸` from `face-shape-reference.md` and include that description in the final Chinese prompt. When the user specifies a safe face direction, preserve the user's direction instead. When the user explicitly asks for a random face shape, randomly choose one face-shape description from `face-shape-reference.md`.
- In the final Chinese prompt, express age, face shape, hairstyle, and mature figure once each. If the chosen face-shape description already includes temperament words, do not repeat the age anchor's temperament words nearby.
- When the user has not specified posture or camera orientation, make the subject face the camera by default: front-facing, or a slight three-quarter turn while the face and body still naturally orient toward the camera.
- Use back-facing, over-the-shoulder, strong side-facing, or looking-away poses only when the user explicitly asks for them or when a repair target clearly needs that intent anchor.
- Do not turn "胸部轮廓自然饱满" into a chest close-up, isolated body-part focus, low-angle body gaze, or soft-porn framing.
- Use "20岁及以上成年女性" or "20岁及以上成年幻想系女性角色" for adult status. Do not use teen/student/childlike cues.
- Other output sections may summarize the anchors instead of repeating every long phrase.

## Basic Anchors

### 1. Age

20岁及以上成年女性，成年女性角色，成年感明确，非幼态，气质自然、自信、优雅。

### 2. Mature Figure

Randomly choose exactly one of these two fixed Chinese mature-figure anchors each time. Do not include both in the same final Chinese prompt unless the user explicitly asks for both:

上半身身形丰腴，胸部轮廓自然饱满，整体身形纤细匀称，身体比例协调，腰肩线条自然，曲线流畅，整体凸显轻盈健康的女性体态。

---

人物身形为丰腴曲线型，整体匀称、自然协调，胸部饱满自然，胸部轮廓清晰但得体，腰线明确，腰胯转折明显，臀腿曲线圆润流畅，肩颈线柔和，整体形成优雅吸睛的 S 型身姿。线条强调为强，重点突出脖颈、锁骨、肩线、胸部自然曲线、腰线、腰胯转折、小腹线条与大腿线条，但表达保持高级、克制、干净，不低俗、不夸张、不变形。

### 3. Natural Posture

自然站姿，端正坐姿，人物正面面向镜头，或轻微三分之四侧身但脸部与身体仍自然朝向镜头，肩颈舒展，姿态从容优雅，动作自然不夸张。

### 4. Bright Interior Scene

明亮室内空间，柔和卧室场景，高级家居环境，浅色背景，干净自然光，整体氛围温柔克制。

### 5. Elegant Clothing

Use only when the user has not specified a safe garment. If the user explicitly specifies safe clothing, preserve the user's garment instead of replacing it with this default. When clothing is unspecified, randomly choose one of these fixed Chinese clothing phrases each time:

服装为剪裁优雅的吊带睡裙，材质细腻，版型合身，贴合身体，吊带一侧肩部自然滑落。

服装为剪裁优雅的短款深V款高级精致浅白色吊带背心，材质细腻，版型合身，贴合身体，腰部自然漏出，吊带两侧肩部自然滑落，下半身穿着白色蕾丝边内裤，精致且高级。

## Intent Anchors

### 6. Swimwear Lookbook

Use when the user asks for swimwear, resort wear, beach/pool styling, summer vacation styling, or product/catalog swimwear imagery.

高端泳装品牌 Lookbook，成年女性模特，健康自信，姿态自然端正，泳装为得体的度假款或运动款，重点表现泳装版型、面料、颜色、使用场景和清爽夏日氛围。

### 7. Maid Or Sweet Fantasy Styling

Use when the user asks for maid styling, sweet pink styling, fantasy character art, cute-but-adult styling, or dreamy character design.

20岁及以上成年幻想系女性角色，甜美梦幻的粉色主题服饰，整体造型精致可爱，气质轻盈美丽、温柔，姿态端正自然，服装设计偏角色美术与幻想风造型。

### 8. Over-The-Shoulder Gaze

Use only when the user asks for 回眸, looking back at camera, back-facing/side-turn posture, or stronger fashion portrait tension beyond the default front-facing/slight three-quarter camera-facing posture.

人物身体轻微侧转，头部自然回望镜头，肩颈线条舒展，姿态优雅从容，整体呈现高级时尚人像感。

### 9. Soft S-Curve Figure

Use when the user asks for S 型身材, curves, body rhythm, full-body silhouette, or when repairing stiff/awkward body shape.

身体呈自然柔和的 S 型动态姿态，肩、腰、胯形成流畅的节奏感，身形纤细匀称，比例协调，凸显健康轻盈成熟的女性体态美。

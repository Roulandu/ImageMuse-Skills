# AI人像摄影 Prompt 百科 V2 专业版
**适用模型：GPT-Image / Flux / Midjourney / Imagen / Recraft / HyperFrames / Codex 知识库**

> 本手册基于你前面给出的资料做了系统化扩展，目标不是简单“抄图”，而是整理成一份可长期复用的 **AI 人像摄影知识库 Markdown**。  
> 适合用作：
>
> - AI 绘图提示词知识库
> - 人像摄影风格词典
> - Codex / Claude Code / HyperFrames 项目知识文档
> - 个人 AI 写真 Prompt 手册
> - 团队内部 AI 出图规范参考

---

# 目录

1. 使用说明  
2. Prompt 基础公式  
3. 焦距系统  
4. 光圈与景深系统  
5. 构图系统  
6. 镜位与视角系统  
7. 光线系统  
8. 色彩与色调系统  
9. 人物体态与比例系统  
10. 脸型与五官系统  
11. 发型系统  
12. 肤质与妆容系统  
13. 服装、材质与布料系统  
14. 风格体系（写真 / 杂志 / 电影 / 社媒）  
15. 相机品牌与成像风格模拟  
16. 背景与场景系统  
17. 姿势与动作系统  
18. 常见 AI 问题修复  
19. 通用 Prompt 模板  
20. 模型专项写法（GPT-Image / Flux / Midjourney）  
21. Prompt 组合公式  
22. 高质量示例 Prompt 库  
23. HyperFrames / Codex 知识库组织建议  
24. 术语速查表  
25. 结语

---

# 1. 使用说明

## 1.1 这份手册怎么用

你可以把一张人像图拆解成以下几个层次：

- **主体**：年龄、性别、气质、体态、脸型、发型、服装
- **摄影参数**：焦距、光圈、机位、构图、景深
- **光线**：自然光、影棚光、逆光、侧光、电影光
- **风格**：日系、韩系、时尚杂志、生活方式、小红书、电影感
- **画质**：写实、肤质、细节、布料、色彩、背景层次
- **修复项**：手部、面部、衣服褶皱、透视、对称性、背景逻辑

## 1.2 推荐 Prompt 思考顺序

建议按这个顺序写 Prompt：

1. **人物设定**
2. **镜头参数**
3. **构图**
4. **光线**
5. **风格**
6. **细节质量**
7. **修复或限制**

例如：

```text
portrait of a young woman, elegant and natural,
85mm portrait lens, half body portrait,
soft daylight, shallow depth of field,
realistic skin texture, natural makeup,
japanese portrait photography style,
high detail, realistic fabric folds
```

---

# 2. Prompt 基础公式

## 2.1 基础公式

```text
主体 + 焦距 / 机位 + 构图 + 光线 + 风格 + 细节质量 + 修复项
```

## 2.2 完整公式

```text
人物设定
+ 身体特征
+ 服装材质
+ 焦距 / 光圈 / 机位
+ 构图
+ 光线
+ 色调
+ 场景
+ 风格
+ 细节增强
+ 修复项
```

## 2.3 中文版思维模板

- 谁：一位怎样的人
- 长什么样：脸型、发型、体态、服装
- 怎么拍：焦距、视角、构图
- 什么光：自然光、影棚光、窗光、逆光
- 什么风格：写真、杂志、生活方式、电影感
- 细节要求：真实皮肤、自然布料、高清细节
- 规避问题：避免塑料皮肤、避免奇怪手部、避免背景穿帮

---

# 3. 焦距系统

> 焦距会直接决定：**透视感、压缩感、背景保留量、人物脸部比例、环境存在感**。

## 3.1 18mm 超广角

### 视觉特征
- 强烈透视
- 背景范围极大
- 空间夸张
- 近大远小明显

### 适用场景
- 旅行大片
- 环境人像
- 建筑 + 人物
- 情绪化、戏剧化构图

### 中文关键词
- 18mm 超广角
- 强透视
- 环境感极强
- 空间夸张

### 英文关键词
- 18mm ultra wide angle
- dramatic perspective
- environmental portrait
- exaggerated spatial depth

---

## 3.2 24mm 广角

### 视觉特征
- 保留环境
- 人物仍较自然
- 兼顾故事感与空间感

### 适用场景
- 街拍
- 旅拍
- 场景式写真

### 英文关键词
- 24mm wide angle portrait
- environmental portrait
- natural wide perspective

---

## 3.3 35mm 环境人像

### 视觉特征
- 自然广角
- 人与环境平衡较好
- 社交媒体常见焦段

### 适用场景
- 日系写真
- 生活方式照片
- 小红书风内容

### 英文关键词
- 35mm portrait
- natural perspective
- storytelling composition

---

## 3.4 50mm 标准镜头

### 视觉特征
- 接近人眼视角
- 自然、稳妥、通用
- 不夸张也不过度压缩

### 适用场景
- 日常人像
- 半身照
- 写真入门万能焦段

### 英文关键词
- 50mm standard lens
- realistic portrait
- natural proportions

---

## 3.5 85mm 人像黄金焦段

### 视觉特征
- 轻微压缩
- 五官更自然
- 背景虚化漂亮
- 主体突出

### 适用场景
- 人像写真
- 商业人像
- 半身和胸像
- 高级感人像

### 英文关键词
- 85mm portrait lens
- natural bokeh
- flattering facial proportions
- professional portrait photography

---

## 3.6 100mm / 105mm 中长焦

### 视觉特征
- 比 85mm 压缩更明显
- 背景更干净
- 视觉更聚焦于人物

### 适用场景
- 胸像
- 特写
- 时尚妆面照

### 英文关键词
- 100mm telephoto portrait
- compressed background
- clean subject isolation

---

## 3.7 135mm 中长焦人像

### 视觉特征
- 面部更立体
- 背景压缩更明显
- 高级商业感

### 适用场景
- 商业人像
- 时尚大片
- 精致头像

### 英文关键词
- 135mm portrait
- elegant compression
- premium portrait look

---

## 3.8 200mm 长焦

### 视觉特征
- 强压缩
- 大虚化
- 背景像被“拉近”
- 情绪更凝练

### 适用场景
- 时尚杂志
- 高级肖像
- 电影感长焦人像

### 英文关键词
- 200mm telephoto portrait
- strong background compression
- dramatic shallow depth of field

---

## 3.9 300mm 超长焦

### 视觉特征
- 极强压缩感
- 背景近似贴近人物
- 戏剧感最强

### 适用场景
- 电影感特写
- 戏剧化肖像
- 强风格作品

### 英文关键词
- 300mm super telephoto portrait
- extreme compression
- dramatic isolation

---

## 3.10 焦距速查表

| 需求 | 推荐焦距 |
|---|---|
| 风景 + 人物 | 18–35mm |
| 旅行写真 | 24–35mm |
| 生活方式 | 35–50mm |
| 万能人像 | 50mm |
| 写真 / 商业人像 | 85mm |
| 高级半身 / 特写 | 100–135mm |
| 时尚大片 | 135–200mm |
| 强戏剧特写 | 200–300mm |

---

# 4. 光圈与景深系统

## 4.1 f/1.2
- 景深极浅
- 奶油散景
- 氛围极强
- 对主体分离最明显

关键词：
- f1.2 aperture
- creamy bokeh
- extremely shallow depth of field

## 4.2 f/1.4
- 很浅的景深
- 电影感强
- 适合情绪人像

## 4.3 f/1.8
- 最常见的人像参数
- 背景虚化明显
- 相对稳定

## 4.4 f/2.0 – f/2.8
- 细节更稳
- 商业摄影常用
- 面部更完整清晰

## 4.5 f/4
- 保留更多环境
- 适合环境人像 / 旅行人像

## 4.6 f/5.6 – f/8
- 清晰范围更大
- 适合多人合影、风景人像

## 4.7 光圈速查建议

| 需求 | 推荐光圈 |
|---|---|
| 氛围感特写 | f/1.2–f/1.8 |
| 万能半身人像 | f/1.8–f/2.8 |
| 商业人像 | f/2–f/4 |
| 环境人像 | f/2.8–f/5.6 |
| 风景人像 | f/5.6–f/8 |

---

# 5. 构图系统

## 5.1 全身构图
- 展示服装完整性
- 强调身材比例
- 适合环境与人物同时呈现

关键词：
- full body portrait
- full length shot

## 5.2 七分身构图
- 常用于社媒
- 保留体态与面部
- 更聚焦人物

关键词：
- three quarter portrait
- 3/4 body shot

## 5.3 半身构图
- 最常见、最稳妥
- 强调面部和上半身
- 适合大多数写真

关键词：
- half body portrait
- waist up portrait

## 5.4 胸像构图
- 重点在表情、妆容、肩颈线条
- 高级感强

关键词：
- bust portrait
- chest up portrait

## 5.5 肩像构图
- 强调脸和发型
- 适合证件感、杂志感头像

关键词：
- head and shoulders portrait

## 5.6 近景特写
- 聚焦眼睛、嘴唇、皮肤、情绪
- 适合电影感人像

关键词：
- close up portrait

## 5.7 超特写
- 局部美学
- 眼妆、唇妆、珠宝、局部肌理展示

关键词：
- extreme close up

---

# 6. 镜位与视角系统

## 6.1 平视
- 最自然
- 平等、亲近
- 适合绝大多数人像

关键词：
- eye level shot

## 6.2 低机位
- 显腿长
- 显气场
- 英气、时尚感强

关键词：
- low angle portrait
- slightly upward camera angle

## 6.3 高机位
- 显脸小
- 甜美、轻盈
- 社媒自拍常用

关键词：
- high angle portrait

## 6.4 正面视角
- 正式、直给
- 强调对称和五官

## 6.5 侧面视角
- 强调鼻梁、下颌线、轮廓
- 适合电影感和氛围感

关键词：
- profile portrait

## 6.6 45 度侧转
- 最适合大多数人
- 自然又立体

关键词：
- 45 degree angle portrait
- slight body turn

---

# 7. 光线系统

## 7.1 窗光
### 特征
- 柔和
- 自然
- 适合日系、生活方式写真

关键词：
- window light
- soft natural light

## 7.2 顺光
- 脸部亮净
- 信息量清晰
- 适合商业与妆面展示

关键词：
- front lighting

## 7.3 侧光
- 立体感强
- 有明暗层次
- 适合情绪人像

关键词：
- side lighting
- sculpted facial light

## 7.4 逆光
- 轮廓发光
- 氛围浪漫
- 适合黄昏写真

关键词：
- backlight
- rim light
- glowing hair light

## 7.5 顶光
- 偏戏剧化
- 容易出压迫感
- 控制不好会显眼窝重

## 7.6 伦勃朗光
- 三角光影
- 高级、经典、油画感

关键词：
- rembrandt lighting

## 7.7 蝴蝶光
- 鼻下出现蝴蝶形阴影
- 女明星感、妆面感强

关键词：
- butterfly lighting
- beauty lighting

## 7.8 电影光
- 光线分区明显
- 情绪强
- 适合剧情化场景

关键词：
- cinematic lighting
- moody lighting

## 7.9 黄金时刻
- 日落前后暖光
- 最适合旅拍、氛围照

关键词：
- golden hour light
- warm sunset glow

---

# 8. 色彩与色调系统

## 8.1 明亮通透
- 适合小红书、生活方式、韩系
- 关键词：
  - bright and airy
  - clean tones
  - soft highlights

## 8.2 柔和低饱和
- 适合日系写真
- 关键词：
  - soft muted colors
  - pastel tones
  - gentle color palette

## 8.3 暖色电影感
- 适合情绪片、夕阳、复古
- 关键词：
  - warm cinematic tones
  - amber highlights
  - nostalgic mood

## 8.4 冷调高级感
- 适合时尚杂志、都市风
- 关键词：
  - cool toned palette
  - editorial color grading

## 8.5 黑白风格
- 更强调表情、结构、光影
- 关键词：
  - black and white portrait
  - monochrome photography

---

# 9. 人物体态与比例系统

> 本章尽量以 **中性、专业、可控** 的方式描述体态，方便模型理解，而不是为了夸张化。

## 9.1 体型类型

### 娇小型
- petite body
- petite frame
- delicate proportions

### 标准型
- balanced figure
- natural body proportions

### 模特型
- fashion model body
- tall and slender
- elongated limbs

### 沙漏型
- hourglass figure
- defined waist
- balanced bust and hips

### 梨形
- pear shaped body
- narrower shoulders, fuller hips

### 苹果型
- apple shaped body
- fuller upper body

### 运动型
- athletic female
- toned body
- lean physique

### 健身型
- fit and toned
- defined muscles
- low body fat

## 9.2 线条描述

- slim waist：细腰
- soft waistline：柔和腰线
- defined shoulders：肩线明确
- elegant neck line：颈线优雅
- long legs：腿部修长
- proportional figure：比例协调
- natural curves：自然曲线

## 9.3 胸部轮廓（中性描述）

### 大小层级
- very full bust：较丰满
- full bust：丰满
- medium bust：标准
- small bust：小巧
- very small bust / flat chest：平坦或极小量感

### 形态层级
- round shape：圆润
- natural shape：自然
- wide set：外扩
- centered shape：聚拢
- athletic chest：运动型上半身轮廓
- natural sagging：自然下垂

### 位置与重力感
- high set bust：高位
- natural placement：自然位置
- slightly low position：略低
- sagging position：下垂感

### 服装对轮廓的影响
- padded bra：聚拢、抬升
- underwire bra：支撑、集中
- wireless bra：更自然
- minimizer bra：体积视觉减弱
- tight fabric：强化轮廓
- loose clothing：弱化轮廓

### 专业写法建议
为了避免生成不自然结果，建议同时搭配：
- realistic anatomy
- natural asymmetry
- realistic fabric behavior
- age appropriate body proportions
- mature adult proportions

---

# 10. 脸型与五官系统

## 10.1 脸型

- round face：圆脸
- oval face：鹅蛋脸
- heart shaped face：心形脸
- square face：方脸
- diamond face：菱形脸
- v shaped face：V 脸

## 10.2 眼睛

- large expressive eyes：大而有神的眼睛
- almond eyes：杏眼
- soft romantic eyes：柔和桃花眼
- slightly upturned eyes：微上扬眼型
- deep set eyes：深邃眼窝

## 10.3 鼻子

- high nose bridge：高鼻梁
- refined nose：精致鼻型
- soft natural nose：自然鼻型

## 10.4 嘴唇

- full lips：饱满嘴唇
- soft lips：柔和唇形
- defined lip line：唇线清晰

## 10.5 轮廓线

- sharp jawline：清晰下颌线
- soft jawline：柔和下颌线
- high cheekbones：高颧骨
- gentle facial contours：柔和轮廓

---

# 11. 发型系统

## 11.1 长度
- short hair：短发
- shoulder length hair：及肩发
- medium length hair：中长发
- long hair：长发

## 11.2 质地
- straight hair：直发
- wavy hair：波浪发
- curly hair：卷发
- soft curls：柔和卷度

## 11.3 风格
- black straight hair：黑长直
- hime cut：公主切
- bob haircut：波波头
- wolf cut：狼尾层次发
- ponytail：马尾
- low bun：低盘发
- messy bun：松散发髻
- braided hair：编发

## 11.4 头发细节
- soft hair strands：细碎发丝
- glossy hair：有光泽的头发
- natural flyaway hairs：自然碎发
- wind blown hair：被风吹动的头发

---

# 12. 肤质与妆容系统

## 12.1 肤质

- realistic skin texture：真实皮肤质感
- visible pores：轻微可见毛孔
- soft skin：柔软细腻肤感
- healthy skin tone：健康肤色
- luminous skin：透亮肤感
- dewy skin：水润肌
- matte skin：雾面肌

## 12.2 肤色
- fair skin：白皙肤色
- natural skin tone：自然肤色
- warm skin tone：暖肤色
- cool skin tone：冷调肤色
- sun kissed skin：晒后暖调皮肤

## 12.3 妆容
- natural makeup：自然妆
- clean makeup：干净妆感
- soft glam makeup：轻奢感妆容
- editorial makeup：时尚编辑妆
- glossy lips：水润唇妆
- subtle blush：轻腮红
- defined eyeliner：清晰眼线
- soft eyeshadow：柔和眼影

---

# 13. 服装、材质与布料系统

## 13.1 服装风格
- casual wear：休闲装
- elegant dress：优雅连衣裙
- minimalist outfit：极简穿搭
- office wear：通勤风
- sporty outfit：运动风
- swimwear：泳装 / 比基尼
- knitwear：针织
- oversized shirt：宽松衬衫
- evening gown：礼服

## 13.2 材质关键词
- cotton fabric：棉质
- linen fabric：亚麻
- silk fabric：真丝
- satin fabric：缎面
- chiffon fabric：雪纺
- knit texture：针织纹理
- denim fabric：牛仔
- leather texture：皮革
- lace details：蕾丝细节

## 13.3 布料表现
- realistic fabric folds：真实褶皱
- natural drape：自然垂坠
- body hugging fit：贴身版型
- loose relaxed fit：宽松版型
- soft fabric behavior：柔软布料表现

---

# 14. 风格体系

## 14.1 日系写真
特点：
- 自然
- 清爽
- 轻柔
- 更生活化

关键词：
- japanese portrait photography
- natural makeup
- soft daylight
- subtle emotions
- realistic everyday beauty

## 14.2 韩系写真
特点：
- 干净
- 明亮
- 皮肤细腻
- 妆容整洁

关键词：
- korean portrait photography
- clean beauty
- bright tones
- polished appearance

## 14.3 小红书风 / 社媒生活方式
特点：
- 明亮
- 松弛
- 亲近感
- 日常分享感

关键词：
- lifestyle photography
- social media aesthetic
- bright and airy
- relatable mood

## 14.4 时尚杂志风
特点：
- 构图明确
- 气场强
- 服装感突出
- 高级商业感

关键词：
- fashion editorial
- high fashion photography
- luxury magazine style

## 14.5 电影感
特点：
- 情绪更强
- 光线更戏剧化
- 色调更叙事

关键词：
- cinematic portrait
- moody lighting
- storytelling composition

## 14.6 复古胶片风
特点：
- 颗粒
- 低对比
- 怀旧感

关键词：
- film look
- vintage tones
- subtle grain
- nostalgic color grading

---

# 15. 相机品牌与成像风格模拟

## 15.1 Leica 风
- 干净
- 高级
- 立体
- 色彩克制

关键词：
- Leica photography
- Leica color science

## 15.2 Fujifilm 风
- 胶片感
- 柔和
- 色彩讨喜

关键词：
- Fujifilm colors
- film simulation look

## 15.3 Hasselblad 风
- 中画幅感
- 层次丰富
- 高级商业感

关键词：
- Hasselblad medium format
- medium format look

## 15.4 Sony 风
- 清晰锐利
- 数码感较强
- 商业出片稳定

关键词：
- Sony Alpha style
- crisp digital portrait

## 15.5 Canon 风
- 讨喜肤色
- 柔和人像表现

关键词：
- Canon portrait colors
- flattering skin tones

---

# 16. 背景与场景系统

## 16.1 城市场景
- urban street
- modern city backdrop
- architectural background

## 16.2 室内生活方式
- cozy indoor setting
- soft interior background
- window side scene

## 16.3 咖啡馆
- cafe portrait
- warm indoor ambiance

## 16.4 海边
- beach portrait
- seaside background
- tropical resort mood

## 16.5 花园
- garden portrait
- floral background
- romantic outdoor setting

## 16.6 工作室背景
- clean studio backdrop
- seamless background
- minimal editorial set

## 16.7 卧室 / 家居
- bedroom portrait
- intimate lifestyle setting
- soft natural environment

---

# 17. 姿势与动作系统

## 17.1 站姿
- relaxed standing pose：自然站立
- contrapposto pose：重心偏移站姿
- slight body turn：身体微侧转

## 17.2 坐姿
- seated portrait：坐姿肖像
- sitting on chair：坐椅子
- cross legged seated pose：交叠腿坐姿

## 17.3 手部动作
- one hand touching hair：单手拨发
- hands gently clasped：双手轻握
- hand near face：手靠近脸部
- hands in pockets：插袋姿势
- holding a cup / book / flower：持道具

## 17.4 表情状态
- soft smile：轻微微笑
- calm expression：平静表情
- confident expression：自信神情
- thoughtful gaze：若有所思
- looking away：视线偏离镜头
- looking into camera：看向镜头

## 17.5 动态感
- walking pose：行走
- turning back slightly：回头
- wind blowing hair：风吹发丝
- dress in motion：衣摆动态

---

# 18. 常见 AI 问题修复

## 18.1 塑料皮肤
问题：
- 皮肤过度磨皮
- 没有真实微纹理

修复词：
- realistic skin texture
- visible pores
- subtle skin details
- natural skin imperfections

## 18.2 五官僵硬
问题：
- 面部像蜡像
- 缺乏自然表情

修复词：
- relaxed facial muscles
- natural expression
- lifelike facial details

## 18.3 胸部形态不自然
问题：
- 过球形
- 左右完全对称
- 与衣服受力关系不合理

修复词：
- realistic natural shape
- natural asymmetry
- realistic gravity
- fabric responding naturally to body shape

## 18.4 手部异常
问题：
- 手指数量错误
- 关节弯折奇怪
- 手过大或过小

修复词：
- anatomically correct hands
- natural finger proportions
- realistic hand pose

## 18.5 布料穿帮
问题：
- 没有自然褶皱
- 布料像贴图
- 衣物和动作脱节

修复词：
- realistic fabric folds
- natural fabric drape
- physically plausible clothing behavior

## 18.6 背景逻辑差
问题：
- 透视错乱
- 背景物件融化
- 景深边界奇怪

修复词：
- coherent background perspective
- natural environmental details
- realistic depth separation

## 18.7 年龄感错误
问题：
- 成熟气质人物却出现幼态五官
- 身材与年龄不匹配

修复词：
- mature adult woman
- age appropriate features
- realistic adult proportions

---

# 19. 通用 Prompt 模板

## 19.1 极简模板

```text
portrait of a woman, 85mm portrait lens, soft daylight, natural makeup, realistic skin texture, professional photography
```

## 19.2 标准模板

```text
portrait of an elegant young woman, half body portrait,
85mm portrait lens, shallow depth of field,
soft natural daylight, natural makeup,
realistic skin texture, subtle facial details,
professional portrait photography, high detail
```

## 19.3 高级模板

```text
portrait of an elegant adult woman with long wavy hair,
balanced body proportions, natural curves, refined facial features,
half body portrait, 85mm portrait lens, f1.8 aperture,
soft window light, gentle shadow transitions,
realistic skin texture, visible pores, natural makeup,
minimalist elegant outfit with realistic fabric folds,
Japanese portrait photography style, clean composition,
professional DSLR photography, photorealistic, high detail
```

---

# 20. 模型专项写法

## 20.1 GPT-Image 写法建议
特点：
- 更适合自然语言
- 少堆砌关键词，重描述逻辑
- 强调“真实”“自然”“专业”

推荐写法：
```text
Create a photorealistic portrait of an elegant adult woman standing by a window. Use an 85mm portrait lens look with shallow depth of field. She has natural makeup, realistic skin texture, and soft wavy hair. The lighting is soft daylight from the side, giving gentle shadows. Her outfit is minimalist and elegant, with realistic fabric folds and natural drape.
```

## 20.2 Flux 写法建议
特点：
- 关键词式表达更有效
- 可以适当堆风格词

推荐写法：
```text
photorealistic portrait, elegant adult woman, long wavy hair, 85mm portrait lens, soft daylight, realistic skin texture, visible pores, natural makeup, minimalist outfit, realistic fabric folds, shallow depth of field, professional photography, high detail
```

## 20.3 Midjourney 写法建议
特点：
- 简练但有画面感
- 适合加入风格和摄影语言

推荐写法：
```text
elegant adult woman, 85mm portrait, soft daylight, natural makeup, realistic skin texture, fashion editorial photography, shallow depth of field, clean composition, highly detailed
```

---

# 21. Prompt 组合公式

## 21.1 日系写真公式
```text
35mm or 50mm + 窗光 / 柔和日光 + 自然妆容 + 低饱和配色 + 日常姿态
```

英文组合：
- 35mm portrait
- soft natural daylight
- natural makeup
- soft muted colors
- everyday relaxed pose
- japanese portrait photography

## 21.2 韩系写真公式
```text
50mm / 85mm + 明亮顺光 + 干净皮肤 + 精致妆容 + 清爽构图
```

## 21.3 商业写真公式
```text
85mm + 蝴蝶光 / 柔和棚拍光 + 半身构图 + 写实皮肤 + 精致服装
```

## 21.4 Vogue 杂志公式
```text
135mm / 200mm + 电影光 / 高级棚拍光 + 强姿态 + 时尚服装 + 编辑风色调
```

## 21.5 小红书爆款公式
```text
35mm / 50mm + 明亮通透 + 生活方式场景 + 轻松微笑 + 清新色调
```

---

# 22. 高质量示例 Prompt 库

## 22.1 日系窗边写真
```text
portrait of a young woman by a window,
35mm portrait, waist up composition,
soft window light, natural makeup,
realistic skin texture, soft muted colors,
relaxed expression, japanese portrait photography,
high detail, realistic fabric folds
```

## 22.2 韩系清爽半身照
```text
portrait of a young woman, half body portrait,
50mm lens, bright clean lighting,
polished makeup, smooth but realistic skin texture,
clean styling, korean portrait photography,
bright and airy, high detail
```

## 22.3 商业 85mm 人像
```text
portrait of an elegant adult woman,
85mm portrait lens, f1.8 look,
soft beauty lighting, shallow depth of field,
natural makeup, realistic skin texture, visible pores,
minimalist elegant outfit, professional studio portrait,
photorealistic, high detail
```

## 22.4 海边旅拍全身照
```text
full body portrait of a woman at the beach,
24mm wide angle portrait, environmental composition,
golden hour sunlight, wind blown hair,
light summer dress, natural smile,
warm cinematic tones, travel photography style,
high detail, realistic scene depth
```

## 22.5 城市场景生活方式
```text
portrait of a stylish woman walking in the city,
35mm environmental portrait,
urban street background, natural daylight,
casual chic outfit, relaxed expression,
lifestyle photography, bright and airy tones,
photorealistic, detailed clothing texture
```

## 22.6 咖啡馆氛围照
```text
portrait of a woman sitting in a cafe,
50mm lens, seated portrait,
warm indoor light mixed with window light,
soft smile, natural makeup,
cozy lifestyle photography, realistic skin texture,
subtle background blur
```

## 22.7 影棚极简背景人像
```text
studio portrait of an elegant woman,
85mm portrait lens, clean seamless backdrop,
butterfly lighting, subtle shadows,
realistic facial details, natural makeup,
minimalist styling, professional fashion portrait,
high detail, photorealistic
```

## 22.8 电影感逆光人像
```text
cinematic portrait of an adult woman,
135mm lens, close up composition,
backlight with rim light, moody atmosphere,
soft wind in hair, thoughtful gaze,
warm cinematic tones, realistic skin texture,
storytelling portrait, highly detailed
```

## 22.9 高级杂志风
```text
fashion editorial portrait of a stylish woman,
200mm telephoto look, strong background compression,
confident pose, luxury outfit,
editorial lighting, cool toned color grading,
sharp facial structure, realistic skin texture,
high fashion photography
```

## 22.10 复古胶片风
```text
portrait of a woman in vintage style,
50mm portrait, soft natural light,
subtle grain, faded film colors,
nostalgic mood, realistic expression,
vintage portrait photography, detailed fabric texture
```

## 22.11 长焦头像
```text
close up portrait of a woman,
200mm telephoto portrait, strong compression,
shallow depth of field, soft daylight,
clean background, realistic eyes and skin texture,
professional beauty photography
```

## 22.12 低机位时尚站姿
```text
full body fashion portrait of a woman,
slightly low angle shot, 85mm lens,
defined posture, elegant long coat,
editorial lighting, clean urban background,
fashion magazine style, realistic fabric movement
```

## 22.13 花园柔光写真
```text
portrait of a woman in a garden,
50mm portrait, soft diffused daylight,
floral background, romantic atmosphere,
natural makeup, soft smile,
pastel colors, realistic skin texture,
gentle and feminine photography style
```

## 22.14 室内极简生活方式
```text
portrait of a woman in a minimalist apartment,
35mm environmental portrait,
soft daylight, cozy interior setting,
casual knitwear, natural pose,
bright and airy lifestyle photography,
realistic skin and fabric details
```

## 22.15 成熟优雅人像
```text
portrait of a mature elegant woman,
85mm portrait lens, half body composition,
soft side lighting, refined facial features,
realistic skin texture, age appropriate details,
elegant blouse, professional portrait photography,
high detail, natural expression
```

---

# 23. HyperFrames / Codex 知识库组织建议

## 23.1 建议拆分为以下 Markdown 文档

1. `01_焦距系统.md`
2. `02_光线系统.md`
3. `03_构图系统.md`
4. `04_人物体态系统.md`
5. `05_脸型与五官.md`
6. `06_发型与妆容.md`
7. `07_服装与材质.md`
8. `08_风格库.md`
9. `09_错误修复词典.md`
10. `10_Prompt模板库.md`

## 23.2 适合做成 Skill / Knowledge 的字段

### Metadata 示例
- style：Japanese / Korean / Editorial / Cinematic
- lens：35mm / 50mm / 85mm / 135mm / 200mm
- composition：full body / half body / close up
- lighting：window light / backlight / butterfly light
- scene：studio / city / beach / cafe / indoor
- use_case：travel / portrait / beauty / fashion / social media

## 23.3 工作流建议
- **第一步**：确定风格
- **第二步**：确定焦距与构图
- **第三步**：确定光线
- **第四步**：补充人物细节
- **第五步**：加入修复词

---

# 24. 术语速查表

| 中文 | 英文 |
|---|---|
| 环境人像 | environmental portrait |
| 半身照 | half body portrait |
| 胸像 | bust portrait |
| 特写 | close up portrait |
| 浅景深 | shallow depth of field |
| 背景压缩 | background compression |
| 自然皮肤纹理 | realistic skin texture |
| 可见毛孔 | visible pores |
| 自然布料褶皱 | realistic fabric folds |
| 自然垂坠 | natural drape |
| 窗光 | window light |
| 逆光 | backlight |
| 蝴蝶光 | butterfly lighting |
| 伦勃朗光 | rembrandt lighting |
| 黄金时刻 | golden hour |
| 胶片感 | film look |
| 电影感 | cinematic look |
| 生活方式摄影 | lifestyle photography |
| 时尚编辑风 | fashion editorial |
| 自然不对称 | natural asymmetry |
| 合理解剖 | realistic anatomy |

---

# 25. 结语

这份 V2 版手册的目标，是把你前面的图片内容升级为一套更适合 **实际出图、实际知识管理、实际 Prompt 工程** 的文档框架。

你后续可以继续往下扩展成三个方向：

## 方向 A：Prompt 素材库
- 增加 100–300 条可直接复制的 Prompt

## 方向 B：模型专项版
- 为 GPT-Image、Flux、Midjourney 分别写更细的版本

## 方向 C：项目知识库版
- 拆分成多个 Markdown，挂到 Codex / HyperFrames / Superpowers 中使用

如果你愿意，下一步我还可以继续帮你生成：

1. **《AI人像摄影 Prompt 百科 V3：100条高质量 Prompt 实战库》**
2. **《GPT-Image 专用人像 Prompt 手册》**
3. **《Flux 专用人像 Prompt 手册》**
4. **《Midjourney 专用人像 Prompt 手册》**
5. **《日系 / 韩系 / 小红书 / 杂志风 4 大风格专册》**


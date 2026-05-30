# Image2 成人魅力与时尚提示词技能包

这个仓库包含 4 个 Codex skill，用来把成人、原创、非露骨的女性魅力写真、时尚人像、内衣/泳装 Lookbook 和失败修复工作流，整理成可复用的 Image2 / GPT Image 2 中文提示词。

核心目标不是生成软色情或绕过审查，而是把“成熟、有吸引力、服装与体态美感、商业审美、镜头张力”转成更稳定、更高级、更清晰的中文图像提示词。

默认主体为“原创成年东方女性，二十多岁及以上”；当用户明确指定其他安全主体时，技能会尊重用户设定，不强行覆盖。

4 个技能默认都会在 `最终中文提示词` 中加入固定中文风格锚点：成熟丰腴且比例协调的整体体态、自然端正的站姿/坐姿、轻微侧身与自然回望镜头、明亮室内或高级家居自然光场景，以及二十多岁及以上成年幻想系女性角色的粉色主题服饰与角色美术造型。这些锚点用于整体人像、服装版型和高级时尚构图，不用于身体局部特写或低俗凝视。

## 技能列表

### `image2-aesthetic-rewriter`

用于把粗糙、低俗、容易失败的描述改写成成熟、高级、非露骨的中文 Image2 提示词。

适合这样问：

```text
使用 $image2-aesthetic-rewriter，把“性感美女，身材火辣，氛围暧昧”改成高级、克制、能用于 Image2 的中文提示词。
```

常见用途：

- 把“性感、魅惑、火辣、撩人”等词转成审美表达。
- 把身体局部强调改成整体体态、服装剪裁和镜头语言。
- 把私密或暧昧语境改成时尚、人像、商业或角色设计语境。

### `image2-adult-glamour-studio`

用于生成成人原创魅力写真、高级女性人像、时尚 editorial 风格的中文提示词。

适合这样问：

```text
使用 $image2-adult-glamour-studio，生成一张原创成年东方女性高级人像的中文提示词，清冷、成熟、低饱和、窗边自然光。
```

常见用途：

- 成人魅力写真
- 高级女性人像
- 成熟女性美
- 时尚杂志感
- 商业人像和 editorial 视觉

### `image2-fashion-lingerie-lookbook`

用于生成成人时尚内衣、泳装、试衣间服装确认照、Lookbook 或 fit check 方向的中文提示词。它会优先强调服装版型、面料、颜色、支撑结构、场景和商业展示，而不是身体局部。

适合这样问：

```text
使用 $image2-fashion-lingerie-lookbook，生成一张原创成年东方女性模特的高级泳装 Lookbook 中文提示词，度假酒店泳池边，重点表现泳装版型和面料。
```

常见用途：

- 内衣 Lookbook
- 泳装品牌图
- 试衣间服装确认照
- bralette / lingerie / swimwear 的商品展示
- 成人时尚 fit check

### `image2-risk-debugger`

用于诊断 Image2 提示词被拒、生成太保守、脸太幼、太擦边、身材变形、不够高级等问题，并输出中文修复提示词。

适合这样问：

```text
使用 $image2-risk-debugger，下面这条提示词被拒了，请诊断原因并输出一个合规的中文修复版：
……
```

常见用途：

- 被拒了
- 太保守
- 脸太幼
- 太擦边
- 身材变形
- 不够高级
- 不像真实摄影

## 输出格式

这 4 个技能默认都会使用简体中文输出。常见字段包括：

```text
意图摘要
已锁定参数
风险/质量说明
最终中文提示词
负面限制词
可选变化参数
```

`image2-risk-debugger` 还会包含：

```text
修复策略
```

其中 `最终中文提示词` 是可以直接复制给 Image2 / GPT Image 2 使用的主体提示词。`负面限制词` 用于约束不希望出现的内容，例如未成年感、真实人物相似、低俗姿势、身体局部特写、手指畸形等。

`最终中文提示词` 也是唯一需要完整承载固定风格锚点的字段；其他字段可以摘要说明，不必重复整段长句。

## 推荐使用流程

1. 不确定原始描述是否稳定时，先用 `$image2-aesthetic-rewriter` 改写。
2. 想要普通成人魅力写真或高级人像时，用 `$image2-adult-glamour-studio`。
3. 涉及内衣、泳装、服装试穿、Lookbook 时，用 `$image2-fashion-lingerie-lookbook`。
4. 提示词被拒或结果不满意时，用 `$image2-risk-debugger` 修复。

一个完整工作流示例：

```text
第一步：
使用 $image2-aesthetic-rewriter，把我的想法改成高级、非露骨的中文 Image2 提示词：
成熟、有吸引力的女性，黑色连衣裙，城市公寓，电影感。

第二步：
使用 $image2-adult-glamour-studio，基于上面的方向扩展成一条完整的 9:16 高级人像提示词。

第三步：
如果生成结果太保守，使用 $image2-risk-debugger，告诉它“太保守，不够时尚张力”，让它输出修复版。
```

## 重要边界

这些技能会保留成人魅力、时尚张力和成熟审美，但不会帮助生成或保留以下方向：

- 软色情或露骨色情目标
- 未成年、幼态、学生感、少女感与性感组合
- 真实人物、明星、网红或私人照片的性化
- 偷拍、泄露、男友视角、胁迫、醉酒、压迫感亲密互动
- 胸、臀、腰胯、腿根、唇部等身体局部主导构图
- 绕过审查或规避安全系统的写法

如果原始请求包含这些内容，技能会把可支持的部分改写成成人、原创、非露骨的时尚、人像、Lookbook 或角色设计方向。

## 文件结构

```text
skills/
  image2-aesthetic-rewriter/
  image2-adult-glamour-studio/
  image2-fashion-lingerie-lookbook/
  image2-risk-debugger/
  _shared/
    references/
      adult-glamour-boundaries.md
      required-prompt-anchors.md
      rewrite-vocabulary.md
      portrait-fashion-parameters.md
      failure-repair-recipes.md
```

4 个技能共享 `_shared/references` 里的边界、词库、参数和修复配方。高风险参考文档只作为反例和改写素材，不会原样迁移成提示词模板。

## 验证技能

可以用 `skill-creator` 的校验脚本检查每个技能：

```powershell
$env:PYTHONUTF8='1'
$script='C:\Users\QQ497\.codex\skills\.system\skill-creator\scripts\quick_validate.py'
python $script skills/image2-aesthetic-rewriter
python $script skills/image2-adult-glamour-studio
python $script skills/image2-fashion-lingerie-lookbook
python $script skills/image2-risk-debugger
```

如果本机 Python 缺少 `PyYAML`，先安装：

```powershell
python -m pip install PyYAML
```

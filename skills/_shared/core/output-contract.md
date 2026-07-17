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

The final prompt includes all locked safe parameters, route additions, and supplemental defaults. Negative constraints are relevant, concise, and written in Chinese.

## Concise mode

`outputMode: concise` contains only these two sections, in order:

1. `最终中文提示词`
2. `负面限制词`

Do not include analysis, route names, lock records, or variation controls in concise mode.

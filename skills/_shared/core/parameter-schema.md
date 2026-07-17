# Parameter Schema

Every director route accepts this canonical parameter record:

| Field | Chinese label | Rule |
| --- | --- | --- |
| `subject` | 主体 | Describe an original, adult subject. |
| `clothing` | 服装 | Preserve safe user-specified clothing. |
| `scene` | 场景 | Preserve the requested location or setting. |
| `action` | 动作 | Preserve a safe pose or activity. |
| `camera` | 镜头 | Covers framing, angle, lens, and viewpoint. |
| `lighting` | 光线 | Covers time, source, direction, and quality. |
| `canvas` | 画幅 | Covers aspect ratio, resolution, and crop. |
| `purpose` | 用途 | Covers delivery context such as editorial or commerce. |
| `outputMode` | 输出模式 | Selects `complete` or `concise`. |

## Locks and defaults

Safe, explicit user values are locked verbatim in a **parameter-lock record** and must not be silently replaced. A skill may only add detail that does not contradict a lock. Missing, blank, `auto`, or otherwise unspecified values use `补充默认值` (supplemental defaults); label every such value as `补充默认值` in the lock record. A safety reframe replaces only the unsafe portion and records the reason.

The contract produces `routeId`, `outputMode`, and the parameter-lock record before prompt writing.

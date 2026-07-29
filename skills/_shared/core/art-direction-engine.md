# Art Direction Engine

Use this engine before selecting camera, light, styling, or decorative detail. Preserve every safe user lock. The default is **balanced editorial**: add one restrained conceptual turn without replacing the user's subject, scene, wardrobe, action, camera, light, or canvas.

## Art-direction record

Create these internal fields:

| Field | Required decision |
| --- | --- |
| `visualThesis` | One sentence describing what the image is about, using a mild tension or contrast rather than a style label. |
| `visualMotif` | One recurring image such as boundary, echo, absence, weight, repetition, fading, inversion, or unfinished motion. |
| `narrativeBeat` | What just happened, what the subject is doing now, the resistance, and what may happen next. |
| `viewerPosition` | The viewer's physical and emotional relation: intimate witness, distant observer, participant, or confronted counterpart. |
| `readingHierarchy` | First read, second read, and afterimage. The first read has exactly one dominant focus. |
| `colorRoles` | Dominant, supporting, and optional accent color with approximate area and purpose. |
| `materialDialogue` | Two or three principal materials and the optical or tactile contrast between them. |
| `elementBudget` | Visible-element budget and the item removed during editing. |

Do not expose raw identifiers unless a specialist contract requires them. Summarize them in `导演扩展` as a concise art-direction brief.

## 1-1-1-3-2-1-1 method

1. Write **one thesis**. A theme, location, genre, or adjective alone is not a thesis.
2. Choose **one motif** and repeat it through at least three of composition, action, light, color, material, or environment.
3. Freeze **one narrative turning point**. Derive expression, gesture, gaze, and prop use from it.
4. Define **three reads**: immediate focus, discovered clue, unresolved afterimage.
5. Build **two relationships**, chosen from color, material, space, time, or emotion. Prefer relationships over extra objects.
6. Add **one counter-expectation** only when it supports the thesis. Keep it restrained; never introduce a second main style.
7. Perform **one ruthless edit** before returning the prompt.

## Element budget

Default maximums:

- one human subject unless the request requires more;
- zero or one narrative prop;
- no more than three environmental identity signals;
- one accent color;
- one effects family;
- zero or one foreground emphasis.

Delete an element that is attractive but does not support thesis, narrative, hierarchy, physical interaction, or task purpose. Compress repeated mood adjectives and remove redundant style labels.

## Observable-quality rule

Words such as `高级`, `电影感`, `杂志感`, `大片感`, `奢华`, `诗意`, `8K`, and `莫兰迪` are not evidence of quality. Translate them into observable decisions:

- hierarchy and negative space;
- camera position and spatial compression or expansion;
- motivated light, contrast, and exposure separation;
- color-area roles;
- material response to light;
- a specific incomplete moment;
- controlled edge detail and intentional omission.

Delivery tokens such as `8K` may remain when the user locks them or the output purpose needs them, but they never substitute for art direction.

## Cultural positioning

For regional, historical, ceremonial, or subcultural imagery, establish the time position and viewing stance. Use at most two cultural signals by default: one explicit and one implicit. Avoid symbol bundles that reduce a culture to props. State which familiar cliché is intentionally omitted.

## Task-strength adaptation

- **Editorial, conceptual, cinematic, wedding, cosplay, poster, or surreal:** apply the full engine.
- **Lifestyle and general portrait:** keep the thesis simple and the counter-expectation subtle.
- **Lookbook and commerce:** product legibility outranks metaphor; use motif and hierarchy to support the garment.
- **Character reference sheet:** identity consistency and view completeness outrank narrative; use only color/material hierarchy and element editing.
- **Risk debugging:** diagnose missing thesis, hierarchy, relationships, or editing when a prompt is complete but bland.

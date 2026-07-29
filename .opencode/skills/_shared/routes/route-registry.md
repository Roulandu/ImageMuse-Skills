# Route Registry

The director selects exactly one Route ID as `routeId`. Each route may use compatible overlays but must follow the shared contracts.

Before applying a route, derive the shared art-direction record. Treat each route's existing fingerprint, palette/material, camera, light, photographed moment, and exclusions as a starting vocabulary, then compile these route-level decisions:

- `thesisSeed`: a task-specific mild tension; never reuse the route name as the thesis;
- `motifVariation`: one motif expressed in at least three dimensions;
- `narrativeTurn`: before/current/next action and one unresolved consequence;
- `spatialPlan`: subject zone, support, scene axis, camera position, projection, and key occlusion;
- `colorMaterialRelation`: color roles plus two or three principal materials;
- `counterExpectation`: one restrained departure from the route cliché;
- `elementCut`: one attractive but nonfunctional element to omit.

Do not apply a route as a fixed prop bundle. Cultural routes use at most two cultural signals by default.

| Route ID | Direction |
| --- | --- |
| `clean-lifestyle` | Clean, natural everyday lifestyle photography. |
| `urban-fashion` | Contemporary city fashion editorial. |
| `french-lazy` | Relaxed French-inspired elegance. |
| `new-chinese` | Modern Chinese aesthetic. |
| `gufeng-xianxia` | Guofeng and xianxia-inspired fantasy styling. |
| `retro-hongkong` | Retro Hong Kong cinematic style. |
| `travel-vacation` | Travel and vacation portrait storytelling. |
| `low-key-cinematic` | Moody low-key cinematic portraiture. |
| `studio-retouched` | Controlled studio and polished retouching direction. |
| `ecommerce-tryon` | E-commerce apparel try-on presentation. |
| `sporty-active` | Active sports and fitness lifestyle. |
| `ultra-close-real-face` | Tight, realistic facial portrait detail. |

## Specialty delegation

Delegate requests for a fixed Chinese portrait field list, structured portrait brief, or the field sequence “摄影风格 / 写真方向 / 场景方向 / 服装方向” to `image2-structured-portrait-prompt`; it uses its own fixed output contract. Delegate bridal requests to `image2-wedding-portrait`. Delegate fashion lookbook requests to `image2-fashion-lingerie-lookbook`. Delegate sports venue, team-babe, cheerleader, stadium, basketball, or football requests to `image2-sports-venue-portrait` (the sports specialty target). The specialty skill constraints outrank the selected route under the conflict-resolution contract.

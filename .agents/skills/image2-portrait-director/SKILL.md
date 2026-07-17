---
name: image2-portrait-director
description: Direct Image2 portrait requests to one governed visual route and produce a contract-compliant Chinese result.
---

# Image2 Portrait Director

## Required load order

Before making a decision, load these documents in order:

1. `../_shared/core/parameter-schema.md`
2. `../_shared/core/reference-image-policy.md`
3. `../_shared/core/conflict-resolution.md`
4. `../_shared/core/quality-gates.md`
5. `../_shared/core/output-contract.md`
6. `../_shared/routes/route-registry.md`
7. Exactly one matching file from `../_shared/routes/{routeId}.md`.

## Direction workflow

1. Parse user intent and lock safe explicit parameters according to the parameter schema.
2. Apply reference-image roles and conflict precedence before visual choices.
3. Select **涓€涓富 Route** (one primary Route) from the registry. Do not blend two main routes; compatible overlays may only add detail under the conflict-resolution contract.
4. Read the selected route and use its fingerprint, palette/material, camera, light, photographed-moment rule, and exclusions.
5. Delegate requests that the registry marks as specialty work to `image2-wedding-portrait`, `image2-fashion-lingerie-lookbook`, `image2-sports-venue-portrait`, `image2-character-poster-cover`, `image2-character-reference-sheet`, or `image2-risk-debugger`. Their constraints outrank route styling.
6. Apply quality gates, then return the shared output contract in Simplified Chinese unless another language is requested.

## Image generation gate

Generate an image only when `interactionMode: direct-image` and the user explicitly says **直接出图**. Otherwise return prompt text only. Reference images authorise only role-locked inputs; they do not authorise image generation.

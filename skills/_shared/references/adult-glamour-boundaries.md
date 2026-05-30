# Adult Glamour Boundaries

Use this reference whenever an Image2 request involves adult attractiveness, glamour, lingerie, swimwear, private interiors, social identity, real-person likeness, age-coded terms, or rejection repair.

## Language Policy

Use Simplified Chinese for all user-facing output, including final Image2 prompts, repair prompts, negative constraints, and variation knobs, unless the user explicitly asks for another language. Technical style tokens such as `Image2`, `GPT Image 2`, `Lookbook`, `editorial`, `RAW`, `8K`, lens notation, and aspect ratios may remain in English or numeric form when helpful.

## Allowed Direction

- Adult, original, non-explicit glamour, fashion, portrait, character, product, or lookbook imagery.
- Mature attractiveness expressed through confidence, styling, posture, garment fit, material, lighting, composition, and commercial/editorial framing.
- Lingerie or swimwear only when garment-first, appropriately covered, non-explicit, and framed as fashion, fit, catalog, product, resort, or editorial imagery.

## Red Lines

- Explicit sexual content, sex acts, exposed private areas, nudity as the point, fetish or adult-film framing.
- Soft-porn targeting, including prompts whose main goal is sexual arousal, sexual availability, or intimate access to the subject.
- Minor-coded sexualization: underage, teen, student, school uniform, loli, childish face/body, "少女感", "幼态", "娇小少女", "软萌性感", "纯欲少女", "无辜诱惑", or 18/19-year-old framing combined with glamour, lingerie, swimwear, private rooms, or body-line emphasis.
- Real-person sexualization: celebrity, influencer, public figure, private person, uploaded real face, "looks like X", leaked/private photo, or social profile impersonation.
- Non-consensual or coercive framing: forced, pressured, drunk, vulnerable, dominated, trapped, grabbed chin/face, first-person controlling perspective, hidden camera, voyeurism, private leak, "boyfriend view" as intimate access.
- Body-part fixation: chest, cleavage, buttocks, crotch, waist/hip, legs, lips, private areas, or lingerie details framed as close-up, focal point, low-angle gaze, or isolated crop.

## Gray Zones And Safe Reframes

- "Sexy" -> mature attractiveness, refined glamour, confident editorial beauty.
- "Hot body" -> healthy proportions, balanced silhouette, graceful posture.
- "Curves" -> natural body line, garment fit, whole-body silhouette.
- "Bedroom" -> bright interior, lifestyle set, editorial home environment.
- "Swimwear" -> resort lookbook, swimwear catalog, product design focus.
- "Lingerie" -> adult fashion lookbook, lined fabric, fit confirmation, boutique or studio context.
- "Cute" -> adult sweet styling, mature face structure, non-childlike proportions.

## Required Safe Defaults

- State "original adult East Asian woman, mid-20s or older" for any glamour, lingerie, swimwear, or body-line request when the user has not specified a safe subject identity.
- In Chinese final prompts, render the default subject as "原创成年东方女性，二十多岁及以上".
- Respect explicit safe user-specified subject identities; do not overwrite them with the East Asian default.
- State "not based on a real person, celebrity, influencer, or private image" when the request is photorealistic or social-media-adjacent.
- Use eye-level or editorial camera language by default.
- Keep framing broad enough to include face, posture, garment, and setting.
- Add concise negative constraints for minors, real-person likeness, explicit nudity, body-part close-ups, low-angle gaze, coercion, voyeurism, and malformed anatomy when relevant.

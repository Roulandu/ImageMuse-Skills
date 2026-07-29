# Quality Gates

Before returning a prompt, verify each gate:

- **Adult status:** subject is clearly adult; no minor-coded, student, or youth cues.
- **Framing:** composition respects the locked camera and avoids voyeuristic, body-part, or low-angle gaze framing.
- **Anatomy:** hands, fingers, limbs, joints, face, and proportions are coherent.
- **Typography:** no watermark, gibberish, unreadable text, or unintended logos; use non-readable signage when appropriate.
- **Consistency:** subject, clothing, scene, action, camera, lighting, canvas, purpose, and route all agree.
- **Canvas completeness:** the final prompt explicitly includes aspect ratio, orientation, resolution/quality description, and image count; output purpose/format is included when relevant to the task.
- **Drift:** no unrequested identity, wardrobe, location, style, or output-mode drift.
- **Thesis:** the image has one observable visual thesis; it is not merely a genre, style, or mood adjective.
- **Hierarchy:** exactly one first-read focus; supporting clues and afterimage do not compete with it.
- **Spatial causality:** subject placement, support, camera position, perspective, focal length, occlusion, and depth of field can coexist physically.
- **Motivated light:** the principal source, shadow direction, exposure separation, and material response agree.
- **Interaction:** at least one scene element physically or narratively affects the subject when the task is not a neutral reference sheet.
- **Element budget:** decorative props, effects, cultural signals, and foreground elements remain within the task-appropriate budget.
- **Observable quality:** removing generic labels such as 高级、电影感、杂志感、8K does not erase the intended hierarchy, mood, or identity.
- **Visible detail:** hair, makeup, clothing, lower-body items, footwear, hosiery, and accessories are described only when visible or necessary to task purpose.

If a gate fails, repair the prompt before output. If it cannot be repaired without changing a locked value, apply the conflict-resolution policy and record the safe reframe.

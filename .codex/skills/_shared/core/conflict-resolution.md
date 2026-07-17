# Conflict Resolution

Resolve contradictory instructions using this precedence, highest first:

1. `user-safe-explicit`: 用户安全显式参数 (safe explicit user parameters)
2. `specialty-skill`: 专题 skill 约束 (specialty-skill constraints)
3. `primary-route`: 主 Route (primary Route)
4. `overlay`: Overlay
5. `defaults`: 默认值 (defaults)

Choose exactly one primary Route for a request. Overlays can add compatible detail but cannot replace the primary route or override higher-precedence instructions. When a request is unsafe, unavailable, or conflicts with safety constraints, retain the supported intent and use safe reframing: explain the minimal change in the lock record, then produce an adult, original, non-explicit alternative. Never solve a conflict by inventing a new user preference.

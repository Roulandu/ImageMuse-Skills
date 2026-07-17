# Image2 Foundation and Priority Migration Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Add a shared, testable prompt-governance foundation and `image2-portrait-director`, then migrate the four highest-priority existing skills without breaking multi-agent distribution.

**Architecture:** Canonical content lives below `skills/`; a PowerShell validator verifies every canonical skill and every generated mirror. The director loads one registered route plus optional overlay and delegates specialised intents to existing skills. Common contracts live in `skills/_shared/core` and `skills/_shared/routes`.

**Tech Stack:** Markdown Agent Skills, YAML metadata, PowerShell 7 validation scripts, Git.

## Global Constraints

- Canonical content is under `skills/`; `.agents/`, `.claude/`, `.codex/`, `.cursor/`, and `.opencode/` must be byte-identical mirrors after every change.
- Default subjects are fictional, clearly adult, original and non-explicit; identity preservation is only for user-owned or authorised adult/product references.
- Safe user-supplied values outrank defaults; select at most one primary Route.
- Only explicit `直接出图` authorises image generation; otherwise return a prompt.
- Public output is Simplified Chinese unless the user requests otherwise.
- Do not introduce application runtime dependencies.

---

## File Structure

- `tools/validate-skills.ps1`: validates YAML metadata, canonical/mirror parity and linked shared files.
- `tests/*.Tests.ps1`: Pester contract tests.
- `skills/_shared/core/*.md`: schema, output contract, conflict resolution, quality gates and reference-image policy.
- `skills/_shared/routes/*.md`: registry plus twelve visual Routes.
- `skills/image2-portrait-director/`: general routing entry.
- Existing specialty directories: shared-contract migration and their topic-specific improvements.
- All platform mirror trees: synchronised published copies.

### Task 1: Add canonical and mirror validation

**Files:**
- Create: `tools/validate-skills.ps1`
- Create: `tests/validate-skills.Tests.ps1`

**Interfaces:**
- Consumes: `-Root <repository root>` and `-SkipMirrorCheck`.
- Produces: exit code `0`; throws `Missing mirror:` or `Front matter:` when invalid.

- [ ] **Step 1: Write the failing test**

```powershell
Describe 'validate-skills' {
  It 'accepts the repository canonical skills and mirrors' {
    & "$PSScriptRoot/../tools/validate-skills.ps1" -Root "$PSScriptRoot/.."
    $LASTEXITCODE | Should -Be 0
  }
  It 'reports a missing mirror' {
    $root = Join-Path $TestDrive 'repo'
    New-Item -ItemType Directory -Force "$root/skills/demo" | Out-Null
    Set-Content "$root/skills/demo/SKILL.md" "---`nname: demo`ndescription: demo`n---`n# Demo"
    { & "$PSScriptRoot/../tools/validate-skills.ps1" -Root $root } | Should -Throw '*Missing mirror:*demo*'
  }
}
```

- [ ] **Step 2: Verify it fails**

Run: `Invoke-Pester tests/validate-skills.Tests.ps1 -Output Detailed`

Expected: FAIL because `tools/validate-skills.ps1` does not exist.

- [ ] **Step 3: Write the minimal validator**

```powershell
param([Parameter(Mandatory)] [string]$Root, [switch]$SkipMirrorCheck)
$canonical = Join-Path $Root 'skills'
$mirrors = @('.agents/skills', '.claude/skills', '.codex/skills', '.cursor', '.opencode/skills')
Get-ChildItem $canonical -Directory | Where-Object Name -ne '_shared' | ForEach-Object {
  $name = $_.Name; $source = Join-Path $_.FullName 'SKILL.md'
  if (-not (Test-Path $source)) { throw "Missing canonical SKILL.md: $name" }
  $text = Get-Content -Raw -Encoding utf8 $source
  if ($text -notmatch '(?s)^---\s*\r?\nname:\s*[^\r\n]+\r?\ndescription:\s*[^\r\n]+\r?\n---') { throw "Front matter: $name" }
  if (-not $SkipMirrorCheck) { foreach ($mirror in $mirrors) {
    $target = Join-Path $Root "$mirror/$name/SKILL.md"
    if (-not (Test-Path $target)) { throw "Missing mirror: $mirror/$name" }
    if ((Get-Content -Raw -Encoding utf8 $target) -ne $text) { throw "Mirror differs: $mirror/$name" }
  }}
}
```

- [ ] **Step 4: Run the tests**

Run: `Invoke-Pester tests/validate-skills.Tests.ps1 -Output Detailed; ./tools/validate-skills.ps1 -Root .`

Expected: two passing tests and exit code `0`.

- [ ] **Step 5: Commit**

```powershell
git add tools/validate-skills.ps1 tests/validate-skills.Tests.ps1
git commit -m "test: validate skill mirrors and metadata"
```

### Task 2: Add shared contracts and route registry

**Files:**
- Create: `skills/_shared/core/parameter-schema.md`
- Create: `skills/_shared/core/output-contract.md`
- Create: `skills/_shared/core/conflict-resolution.md`
- Create: `skills/_shared/core/quality-gates.md`
- Create: `skills/_shared/core/reference-image-policy.md`
- Create: `skills/_shared/routes/route-registry.md`
- Create: `tests/shared-contracts.Tests.ps1`

**Interfaces:**
- Consumes: `主体、服装、场景、动作、镜头、光线、画幅、用途、输出模式`.
- Produces: `routeId`, `outputMode`, parameter-lock record and fixed output section order.

- [ ] **Step 1: Write the failing test**

```powershell
Describe 'shared prompt contracts' {
  $root = Resolve-Path "$PSScriptRoot/.."
  It 'defines all required core documents' {
    'parameter-schema.md','output-contract.md','conflict-resolution.md','quality-gates.md','reference-image-policy.md' |
      ForEach-Object { Test-Path "$root/skills/_shared/core/$_" | Should -BeTrue }
  }
  It 'registers director routes and specialty targets' {
    $registry = Get-Content -Raw -Encoding utf8 "$root/skills/_shared/routes/route-registry.md"
    $registry | Should -Match 'clean-lifestyle'
    $registry | Should -Match 'image2-wedding-portrait'
    $registry | Should -Match 'image2-sports-venue-portrait'
  }
}
```

- [ ] **Step 2: Verify it fails**

Run: `Invoke-Pester tests/shared-contracts.Tests.ps1 -Output Detailed`

Expected: FAIL because core and route files do not exist.

- [ ] **Step 3: Implement the documents**

`parameter-schema.md` defines the nine fields above, locks user values and labels defaults `补充默认值`. `output-contract.md` defines complete output `意图摘要、已锁定参数、导演扩写、最终中文提示词、负面限制词、可选变化参数` and concise output containing only final prompt and negative constraints. `conflict-resolution.md` defines precedence `用户安全显式参数 > 专题 skill 约束 > 主 Route > Overlay > 默认值`, one primary Route, and safe reframing. `quality-gates.md` checks adult status, framing, anatomy, typography, consistency and drift. `reference-image-policy.md` requires authorisation and role locking. The registry contains twelve Route IDs: `clean-lifestyle`, `urban-fashion`, `french-lazy`, `new-chinese`, `gufeng-xianxia`, `retro-hongkong`, `travel-vacation`, `low-key-cinematic`, `studio-retouched`, `ecommerce-tryon`, `sporty-active`, `ultra-close-real-face`; it delegates bridal, Lookbook and sports requests.

- [ ] **Step 4: Run tests**

Run: `Invoke-Pester tests/shared-contracts.Tests.ps1 -Output Detailed`

Expected: two passing tests.

- [ ] **Step 5: Commit**

```powershell
git add skills/_shared/core skills/_shared/routes tests/shared-contracts.Tests.ps1
git commit -m "feat: add shared Image2 prompt contracts"
```

### Task 3: Build the director and twelve route files

**Files:**
- Create: `skills/image2-portrait-director/SKILL.md`
- Create: `skills/image2-portrait-director/agents/openai.yaml`
- Create: `skills/_shared/routes/{clean-lifestyle,urban-fashion,french-lazy,new-chinese,gufeng-xianxia,retro-hongkong,travel-vacation,low-key-cinematic,studio-retouched,ecommerce-tryon,sporty-active,ultra-close-real-face}.md`
- Create: `tests/director-contract.Tests.ps1`

**Interfaces:**
- Consumes: Task 2 contracts and registry.
- Produces: `image2-portrait-director`, which loads exactly one Route and follows the shared output contract.

- [ ] **Step 1: Write the failing test**

```powershell
Describe 'image2 portrait director' {
  $root = Resolve-Path "$PSScriptRoot/.."; $skill = "$root/skills/image2-portrait-director/SKILL.md"
  It 'loads governance before selecting a route' {
    $text = Get-Content -Raw -Encoding utf8 $skill
    $text | Should -Match '../_shared/core/parameter-schema.md'
    $text | Should -Match '../_shared/routes/route-registry.md'
  }
  It 'enforces one route and explicit image generation' {
    $text = Get-Content -Raw -Encoding utf8 $skill
    $text | Should -Match '一个主 Route'
    $text | Should -Match '直接出图'
  }
}
```

- [ ] **Step 2: Verify it fails**

Run: `Invoke-Pester tests/director-contract.Tests.ps1 -Output Detailed`

Expected: FAIL because the director does not exist.

- [ ] **Step 3: Implement director and routes**

The director front matter uses `name: image2-portrait-director`. It loads the five core documents, then registry, then one route. It delegates to `image2-wedding-portrait`, `image2-fashion-lingerie-lookbook`, `image2-sports-venue-portrait`, `image2-character-poster-cover`, `image2-character-reference-sheet`, and `image2-risk-debugger`. Every route defines fingerprint, palette/material/camera/light decisions, a photographed-moment rule, and exclusions preventing overlap with another main Route.

- [ ] **Step 4: Run tests**

Run: `Invoke-Pester tests/director-contract.Tests.ps1 -Output Detailed`

Expected: two passing tests.

- [ ] **Step 5: Commit**

```powershell
git add skills/image2-portrait-director skills/_shared/routes tests/director-contract.Tests.ps1
git commit -m "feat: add Image2 portrait director"
```

### Task 4: Upgrade priority specialty skills

**Files:**
- Modify: `skills/image2-risk-debugger/SKILL.md`
- Modify: `skills/image2-wedding-portrait/SKILL.md`
- Modify: `skills/image2-fashion-lingerie-lookbook/SKILL.md`
- Rename: `skills/image2-court-babe-portrait/` to `skills/image2-sports-venue-portrait/`
- Create: `tests/priority-skills.Tests.ps1`

**Interfaces:**
- Consumes: Task 2 contracts.
- Produces: priority specialty skills with shared contract links and topic-specific controls.

- [ ] **Step 1: Write the failing test**

```powershell
Describe 'priority skill upgrades' {
  $root = Resolve-Path "$PSScriptRoot/.."
  $skills = @('image2-risk-debugger','image2-wedding-portrait','image2-fashion-lingerie-lookbook','image2-sports-venue-portrait')
  It 'links each skill to output and quality contracts' {
    foreach ($name in $skills) {
      $text = Get-Content -Raw -Encoding utf8 "$root/skills/$name/SKILL.md"
      $text | Should -Match '../_shared/core/output-contract.md'
      $text | Should -Match '../_shared/core/quality-gates.md'
    }
  }
  It 'removes the old court-babe directory' { Test-Path "$root/skills/image2-court-babe-portrait" | Should -BeFalse }
}
```

- [ ] **Step 2: Verify it fails**

Run: `Invoke-Pester tests/priority-skills.Tests.ps1 -Output Detailed`

Expected: FAIL because common links and renamed directory are absent.

- [ ] **Step 3: Implement specialised improvements**

Risk debugger classifies `拒绝、构图、解剖、年龄、服装、文字、一致性、风格漂移`, returning the smallest repair and safe alternative. Wedding portrait replaces bust menus with `体态比例与礼服合身度` and adds documentary, studio, travel and Chinese-style routes. Lookbook adds front/side/back catalog views, fabric and fit, SKU color variants and product consistency. Sports venue adds sport type, venue, team-color palette, pre/during/post-event story and no-real-logo rules.

- [ ] **Step 4: Run tests**

Run: `Invoke-Pester tests/priority-skills.Tests.ps1 -Output Detailed`

Expected: two passing tests.

- [ ] **Step 5: Commit**

```powershell
git add skills/image2-risk-debugger skills/image2-wedding-portrait skills/image2-fashion-lingerie-lookbook skills/image2-sports-venue-portrait tests/priority-skills.Tests.ps1
git rm -r skills/image2-court-babe-portrait
git commit -m "feat: upgrade priority Image2 specialty skills"
```

### Task 5: Migrate the remaining specialties

**Files:**
- Modify: `skills/image2-adult-glamour-studio/SKILL.md`
- Modify: `skills/image2-aesthetic-rewriter/SKILL.md`
- Modify: `skills/image2-character-poster-cover/SKILL.md`
- Modify: `skills/image2-character-reference-sheet/SKILL.md`
- Create: `tests/remaining-skills.Tests.ps1`

**Interfaces:**
- Consumes: Task 2 contracts and Route IDs.
- Produces: four skills with shared contract links plus specialty behaviour.

- [ ] **Step 1: Write the failing test**

```powershell
Describe 'remaining skill migrations' {
  $root = Resolve-Path "$PSScriptRoot/.."
  $skills = @('image2-adult-glamour-studio','image2-aesthetic-rewriter','image2-character-poster-cover','image2-character-reference-sheet')
  It 'links each migrated skill to schema and output contract' {
    foreach ($name in $skills) {
      $text = Get-Content -Raw -Encoding utf8 "$root/skills/$name/SKILL.md"
      $text | Should -Match '../_shared/core/parameter-schema.md'
      $text | Should -Match '../_shared/core/output-contract.md'
    }
  }
}
```

- [ ] **Step 2: Verify it fails**

Run: `Invoke-Pester tests/remaining-skills.Tests.ps1 -Output Detailed`

Expected: FAIL because the current skills do not link to the new contracts.

- [ ] **Step 3: Implement the migrations**

Adult glamour selects a single compatible route rather than generic “高级感”. The rewriter classifies risk and offers `保守、平衡、表现力` variants. Poster cover returns a copy-bearing version plus a text-free blank-layout alternative. Character sheet locks identity anchors and adds outfit, expression and prop callouts plus typography fallback.

- [ ] **Step 4: Run tests**

Run: `Invoke-Pester tests/remaining-skills.Tests.ps1 -Output Detailed`

Expected: one passing test.

- [ ] **Step 5: Commit**

```powershell
git add skills/image2-adult-glamour-studio skills/image2-aesthetic-rewriter skills/image2-character-poster-cover skills/image2-character-reference-sheet tests/remaining-skills.Tests.ps1
git commit -m "feat: migrate remaining Image2 specialty skills"
```

### Task 6: Synchronise distributions and document the entry point

**Files:**
- Modify: `README.md`
- Modify or create: platform mirrors under `.agents`, `.claude`, `.codex`, `.cursor`, `.opencode`
- Modify: `tests/validate-skills.Tests.ps1`

**Interfaces:**
- Consumes: Tasks 2–5 canonical files.
- Produces: mirrors exactly match canonical skills; README lists director and sports-venue name.

- [ ] **Step 1: Extend the failing mirror test**

```powershell
It 'finds the new director in every mirror' {
  $root = Resolve-Path "$PSScriptRoot/.."
  & "$root/tools/validate-skills.ps1" -Root $root
  $LASTEXITCODE | Should -Be 0
}
```

- [ ] **Step 2: Verify it fails**

Run: `Invoke-Pester tests/validate-skills.Tests.ps1 -Output Detailed`

Expected: FAIL with `Missing mirror` for `image2-portrait-director`.

- [ ] **Step 3: Synchronise and document**

Copy every changed canonical `SKILL.md`, `agents/openai.yaml`, `_shared/core` and `_shared/routes` file into the existing conventions `.agents/skills`, `.claude/skills`, `.codex/skills`, `.cursor`, and `.opencode/skills`. Update README skill list, examples and all `court-babe` names to `sports-venue`.

- [ ] **Step 4: Run final verification**

Run: `Invoke-Pester tests -Output Detailed; ./tools/validate-skills.ps1 -Root .; git diff --check`

Expected: all Pester tests pass, validator exits `0`, and `git diff --check` has no output.

- [ ] **Step 5: Commit**

```powershell
git add README.md .agents .claude .codex .cursor .opencode tests/validate-skills.Tests.ps1
git commit -m "docs: publish director and synced skill mirrors"
```

## Follow-on Plans

The independent content packs stay separate from this foundation plan: (1) `image2-ancient-costume-editorial` plus `image2-cinematic-story-portrait`; (2) `image2-travel-lifestyle-portrait` plus `image2-ecommerce-fashion-catalog`; (3) demand-driven `image2-professional-headshot-branding` and `image2-motherhood-family-portrait`. Each follow-on plan must use Task 1 validation and Task 6 distribution rules.


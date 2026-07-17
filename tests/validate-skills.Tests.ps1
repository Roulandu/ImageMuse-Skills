Describe 'validate-skills' {
  It 'accepts the repository canonical skills and mirrors' {
    & "$PSScriptRoot/../tools/validate-skills.ps1" -Root "$PSScriptRoot/.."
    $LASTEXITCODE | Should -Be 0
  }

  It 'finds the new director in every mirror' {
    $root = Resolve-Path "$PSScriptRoot/.."
    & "$root/tools/validate-skills.ps1" -Root $root
    $LASTEXITCODE | Should -Be 0
  }

  It 'uses sports-venue terminology in public skill files' {
    $root = Resolve-Path "$PSScriptRoot/.."
    $skillFiles = @(
      "$root/skills/image2-sports-venue-portrait/SKILL.md",
      "$root/.agents/skills/image2-sports-venue-portrait/SKILL.md",
      "$root/.claude/skills/image2-sports-venue-portrait/SKILL.md",
      "$root/.codex/skills/image2-sports-venue-portrait/SKILL.md",
      "$root/.cursor/image2-sports-venue-portrait/SKILL.md",
      "$root/.opencode/skills/image2-sports-venue-portrait/SKILL.md"
    )

    foreach ($skillFile in $skillFiles) {
      Get-Content -Raw $skillFile | Should -Not -Match '(?i)court-babe|court babe'
    }
  }

  It 'reports a missing mirror' {
    $root = Join-Path $TestDrive 'repo'
    New-Item -ItemType Directory -Force "$root/skills/demo" | Out-Null
    Set-Content "$root/skills/demo/SKILL.md" "---`nname: demo`ndescription: demo`n---`n# Demo"
    { & "$PSScriptRoot/../tools/validate-skills.ps1" -Root $root } | Should -Throw '*Missing mirror:*demo*'
  }

  It 'reports a byte-different mirror' {
    $root = Join-Path $TestDrive 'repo'
    $source = "$root/skills/demo/SKILL.md"
    New-Item -ItemType Directory -Force (Split-Path $source) | Out-Null
    Set-Content $source "---`nname: demo`ndescription: demo`n---`n# Demo"
    $bytes = [System.IO.File]::ReadAllBytes($source)

    foreach ($mirror in @('.agents/skills', '.claude/skills', '.codex/skills', '.cursor', '.opencode/skills')) {
      $target = "$root/$mirror/demo/SKILL.md"
      New-Item -ItemType Directory -Force (Split-Path $target) | Out-Null
      [System.IO.File]::WriteAllBytes($target, $bytes)
    }

    [System.IO.File]::WriteAllBytes("$root/.agents/skills/demo/SKILL.md", [byte[]](0xEF, 0xBB, 0xBF) + $bytes)
    { & "$PSScriptRoot/../tools/validate-skills.ps1" -Root $root } | Should -Throw '*Mirror differs:*.agents/skills/demo*'
  }
}

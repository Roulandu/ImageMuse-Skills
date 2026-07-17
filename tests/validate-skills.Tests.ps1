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

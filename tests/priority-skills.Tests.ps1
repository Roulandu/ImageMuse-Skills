Describe 'priority skill upgrades' {
  It 'links each skill to output and quality contracts' {
    $root = Resolve-Path "$PSScriptRoot/.."
    $skills = @('image2-risk-debugger','image2-wedding-portrait','image2-fashion-lingerie-lookbook','image2-sports-venue-portrait')
    foreach ($name in $skills) {
      $text = Get-Content -Raw -Encoding utf8 "$root/skills/$name/SKILL.md"
      $text | Should -Match '../_shared/core/output-contract.md'
      $text | Should -Match '../_shared/core/quality-gates.md'
    }
  }
  It 'removes the old court-babe directory' {
    $root = Resolve-Path "$PSScriptRoot/.."
    Test-Path "$root/skills/image2-court-babe-portrait" | Should -BeFalse
  }
}

Describe 'remaining skill migrations' {
  $skills = @('image2-adult-glamour-studio','image2-aesthetic-rewriter','image2-character-poster-cover','image2-character-reference-sheet')

  It 'links each migrated skill to schema and output contract' {
    $workspace = Resolve-Path (Join-Path $PSScriptRoot '..')
    $skills = @('image2-adult-glamour-studio','image2-aesthetic-rewriter','image2-character-poster-cover','image2-character-reference-sheet')
    foreach ($name in $skills) {
      $text = Get-Content -Raw -Encoding utf8 "$workspace/skills/$name/SKILL.md"
      $text | Should -Match ([regex]::Escape('../_shared/core/parameter-schema.md'))
      $text | Should -Match ([regex]::Escape('../_shared/core/output-contract.md'))
    }
  }

  It 'gives each specialty its required route-specific behavior' {
    $workspace = Resolve-Path (Join-Path $PSScriptRoot '..')
    $adult = Get-Content -Raw -Encoding utf8 "$workspace/skills/image2-adult-glamour-studio/SKILL.md"
    $rewriter = Get-Content -Raw -Encoding utf8 "$workspace/skills/image2-aesthetic-rewriter/SKILL.md"
    $poster = Get-Content -Raw -Encoding utf8 "$workspace/skills/image2-character-poster-cover/SKILL.md"
    $sheet = Get-Content -Raw -Encoding utf8 "$workspace/skills/image2-character-reference-sheet/SKILL.md"

    $adult | Should -Match 'single compatible route'
    $rewriter | Should -Match '\u4FDD\u5B88'
    $rewriter | Should -Match '\u5E73\u8861'
    $rewriter | Should -Match '\u8868\u73B0\u529B'
    $poster | Should -Match 'text-free blank-layout'
    $sheet | Should -Match 'identity anchors'
    $sheet | Should -Match 'typography fallback'
  }
}

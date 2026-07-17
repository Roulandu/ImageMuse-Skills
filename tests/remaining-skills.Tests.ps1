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

  It 'uses the shared complete-mode heading order without legacy output formats' {
    $workspace = Resolve-Path (Join-Path $PSScriptRoot '..')
    $skills = @('image2-adult-glamour-studio','image2-aesthetic-rewriter','image2-character-poster-cover','image2-character-reference-sheet')
    $headings = '(?s)\*\*\u610F\u56FE\u6458\u8981\*\*.*?\*\*\u5DF2\u9501\u5B9A\u53C2\u6570\*\*.*?\*\*\u5BFC\u6F14\u6269\u5C55\*\*.*?\*\*\u6700\u7EC8\u4E2D\u6587\u63D0\u793A\u8BCD\*\*.*?\*\*\u8D1F\u9762\u9650\u5236\u8BCD\*\*.*?\*\*\u53EF\u9009\u53D8\u5316\u53C2\u6570\*\*'

    foreach ($name in $skills) {
      $text = Get-Content -Raw -Encoding utf8 "$workspace/skills/$name/SKILL.md"
      $text | Should -Match $headings
      $text | Should -Not -Match '## Output Format'
    }
  }
}

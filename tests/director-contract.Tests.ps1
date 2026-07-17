Describe 'image2 portrait director' {
  It 'loads governance before selecting a route' {
    $root = Resolve-Path "$PSScriptRoot/.."; $skill = "$root/skills/image2-portrait-director/SKILL.md"
    $text = Get-Content -Raw -Encoding utf8 $skill
    $text | Should -Match '../_shared/core/parameter-schema.md'
    $text | Should -Match '../_shared/routes/route-registry.md'
  }
  It 'enforces one route and explicit image generation' {
    $root = Resolve-Path "$PSScriptRoot/.."; $skill = "$root/skills/image2-portrait-director/SKILL.md"
    $text = Get-Content -Raw -Encoding utf8 $skill
    $text | Should -Match 'one primary Route'
    $directImagePhrase = ([char]30452).ToString() + ([char]25509).ToString() + ([char]20986).ToString() + ([char]22270).ToString()
    $text | Should -Match $directImagePhrase
  }
}

Describe 'shared prompt contracts' {
  It 'defines all required core documents' {
    $repositoryRoot = [System.IO.Path]::GetFullPath((Join-Path $PSScriptRoot '..'))
    'parameter-schema.md','output-contract.md','conflict-resolution.md','quality-gates.md','reference-image-policy.md' |
      ForEach-Object { Test-Path "$repositoryRoot/skills/_shared/core/$_" | Should -BeTrue }
  }

  It 'registers director routes and specialty targets' {
    $repositoryRoot = [System.IO.Path]::GetFullPath((Join-Path $PSScriptRoot '..'))
    $registry = Get-Content -Raw -Encoding utf8 "$repositoryRoot/skills/_shared/routes/route-registry.md"
    $registry | Should -Match 'clean-lifestyle'
    $registry | Should -Match 'image2-wedding-portrait'
    $registry | Should -Match 'image2-sports-venue-portrait'
  }
}

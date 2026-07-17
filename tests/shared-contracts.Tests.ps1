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

  It 'defines each canonical parameter field and supplemental-default label' {
    $repositoryRoot = [System.IO.Path]::GetFullPath((Join-Path $PSScriptRoot '..'))
    $schema = Get-Content -Raw -Encoding utf8 "$repositoryRoot/skills/_shared/core/parameter-schema.md"
    'subject','clothing','scene','action','camera','lighting','canvas','purpose','outputMode' |
      ForEach-Object { $schema | Should -Match $_ }
    $supplementalDefault = -join @(0x8865,0x5145,0x9ED8,0x8BA4,0x503C | ForEach-Object { [char]$_ })
    $schema | Should -Match $supplementalDefault
  }

  It 'defines all supported output modes and gates direct image generation' {
    $repositoryRoot = [System.IO.Path]::GetFullPath((Join-Path $PSScriptRoot '..'))
    $schema = Get-Content -Raw -Encoding utf8 "$repositoryRoot/skills/_shared/core/parameter-schema.md"
    $output = Get-Content -Raw -Encoding utf8 "$repositoryRoot/skills/_shared/core/output-contract.md"
    'prompt','direct-image','reference-image' | ForEach-Object { $schema | Should -Match $_ }
    $directImage = -join @(0x76F4,0x63A5,0x51FA,0x56FE | ForEach-Object { [char]$_ })
    $schema | Should -Match $directImage
    $schema | Should -Match 'explicit'
    $output | Should -Match $directImage
  }

  It 'uses the required precedence order' {
    $repositoryRoot = [System.IO.Path]::GetFullPath((Join-Path $PSScriptRoot '..'))
    $conflicts = Get-Content -Raw -Encoding utf8 "$repositoryRoot/skills/_shared/core/conflict-resolution.md"
    $positions = 'user-safe-explicit','specialty-skill','primary-route','overlay','defaults' |
      ForEach-Object { $conflicts.IndexOf($_) }
    $positions | Should -Not -Contain -1
    for ($index = 0; $index -lt $positions.Count - 1; $index++) {
      ($positions[$index] -lt $positions[$index + 1]) | Should -BeTrue
    }
  }

  It 'registers all twelve canonical routes' {
    $repositoryRoot = [System.IO.Path]::GetFullPath((Join-Path $PSScriptRoot '..'))
    $registry = Get-Content -Raw -Encoding utf8 "$repositoryRoot/skills/_shared/routes/route-registry.md"
    'clean-lifestyle','urban-fashion','french-lazy','new-chinese','gufeng-xianxia','retro-hongkong',
    'travel-vacation','low-key-cinematic','studio-retouched','ecommerce-tryon','sporty-active','ultra-close-real-face' |
      ForEach-Object { $registry | Should -Match $_ }
  }

  It 'fixes the detailed output section order' {
    $repositoryRoot = [System.IO.Path]::GetFullPath((Join-Path $PSScriptRoot '..'))
    $output = Get-Content -Raw -Encoding utf8 "$repositoryRoot/skills/_shared/core/output-contract.md"
    $positions = 'intent-summary','locked-parameters','director-expansion','final-chinese-prompt','negative-constraints','variation-knobs' |
      ForEach-Object { $output.IndexOf($_) }
    $positions | Should -Not -Contain -1
    for ($index = 0; $index -lt $positions.Count - 1; $index++) {
      ($positions[$index] -lt $positions[$index + 1]) | Should -BeTrue
    }
  }

  It 'requires reference-image authorisation and role locking' {
    $repositoryRoot = [System.IO.Path]::GetFullPath((Join-Path $PSScriptRoot '..'))
    $policy = Get-Content -Raw -Encoding utf8 "$repositoryRoot/skills/_shared/core/reference-image-policy.md"
    $policy | Should -Match 'authorisation'
    $policy | Should -Match 'role'
    $policy | Should -Match 'lock'
  }
}

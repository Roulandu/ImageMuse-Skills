param([Parameter(Mandatory)] [string]$Root, [switch]$SkipMirrorCheck)

$canonical = Join-Path $Root 'skills'
$mirrors = @('.agents/skills', '.claude/skills', '.codex/skills', '.cursor', '.opencode/skills')

foreach ($skill in Get-ChildItem $canonical -Directory | Where-Object Name -ne '_shared') {
  $name = $skill.Name
  $source = Join-Path $skill.FullName 'SKILL.md'
  if (-not (Test-Path $source)) { throw "Missing canonical SKILL.md: $name" }

  $text = Get-Content -Raw -Encoding utf8 $source
  if ($text -notmatch '(?s)^---\s*\r?\nname:\s*[^\r\n]+\r?\ndescription:\s*[^\r\n]+\r?\n---') { throw "Front matter: $name" }
  $sourceBytes = [System.IO.File]::ReadAllBytes($source)

  if (-not $SkipMirrorCheck) {
    foreach ($mirror in $mirrors) {
      $target = Join-Path $Root "$mirror/$name/SKILL.md"
      if (-not (Test-Path $target)) { throw "Missing mirror: $mirror/$name" }
      $targetBytes = [System.IO.File]::ReadAllBytes($target)
      $sameBytes = $sourceBytes.Length -eq $targetBytes.Length
      if ($sameBytes) {
        for ($index = 0; $index -lt $sourceBytes.Length; $index++) {
          if ($sourceBytes[$index] -ne $targetBytes[$index]) {
            $sameBytes = $false
            break
          }
        }
      }
      if (-not $sameBytes) { throw "Mirror differs: $mirror/$name" }
    }
  }
}

exit 0

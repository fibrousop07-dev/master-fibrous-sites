# Step 2 of 2: installs master-fibrous-sites, then asks about the optional extras.
# Usage: .\install.ps1 [-All]
param([switch]$All)
$ErrorActionPreference = 'Stop'
$Dest = if ($env:CLAUDE_SKILLS_DIR) { $env:CLAUDE_SKILLS_DIR } else { Join-Path $HOME '.claude\skills' }
New-Item -ItemType Directory -Force $Dest | Out-Null

function Ask($q) { if ($All) { return $true }; (Read-Host "$q [y/N]") -match '^[Yy]' }
function Fetch($name, $repo) {
  $tmp = Join-Path ([IO.Path]::GetTempPath()) ([guid]::NewGuid())
  git clone -q --depth 1 "https://github.com/fibrousop07-dev/$repo.git" "$tmp\r"
  if (Test-Path "$tmp\r\skills") { Copy-Item "$tmp\r\skills\*" $Dest -Recurse -Force }
  else { Remove-Item "$tmp\r\.git" -Recurse -Force; Copy-Item "$tmp\r" "$Dest\$name" -Recurse -Force }
  Remove-Item $tmp -Recurse -Force; Write-Host "  installed $name"
}

Copy-Item "$PSScriptRoot\skills\master-fibrous-sites" $Dest -Recurse -Force
Write-Host "Installed master-fibrous-sites into $Dest"

if (Ask 'Also install awesome-frontend-skills (GSAP, design polish, accessibility, router)?') { Fetch 'awesome-frontend-skills' 'awesome-frontend-skills' }
if (Ask 'Also install site-glow-up-skills (the post-build polish pass)?') { Fetch 'site-glow-up' 'site-glow-up-skills' }
Write-Host 'Done. Restart Claude Code, then run /master-fibrous-sites'

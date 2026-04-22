$ErrorActionPreference = "Stop"

$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$PackageRoot = $ScriptDir
$PayloadDir = Join-Path $PackageRoot "skills"
$VersionFile = Join-Path $PackageRoot "VERSION"
$Skills = @("deep-research", "academic-paper", "academic-paper-reviewer", "academic-pipeline")

if ($env:CODEX_HOME) {
  $CodexHome = $env:CODEX_HOME
} elseif ($env:USERPROFILE) {
  $CodexHome = Join-Path $env:USERPROFILE ".codex"
} else {
  $CodexHome = Join-Path $HOME ".codex"
}

$TargetSkillsDir = Join-Path $CodexHome "skills"
$Timestamp = Get-Date -Format "yyyyMMdd-HHmmss"
$BackupDir = Join-Path $CodexHome "skill_backups\academic-research-skills\$Timestamp"
$InstalledVersionFile = Join-Path $CodexHome "academic-research-skills.version"

Write-Host "==> Codex home: $CodexHome"
Write-Host "==> Target skills dir: $TargetSkillsDir"

New-Item -ItemType Directory -Force -Path $TargetSkillsDir | Out-Null
New-Item -ItemType Directory -Force -Path $BackupDir | Out-Null

foreach ($Skill in $Skills) {
  $SkillMarker = Join-Path $PayloadDir $Skill
  $SkillMarker = Join-Path $SkillMarker "SKILL.md"
  if (-not (Test-Path $SkillMarker)) {
    throw "Missing payload: $SkillMarker"
  }
}

foreach ($Skill in $Skills) {
  $Source = Join-Path $PayloadDir $Skill
  $Target = Join-Path $TargetSkillsDir $Skill
  if (Test-Path $Target) {
    $BackupTarget = Join-Path $BackupDir $Skill
    Write-Host "==> Backing up $Skill"
    Move-Item -Force $Target $BackupTarget
  }
  Write-Host "==> Installing $Skill"
  Copy-Item -Recurse -Force $Source $Target
}

if (Test-Path $VersionFile) {
  Copy-Item -Force $VersionFile $InstalledVersionFile
}

Write-Host ""
Write-Host "Installed skills:"
foreach ($Skill in $Skills) {
  Write-Host "  - $Skill"
}
Write-Host "Backup dir: $BackupDir"
Write-Host "Please restart Codex."

$ErrorActionPreference = "Stop"

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
$BackupDir = Join-Path $CodexHome "skill_backups\academic-research-skills\uninstall-$Timestamp"
$InstalledVersionFile = Join-Path $CodexHome "academic-research-skills.version"

New-Item -ItemType Directory -Force -Path $BackupDir | Out-Null

foreach ($Skill in $Skills) {
  $Target = Join-Path $TargetSkillsDir $Skill
  if (Test-Path $Target) {
    $BackupTarget = Join-Path $BackupDir $Skill
    Write-Host "==> Backing up and removing $Skill"
    Move-Item -Force $Target $BackupTarget
  } else {
    Write-Host "==> Skipping missing $Skill"
  }
}

if (Test-Path $InstalledVersionFile) {
  Remove-Item -Force $InstalledVersionFile
}

Write-Host "Removed managed skills."
Write-Host "Backup dir: $BackupDir"
Write-Host "Please restart Codex."

$ErrorActionPreference = "Stop"
[Console]::InputEncoding = [System.Text.UTF8Encoding]::new($false)
[Console]::OutputEncoding = [System.Text.UTF8Encoding]::new($false)
$OutputEncoding = [System.Text.UTF8Encoding]::new($false)

$repoUrl = "https://github.com/CercaTrovato/wuhan-donghu-thesis-revision.git"
$branch = "main"
$skillName = "wuhan-donghu-thesis-revision"
$target = $env:WDU_THESIS_REVISION_TARGET
if ([string]::IsNullOrWhiteSpace($target)) { $target = "codex" }
$target = $target.ToLowerInvariant()

$rootOverride = $env:WDU_THESIS_REVISION_SKILL_ROOT
if (-not [string]::IsNullOrWhiteSpace($rootOverride)) {
    $skillRoot = $rootOverride
} elseif ($target -eq "claude") {
    $skillRoot = Join-Path $HOME ".claude\skills"
} elseif ($target -eq "codex") {
    $skillRoot = Join-Path $HOME ".agents\skills"
} else {
    throw "Unsupported WDU_THESIS_REVISION_TARGET '$target'. Use 'codex' or 'claude'."
}

if ($null -eq (Get-Command git -ErrorAction SilentlyContinue)) {
    throw "git is required. Install Git first, then rerun this installer."
}

New-Item -ItemType Directory -Force -Path $skillRoot | Out-Null
$dest = Join-Path $skillRoot $skillName

if (Test-Path -LiteralPath (Join-Path $dest ".git")) {
    git -C $dest pull --ff-only origin $branch
} else {
    if (Test-Path -LiteralPath $dest) {
        $stamp = Get-Date -Format "yyyyMMdd_HHmmss"
        $backup = "$dest.backup_$stamp"
        Move-Item -LiteralPath $dest -Destination $backup
        Write-Output "Existing non-Git skill directory moved to: $backup"
    }
    git clone --depth 1 --branch $branch $repoUrl $dest
}

Write-Output "wuhan-donghu-thesis-revision installed for ${target}:"
Write-Output $dest
Write-Output "Restart your agent app so the skill list refreshes."

param(
  [string]$OutputPath = (Join-Path $PSScriptRoot 'officecli-1.0.72-full-reference.md'),
  [switch]$NoBackup
)

$ErrorActionPreference = 'Stop'
[Console]::InputEncoding = [System.Text.UTF8Encoding]::new($false)
[Console]::OutputEncoding = [System.Text.UTF8Encoding]::new($false)
$OutputEncoding = [System.Text.UTF8Encoding]::new($false)
$env:PYTHONUTF8 = '1'
$env:PYTHONIOENCODING = 'utf-8'

function Invoke-OfficeCliText {
  param([string[]]$CommandArgs)

  $previous = $ErrorActionPreference
  $ErrorActionPreference = 'Continue'
  try {
    $output = & officecli @CommandArgs 2>&1 | ForEach-Object { $_.ToString() }
    return ($output -join [Environment]::NewLine).TrimEnd()
  }
  finally {
    $ErrorActionPreference = $previous
  }
}

function Add-Section {
  param(
    [System.Collections.Generic.List[string]]$Lines,
    [string]$Title,
    [string]$Body
  )

  $Lines.Add('')
  $Lines.Add($Title)
  $Lines.Add('')
  $Lines.Add('```text')
  if ($Body) {
    foreach ($line in ($Body -split "`r?`n")) {
      $Lines.Add($line)
    }
  }
  $Lines.Add('```')
}

function Get-FormatElements {
  param([string]$Format)

  $help = Invoke-OfficeCliText @('help', $Format)
  $elements = New-Object System.Collections.Generic.List[string]
  foreach ($line in ($help -split "`r?`n")) {
    $trimmed = $line.Trim()
    if (-not $trimmed) { continue }
    if ($trimmed -like 'Elements for*') { continue }
    if ($trimmed -like 'Run *') { continue }
    if ($trimmed -match '^[A-Za-z0-9][A-Za-z0-9_.-]*$') {
      $elements.Add($trimmed)
    }
  }
  return $elements
}

$version = Invoke-OfficeCliText @('--version')
$generated = [DateTimeOffset]::Now.ToString('yyyy-MM-dd HH:mm:ss zzz')
$lines = [System.Collections.Generic.List[string]]::new()

$lines.Add("# OfficeCLI $version Full Reference")
$lines.Add('')
$lines.Add("Generated: $generated")
$lines.Add('')
$lines.Add('This file is generated from the installed officecli binary. Regenerate it after upgrading OfficeCLI.')
$lines.Add('')
$lines.Add('Regenerate command from this directory:')
$lines.Add('')
$lines.Add('```powershell')
$lines.Add('.\generate-officecli-reference.ps1')
$lines.Add('```')

Add-Section $lines '## Global Help' (Invoke-OfficeCliText @('help'))

$commands = @(
  'open',
  'close',
  'watch',
  'unwatch',
  'mark',
  'unmark',
  'get-marks',
  'goto',
  'view',
  'get',
  'query',
  'set',
  'add',
  'remove',
  'move',
  'swap',
  'raw',
  'raw-set',
  'add-part',
  'validate',
  'batch',
  'dump',
  'import',
  'create',
  'new',
  'merge',
  'mcp',
  'skills',
  'install',
  'help'
)

foreach ($command in $commands) {
  Add-Section $lines "## Command: $command" (Invoke-OfficeCliText @('help', $command))
}

foreach ($format in @('docx', 'xlsx', 'pptx')) {
  $formatHelp = Invoke-OfficeCliText @('help', $format)
  Add-Section $lines "## Format: $format Elements" $formatHelp

  foreach ($element in (Get-FormatElements $format)) {
    Add-Section $lines "## $format Element: $element" (Invoke-OfficeCliText @('help', $format, $element))
  }
}

$allHelp = Invoke-OfficeCliText @('help', 'all')
Add-Section $lines '## Flat Schema Dump: help all' $allHelp

if ((Test-Path -LiteralPath $OutputPath) -and -not $NoBackup) {
  $backupPath = "$OutputPath.bak-$($version)-$(Get-Date -Format 'yyyyMMdd-HHmmss')"
  Copy-Item -LiteralPath $OutputPath -Destination $backupPath
  Write-Host "Backup: $backupPath"
}

$parent = Split-Path -Parent $OutputPath
if ($parent -and -not (Test-Path -LiteralPath $parent)) {
  New-Item -ItemType Directory -Path $parent | Out-Null
}

Set-Content -LiteralPath $OutputPath -Value $lines -Encoding utf8
Write-Host "Wrote: $OutputPath"

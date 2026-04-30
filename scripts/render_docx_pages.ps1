param(
    [Parameter(Mandatory=$true)][string]$DocxPath,
    [Parameter(Mandatory=$true)][string]$OutputDir,
    [int]$FromPage = 1,
    [int]$ToPage = 1,
    [int]$Resolution = 160
)

$ErrorActionPreference = "Stop"
[Console]::InputEncoding = [System.Text.UTF8Encoding]::new($false)
[Console]::OutputEncoding = [System.Text.UTF8Encoding]::new($false)
$OutputEncoding = [System.Text.UTF8Encoding]::new($false)

$doc = (Resolve-Path -LiteralPath $DocxPath).Path
New-Item -ItemType Directory -Force -Path $OutputDir | Out-Null
$out = (Resolve-Path -LiteralPath $OutputDir).Path
$pdf = Join-Path $out "word_export.pdf"
$log = Join-Path $out "render_docx_pages.log"
if (Test-Path -LiteralPath $pdf) { Remove-Item -LiteralPath $pdf -Force }
"START $(Get-Date -Format o)" | Set-Content -LiteralPath $log -Encoding utf8
"DOCX=$doc" | Add-Content -LiteralPath $log -Encoding utf8

$word = $null
$docObj = $null
$wdDoNotSaveChanges = 0
try {
    $word = New-Object -ComObject Word.Application
    $word.Visible = $false
    $word.DisplayAlerts = 0
    "WORD_CREATED" | Add-Content -LiteralPath $log -Encoding utf8
    $docObj = $word.Documents.Open($doc, $false, $false)
    "DOC_OPENED" | Add-Content -LiteralPath $log -Encoding utf8
    $docObj.Repaginate()
    $pageCount = $docObj.ComputeStatistics(2)
    "PAGE_COUNT=$pageCount" | Add-Content -LiteralPath $log -Encoding utf8
    $docObj.ExportAsFixedFormat($pdf, 17)
    "PDF_EXPORTED=$pdf" | Add-Content -LiteralPath $log -Encoding utf8
}
finally {
    if ($docObj -ne $null) {
        try { $docObj.Close([ref]$wdDoNotSaveChanges) } catch {}
        try { [System.Runtime.InteropServices.Marshal]::ReleaseComObject($docObj) | Out-Null } catch {}
    }
    if ($word -ne $null) {
        try { $word.Quit() } catch {}
        try { [System.Runtime.InteropServices.Marshal]::ReleaseComObject($word) | Out-Null } catch {}
    }
}

$pageDir = Join-Path $out ("pages_{0}_{1}" -f $FromPage, $ToPage)
New-Item -ItemType Directory -Force -Path $pageDir | Out-Null
Get-ChildItem -LiteralPath $pageDir -Filter "*.png" -ErrorAction SilentlyContinue | Remove-Item -Force

$pdftoppm = Get-Command pdftoppm -ErrorAction SilentlyContinue
if ($null -eq $pdftoppm) {
    Write-Output "WORD_PDF_EXPORT=PASS"
    Write-Output "PDF=$pdf"
    Write-Output "PDFTOPPM=NOT_FOUND"
    exit 0
}

& $pdftoppm.Source -f $FromPage -l $ToPage -r $Resolution -png $pdf (Join-Path $pageDir "page")
"PAGES_RENDERED=$pageDir" | Add-Content -LiteralPath $log -Encoding utf8
Write-Output "WORD_PDF_EXPORT=PASS"
Write-Output "PDF=$pdf"
Write-Output "PAGE_COUNT=$pageCount"
Write-Output "PAGE_DIR=$pageDir"
Write-Output "LOG=$log"

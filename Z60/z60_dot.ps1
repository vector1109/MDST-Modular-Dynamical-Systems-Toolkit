# MDST - GraphViz Export for Z60

function Invoke-PowerMap {
    param(
        [int]$x,
        [int]$k,
        [int]$n
    )

    return [int]([math]::Pow($x, $k) % $n)
}

$n = 60
$k = 2

$Dot = @()

$Dot += "digraph Z60 {"
$Dot += ""
$Dot += "    rankdir=LR;"
$Dot += "    node [shape=circle];"
$Dot += ""

for ($x = 0; $x -lt $n; $x++) {

    $y = Invoke-PowerMap $x $k $n

    $Dot += "    $x -> $y;"
}

$Dot += ""
$Dot += "}"

# ---------------------------------------------
# Export
# ---------------------------------------------

$ExportPath = "$PSScriptRoot\z60.dot"

$Dot | Out-File $ExportPath

Write-Host ""
Write-Host "DOT graph exported:" -ForegroundColor Cyan
Write-Host $ExportPath
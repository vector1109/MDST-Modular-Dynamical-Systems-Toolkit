# MDST - Functional Graph Generator for Z60

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

Write-Host ""
Write-Host "MDST - Functional Graph Edges" -ForegroundColor Cyan
Write-Host "--------------------------------" -ForegroundColor DarkCyan

$Edges = @()

for ($x = 0; $x -lt $n; $x++) {

    $y = Invoke-PowerMap $x $k $n

    $edge = "$x -> $y"

    $Edges += $edge

    Write-Host $edge
}

# ---------------------------------------------
# Export Graph
# ---------------------------------------------

$ExportPath = "$PSScriptRoot\z60_graph.txt"

$Edges | Out-File $ExportPath

Write-Host ""
Write-Host "Graph exported to:" -ForegroundColor Yellow
Write-Host $ExportPath
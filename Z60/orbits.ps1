# MDST - Orbit Analysis for Z60

function Invoke-PowerMap {
    param(
        [int]$x,
        [int]$k,
        [int]$n
    )

    return [int]([math]::Pow($x, $k) % $n)
}

# ---------------------------------------------
# Orbit Generator
# ---------------------------------------------

function Get-Orbit {
    param(
        [int]$x,
        [int]$k,
        [int]$n
    )

    $Visited = @{}
    $Orbit = @()

    $current = $x

    while (-not $Visited.ContainsKey($current)) {

        $Visited[$current] = $true
        $Orbit += $current

        $current = Invoke-PowerMap $current $k $n
    }

    $Orbit += $current

    return $Orbit
}

# ---------------------------------------------
# Demo
# ---------------------------------------------

$n = 60
$k = 2

Write-Host ""
Write-Host "MDST - Orbit Analysis for Z60" -ForegroundColor Cyan
Write-Host "----------------------------------" -ForegroundColor DarkCyan

for ($x = 0; $x -lt 20; $x++) {

    $orbit = Get-Orbit $x $k $n

    Write-Host ""
    Write-Host ("x = {0}" -f $x) -ForegroundColor Yellow
    Write-Host ($orbit -join " -> ")
}
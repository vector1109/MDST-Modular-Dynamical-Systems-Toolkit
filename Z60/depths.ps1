# MDST - Depth Analysis for Z60

function Invoke-PowerMap {
    param(
        [int]$x,
        [int]$k,
        [int]$n
    )

    return [int]([math]::Pow($x, $k) % $n)
}

# ---------------------------------------------
# Check idempotent
# ---------------------------------------------

function Test-Idempotent {
    param(
        [int]$x,
        [int]$n
    )

    return ((($x * $x) % $n) -eq $x)
}

# ---------------------------------------------
# Compute depth
# ---------------------------------------------

function Get-Depth {
    param(
        [int]$x,
        [int]$k,
        [int]$n
    )

    $depth = 0
    $current = $x

    while (-not (Test-Idempotent $current $n)) {

        $current = Invoke-PowerMap $current $k $n
        $depth++
    }

    return $depth
}

# ---------------------------------------------
# Main
# ---------------------------------------------

$n = 60
$k = 2

$maxDepth = 0

Write-Host ""
Write-Host "MDST - Dynamic Depths for Z60" -ForegroundColor Cyan
Write-Host "-----------------------------------" -ForegroundColor DarkCyan

for ($x = 0; $x -lt $n; $x++) {

    $d = Get-Depth $x $k $n

    if ($d -gt $maxDepth) {
        $maxDepth = $d
    }

    Write-Host ("x = {0,2} -> depth = {1}" -f $x, $d)
}

Write-Host ""
Write-Host ("Maximum depth D(60,2) = {0}" -f $maxDepth) -ForegroundColor Yellow
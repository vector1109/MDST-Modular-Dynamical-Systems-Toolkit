# MDST - CRT Coordinate Visualizer for Z60

function Get-CRTCoordinates {
    param(
        [int]$x,
        [int[]]$Moduli
    )

    $coords = @()

    foreach ($m in $Moduli) {

        $coords += ($x % $m)
    }

    return $coords
}

# ---------------------------------------------
# Configuration
# ---------------------------------------------

$n = 60

$Moduli = @(4,3,5)

Write-Host ""
Write-Host "MDST - CRT Coordinates for Z60" -ForegroundColor Cyan
Write-Host "-----------------------------------" -ForegroundColor DarkCyan

for ($x = 0; $x -lt $n; $x++) {

    $c = Get-CRTCoordinates $x $Moduli

    $coordString = "(" + ($c -join ", ") + ")"

    Write-Host ("x = {0,2} -> {1}" -f $x, $coordString)
}
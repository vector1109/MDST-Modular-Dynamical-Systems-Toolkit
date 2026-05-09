# MDST - Basin Analysis for Z60

. "$PSScriptRoot\..\Core\PowerShell\crt.ps1"

$n = 60

$PrimeFactors = @(2,3,5)
$PrimePowers  = @(4,3,5)

# ---------------------------------------------
# Basin Counter
# ---------------------------------------------

$Basins = @{}

for ($x = 0; $x -lt $n; $x++) {

    $phi = Invoke-PhiClassifier $x $PrimeFactors $PrimePowers

    if ($Basins.ContainsKey($phi)) {
        $Basins[$phi]++
    }
    else {
        $Basins[$phi] = 1
    }
}

# ---------------------------------------------
# Output
# ---------------------------------------------

Write-Host ""
Write-Host "MDST - Basin Cardinalities for Z60" -ForegroundColor Cyan
Write-Host "--------------------------------------" -ForegroundColor DarkCyan

$Basins.Keys | Sort-Object | ForEach-Object {

    Write-Host ("Φ⁻¹({0,2}) -> {1,2} elements" -f $_, $Basins[$_])
}
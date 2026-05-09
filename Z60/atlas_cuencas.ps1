# MDST - Atlas of Basins Φ for Z60

function Phi {
    param([int]$x)

    # Z60 structure: 4,3,5 decomposition

    $a = $x % 4
    $b = $x % 3
    $c = $x % 5

    if ($a -eq 0) { $p1 = 0 } else { $p1 = 1 }
    if ($b -eq 0) { $p2 = 0 } else { $p2 = 1 }
    if ($c -eq 0) { $p3 = 0 } else { $p3 = 1 }

    # CRT reconstruction of idempotent
    # Known Z60 idempotent mapping (precomputed structure)
    $map = @{
        "000" = 0
        "001" = 1
        "010" = 36
        "011" = 21
        "100" = 16
        "101" = 25
        "110" = 40
        "111" = 45
    }

    return $map["$p1$p2$p3"]
}

# -----------------------------------------
# BUILD ATLAS
# -----------------------------------------

$basins = @{}

for ($x = 0; $x -lt 60; $x++) {

    $phi = Phi $x

    if (-not $basins.ContainsKey($phi)) {
        $basins[$phi] = @()
    }

    $basins[$phi] += $x
}

# -----------------------------------------
# OUTPUT ATLAS
# -----------------------------------------

Write-Host ""
Write-Host "MDST - Atlas of Basins Φ⁻¹ for Z60" -ForegroundColor Cyan
Write-Host "--------------------------------------"

foreach ($key in ($basins.Keys | Sort-Object)) {

    $elements = $basins[$key]

    Write-Host ""
    Write-Host ("Φ⁻¹({0}) -> {1} elements" -f $key, $elements.Count) -ForegroundColor Yellow
    Write-Host ("  " + ($elements -join ", "))
}
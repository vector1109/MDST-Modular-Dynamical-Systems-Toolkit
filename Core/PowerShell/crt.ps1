# MDST - CRT Core Module
# Initial foundational implementation

# -------------------------------------------------
# Extended Euclidean Algorithm
# -------------------------------------------------

function Get-GCD {
    param(
        [int]$a,
        [int]$b
    )

    while ($b -ne 0) {
        $temp = $b
        $b = $a % $b
        $a = $temp
    }

    return [math]::Abs($a)
}

# -------------------------------------------------
# Modular Inverse
# -------------------------------------------------

function Get-ModInverse {
    param(
        [int]$a,
        [int]$m
    )

    $m0 = $m
    $x0 = 0
    $x1 = 1

    if ($m -eq 1) {
        return 0
    }

    while ($a -gt 1) {

        $q = [math]::Floor($a / $m)

        $t = $m
        $m = $a % $m
        $a = $t

        $t = $x0
        $x0 = $x1 - $q * $x0
        $x1 = $t
    }

    if ($x1 -lt 0) {
        $x1 += $m0
    }

    return $x1
}

# -------------------------------------------------
# CRT Reconstruction
# -------------------------------------------------

function Invoke-CRT {
    param(
        [int[]]$Residues,
        [int[]]$Moduli
    )

    $N = 1

    foreach ($m in $Moduli) {
        $N *= $m
    }

    $x = 0

    for ($i = 0; $i -lt $Moduli.Length; $i++) {

        $ni = $Moduli[$i]
        $ai = $Residues[$i]

        $Mi = [int]($N / $ni)

        $yi = Get-ModInverse $Mi $ni

        $x += $ai * $Mi * $yi
    }

    return ($x % $N)
}

# -------------------------------------------------
# Idempotent Classifier Φ
# -------------------------------------------------

function Invoke-PhiClassifier {
    param(
        [int]$x,
        [int[]]$PrimeFactors,
        [int[]]$PrimePowers
    )

    $eps = @()

    for ($i = 0; $i -lt $PrimeFactors.Length; $i++) {

        $p = $PrimeFactors[$i]

        if (($x % $p) -eq 0) {
            $eps += 0
        }
        else {
            $eps += 1
        }
    }

    return Invoke-CRT $eps $PrimePowers
}

# -------------------------------------------------
# Example
# -------------------------------------------------

$n = 60

$PrimeFactors = @(2,3,5)
$PrimePowers  = @(4,3,5)

Write-Host ""
Write-Host "MDST - Φ Classifier Demo" -ForegroundColor Cyan
Write-Host "--------------------------------" -ForegroundColor DarkCyan

for ($x = 0; $x -lt $n; $x++) {

    $phi = Invoke-PhiClassifier $x $PrimeFactors $PrimePowers

    Write-Host ("x = {0,2} -> Φ(x) = {1,2}" -f $x, $phi)
}
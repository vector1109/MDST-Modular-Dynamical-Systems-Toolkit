$ErrorActionPreference = "Stop"

# MDST - CRT Dynamical Evolution (Z60)
# Arquitectura de Tipos Reforzada

function CRT-Step {
    param(
        [int[]]$state,
        [int]$k,
        [int[]]$moduli
    )

    $new = @()

    for ($i = 0; $i -lt $state.Length; $i++) {
        # Conversión a double para precisión en cálculo de potencia
        $val = [math]::Pow([double]$state[$i], [double]$k)
        $new += [int]($val % $moduli[$i])
    }

    # El operador ',' evita el 'flattening' de PowerShell 
    # y entrega el array real al llamador.
    return ,$new
}

function Show-State {
    param([int[]]$s)
    return "(" + ($s -join ", ") + ")"
}

# -----------------------------------------
# CONFIG - CRT Decomposition (4 * 3 * 5 = 60)
# -----------------------------------------
$moduli = [int[]]@(4, 3, 5)
$k = 2

Write-Host ""
Write-Host "MDST - CRT Dynamical Evolution (Z60)" -ForegroundColor Cyan
Write-Host "Status: Type-Safe & Error-Controlled" -ForegroundColor Gray
Write-Host "--------------------------------------"

# -----------------------------------------
# TEST INITIAL STATES
# -----------------------------------------
for ($x = 0; $x -lt 60; $x += 7) {

    # Versión Tipada: Aseguramos la integridad del estado inicial
    $state = [int[]]@(
        [int]($x % 4),
        [int]($x % 3),
        [int]($x % 5)
    )

    Write-Host ""
    Write-Host ("Input x = {0,2}" -f $x) -ForegroundColor Yellow

    $current = $state

    for ($t = 0; $t -lt 5; $t++) {
        try {
            $out = CRT-Step $current $k $moduli
            
            Write-Host ("  t={0}: {1} -> {2}" -f $t, (Show-State $current), (Show-State $out))
            
            # Verificación de Punto Fijo (Fixed Point)
            if (($current -join ',') -eq ($out -join ',')) {
                Write-Host "      [Steady State Reached]" -ForegroundColor Gray
                break
            }

            $current = $out
        }
        catch {
            Write-Host "[ERROR] Fallo en evolución en t=$t : $($_.Exception.Message)" -ForegroundColor Red
            break
        }
    }
}

Write-Host ""
Write-Host "[SYSTEM STATUS] Evolution Complete" -ForegroundColor Green
[CmdletBinding(SupportsShouldProcess)]
param(
    [string]$Destino = (Join-Path $HOME '.agents/skills'),
    [switch]$UsarPluginSuperpowers
)

$ErrorActionPreference = 'Stop'
$catalogo = Get-Content -Raw -Encoding UTF8 -LiteralPath (Join-Path $PSScriptRoot 'catalogo.json') | ConvertFrom-Json
$origem = Join-Path $PSScriptRoot 'skills'
$Destino = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($Destino)
$instaladas = 0
$existentes = 0
$omitidas = 0

foreach ($item in $catalogo.skills) {
    $nome = $item.nome
    if ($nome -notmatch '^[a-z0-9]+(?:-[a-z0-9]+)*$') { throw "Nome invalido no catalogo: $nome" }
    $pasta = Join-Path $origem $nome
    if (-not (Test-Path -LiteralPath (Join-Path $pasta 'SKILL.md') -PathType Leaf)) {
        throw "Skill incompleta no pacote: $nome"
    }
}

foreach ($item in $catalogo.skills) {
    $nome = $item.nome
    if ($UsarPluginSuperpowers -and $catalogo.superpowers -contains $nome) {
        $omitidas++
        continue
    }
    $pasta = Join-Path $origem $nome
    $alvo = Join-Path $Destino $nome
    if (Test-Path -LiteralPath $alvo) {
        Write-Verbose "Ja existe: $nome"
        $existentes++
        continue
    }
    if ($PSCmdlet.ShouldProcess($alvo, "Instalar $nome")) {
        if (-not (Test-Path -LiteralPath $Destino -PathType Container)) {
            [void][IO.Directory]::CreateDirectory($Destino)
        }
        Copy-Item -LiteralPath $pasta -Destination $alvo -Recurse -Force
        $instaladas++
    }
}

Write-Host "Destino: $Destino"
Write-Host "Instaladas: $instaladas | Preservadas: $existentes | Omitidas (plugin): $omitidas"


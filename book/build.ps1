$ErrorActionPreference = 'Stop'

function Find-LuaLaTeX {
    $command = Get-Command lualatex -ErrorAction SilentlyContinue
    if ($command) {
        return $command.Source
    }

    $texLiveRoot = 'C:\texlive'
    if (Test-Path -LiteralPath $texLiveRoot) {
        $candidate = Get-ChildItem -LiteralPath $texLiveRoot -Directory |
            Sort-Object Name -Descending |
            ForEach-Object { Join-Path $_.FullName 'bin\windows\lualatex.exe' } |
            Where-Object { Test-Path -LiteralPath $_ } |
            Select-Object -First 1
        if ($candidate) {
            return $candidate
        }
    }

    throw 'lualatex was not found in PATH or under C:\texlive.'
}

$engine = Find-LuaLaTeX

& (Join-Path $PSScriptRoot 'check-project.ps1')

$repositoryRoot = Split-Path $PSScriptRoot -Parent
$taskId = 'build-main-{0}-{1}' -f (Get-Date -Format 'yyyyMMdd-HHmmss'), $PID
$taskDirectory = Join-Path $repositoryRoot "tmp\tasks\$taskId"
$candidateDirectory = Join-Path $taskDirectory 'publish-pending'
$fontCacheDirectory = Join-Path $taskDirectory 'texmf-var'
New-Item -ItemType Directory -Force -Path $candidateDirectory | Out-Null
New-Item -ItemType Directory -Force -Path $fontCacheDirectory | Out-Null
$previousTexmfVar = [Environment]::GetEnvironmentVariable('TEXMFVAR', 'Process')
$previousTexmfCache = [Environment]::GetEnvironmentVariable('TEXMFCACHE', 'Process')
$env:TEXMFVAR = $fontCacheDirectory
$env:TEXMFCACHE = $fontCacheDirectory
$retainTaskDirectory = $false

Push-Location -LiteralPath $PSScriptRoot
try {
    1..2 | ForEach-Object {
        & $engine -interaction=nonstopmode -halt-on-error main.tex
        if ($LASTEXITCODE -ne 0) {
            throw "LuaLaTeX compilation failed on pass $_."
        }
    }

    $candidatePath = Join-Path $candidateDirectory '从高等数学到数学分析-第一卷第一至三编及附录A至G.pdf'
    $builtPdf = Join-Path $PSScriptRoot 'main.pdf'
    if (-not (Test-Path -LiteralPath $builtPdf)) {
        throw 'LuaLaTeX did not produce main.pdf.'
    }
    Copy-Item -LiteralPath $builtPdf -Destination $candidatePath -Force

    $outputDirectory = Join-Path $repositoryRoot 'output\pdf'
    New-Item -ItemType Directory -Force -Path $outputDirectory | Out-Null
    $releasePath = Join-Path $outputDirectory '从高等数学到数学分析-第一卷第一至三编及附录A至G.pdf'
    try {
        Copy-Item -LiteralPath $candidatePath -Destination $releasePath -Force
    }
    catch {
        $retainTaskDirectory = $true
        throw "发布文件可能正被占用：$releasePath。候选文件保留在 $candidatePath；请关闭占用后重新运行，勿创建带后缀的替代 PDF。"
    }
}
finally {
    if ($null -eq $previousTexmfVar) {
        Remove-Item Env:TEXMFVAR -ErrorAction SilentlyContinue
    }
    else {
        $env:TEXMFVAR = $previousTexmfVar
    }
    if ($null -eq $previousTexmfCache) {
        Remove-Item Env:TEXMFCACHE -ErrorAction SilentlyContinue
    }
    else {
        $env:TEXMFCACHE = $previousTexmfCache
    }
    Pop-Location
    if (-not $retainTaskDirectory -and (Test-Path -LiteralPath $taskDirectory)) {
        Remove-Item -LiteralPath $taskDirectory -Recurse -Force
    }
}

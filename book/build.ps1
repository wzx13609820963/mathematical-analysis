$ErrorActionPreference = 'Stop'

function Find-XeLaTeX {
    $command = Get-Command xelatex -ErrorAction SilentlyContinue
    if ($command) {
        return $command.Source
    }

    $texLiveRoot = 'C:\texlive'
    if (Test-Path -LiteralPath $texLiveRoot) {
        $candidate = Get-ChildItem -LiteralPath $texLiveRoot -Directory |
            Sort-Object Name -Descending |
            ForEach-Object { Join-Path $_.FullName 'bin\windows\xelatex.exe' } |
            Where-Object { Test-Path -LiteralPath $_ } |
            Select-Object -First 1
        if ($candidate) {
            return $candidate
        }
    }

    throw 'xelatex was not found in PATH or under C:\texlive.'
}

$engine = Find-XeLaTeX

Push-Location -LiteralPath $PSScriptRoot
try {
    1..2 | ForEach-Object {
        & $engine -interaction=nonstopmode -halt-on-error main.tex
        if ($LASTEXITCODE -ne 0) {
            throw "XeLaTeX compilation failed on pass $_."
        }
    }

    $outputDirectory = Join-Path (Split-Path $PSScriptRoot -Parent) 'output\pdf'
    New-Item -ItemType Directory -Force -Path $outputDirectory | Out-Null
    Copy-Item -LiteralPath (Join-Path $PSScriptRoot 'main.pdf') `
        -Destination (Join-Path $outputDirectory '从高等数学到数学分析-第一卷第一编-第0章.pdf') -Force
}
finally {
    Pop-Location
}

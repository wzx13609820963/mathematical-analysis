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
$xdvipdfmx = Join-Path (Split-Path $engine -Parent) 'xdvipdfmx.exe'
if (-not (Test-Path -LiteralPath $xdvipdfmx)) {
    throw 'xdvipdfmx was not found beside xelatex.'
}

& (Join-Path $PSScriptRoot 'check-project.ps1')

$mainAux = Join-Path $PSScriptRoot 'main.aux'
if (-not (Test-Path -LiteralPath $mainAux)) {
    throw 'main.aux 不存在。解答册通过正文标签取得题号，请先运行 book/build.ps1。'
}

$repositoryRoot = Split-Path $PSScriptRoot -Parent
$taskId = 'build-solutions-{0}-{1}' -f (Get-Date -Format 'yyyyMMdd-HHmmss'), $PID
$taskDirectory = Join-Path $repositoryRoot "tmp\tasks\$taskId"
$candidateDirectory = Join-Path $taskDirectory 'publish-pending'
New-Item -ItemType Directory -Force -Path $candidateDirectory | Out-Null
$xdvPath = Join-Path $PSScriptRoot 'solutions.xdv'

Push-Location -LiteralPath $PSScriptRoot
try {
    1..2 | ForEach-Object {
        & $engine -no-pdf -interaction=nonstopmode -halt-on-error solutions.tex
        if ($LASTEXITCODE -ne 0) {
            throw "XeLaTeX compilation failed on pass $_."
        }
    }

    $candidatePath = Join-Path $candidateDirectory '从高等数学到数学分析-习题解答-第一卷第一至三编及附录A至G.pdf'
    $savedErrorPreference = $ErrorActionPreference
    $ErrorActionPreference = 'Continue'
    & $xdvipdfmx -o $candidatePath $xdvPath
    $conversionExitCode = $LASTEXITCODE
    $ErrorActionPreference = $savedErrorPreference
    if ($conversionExitCode -ne 0 -or -not (Test-Path -LiteralPath $candidatePath)) {
        throw 'XDV to PDF conversion failed.'
    }

    $outputDirectory = Join-Path $repositoryRoot 'output\pdf'
    New-Item -ItemType Directory -Force -Path $outputDirectory | Out-Null
    $releasePath = Join-Path $outputDirectory '从高等数学到数学分析-习题解答-第一卷第一至三编及附录A至G.pdf'
    try {
        Copy-Item -LiteralPath $candidatePath -Destination $releasePath -Force
    }
    catch {
        throw "发布文件可能正被占用：$releasePath。候选文件保留在 $candidatePath；请关闭占用后重新运行，勿创建带后缀的替代 PDF。"
    }

    Remove-Item -LiteralPath $taskDirectory -Recurse -Force
}
finally {
    if (Test-Path -LiteralPath $xdvPath) {
        Remove-Item -LiteralPath $xdvPath -Force
    }
    Pop-Location
}

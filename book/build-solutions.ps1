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

$mainAux = Join-Path $PSScriptRoot 'main.aux'
if (-not (Test-Path -LiteralPath $mainAux)) {
    throw 'main.aux 不存在。解答册通过正文标签取得题号，请先运行 book/build.ps1。'
}

$includedAux = [regex]::Matches(
    [System.IO.File]::ReadAllText($mainAux),
    '\\@input\{([^}]+\.aux)\}'
) | ForEach-Object { $_.Groups[1].Value } | Sort-Object -Unique
$missingAux = @(
    $includedAux | Where-Object {
        -not (Test-Path -LiteralPath (Join-Path $PSScriptRoot $_))
    }
)
if ($missingAux.Count -gt 0) {
    throw "main.aux 引用的章节辅助文件不完整（缺少 $($missingAux.Count) 个）。请先运行 book/build.ps1，再构建解答册。"
}

$repositoryRoot = Split-Path $PSScriptRoot -Parent
$taskId = 'build-solutions-{0}-{1}' -f (Get-Date -Format 'yyyyMMdd-HHmmss'), $PID
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
    1..3 | ForEach-Object {
        & $engine -interaction=nonstopmode -halt-on-error solutions.tex
        if ($LASTEXITCODE -ne 0) {
            throw "LuaLaTeX compilation failed on pass $_."
        }
    }

    $candidatePath = Join-Path $candidateDirectory '从高等数学到数学分析-习题解答-第0至110章.pdf'
    $builtPdf = Join-Path $PSScriptRoot 'solutions.pdf'
    if (-not (Test-Path -LiteralPath $builtPdf)) {
        throw 'LuaLaTeX did not produce solutions.pdf.'
    }
    Copy-Item -LiteralPath $builtPdf -Destination $candidatePath -Force

    $outputDirectory = Join-Path $repositoryRoot 'output\pdf'
    New-Item -ItemType Directory -Force -Path $outputDirectory | Out-Null
    $releasePath = Join-Path $outputDirectory '从高等数学到数学分析-习题解答-第0至110章.pdf'
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
        $resolvedTask = [System.IO.Path]::GetFullPath($taskDirectory)
        $allowedTaskRoot = [System.IO.Path]::GetFullPath((Join-Path $repositoryRoot 'tmp\tasks')) + [System.IO.Path]::DirectorySeparatorChar
        if (-not $resolvedTask.StartsWith($allowedTaskRoot, [System.StringComparison]::OrdinalIgnoreCase) -or
            (Split-Path $resolvedTask -Leaf) -ne $taskId) {
            throw "拒绝清理任务目录以外的路径：$resolvedTask"
        }
        Remove-Item -LiteralPath $resolvedTask -Recurse -Force
    }
}

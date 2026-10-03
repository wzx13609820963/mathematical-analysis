$ErrorActionPreference = 'Stop'

$bookRoot = $PSScriptRoot
$repositoryRoot = Split-Path $bookRoot -Parent

$bodyFiles = @(
    Get-ChildItem (Join-Path $bookRoot 'chapters') -Recurse -Filter 'chapter*.tex'
) + @(
    Get-ChildItem (Join-Path $bookRoot 'appendices') -Filter 'appendix*.tex'
)
$solutionFiles = @(Get-ChildItem (Join-Path $bookRoot 'solutions') -Recurse -Filter '*.tex')
$allTexFiles = $bodyFiles + $solutionFiles

$errors = [System.Collections.Generic.List[string]]::new()
$warnings = [System.Collections.Generic.List[string]]::new()

function Add-Matches {
    param(
        [System.IO.FileInfo[]] $Files,
        [string] $Pattern,
        [string] $Message,
        [System.Collections.Generic.List[string]] $Target
    )
    foreach ($file in $Files) {
        $lineNumber = 0
        foreach ($line in [System.IO.File]::ReadLines($file.FullName)) {
            $lineNumber++
            if ($line -match $Pattern) {
                $relative = $file.FullName.Substring($repositoryRoot.Length).TrimStart('\')
                $Target.Add("${Message}: ${relative}:${lineNumber}")
            }
        }
    }
}

$exerciseKeys = [System.Collections.Generic.List[string]]::new()
foreach ($file in $bodyFiles) {
    $text = [System.IO.File]::ReadAllText($file.FullName)
    foreach ($match in [regex]::Matches($text, '\\(?:exerciseitem|optionalexerciseitem|projectexerciseitem|openexerciseitem)\{([^}]+)\}')) {
        $exerciseKeys.Add($match.Groups[1].Value)
    }
    if ($text -notmatch '\\label\{(?:chap|app):[^}]+\}') {
        $relative = $file.FullName.Substring($repositoryRoot.Length).TrimStart('\')
        $errors.Add("Body file has no stable chapter label: $relative")
    }
}

$solutionKeys = [System.Collections.Generic.List[string]]::new()
foreach ($file in $solutionFiles) {
    $text = [System.IO.File]::ReadAllText($file.FullName)
    foreach ($match in [regex]::Matches($text, '\\begin\{solution\}\{([^}]+)\}')) {
        $solutionKeys.Add($match.Groups[1].Value)
    }
}

$duplicateExerciseKeys = $exerciseKeys | Group-Object | Where-Object Count -gt 1
$duplicateSolutionKeys = $solutionKeys | Group-Object | Where-Object Count -gt 1
foreach ($item in $duplicateExerciseKeys) { $errors.Add("Duplicate exercise key: $($item.Name)") }
foreach ($item in $duplicateSolutionKeys) { $errors.Add("Duplicate solution key: $($item.Name)") }

$exerciseOnly = Compare-Object ($exerciseKeys | Sort-Object -Unique) ($solutionKeys | Sort-Object -Unique) |
    Where-Object SideIndicator -eq '<=' | ForEach-Object InputObject
$solutionOnly = Compare-Object ($exerciseKeys | Sort-Object -Unique) ($solutionKeys | Sort-Object -Unique) |
    Where-Object SideIndicator -eq '=>' | ForEach-Object InputObject
foreach ($key in $exerciseOnly) { $errors.Add("Exercise has no solution: $key") }
foreach ($key in $solutionOnly) { $errors.Add("Solution has no exercise: $key") }

Add-Matches $bodyFiles '^\s*\\item\s*(?=\\(?:mustdo|optionaldo|projectdo|opendo))' `
    'Formal exercise does not use \exerciseitem' $errors
Add-Matches $bodyFiles '\\exerciseitem\{[^}]+\}\s*\\(?:mustdo|optionaldo|projectdo|opendo)' `
    'Legacy exercise marker follows the item number' $errors
Add-Matches $allTexFiles '[\x00-\x08\x0B\x0C\x0E-\x1F]' 'ASCII control character in TeX source (possible escaped-command corruption)' $errors
Add-Matches $allTexFiles '\u7B2C\s*\d+(?:\s*(?:--?|[、，,及至与—–])\s*\d+)*\s*\u7AE0' 'Hard-coded chapter number' $errors
Add-Matches $allTexFiles '\u4E60\u9898(?:II|III|[A-G]|\d+)\.\d+' 'Hard-coded exercise reference' $errors

$labels = [System.Collections.Generic.List[string]]::new()
foreach ($file in $bodyFiles) {
    $text = [System.IO.File]::ReadAllText($file.FullName)
    foreach ($match in [regex]::Matches($text, '\\label\{([^}]+)\}')) {
        $labels.Add($match.Groups[1].Value)
    }
}
foreach ($item in ($labels | Group-Object | Where-Object Count -gt 1)) {
    $errors.Add("Duplicate body label: $($item.Name)")
}

# A matching key set does not guarantee that the answer booklet follows the
# exercise order. Keep legacy discrepancies visible without silently reordering.
foreach ($file in $bodyFiles | Where-Object Name -like 'chapter*.tex') {
    $relative = $file.FullName.Substring((Join-Path $bookRoot 'chapters').Length).TrimStart('\')
    $answerRelative = $relative -replace '\.tex$', '-solutions.tex'
    $answerPath = Join-Path (Join-Path $bookRoot 'solutions') $answerRelative
    if (-not (Test-Path -LiteralPath $answerPath)) {
        $errors.Add("Missing chapter solution file: $answerRelative")
        continue
    }
    $bodyText = [System.IO.File]::ReadAllText($file.FullName)
    $answerText = [System.IO.File]::ReadAllText($answerPath)
    $orderedExercises = @([regex]::Matches($bodyText, '\\(?:exerciseitem|optionalexerciseitem|projectexerciseitem|openexerciseitem)\{([^}]+)\}') | ForEach-Object { $_.Groups[1].Value })
    $orderedAnswers = @([regex]::Matches($answerText, '\\begin\{solution\}\{([^}]+)\}') | ForEach-Object { $_.Groups[1].Value })
    if (($orderedExercises -join "`n") -cne ($orderedAnswers -join "`n")) {
        $warnings.Add("Exercise/solution order differs: $relative; inspect before reordering.")
    }
}

$requiredRegisters = 'docs\NOTATION.md', 'docs\TERMINOLOGY.md', 'docs\DEPENDENCIES.md'
foreach ($relative in $requiredRegisters) {
    if (-not (Test-Path -LiteralPath (Join-Path $repositoryRoot $relative))) {
        $errors.Add("Missing authoring register: $relative")
    }
}

Write-Host "Checked $($bodyFiles.Count) body files and $($solutionFiles.Count) solution files."
Write-Host "Exercise labels: $($exerciseKeys.Count); solution entries: $($solutionKeys.Count)."
foreach ($warning in $warnings) { Write-Warning $warning }
if ($errors.Count -gt 0) {
    foreach ($errorMessage in $errors) { Write-Error $errorMessage -ErrorAction Continue }
    throw "Project consistency check failed with $($errors.Count) error(s)."
}
Write-Host 'Project consistency check passed.'

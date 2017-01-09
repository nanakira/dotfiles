# Posh Git prompt setting
$GitPromptSettings.EnableFileStatus = $true
$global:GitPromptSettings.BeforeText = '['
$global:GitPromptSettings.AfterText  = '] '

# Based on poshgit profile.example.ps1
# Set up a simple prompt, adding the git prompt parts inside git repos
function global:prompt {
    $origLASTEXITCODE = $LASTEXITCODE
    Write-VcsStatus

    # Replace $home by ~ if current path includes $home
    $curPath = $ExecutionContext.SessionState.Path.CurrentLocation.Path
    if ($curPath.ToLower().StartsWith($Home.ToLower()))
    {
        $curPath = "~" + $curPath.SubString($Home.Length)
    }

    # Limit path length up to maxPathLength
    $maxPathLength = 40
    $curPath = $ExecutionContext.SessionState.Path.CurrentLocation.Path
    if ($curPath.Length -gt $maxPathLength) {
        $curPath = '...' + $curPath.SubString($curPath.Length - $maxPathLength + 3)
    }

    Write-Host $curPath -ForegroundColor DarkGreen
#    Write-Host(Split-Path (Get-Location) -Leaf) -nonewline # only current directory
    $global:LASTEXITCODE = $origLASTEXITCODE

    if ($?) {
        Write-Host " (*'-')"  -NoNewLine -ForegroundColor "DarkGreen"
    } else {
        Write-Host " (*;-;)"  -NoNewLine -ForegroundColor "Red"
    }
    return "> "
}


Rename-Item Function:\Prompt PoshGitPrompt -Force
function Prompt() {
    if(Test-Path Function:\PrePoshGitPrompt){
        ++$global:poshScope;
        New-Item function:\script:Write-host -value "param([object] `$object, `$backgroundColor, `$foregroundColor, [switch] `$nonewline) " -Force | Out-Null;
        $private:p = PrePoshGitPrompt;
        if(--$global:poshScope -eq 0) {
            Remove-Item function:\Write-Host -Force
        }
    }
    PoshGitPrompt
}


Write-Host "prompt.ps1 Loaded" -ForegroundColor DarkCyan

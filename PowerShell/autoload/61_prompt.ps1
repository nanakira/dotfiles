# Posh Git prompt setting
$GitPromptSettings.EnableFileStatus = $true

# Based on poshgit profile.example.ps1
# Set up a simple prompt, adding the git prompt parts inside git repos
function global:prompt {
    $realLASTEXITCODE = $LASTEXITCODE

    Write-Host($pwd.ProviderPath) -nonewline

    Write-VcsStatus

    $global:LASTEXITCODE = $realLASTEXITCODE
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

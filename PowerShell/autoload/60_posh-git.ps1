# Load posh-git example profile
if(Test-Path Function:\Prompt) {Rename-Item Function:\Prompt PrePoshGitPrompt -Force}

# Directly import poshgit module instead of calling profile.example.ps1
# (Original) . 'C:\ChocoPackages\poshgit\dahlbyk-posh-git-f22a92d\profile.example.ps1'
Import-Module 'C:\ChocoPackages\poshgit\dahlbyk-posh-git-7d93c81\src\posh-git'

Start-SshAgent -Quiet

Write-Host "posh-git.ps1 Loaded" -ForegroundColor DarkCyan

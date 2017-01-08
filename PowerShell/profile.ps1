# Put PowerShell custom profile directory
$psdir="$env:HOME\dotfiles\PowerShell"

Write-Host ("Load PS Profiles from {0}\autoload" -f $psdir) -ForegroundColor Green

# Load .ps1 files from "autoload"
Get-ChildItem $psdir\autoload | where Extension -eq ".ps1" | %{.$_.FullName}

Write-Host "PowerShell Profiles Loaded" -ForegroundColor Green

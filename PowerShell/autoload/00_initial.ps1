$env:path += ";" + (Get-Item "Env:ProgramFiles(x86)").Value + "\Git\bin"

Write-Host "initial.ps1 Loaded" -ForegroundColor DarkCyan

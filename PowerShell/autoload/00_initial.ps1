$env:path += ";" + (Get-Item "Env:ProgramFiles").Value + "\Git\bin"

Write-Host "initial.ps1 Loaded" -ForegroundColor DarkCyan

# Alias
Set-Alias subl "C:\Program Files\Sublime Text 3\sublime_text.exe"

function cd.. {
   cd ..
}
Set-Alias .. cd..
function cd... {
   cd ..
   cd ..
}
Set-Alias ... cd...
function cd.... {
   cd ..
   cd ..
   cd ..
}
Set-Alias .... cd....

# Delete original alias
del alias:curl
del alias:wget


Write-Host "alias.ps1 Loaded" -ForegroundColor DarkCyan


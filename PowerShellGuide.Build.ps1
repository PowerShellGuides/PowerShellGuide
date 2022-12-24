Push-Location $PSScriptRoot

Import-Module .\PowerShellGuide.psd1 -Force

(Get-PowerShellGuide).Export()

Pop-Location
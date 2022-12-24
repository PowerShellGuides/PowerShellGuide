#requires -Module PSDevOps
Import-BuildStep -ModuleName PowerShellGuide
Push-Location $PSScriptRoot
New-GitHubWorkflow -Name "Build PowerShell Guide" -On Push, PullRequest, Demand -Job PowerShellStaticAnalysis, TestPowerShellOnLinux, TagReleaseAndPublish, BuildPowerShellGuide -Environment @{
    NoCoverage = $true
} -OutputPath (Join-Path $PSScriptRoot .github\workflows\BuildGuide.yml)

Pop-Location
function Get-PowerShellGuide
{
    [CmdletBinding(DefaultParameterSetName='NoTopic')]
    [Alias('Get-PSGuide')]
    param(
    [Parameter(Mandatory,ParameterSetName='Topic',ValueFromPipelineByPropertyName)]
    [Alias('TopicName')]
    [string]
    $Topic
    )

    process {
        if ($PSCmdlet.ParameterSetName -eq 'NoTopic') {
            if (-not $script:CachedPowerShellGuide) {
                $guideTopics = 
                    Get-ChildItem -Path $PSScriptRoot -Filter Guide |
                        Get-ChildItem -Recurse |
                        Where-Object Extension -in '.md' |
                        Where-Object FullName -notlike '*_site*'
                                
                $guideTopics = @(all in $guideTopics are 'PowerShell Guide Topic File')

                $myModuleVersion = $MyInvocation.MyCommand.ScriptBlock.Module.Version
                
                $script:CachedPowerShellGuide = [PSCustomObject]@{
                    PSTypeName = 'PowerShell.Guide'
                    Version    = $myModuleVersion
                    AllTopics  = $guideTopics
                    AllDemos   = $guideDemos
                }
            }
            
            $script:CachedPowerShellGuide
        }

        if ($PSCmdlet.ParameterSetName -eq 'Topic') {
            $psGuide = Get-PowerShellGuide
            $psGuide.AllTopics | 
                Where-Object Aliases -like $Topic
        }
    }
}

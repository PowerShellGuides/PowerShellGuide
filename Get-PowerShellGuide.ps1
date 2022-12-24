function Get-PowerShellGuide {
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
                                
                $guideTopics = @($(
                                 # Collect all items into an input collection
                                 $inputCollection =$($guideTopics)
                                 # 'unroll' the collection by iterating over it once.
                                 $filteredCollection = $inputCollection =
                                     @(foreach ($in in $inputCollection) {
                                         $in
                                     })
                                 # Walk over each item in the filtered collection
                                 foreach ($item in $filteredCollection) {
                                     # we set $this, $psItem, and $_ for ease-of-use.
                                     $this = $_ = $psItem = $item
                                 if ($item.value -and $item.value.pstypenames.insert) {
                                     if ($item.value.pstypenames -notcontains 'PowerShell Guide Topic File') {
                                         $item.value.pstypenames.insert(0, 'PowerShell Guide Topic File')
                                     }
                                 }
                                 elseif ($item.pstypenames.insert -and $item.pstypenames -notcontains 'PowerShell Guide Topic File') {
                                     $item.pstypenames.insert(0, 'PowerShell Guide Topic File')
                                 }
                                 $item
                                             
                                 }   
                                 ))
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


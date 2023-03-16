<#
.SYNOPSIS
    Exports the PowerShell guide.
.DESCRIPTION
    Export all files in the PowerShell guide.
#>  
param(
$OutputPath
)

if (-not $OutputPath) {
    $OutputPath = 
        Get-Module PowerShellGuide |
            Select-Object -first 1 |
            Split-Path |
            Join-Path -ChildPath 'docs'
}

$dataDir = Join-Path $OutputPath "_data"

if (-not (Test-Path $dataDir)) {
    $null = New-Item -ItemType Directory -Path $dataDir -Force
}

$allTopicMetadata = @()

foreach ($topic in $this.AllTopics) {
    $relativePathParts = @($topic.RelativePath.Split([IO.Path]::DirectorySeparatorChar))
    $targetPathRoot = $OutputPath    
    if ($relativePathParts.Length -gt 1) {
        for (
            $pathPartIndex = 0;
            $pathPartIndex -lt ($relativePathParts.Length - 1);
            $pathPartIndex++
        ) {
            $pathPart = $relativePathParts[$pathPartIndex]            
            $targetPathRoot = Join-Path $targetPathRoot $pathPart
        }        
    }

    if (-not (Test-Path $targetPathRoot)) {
        $null = New-Item -ItemType Directory -Path $targetPathRoot -Force
    }

    if ($topic.Link.Length -ne ($topic.RelativePath.Length - 3)) {
        $topicMarkdownFile = Join-Path $OutputPath $topic.Link | 
            Join-Path -ChildPath "index.markdown"
        
    } else {        
        $topicMarkdownFile = Join-Path $targetPathRoot "$($topic.TopicName -replace '[_\-\s]', '-').md"
    }
    
    $allTopicMetadata += [PSCustomObject]@{
        Name = $topic.TopicName
        Aliases = $topic.Aliases
        Link = $topic.Link
    }

    $($topic |
        Add-Member NoteProperty FrontMatter @{
            layout    ='default'
        } -PassThru -Force |
        Format-Custom -View Markdown |
        Out-String -Width 1mb).Trim() |
        Set-Content -Path $topicMarkdownFile
    
    Get-Item $topicMarkdownFile
}

$allTopics = $this.AllTopics
$byCourseName = @($allTopics | 
    Group-Object {  $_.Metadata.CourseName } |
    Where-Object { $_.Name } |
    Select-Object @{
        Name = 'CourseName'
        Expression = { $_.Name }
    }, @{
        Name = 'Topics'
        Expression =  { 
            ($_.Group | Sort-Object { $_.Metadata.Level }).TopicName
        }
    })

$CoursesJson = ConvertTo-Json -Depth 10 -InputObject $byCourseName
$CoursesPath = Join-Path $dataDir "courses.json"
$CoursesJson | Set-Content -Path $CoursesPath 
Get-Item $CoursesPath

$topicMetadataPath = Join-Path $OutputPath -ChildPath "guide.json"
$allTopicMetadata | ConvertTo-Json -Depth 100 |
    Set-Content -Path $topicMetadataPath
Get-Item $topicMetadataPath
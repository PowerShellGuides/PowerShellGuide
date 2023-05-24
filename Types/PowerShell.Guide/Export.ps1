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
# Get all the topics (we'll want them for later)
$allTopics = $this.AllTopics | Sort-Object TopicName


foreach ($topic in $allTopics) {
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

# Group them by course name (sorted by level)
$byCourseName = @($allTopics | 
    Group-Object {  $_.Metadata.CourseName } |
    Where-Object { $_.Name } |
    Select-Object @{
        Name = 'CourseName'
        Expression = { $_.Name }
    }, @{
        Name = 'Topics'
        Expression =  { 
            ($_.Group | Sort-Object { $_.Metadata.Level }, TopicName) | Select-Object TopicName, Link, @{
                Name='Level'
                Expression = { $_.Metadata.Level}
            } 
        }
    })

# Write courses.json and output the file.
$CoursesJson = ConvertTo-Json -Depth 10 -InputObject $byCourseName
$CoursesPath = Join-Path $dataDir "courses.json"
$CoursesJson | Set-Content -Path $CoursesPath 
Get-Item $CoursesPath

$topicsByLevel = @($allTopics | Sort-Object { 
    if ($_.Metadata.Level) { $_.Metadata.Level -as [int]} else { 1mb }
}, TopicName |
    Select-Object TopicName, Link, ([Ordered]@{
        Name = 'Level'
        Expression = { $_.Metadata.Level }
    }))


$TopicsJson = ConvertTo-Json -Depth 10 -InputObject $topicsByLevel
$TopicsPath = Join-Path $dataDir "TopicsByLevel.json"
$TopicsJson | Set-Content -Path $TopicsPath 
Get-Item $TopicsPath

# Outputting the guide.json to _data (for Jekyll) and docs (for Javascript)
$topicJson = $allTopicMetadata | ConvertTo-Json -Depth 100
foreach ($rootPath in $OutputPath, $dataDir) {
    $topicMetadataPath = Join-Path $rootPath -ChildPath "guide.json"
    $topicJson | Set-Content -Path $topicMetadataPath
    Get-Item $topicMetadataPath
}
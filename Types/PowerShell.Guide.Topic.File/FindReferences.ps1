$content = $this.Content
$PowerShellGuide  = Get-PowerShellGuide
$topicReference   = @{}
foreach ($guideTopic in $PowerShellGuide.AllTopics) {
    if ($guideTopic.Fullname -eq $this.Fullname) { continue } # avoid self-references
    foreach ($alias in $guideTopic.Aliases) {
        $topicReference[$alias] = $guideTopic
    }
}

$skipReference = @()
if ($this.Metadata.SkipReference) {
    $skipReference += $this.Metadata.SkipReference
}
if ($this.Metadata.SkipReferences) {
    $skipReference += $this.Metadata.SkipReferences
}
if ($this.Metadata.NoReference) {
    $skipReference += $this.Metadata.NoReference
}
if ($this.Metadata.NoReferences) {
    $skipReference += $this.Metadata.NoReferences
}

$sortedKeys = $topicReference.Keys | Sort-Object Length, { $_ } -Descending



$anyMatches = [Regex]::new("(?<=[\s\>'`"_])(?>$(
    @(foreach ($k in $sortedKeys) {
        [Regex]::Escape($k) -replace '\\\s', '[\s\-_]'
    }) -join '|'
))(?=[\s\>'`"_\.,])", 'IgnoreCase')



foreach ($match in $anyMatches.Matches($content)) {
    $topicAlias = $match -replace '[\s\-_]',' '
    if ($skipReference -and (
        $skipReference -contains $topicAlias -or 
        $skipReference -contains $topicReference["$topicAlias"].TopicName)
    ) {
        continue
    }
    
    [PSCustomObject]@{
        PSTypeName = 'PowerShell.Guide.Reference'
        Match      = $match
        TopicName  = $topicReference["$topicAlias"].TopicName
        TopicFile  = $topicReference["$topicAlias"]
    }
}
$content = $this.Content
$PowerShellGuide  = Get-PowerShellGuide
$topicReference   = @{}
foreach ($guideTopic in $PowerShellGuide.AllTopics) {
    if ($guideTopic.Fullname -eq $this.Fullname) { continue } # avoid self-references
    foreach ($alias in $guideTopic.Aliases) {
        $topicReference[$alias] = $guideTopic
    }
}

$sortedKeys = $topicReference.Keys | Sort-Object Length, { $_ } -Descending



$anyMatches = [Regex]::new("(?<=[\s\>'`"_])(?>$(
    @(foreach ($k in $sortedKeys) {
        [Regex]::Escape($k) -replace '\\\s', '[\s\-_]'
    }) -join '|'
))(?=[\s\>'`"_\.,])", 'IgnoreCase')



foreach ($match in $anyMatches.Matches($content)) {
    $topicAlias = $match -replace '[\s\-_]',' '
    [PSCustomObject]@{
        PSTypeName = 'PowerShell.Guide.Reference'
        Match      = $match
        TopicName  = $topicReference["$topicAlias"].TopicName
        TopicFile  = $topicReference["$topicAlias"]
    }
}
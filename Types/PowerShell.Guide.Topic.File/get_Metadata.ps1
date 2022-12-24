if ($this.psobject.properties['_CachedMetadata']) {
    return $this._CachedMetadata
}

$psd1FileName = $this.Name     + '.psd1'
$psd1File     = $this.Fullname + '.psd1'
$topicData    = 
    if (Test-Path $psd1File) {
        try {
            Import-LocalizedData -BaseDirectory $this.Directory.Fullname -FileName $psd1FileName
        } catch {
            Write-Warning "$_"
            @{}
        }
    } else {
        @{}
    }

if (-not $topicData["title"]) {
    $topicData["title"] = $this.TopicName
}
elseif ($topicData.Keys -inotcontains 'title') {
    $title = $topicData["title"]
    $topicData.Remove("Title")
    $topicData["title"] = $title
}


$this | Add-Member NoteProperty _CachedMetadata $topicData -Force
return $topicData
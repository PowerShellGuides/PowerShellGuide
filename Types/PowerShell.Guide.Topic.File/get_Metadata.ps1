if ($this.psobject.properties['_CachedMetadata']) {
    return $this._CachedMetadata
}

$psd1FileName = $this.Name     + '.psd1'
$psd1File     = $this.Fullname + '.psd1'
$topicData    = 
    if (Test-Path $psd1File) {
        try {            
            $localizedData = Import-LocalizedData -BaseDirectory $this.Directory.Fullname -FileName $psd1FileName
            $importedData = [Ordered]@{}
            if ($localizedData) {
                $localizedData.GetEnumerator() | 
                Sort-Object { $_.Key.ToLower() }|
                & { process {
                    $importedData[$_.Key.ToLower()] = $_.Value
                } }            
            }
            $importedData
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
elseif ($topicData.Keys -cnotcontains 'title') {
    $title = $topicData["title"]
    $topicData.Remove("Title")
    $topicData["title"] = $title
}


$this | Add-Member NoteProperty _CachedMetadata $topicData -Force
return $topicData
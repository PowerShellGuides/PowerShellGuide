$link = $this.RelativePath -replace '[\-_\s]', '-' -replace '\.md$', ''
if ($link -match '[\\/]') {
    $linkParts = @($link -split '[\\/]')
    if ($linkParts[-1] -eq $linkParts[-2]) {
        $linkParts[0..$($linkParts.Length - 2)] -join '/'
    } else {
        $linkParts -join '/'
    }
} else {
    $link
}
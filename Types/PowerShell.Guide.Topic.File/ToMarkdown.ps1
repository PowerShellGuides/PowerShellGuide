$content = $this.Content

$avoidRange = @()
$avoidRange += @(foreach ($cb in $this.FindCodeBlocks()) {
    $cb.Index..($cb.Index+$cb.Length)
})

$avoidRange += @(foreach ($hyperlink in $this.FindHyperLinks()) {
    $hyperlink.Index..$($hyperlink.Index + $hyperlink.Length)
})

$newText = ''
$index   = 0
@(
foreach ($ref in $this.FindReferences()) {
    if ($ref.Match.Index -in $avoidRange) { continue }
    $refStart = $ref.Match.Index
    if ($refStart -gt $index) {
        $content.Substring($index, $refStart - $index)
    }    
    "[$($ref.Match)](/$($ref.TopicFile.Link))"
    $index = $ref.Match.Index + $ref.Match.Length                
}

if ($index -lt $content.Length) {
    $content.Substring($index)
}
) -join ''
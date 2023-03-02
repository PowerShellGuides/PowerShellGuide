Write-FormatView -TypeName 'PowerShell Guide Topic File','PowerShell.Guide.Topic.File' -Action {
    $topicMarkdown = @(
        "# " + $_.TopicName
        $_.Content
    ) -join ([Environment]::NewLine * 2)
    if ($ExecutionContext.SessionState.InvokeCommand.GetCommand('Show-Markdown', 'Cmdlet')) {
        Show-Markdown -InputObject $topicMarkdown
    } else {
        $topicMarkdown
    }
}

Write-FormatView -TypeName 'PowerShell Guide Topic File','PowerShell.Guide.Topic.File' -Property "TopicName", Content -VirtualProperty @{
    Content = {
        Show-Markdown -InputObject $_.Content        
    }
} -AsList

Write-FormatView -TypeName 'PowerShell Guide Topic File','PowerShell.Guide.Topic.File' -Action {
    Write-FormatViewExpression -ScriptBlock {
        @("---"
        Format-Yaml -InputObject $_.Metadata
        if ($_.FrontMatter) {
            Format-Yaml -InputObject $_.FrontMatter
        }
        "---") -join [Environment]::Newline
    }

    Write-FormatViewExpression -Newline
    Write-FormatViewExpression -Newline

    Write-FormatViewExpression -ScriptBlock {        
        $guideTopic = $_

        $codeFenceRegex = [Regex]::new(@'
(?>
    (?<FenceChar>[`\~]){3}    # Code fences start with tildas or backticks, repeated at least 3 times
(?<Language>                  # Match a specific language
PowerShell
)
[\s-[\r\n]]{0,}               # Match but do not capture initial whitespace.
(?<Code>                      # Capture the <Code> block
    (?:.|\s){0,}?             # This is anything until
    (?=\z|\k<FenceChar>{3})   # the end of the string or the same matching fence chars
)
(?>\z|\k<FenceChar>{3})
)
'@, 'IgnoreCase,IgnorePatternWhitespace,Singleline')

        $topicContent = $guideTopic.ToMarkdown()
        $hostSupportedHTML = $host.UI.SupportsHTML
        $host.UI | Add-Member NoteProperty SupportsHTML $true -Force
        $codeFenceRegex.Replace($topicContent, {
            param($match)

            $colorizedParts = $guideTopic.ColorizeCode($match.Groups["Code"].Value)
            return ("<pre>" + 
            $(@(foreach ($colorizedPart in $colorizedParts) {
                if ($colorizedPart.InputObject -eq [Environment]::NewLine) {
                    "<br/>"
                }
                elseif ($colorizedPart.InputObject -match '^\s+$') {
                    $colorizedPart.InputObject -replace '\s', "&nbsp;"
                }
                else {
                    Format-RichText @colorizedPart
                }
            }) -join '') + 
            "</pre>")
        })
        $host.UI | Add-Member NoteProperty SupportsHTML $hostSupportedHTML -Force
    }
} -Name 'Markdown'
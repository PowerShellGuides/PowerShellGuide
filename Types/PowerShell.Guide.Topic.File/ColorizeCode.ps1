param($code)

$codeTokens = [Management.Automation.PSParser]::Tokenize($code, [ref]$null)
$PreviousToken = $null
foreach ($_ in $codeTokens) {   
    $content = $_.Content
    if ($_.Type -in 'Variable', 'String') {
        $content = $code.Substring($_.Start, $_.Length)
    }
    if ($PreviousToken) {
        $token = $_
        $prevEnd = $PreviousToken.Start + $PreviousToken.Length
        $substring = $code.Substring($prevEnd, $token.Start -  $prevEnd)
        if ($substring) {
            @{InputObject=$substring}
        }
    }
    
    if ($_.Type -eq 'Comment') {
        @{
            ForegroundColor='Success'
            InputObject = $content
        }
    }
    elseif ($_.Type -in 'Keyword', 'String', 'CommandArgument') {
        @{
            ForegroundColor='Verbose'
            InputObject = $Content
        }
    }
    elseif ($_.Type -in 'Variable', 'Command') {
        @{
            ForegroundColor='Warning'
            InputObject = $Content
        }   
    }
    elseif ($_.Type -in 'CommandParameter') {
        @{
            ForegroundColor='Magenta'
            InputObject = $Content
        }        
    }
    elseif (
        $_.Type -in 'Operator','GroupStart', 'GroupEnd'
    ) {
        @{
            ForegroundColor='Magenta'
            InputObject = $Content
        }
    }
    elseif (
        $_.Type -in 'Type'
    ) {
        @{
            ForegroundColor='Progress'
            InputObject = $Content
        }
    }
    elseif (
        $_.Type -notin 'Comment', 
            'Keyword', 'String', 'CommandArgument',
            'Variable', 'Command',
            'CommandParameter',
            'Operator','GroupStart', 'GroupEnd'
    )  {
        @{
            ForegroundColor='Output'
            InputObject=$Content
        }
    } else {
        @{
            ForegroundColor='Output'
            InputObject=$Content
        }
    }
    $PreviousToken = $_
}
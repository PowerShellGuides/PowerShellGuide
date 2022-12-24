PowerShell's built-in help system is quite nice.

Any module can include any number of about topics, which can help people figure out how to use that module.

Perhaps more importantly, any function or script can include inline help.

This help will be easy to access for anyone with PowerShell, using Get-Help.


Inline help is defined in comments at the start of a function or script, and can also be defined above each parameter.


Let's write a completely useless example to show how this works

~~~PowerShell
function Get-Something {
    <#
    .Synopsis
        Gets something
    .Description
        I swear I was going to get something
    .Example
        Get-Something
    .Link
        https://powershellguide.com/
    #>
    param(
    # What was I trying to get again?  Oh, yeah.  Something.
    $Something
    )

    $Something
}
~~~


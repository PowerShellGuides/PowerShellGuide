---

title: Inline Help

layout: default
---

PowerShell's built-in help system is quite nice.

Any module can include any number of [about topics](/PowerShell/Help/About-Topics), which can help people figure out how to use that module.

Perhaps more importantly, any [function](/PowerShell/Functions) or script can include inline help.

This help will be easy to access for anyone with [PowerShell](/PowerShell), using Get-Help.


Inline help is defined in comments at the start of a [function](/PowerShell/Functions) or script, and can also be defined above each parameter.


Let's write a completely useless example to show how this works

<pre><br/><span class='Verbose'>function</span>&nbsp;<span class='Verbose'>Get-Something</span>&nbsp;<span class='Magenta'>{</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Success'><#
    .Synopsis
        Gets something
    .Description
        I swear I was going to get something
    .Example
        Get-Something
    .Link
        https://powershellguide.com/
    #></span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Verbose'>param</span><span class='Magenta'>(</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Success'># What was I trying to get again?  Oh, yeah.  Something.</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Warning'>$Something</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Magenta'>)</span><br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Warning'>$Something</span><br/><span class='Magenta'>}</span><br/></pre>

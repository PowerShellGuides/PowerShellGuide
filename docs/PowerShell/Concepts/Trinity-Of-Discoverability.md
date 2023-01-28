---

title: Trinity Of Discoverability
Alias: Discoverability

layout: default
---

One of [PowerShell](/PowerShell)'s major strengths is it's discoverability.

That is, within [PowerShell](/PowerShell), you can find out what [PowerShell](/PowerShell) can do.

There are three [commands](/PowerShell/Commands) that make up [PowerShell](/PowerShell)'s trinity of discoverability:

* [Get-Command](/PowerShell/Commands/Get-Command)
* [Get-Help](/PowerShell/Commands/Get-Help)
* [Get-Member](/PowerShell/Commands/Get-Member)

We can run [Get-Command](/PowerShell/Commands/Get-Command) to give us a list of commands:

<pre><br/><span class='Success'># Get all currently loaded commands:</span><br/><span class='Warning'>Get-Command</span><br/></pre>

We can run [Get-Help](/PowerShell/Commands/Get-Help) to give us help about a command:

<pre><br/><span class='Success'># Get-Help about Get-Command:</span><br/><span class='Warning'>Get-Help</span>&nbsp;<span class='Verbose'>Get-Command</span><br/></pre>


Finally, we can discover information about an objects by using Get-Member:

<pre><br/><span class='Success'># Find out all members of the types of objects returned from Get-Command:</span><br/><span class='Warning'>Get-Command</span>&nbsp;<span class='Magenta'>|</span>&nbsp;<span class='Warning'>Get-Member</span><br/></pre>

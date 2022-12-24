---

layout: default
---

In most [programming languages](/Languages/Programming-Languages), objects are only as malleable as they wish to be.

If an object did not have a property or a method, you'd be out of luck.

In [PowerShell](/PowerShell), _every object can be extended_.

This is because [everything is an object](/PowerShell/Concepts/Everything-Is-An-Object) in [PowerShell](/PowerShell), and [PowerShell](/PowerShell) objects are very flexible.

To add information to an instance of an object, you can use the Add-Member [command](/PowerShell/Commands).

For instance, suppose we wanted to add a timestamp to each process, we could do something like:

<pre><br/><span class='Warning'>$processSnapshot</span>&nbsp;<span class='Magenta'>=</span>&nbsp;<span class='Warning'>Get-Process</span>&nbsp;<span class='Magenta'>|</span>&nbsp;<br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Warning'>Add-Member</span>&nbsp;<span class='Verbose'>NoteProperty</span>&nbsp;<span class='Verbose'>Timestamp</span>&nbsp;<span class='Magenta'>(</span><span class='Warning'>Get-Date</span><span class='Magenta'>)</span>&nbsp;<span class='Magenta'>-Force</span>&nbsp;<span class='Magenta'>-Passthru</span><br/></pre>

Then we could come back next week and see not just what processes were running then, but also _when_ we got that information.

You may find it's exactly these sort of scenarios where you want to extend an object, and this is when you will find [PowerShell](/PowerShell) quite adept.

You can also extend [types](/PowerShell/Types) in [PowerShell](/PowerShell), so that any similar object would be treated in the same way.

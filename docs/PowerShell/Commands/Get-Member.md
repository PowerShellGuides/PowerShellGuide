---

title: Get-Member

layout: default
---

Get-Member may be the most technically named of the [trinity of discoverability](/PowerShell/Concepts/Trinity-Of-Discoverability), but it is still quite indispensible.

In programming parlance, "members" are the properties, methods, or events of an object.

Since [everything is an object](/PowerShell/Concepts/Everything-Is-An-Object) in [PowerShell](/PowerShell), Get-Member is your key to understanding what you can do with each object.

For example, if we wanted to know all I can do with a process, we can run:

<pre><br/><span class='Warning'>Get-Process</span>&nbsp;<span class='Magenta'>|</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Warning'>Get-Member</span><br/></pre>

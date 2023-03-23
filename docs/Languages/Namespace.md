---

alias: 
- namespace
- namespaces
title: Namespace

layout: default
---

Just like with most things in life, programmer like to put things into your own little groups. One of the most common mechanisms for this is namespaces.

Namepaces exist in multiple different [programming languages](/Languages/Programming-Languages), including C/C++, Java, Visual Basic, and C#. 

Namespaces are used to organize different item into related collections. I think a much more flexible version of the dewey decimal system. Or like how this [guide](/PowerShell/Guide) is broken up into topics and those topics contain related infromation. I mean just imaging if you where learning about a topic and someone goes off in a completely unrelated topic that breaks your consentration on the matter at hand. Now where were we?

## Namespaces in [PowerShell](/PowerShell)
In the [.NET](/PowerShell/Concepts/PowerShell-NET-and-Everything) framework, and by extension [PowerShell](/PowerShell), namespaces can contain classes, delegates, enumerations, structures, [modules](/PowerShell/Modules) (not PowerShell modules), interfaces, and even other namespaces.

You can preload a namespace at the beginning of a script, allowing you to call the classes using their short name. However, this is not required. You can call a class using the full path.

Call [.NET](/PowerShell/Concepts/PowerShell-NET-and-Everything) class with the full name. Full name is the namespace a period (fullstop for my European folks) then the class name.
<pre><br/><span class='Progress'>[Microsoft.VisualBasic.Interaction]</span><span class='Magenta'>::</span><span class='Output'>Beep</span><span class='Magenta'>(</span><span class='Magenta'>)</span><br/></pre>

Call [.NET](/PowerShell/Concepts/PowerShell-NET-and-Everything) class with the short name be declaring the namespace 
<pre><br/><span class='Verbose'>using</span>&nbsp;<span class='Verbose'>namespace</span>&nbsp;<span class='Verbose'>Microsoft.VisualBasic</span><br/><span class='Progress'>[Interaction]</span><span class='Magenta'>::</span><span class='Output'>Beep</span><span class='Magenta'>(</span><span class='Magenta'>)</span><br/></pre>

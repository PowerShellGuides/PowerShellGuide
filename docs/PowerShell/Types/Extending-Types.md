---

alias: 
- Extended Types System
- types.ps1xml
- types file
- Extending Types in PowerShell
- Extend Types
title: Extending Types

layout: default
---

In most [languages](/Languages), [types](/PowerShell/Types) are somewhat set in stone.

Not so in [PowerShell](/PowerShell).

In [PowerShell](/PowerShell), [everything is an object](/PowerShell/Concepts/Everything-Is-An-Object), and [every object can be extended](/PowerShell/Concepts/Every-Object-Can-Be-Extended).


This is thanks to the [PowerShell](/PowerShell) Extended [Types](/PowerShell/Types) System.

## Extending [Types](/PowerShell/Types) in Script

We can extend [types](/PowerShell/Types) in script with the somewhat awkwardly named [Update-TypeData](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/update-typedata) [command](/PowerShell/Commands).

Update-TypeData allows us to add any number of properties and methods to a given [type](/PowerShell/Types).

For a brief example, let's add two ScriptProperty to all [int] objects to see if it is even or odd.

<pre><br/><span class='Success'># Add .IsEven to [int]</span><br/><span class='Warning'>Update-TypeData</span>&nbsp;<span class='Magenta'>-TypeName</span>&nbsp;<span class='Verbose'>System.Int32</span>&nbsp;<span class='Magenta'>-MemberName</span>&nbsp;<span class='Verbose'>IsEven</span>&nbsp;<span class='Magenta'>-MemberType</span>&nbsp;<span class='Verbose'>ScriptProperty</span>&nbsp;<span class='Magenta'>-Value</span>&nbsp;<span class='Magenta'>{</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Magenta'>(</span><span class='Warning'>$this</span>&nbsp;<span class='Magenta'>%</span>&nbsp;<span class='Output'>2</span><span class='Magenta'>)</span>&nbsp;<span class='Magenta'>-eq</span>&nbsp;<span class='Output'>0</span><br/><span class='Magenta'>}</span>&nbsp;<span class='Magenta'>-Force</span><br/><br/><span class='Success'># Add .IsOdd to [int]</span><br/><span class='Warning'>Update-TypeData</span>&nbsp;<span class='Magenta'>-TypeName</span>&nbsp;<span class='Verbose'>System.Int32</span>&nbsp;<span class='Magenta'>-MemberName</span>&nbsp;<span class='Verbose'>IsOdd</span>&nbsp;<span class='Magenta'>-MemberType</span>&nbsp;<span class='Verbose'>ScriptProperty</span>&nbsp;<span class='Magenta'>-Value</span>&nbsp;<span class='Magenta'>{</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Magenta'>(</span><span class='Warning'>$this</span>&nbsp;<span class='Magenta'>%</span>&nbsp;<span class='Output'>2</span><span class='Magenta'>)</span>&nbsp;<span class='Magenta'>-as</span>&nbsp;<span class='Progress'>[bool]</span><br/><span class='Magenta'>}</span>&nbsp;<span class='Magenta'>-Force</span><br/><br/><span class='Magenta'>(</span><span class='Output'>1</span><span class='Magenta'>)</span><span class='Magenta'>.</span><span class='Output'>IsOdd</span><br/><span class='Magenta'>(</span><span class='Output'>2</span><span class='Magenta'>)</span><span class='Magenta'>.</span><span class='Output'>IsEven</span><br/></pre>

Gentle reminder: [PowerShell](/PowerShell) [types](/PowerShell/Types) do not need to be real, they can simply be any property bag with a PSTypeName.



## Extending [Types](/PowerShell/Types) with XML

One can, if one has some pain tolerence, declare these extensions to [types](/PowerShell/Types) in an XML file.

The [types schema](https://github.com/PowerShell/PowerShell/blob/master/src/Schemas/Types.xsd) decribes a `.types.ps1xml` file, and these can do everything that Update-TypeData can.

This approach is somewhat preferrable when we're creating [modules](/PowerShell/Modules), as a `.types.ps1xml` file is more portable.  

Of course, if one does not want to write a large amount of XML, there are alternatives.

## Extending [Types](/PowerShell/Types) with EZOut

There is an ancient [PowerShell](/PowerShell) [module](/PowerShell/Modules) that helps us write `types.ps1xml` and `format.ps1xml` files without driving ourselves insane.

It is called [EZOut](https://github.com/StartAutomating/EZOut).

You're welcome to use it, or take the hard way.

It all depends on your level of masochism.

---

alias: 
- assemblies
- assembly
- dll
title: Assemblies

layout: default
---

When the universe faced it's greatest threat in Thanos, Captain America lead the charge to save humanity by calling out, "Avengers, assemble!"

By assembling the 2nd greatest group of superheroes ever (sorry, I'm a DC fan - Justice League FTW!) Steve Rogers was able to do the impossible and defeat Thanos.

You can think of assemblies in [.NET](/PowerShell/Concepts/PowerShell-NET-and-Everything) in the same light. When there is something [PowerShell](/PowerShell) can't do on it's own, you call in the assemblies. These assemblies are collections of resources designed to provide different sets of functionality.

Assemblies are .dll files that contain compiled C# code. Some are designed specifically for [PowerShell](/PowerShell). This is where cmdlets come from. Others are part of the [.NET](/PowerShell/Concepts/PowerShell-NET-and-Everything) framework. While other still are custom code someone else might have written. In all cases these dll files can be imported directly into [PowerShell](/PowerShell), allowing you to use the classes and other objects directly in your [scripts](/PowerShell/Scripts).

## Assemblies in [PowerShell](/PowerShell)
Assemblies are imported into [PowerShell](/PowerShell) using the Add-Type cmdlet. 

<pre><br/><span class='Success'># Import the Assembly by name</span><br/><span class='Warning'>Add-Type</span>&nbsp;<span class='Magenta'>-AssemblyName</span>&nbsp;<span class='Verbose'>Microsoft.VisualBasic.Core</span><br/></pre>

The above will work if [PowerShell](/PowerShell) already know the assembly or if it is in the folder your session is set too. You can also supply a path to a DLL.

<pre><br/><span class='Success'># Import the Assembly by path</span><br/><span class='Warning'>Add-Type</span>&nbsp;<span class='Magenta'>-Path</span>&nbsp;<span class='Verbose'>'C:\Program Files\PowerShell\7\Microsoft.VisualBasic.Core.dll'</span><br/></pre>

Obvisouly, this make your script less portable. Even if you used environment [variables](/PowerShell/Variables), there no guarentee the paths will remain the same machine to machine and OS to OS.

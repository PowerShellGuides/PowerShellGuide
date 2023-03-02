---

alias: 
- PowerShell Modules
- PowerShell Modules
- Module
title: Modules

layout: default
---

PowerShell Modules are packages of [PowerShell](/PowerShell) functionality.

In other words, they're little gift boxes of code and joy.

You can find many modules on the [PowerShell Gallery](https://powershellgallery.com) ( ~7 billion served ).

You can install them with the built-in [command](/PowerShell/Commands) Install-Module.

For instance, if we wanted to install an offline copy of the [PowerShell Guide](/PowerShell/Guide), we'd use:

<pre><br/><span class='Warning'>Install-Module</span>&nbsp;<span class='Verbose'>PowerShellGuide</span><br/></pre>

Once a module is installed, we can import the module with Import-Module:

<pre><br/><span class='Warning'>Import-Module</span>&nbsp;<span class='Verbose'>PowerShellGuide</span><br/></pre>

If we wanted to remove it after we've loaded it:

<pre><br/><span class='Warning'>Remove-Module</span>&nbsp;<span class='Verbose'>PowerShellGuide</span><br/></pre>

Hopefully we're getting it.  [Verb-noun pairing](/PowerShell/Concepts/Verb-Noun) can be rather obviously boring sometimes.

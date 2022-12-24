---

title: Get-Help

layout: default
---

Get-Help is the most helpful [command](/PowerShell/Commands) there is.

It exposes [inline help](/PowerShell/Help/Inline-Help) for [commands](/PowerShell/Commands) and [about topics](/PowerShell/Help/About-Topics) built into the system. 

Get-Help is part of the [trinity of discoverability](/PowerShell/Concepts/Trinity-Of-Discoverability).

## General Help

To get general help about [PowerShell](/PowerShell), we can use:

<pre><br/><span class='Warning'>Get-Help</span><br/></pre>

## [Command](/PowerShell/Commands) Help

To get help about a particular [command](/PowerShell/Commands), we can use:

<pre><br/><span class='Warning'>Get-Help</span>&nbsp;<span class='Verbose'>Get-Help</span><br/></pre>

## Online Help

If a [command](/PowerShell/Commands) has a .Link, the first link will give you online help.

<pre><br/><span class='Warning'>Get-Help</span>&nbsp;<span class='Verbose'>Get-Command</span>&nbsp;<span class='Magenta'>-Online</span><br/></pre>

This will bring you to [microsoft's get-command help](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/get-command)

## [About Topics](/PowerShell/Help/About-Topics)

To get help about a particular topic, we can use:

<pre><br/><span class='Warning'>Get-Help</span>&nbsp;<span class='Verbose'>about_Variables</span><br/></pre>

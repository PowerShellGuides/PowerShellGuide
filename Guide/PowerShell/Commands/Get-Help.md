Get-Help is the most helpful command there is.

It exposes inline help for commands and about topics built into the system. 

Get-Help is part of the trinity of discoverability.

## General Help

To get general help about PowerShell, we can use:

~~~PowerShell
Get-Help
~~~

## Command Help

To get help about a particular command, we can use:

~~~PowerShell
Get-Help Get-Help
~~~

## Online Help

If a command has a .Link, the first link will give you online help.

~~~PowerShell
Get-Help Get-Command -Online
~~~

This will bring you to [microsoft's get-command help](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/get-command)

## About Topics

To get help about a particular topic, we can use:

~~~PowerShell
Get-Help about_Variables
~~~








PowerShell Modules are packages of PowerShell functionality.

In other words, they're little gift boxes of code and joy.

You can find many modules on the [PowerShell Gallery](https://powershellgallery.com) ( ~7 billion served ).

You can install them with the built-in command Install-Module.

For instance, if we wanted to install an offline copy of the PowerShell Guide, we'd use:

~~~PowerShell
Install-Module PowerShellGuide
~~~

Once a module is installed, we can import the module with Import-Module:

~~~PowerShell
Import-Module PowerShellGuide
~~~

If we wanted to remove it after we've loaded it:

~~~PowerShell
Remove-Module PowerShellGuide
~~~

Hopefully we're getting it.  Verb-noun pairing can be rather obviously boring sometimes.



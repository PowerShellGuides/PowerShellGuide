One of PowerShell's major strengths is it's discoverability.

That is, within PowerShell, you can find out what PowerShell can do.

There are three commands that make up PowerShell's trinity of discoverability:

* Get-Command
* Get-Help
* Get-Member

We can run Get-Command to give us a list of commands:

~~~PowerShell
# Get all currently loaded commands:
Get-Command
~~~

We can run Get-Help to give us help about a command:

~~~PowerShell
# Get-Help about Get-Command:
Get-Help Get-Command
~~~


Finally, we can discover information about an objects by using Get-Member:

~~~PowerShell
# Find out all members of the types of objects returned from Get-Command:
Get-Command | Get-Member
~~~

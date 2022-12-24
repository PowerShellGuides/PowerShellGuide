Get-Member may be the most technically named of the trinity of discoverability, but it is still quite indispensible.

In programming parlance, "members" are the properties, methods, or events of an object.

Since everything is an object in PowerShell, Get-Member is your key to understanding what you can do with each object.

For example, if we wanted to know all I can do with a process, we can run:

~~~PowerShell
Get-Process |
    Get-Member
~~~

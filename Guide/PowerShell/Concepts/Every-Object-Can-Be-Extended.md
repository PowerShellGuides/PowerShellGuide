In most programming languages, objects are only as malleable as they wish to be.

If an object did not have a property or a method, you'd be out of luck.

In PowerShell, _every object can be extended_.

This is because everything is an object in PowerShell, and PowerShell objects are very flexible.

To add information to an instance of an object, you can use the Add-Member command.

For instance, suppose we wanted to add a timestamp to each process, we could do something like:

~~~PowerShell
$processSnapshot = Get-Process | 
    Add-Member NoteProperty Timestamp (Get-Date) -Force -Passthru
~~~

Then we could come back next week and see not just what processes were running then, but also _when_ we got that information.

You may find it's exactly these sort of scenarios where you want to extend an object, and this is when you will find PowerShell quite adept.

You can also extend types in PowerShell, so that any similar object would be treated in the same way.


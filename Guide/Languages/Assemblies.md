When the universe faced it's greatest threat in Thanos, Captain America lead the charge to save humanity by calling out, "Avengers, assemble!"

By assembling the 2nd greatest group of superheroes ever (sorry, I'm a DC fan - Justice League FTW!) Steve Rogers was able to do the impossible and defeat Thanos.

You can think of assemblies in .NET in the same light. When there is something PowerShell can't do on it's own, you call in the assemblies. These assemblies are collections of resources designed to provide different sets of functionality.

Assemblies are .dll files that contain compiled C# code. Some are designed specifically for PowerShell. This is where cmdlets come from. Others are part of the .NET framework. While other still are custom code someone else might have written. In all cases these dll files can be imported directly into PowerShell, allowing you to use the classes and other objects directly in your scripts.

## Assemblies in PowerShell
Assemblies are imported into PowerShell using the Add-Type cmdlet. 

~~~PowerShell
# Import the Assembly by name
Add-Type -AssemblyName Microsoft.VisualBasic.Core
~~~

The above will work if PowerShell already know the assembly or if it is in the folder your session is set too. You can also supply a path to a DLL.

~~~PowerShell
# Import the Assembly by path
Add-Type -Path 'C:\Program Files\PowerShell\7\Microsoft.VisualBasic.Core.dll'
~~~

Obvisouly, this make your script less portable. Even if you used environment variables, there no guarentee the paths will remain the same machine to machine and OS to OS.
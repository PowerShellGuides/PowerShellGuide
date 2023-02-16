Namespaces in .NET are similar to modules in PowerShell, in that they are used to organize different item into related collections. A namespace can be a collection of classes, delegates, enumerations, structures, modules (.NET modules not PowerShell), interfaces, and even other namespaces.

Namespaces are contained inside of assemblies (aka Dynamic Link library (aka-aka DLL)).

However, unlike PowerShell modules, namespaces do not contain nicely named cmdlets or functions.

The most common object you'll work with in namespaces is classes and structures. Sometimes enumerations. You can and do use structures (Struct) but for the most part you'll never notice they are Struct and not classes. To give you an idea, I bet you didn't know DateTime is a Struct. And unless you are getting into lower-level programming languages you don't need to worry about. Just throw them on the heap and let the garbage be collected.

You can preload a namespace at the beginning of a script, allowing you to call the classes using their short name. However, this is not required. You can call a class using the full path.

Call .NET class with the full name. Full name is the namespace a period (fullstop for my European folks) then the class name.
~~~PowerShell
[Microsoft.VisualBasic.Interaction]::Beep()
~~~

Call .NET class with the short name be declaring the namespace 
~~~PowerShell
using namespace Microsoft.VisualBasic
[Interaction]::Beep()
~~~


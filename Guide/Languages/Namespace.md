Just like with most things in life, programmer like to put things into your own little groups. One of the most common mechanisms for this is namespaces.

Namepaces exist in multiple different programming languages, including C/C++, Java, Visual Basic, and C#. 

Namespaces are used to organize different item into related collections. I think a much more flexible version of the dewey decimal system. Or like how this guide is broken up into topics and those topics contain related infromation. I mean just imaging if you where learning about a topic and someone goes off in a completely unrelated topic that breaks your consentration on the matter at hand. Now where were we?

## Namespaces in PowerShell
In the .NET framework, and by extension PowerShell, namespaces can contain classes, delegates, enumerations, structures, modules (not PowerShell modules), interfaces, and even other namespaces.

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


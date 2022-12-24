In most languages, types are somewhat set in stone.

Not so in PowerShell.

In PowerShell, everything is an object, and every object can be extended.


This is thanks to the PowerShell Extended Types System.

## Extending Types in Script

We can extend types in script with the somewhat awkwardly named [Update-TypeData](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/update-typedata) command.

Update-TypeData allows us to add any number of properties and methods to a given type.

For a brief example, let's add two ScriptProperty to all [int] objects to see if it is even or odd.

~~~PowerShell
# Add .IsEven to [int]
Update-TypeData -TypeName System.Int32 -MemberName IsEven -MemberType ScriptProperty -Value {
    ($this % 2) -eq 0
} -Force

# Add .IsOdd to [int]
Update-TypeData -TypeName System.Int32 -MemberName IsOdd -MemberType ScriptProperty -Value {
    ($this % 2) -as [bool]
} -Force

(1).IsOdd
(2).IsEven
~~~

Gentle reminder: PowerShell types do not need to be real, they can simply be any property bag with a PSTypeName.



## Extending Types with XML

One can, if one has some pain tolerence, declare these extensions to types in an XML file.

The [types schema](https://github.com/PowerShell/PowerShell/blob/master/src/Schemas/Types.xsd) decribes a `.types.ps1xml` file, and these can do everything that Update-TypeData can.

This approach is somewhat preferrable when we're creating modules, as a `.types.ps1xml` file is more portable.  

Of course, if one does not want to write a large amount of XML, there are alternatives.

## Extending Types with EZOut

There is an ancient PowerShell module that helps us write `types.ps1xml` and `format.ps1xml` files without driving ourselves insane.

It is called [EZOut](https://github.com/StartAutomating/EZOut).

You're welcome to use it, or take the hard way.

It all depends on your level of masochism.

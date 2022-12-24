Types are, well, types of objects.

That is to say, a type describes the properties, methods, and events of an object.

Types run the gamut between strongly defined and weakly defined.

## Strongly Defined Types

A strongly defined type has a very particular idea of what it is and what it can do.

This definition is written in an object oriented programming language.

It is often compiled into a file so that other programs and scripts can reference it.

Most object oriented programming languages allow you to strongly define a type in a class.

PowerShell is built atop the .NET framework, and so, all .NET types can be used in PowerShell.

For instance, to see the .NET type for an integer, we just put the name in brackets:

~~~PowerShell
[int]
~~~

### Strongly Defining Types in PowerShell

You can write a class in PowerShell fairly easily:

~~~PowerShell
class AmIClassy {
    [string] $Name 
    [bool] $HaveManners
    [bool] $HaveTaste
    [int]  $Age    
}
~~~

To learn all about classes, we can consult the much more dry by very thorough built-in about topic by running:

~~~PowerShell
Get-Help about_Classes
~~~

This isn't the only way to strongly define a type in PowerShell.

There is an older, more arcane power of PowerShell.

You can dynamically compile .NET languages with Add-Type.

## Weakly defined types

Another way to treat the idea of a type is a lot less formal and a lot more scriptable.

Instead of writing out a class, we can just have a vague idea of what properties we might need in an object and start cobbling something together.

This is a pretty common convention in PowerShell.  It's often called a property bag.

To make a property bag, we simply cast a hashtable to a `[PSCustomObject]`.

If that hashtable has a PSTypeName property, then we've given it a weakly defined type.

~~~PowerShell
[PSCustomObject]@{
    PSTypeName = 'Person'
    Age     = 41
    Name    = "James"
    City    = "Seattle"
    Start   = "Washington"
    Country = "United States"
}
~~~
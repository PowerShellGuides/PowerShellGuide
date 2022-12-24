Attributes are, well, attributes of an object.

Attributes allow us to add additional information to something in a somewhat standard way.

In PowerShell, there are several places you can provide attributes:

## Attributes on Script Blocks

All Script Blocks in PowerShell can have attributes.

They can be placed above the param block, though there has to actually _be_ a parameter block.

~~~PowerShell
{
    [Reflection.AssemblyMetadata("SomeKey","SomeValue")]
    param()
}.Attributes
~~~

## Attributes on Functions

Since PowerShell functions are script blocks with names, we can add an attribute to a function in the same way.

~~~PowerShell
function ACommandWithAttributes {
    [Reflection.AssemblyMetadata("SomeKey","SomeValue")]
    param()
}

(Get-Command ACommandWithAttributes).ScriptBlock.Attributes
~~~

## Attributes on Parameters

PowerShell Parameters use attributes quite a bit.

In fact, the thing that separates a simple parameter from a smart one is the presence of a `[Parameter]` attribute.

~~~PowerShell
function AFunctionWithMandatoryParameters {
    param(
    [Parameter(Mandatory)]
    $ThisParameterIsMandatory
    )
}
~~~

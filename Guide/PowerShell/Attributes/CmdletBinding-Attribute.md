The `[CmdletBinding]` attribute helps determine how parameters are bound to a given function or ScriptBlock.

It's also the formal dividing line between an advanced function and a simple function.

We can put a `[CmdletBinding]` can be put above the `param()` block in any ScriptBlock.

~~~PowerShell
{
    [CmdletBinding()]
    param()
}
~~~

CmdletBinding is a very useful thing to understand.

Let's take a look at a few common things you can do with it.

## DefaultParameterSetName

Parameter Sets cam be powerful.  They allow your parameters to handle several different sets of input.

Unfortunately, parameter sets can also cause some confusion in parameter binding.  

Setting a DefaultParameterSetName may help clear up that confusion.

~~~PowerShell
function WinLoseOrDraw
{
    [CmdletBinding(DefaultParameterSetName='Draw')]
    param(
    [Parameter(ParameterSetName='Win')]
    [switch]
    $Win,

    [Parameter(ParameterSetName='Lose')]
    [switch]
    $Lose,

    [Parameter(ParameterSetName='Draw')]
    [switch]
    $Draw
    )

    $psCmdlet.ParameterSetName
}

WinLoseOrDraw
~~~


## SupportsShouldProcess / ConfirmImpact

PowerShell can Prompt for Confirmation.  To support this, we use the SupportsShouldProcess property on `[CmdletBinding]`

~~~PowerShell
function shouldI {
    [CmdletBinding(SupportsShouldProcess,ConfirmImpact='High')]
    param($DoThis)

    if ($psCmdlet.ShouldProcess($DoThis)) {
        "You should do this $doThis"
    } else {
        "You should not do this $doThis"
    }
}

shouldI -DoThis "On a boat"
shouldI -DoThis "In a moat"

~~~

## Turning off PositionalBinding

By default, parameters have a position that reflects the order they're declared.

You can turn this behavior off by using `PositionalBinding=$false` in `[CmdletBinding]`.

This is especially useful when combined with a parameter attribute that uses `ValueFromRemainingArguments`

~~~PowerShell
function FreeFormFunction {
    [CmdletBinding(PositionalBinding=$false)]
    param(
    $NamedParameter,

    [Parameter(ValueFromRemainingArguments)]
    $RestOfParameters,

    [Parameter(Position=0)]
    $FirstParameter    
    )

    $psBoundParameters
}

FreeFormFunction a b c d
FreeFormFunction a b c -NamedParameter d
~~~

All attributes are useful, but some are more useful than others.

ValidateScript is one such attribute.

It does what's on the tin.  It validates a script.  Hope that's simple enough to understand. 

## Validating Variables

If it's not, let's just try assigning a variable to some that has a ValidateScript:

~~~PowerShell
[Validatescript({
    ($_ % 2 -as [bool])
})]$ThatsNotOdd = 2
~~~

If you run this, you'll get a rather obtuse message:
`MetadataError: The attribute cannot be added because variable ThatsNotOdd with value 2 would no longer be valid.`

If we want improve the message, we can throw inside of a ValidateScript:

~~~PowerShell
[Validatescript({
    if (-not ($_ % 2 -as [bool])) {
        throw "$_ is not odd"
    }
    $true
})]$ThatsNotOdd = 2
~~~

Now you should see that 2 is not odd.
One could hope you knew this already, but, now you know how to ensure a variable never has anything even in it.

If you don't believe us, go ahead an prove any number you know is odd
~~~PowerShell
[Validatescript({
    if (-not ($_ % 2 -as [bool])) {
        throw "$_ is not odd"
    }
    $true
})]$ThatsOdd = 17
$ThatsOdd
~~~

The other places you'll run into ValidateScript are in Parameters and on Commands.

## Validating Parameters

Parameters tend to be an important part of PowerShell.  So does ease of use.

A good PowerShell developer will make a command that even an idiot could use.
Not that we're saying you have any resemblance.

If you want to make sure a parameter is exactly what you want, you can use a ValidateScript.

~~~PowerShell
function IsOddNumber {
    param(
    [Validatescript({
        if (-not ($_ % 2 -as [bool])) {
            throw "$_ is not odd"
        }
        $true
    })]$Number
    )

    $number
}

IsOddNumber 20
~~~

If you want, there a few other attributes that can validate a parameter.

They are:  ValidatePattern, ValidateRange, ValidateSet.

## Validating Commands

PowerShell can do many amazing things.  One of them is allowing you to put attributes almost anywhere.

The first example in this showed us using ValidateScript on variable.  The second showed us using ValidateScript on a parameter.

Both of these automatically validate a value, because they're both effectively the same thing.  A parameter will become a variable.

But you can have attributes anywhere, and you can treat them however you'd like.

ValidateScript can be used on a function or an External Script.

When you have a validate attribute on a command, it doesn't do anything unless it's called.

Then, it could give you some idea as to if running the command would be a bright idea.

After all, you wouldn't want to use a device an invalid way, would you?






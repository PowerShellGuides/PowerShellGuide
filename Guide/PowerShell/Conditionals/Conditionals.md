Nearly everything you might do has a condition.

For instance, _if_ it's cold outside, you might wear a coat.

Every language has conditionals.

In PowerShell, as in many languages, a conditional is represented by the keyword "if".

~~~PowerShell
if ($ItsColdOutside)
{
    "I just can't stay"
}
~~~

Coniditionals are a basic part of programming.  As in _if_ you don't learn conditionals, you'll never learn to code.

In PowerShell, If will be followed by a condition (in parenthesis), and an action (in curly braces).

## What else?

Coniditionals wouldn't be too much use if you could only handle one condition.

So, PowerShell (and almost every language), if can be followed by an _else_ keyword.

~~~PowerShell
if ($ItsColdOutside)
{
    "I just can't stay"
}
else
{
    "I can stay"
}
~~~

## Do I Have To Choose Just One?

Coniditionals also wouldn't be much use if you could only handle two conditions, either.

In a given _if_, you can have as many _elseif_ conditions as you'd like.

~~~PowerShell
if ($ItsColdOutside)
{
    "I just can't stay"
}
elseif ($My.Friends -notcontains 'You')
{
    "I won't stay"
}
elseif ($My.Friends -contains 'You')
{
    "I could stay"
}
else
{
    "I can stay"
}
~~~

## Switching it up

If isn't the only conditional in PowerShell (or most languages).

PowerShell also has a _switch_ keyword.

A switch is followed by an expression.  We switch what we do based off of the output of the expression.

Let's start simple:

~~~PowerShell
$temperature = 32
switch ($temperature) {
    32 { "It's Freezing (in Fahrenheit)" }
    0 { "It's Freezing (in Celsius)" }    
}
~~~

Switch statements can get a lot more complicated than that, of course.

You should keep reading your trust PowerShell Guide, or consult the about topics.
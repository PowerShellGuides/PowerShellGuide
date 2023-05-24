At the other end of the spectrum from a Strongly Typed Language is a Weakly Typed Language.

Despite the formal name, this does not mean that a weakly typed language is especially weak.

In a weakly typed language, if it wants a specific type, it will try to cast or convert it.

Some people have moral judgements about this type of behavior, which is possibly why one of the other terms for a weakly typed language is a "type promiscuous" language.

PowerShell is especially promiscuous.

## Automatic Casting

PowerShell is very good at converting things, and will happily help you make one type into another, if it can determine how.

This is especially helpful in handling parameters.  A simple example is providing a `[DateTime]` parameter:

~~~PowerShell
function Get-TimeUntil([DateTime]$Then)
{
    ($Then - [DateTime]::now)
}

Get-TimeUntil "5:00 PM" # Will turn this string into a datetime (at least in English)
~~~


## Truthy and Falsy

Another feature commonly found in weakly typed language is the idea of something being "truthy" (or "falsy").

Truthy and falsy mean something is "likey to be true" or "likely to be false".

For example:

~~~PowerShell
if (0) {
    "This will never run, because 0 is falsy"
}

if (1.1) {
    "This will run, because 1 is truthy"
}

if (@()) {
    "This will not run, because an empty list is falsy"
}

if (@(1)) {
    "This will run, because a non-empty list is truthy"
}
~~~

Most of the time, type promiscuity is your friend.

A few times, it might mess with your head and heart, which is probably where the epitaph comes from.

### Truthy and Falsy Failures

One of these might already jump out at you.

What if you wanted a 0 to be "true"?

You can always make a more explicit if:

~~~PowerShell
if (0) {
    "this will not run, because 0 is falsy"
}
if ($null -ne 0) {
    "this will run fine, because 0 is not null"
}
~~~

You might be scratching your head a bit at the way that statement is written.

It will make more sense when we consider how lists work in PowerShell

When a list is on the left side of an operator, most operators will run on every item in the list

~~~PowerShell
if ("duck", "duck", "goose" -eq "goose") {
    "This is truthy because 'duck','duck','goose' has 'goose' in it."
}
~~~

If we want to avoid this behavior, we can put our list on the right instead
~~~PowerShell
if ("goose" -eq "duck","duck","goose")  {
    "This is falsy because 'goose' is not 'duck','duck','goose'"
}
~~~


### Testing Promiscuity

In case you want to see how PowerShell would handle conversion, you can use the static method `[System.Management.Automation.LanguagePrimitives]::ConvertTo`

~~~PowerShell
[System.Management.Automation.LanguagePrimitives]::ConvertTo("5:00 PM", [DateTime])
~~~

This can help you see exactly how PowerShell would convert any object.  Try this out a few ways and see just how strong a weakly typed language can be.
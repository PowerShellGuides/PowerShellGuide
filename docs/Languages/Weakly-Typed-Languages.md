---

alias: 
- Weakly Typed Language
- Type Promiscuous
- Type Promiscuity
- PowerShell is Promiscuous
coursename: Understanding Languages
level: 103
title: Weakly Typed Languages

layout: default
---

At the other end of the spectrum from a [Strongly Typed Language](/Languages/Strongly-Typed-Languages) is a Weakly Typed Language.

Despite the formal name, this does not mean that a weakly typed language is especially weak.

In a weakly typed language, if it wants a specific [type](/PowerShell/Types), it will try to cast or convert it.

Some people have moral judgements about this [type](/PowerShell/Types) of behavior, which is possibly why one of the other terms for a weakly typed language is a "[type](/PowerShell/Types) promiscuous" language.

[PowerShell](/PowerShell) is especially promiscuous.

## Automatic Casting

[PowerShell](/PowerShell) is very good at converting things, and will happily [help](/PowerShell/Help) you make one [type](/PowerShell/Types) into another, if it can determine how.

This is especially helpful in handling [parameters](/PowerShell/Parameters).  A simple example is providing a `[DateTime]` parameter:

<pre><br/><span class='Verbose'>function</span>&nbsp;<span class='Verbose'>Get-TimeUntil</span><span class='Magenta'>(</span><span class='Progress'>[DateTime]</span><span class='Warning'>$Then</span><span class='Magenta'>)</span><br/><span class='Magenta'>{</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Magenta'>(</span><span class='Warning'>$Then</span>&nbsp;<span class='Magenta'>-</span>&nbsp;<span class='Progress'>[DateTime]</span><span class='Magenta'>::</span><span class='Output'>now</span><span class='Magenta'>)</span><br/><span class='Magenta'>}</span><br/><br/><span class='Warning'>Get-TimeUntil</span>&nbsp;<span class='Verbose'>"5:00 PM"</span>&nbsp;<span class='Success'># Will turn this string into a datetime (at least in English)</span><br/></pre>


## Truthy and Falsy

Another feature commonly found in weakly typed language is the idea of something being "truthy" (or "falsy").

Truthy and falsy mean something is "likey to be true" or "likely to be false".

For example:

<pre><br/><span class='Verbose'>if</span>&nbsp;<span class='Magenta'>(</span><span class='Output'>0</span><span class='Magenta'>)</span>&nbsp;<span class='Magenta'>{</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Verbose'>"This will never run, because 0 is falsy"</span><br/><span class='Magenta'>}</span><br/><br/><span class='Verbose'>if</span>&nbsp;<span class='Magenta'>(</span><span class='Output'>1.1</span><span class='Magenta'>)</span>&nbsp;<span class='Magenta'>{</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Verbose'>"This will run, because 1 is truthy"</span><br/><span class='Magenta'>}</span><br/><br/><span class='Verbose'>if</span>&nbsp;<span class='Magenta'>(</span><span class='Magenta'>@(</span><span class='Magenta'>)</span><span class='Magenta'>)</span>&nbsp;<span class='Magenta'>{</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Verbose'>"This will not run, because an empty list is falsy"</span><br/><span class='Magenta'>}</span><br/><br/><span class='Verbose'>if</span>&nbsp;<span class='Magenta'>(</span><span class='Magenta'>@(</span><span class='Output'>1</span><span class='Magenta'>)</span><span class='Magenta'>)</span>&nbsp;<span class='Magenta'>{</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Verbose'>"This will run, because a non-empty list is truthy"</span><br/><span class='Magenta'>}</span><br/></pre>

Most of the time, [type](/PowerShell/Types) promiscuity is your friend.

A few times, it might mess with your head and heart, which is probably where the epitaph comes from.

### Truthy and Falsy Failures

One of these might already jump out at you.

What if you wanted a 0 to be "true"?

You can always make a more explicit if:

<pre><br/><span class='Verbose'>if</span>&nbsp;<span class='Magenta'>(</span><span class='Output'>0</span><span class='Magenta'>)</span>&nbsp;<span class='Magenta'>{</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Verbose'>"this will not run, because 0 is falsy"</span><br/><span class='Magenta'>}</span><br/><span class='Verbose'>if</span>&nbsp;<span class='Magenta'>(</span><span class='Warning'>$null</span>&nbsp;<span class='Magenta'>-ne</span>&nbsp;<span class='Output'>0</span><span class='Magenta'>)</span>&nbsp;<span class='Magenta'>{</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Verbose'>"this will run fine, because 0 is not null"</span><br/><span class='Magenta'>}</span><br/></pre>

You might be scratching your head a bit at the way that statement is written.

It will make more sense when we consider how [lists](/PowerShell/Types/Lists) work in [PowerShell](/PowerShell)

When a list is on the left side of an operator, most [operators](/PowerShell/Operators) will run on every item in the list

<pre><br/><span class='Verbose'>if</span>&nbsp;<span class='Magenta'>(</span><span class='Verbose'>"duck"</span><span class='Magenta'>,</span>&nbsp;<span class='Verbose'>"duck"</span><span class='Magenta'>,</span>&nbsp;<span class='Verbose'>"goose"</span>&nbsp;<span class='Magenta'>-eq</span>&nbsp;<span class='Verbose'>"goose"</span><span class='Magenta'>)</span>&nbsp;<span class='Magenta'>{</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Verbose'>"This is truthy because 'duck','duck','goose' has 'goose' in it."</span><br/><span class='Magenta'>}</span><br/></pre>

If we want to avoid this behavior, we can put our list on the right instead
<pre><br/><span class='Verbose'>if</span>&nbsp;<span class='Magenta'>(</span><span class='Verbose'>"goose"</span>&nbsp;<span class='Magenta'>-eq</span>&nbsp;<span class='Verbose'>"duck"</span><span class='Magenta'>,</span><span class='Verbose'>"duck"</span><span class='Magenta'>,</span><span class='Verbose'>"goose"</span><span class='Magenta'>)</span>&nbsp;&nbsp;<span class='Magenta'>{</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Verbose'>"This is falsy because 'goose' is not 'duck','duck','goose'"</span><br/><span class='Magenta'>}</span><br/></pre>


### Testing Promiscuity

In case you want to see how [PowerShell](/PowerShell) would handle conversion, you can use the static method `[System.Management.Automation.LanguagePrimitives]::ConvertTo`

<pre><br/><span class='Progress'>[System.Management.Automation.LanguagePrimitives]</span><span class='Magenta'>::</span><span class='Output'>ConvertTo</span><span class='Magenta'>(</span><span class='Verbose'>"5:00 PM"</span><span class='Magenta'>,</span>&nbsp;<span class='Progress'>[DateTime]</span><span class='Magenta'>)</span><br/></pre>

This can [help](/PowerShell/Help) you see exactly how [PowerShell](/PowerShell) would convert any object.  Try this out a few ways and see just how strong a weakly typed language can be.

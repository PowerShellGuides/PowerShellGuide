---

alias: Validate Script
coursename: Working with Attributes
level: 202
title: ValidateScript

layout: default
---

All [attributes](/PowerShell/Attributes) are useful, but some are more useful than others.

ValidateScript is one such attribute.

It does what's on the tin.  It validates a script.  Hope that's simple enough to understand. 

## Validating [Variables](/PowerShell/Variables)

If it's not, let's just try assigning a [variable](/PowerShell/Variables) to some that has a ValidateScript:

<pre><br/><span class='Magenta'>[</span><span class='Output'>Validatescript</span><span class='Magenta'>(</span><span class='Magenta'>{</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Magenta'>(</span><span class='Warning'>$_</span>&nbsp;<span class='Magenta'>%</span>&nbsp;<span class='Output'>2</span>&nbsp;<span class='Magenta'>-as</span>&nbsp;<span class='Progress'>[bool]</span><span class='Magenta'>)</span><br/><span class='Magenta'>}</span><span class='Magenta'>)</span><span class='Magenta'>]</span><span class='Warning'>$ThatsNotOdd</span>&nbsp;<span class='Magenta'>=</span>&nbsp;<span class='Output'>2</span><br/></pre>

If you run this, you'll get a rather obtuse message:
`MetadataError: The attribute cannot be added because [variable](/PowerShell/Variables) ThatsNotOdd with value 2 would no longer be valid.`

If we want improve the message, we can throw inside of a ValidateScript:

<pre><br/><span class='Magenta'>[</span><span class='Output'>Validatescript</span><span class='Magenta'>(</span><span class='Magenta'>{</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Verbose'>if</span>&nbsp;<span class='Magenta'>(</span><span class='Magenta'>-not</span>&nbsp;<span class='Magenta'>(</span><span class='Warning'>$_</span>&nbsp;<span class='Magenta'>%</span>&nbsp;<span class='Output'>2</span>&nbsp;<span class='Magenta'>-as</span>&nbsp;<span class='Progress'>[bool]</span><span class='Magenta'>)</span><span class='Magenta'>)</span>&nbsp;<span class='Magenta'>{</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class='Verbose'>throw</span>&nbsp;<span class='Verbose'>"$_ is not odd"</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Magenta'>}</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Warning'>$true</span><br/><span class='Magenta'>}</span><span class='Magenta'>)</span><span class='Magenta'>]</span><span class='Warning'>$ThatsNotOdd</span>&nbsp;<span class='Magenta'>=</span>&nbsp;<span class='Output'>2</span><br/></pre>

Now you should see that 2 is not odd.
One could hope you knew this already, but, now you know how to ensure a [variable](/PowerShell/Variables) never has anything even in it.

If you don't believe us, go ahead an prove any number you know is odd
<pre><br/><span class='Magenta'>[</span><span class='Output'>Validatescript</span><span class='Magenta'>(</span><span class='Magenta'>{</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Verbose'>if</span>&nbsp;<span class='Magenta'>(</span><span class='Magenta'>-not</span>&nbsp;<span class='Magenta'>(</span><span class='Warning'>$_</span>&nbsp;<span class='Magenta'>%</span>&nbsp;<span class='Output'>2</span>&nbsp;<span class='Magenta'>-as</span>&nbsp;<span class='Progress'>[bool]</span><span class='Magenta'>)</span><span class='Magenta'>)</span>&nbsp;<span class='Magenta'>{</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class='Verbose'>throw</span>&nbsp;<span class='Verbose'>"$_ is not odd"</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Magenta'>}</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Warning'>$true</span><br/><span class='Magenta'>}</span><span class='Magenta'>)</span><span class='Magenta'>]</span><span class='Warning'>$ThatsOdd</span>&nbsp;<span class='Magenta'>=</span>&nbsp;<span class='Output'>17</span><br/><span class='Warning'>$ThatsOdd</span><br/></pre>

The other places you'll run into ValidateScript are in [Parameters](/PowerShell/Parameters) and on [Commands](/PowerShell/Commands).

## Validating [Parameters](/PowerShell/Parameters)

[Parameters](/PowerShell/Parameters) tend to be an important part of [PowerShell](/PowerShell).  So does ease of use.

A good [PowerShell](/PowerShell) developer will make a [command](/PowerShell/Commands) that even an idiot could use.
Not that we're saying you have any resemblance.

If you want to make sure a [parameter](/PowerShell/Parameters) is exactly what you want, you can use a ValidateScript.

<pre><br/><span class='Verbose'>function</span>&nbsp;<span class='Verbose'>IsOddNumber</span>&nbsp;<span class='Magenta'>{</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Verbose'>param</span><span class='Magenta'>(</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Magenta'>[</span><span class='Output'>Validatescript</span><span class='Magenta'>(</span><span class='Magenta'>{</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class='Verbose'>if</span>&nbsp;<span class='Magenta'>(</span><span class='Magenta'>-not</span>&nbsp;<span class='Magenta'>(</span><span class='Warning'>$_</span>&nbsp;<span class='Magenta'>%</span>&nbsp;<span class='Output'>2</span>&nbsp;<span class='Magenta'>-as</span>&nbsp;<span class='Progress'>[bool]</span><span class='Magenta'>)</span><span class='Magenta'>)</span>&nbsp;<span class='Magenta'>{</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class='Verbose'>throw</span>&nbsp;<span class='Verbose'>"$_ is not odd"</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class='Magenta'>}</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class='Warning'>$true</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Magenta'>}</span><span class='Magenta'>)</span><span class='Magenta'>]</span><span class='Warning'>$Number</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Magenta'>)</span><br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Warning'>$number</span><br/><span class='Magenta'>}</span><br/><br/><span class='Warning'>IsOddNumber</span>&nbsp;<span class='Output'>20</span><br/></pre>

If you want, there a few other [attributes](/PowerShell/Attributes) that can validate a [parameter](/PowerShell/Parameters).

They are:  ValidatePattern, ValidateRange, [ValidateSet](/PowerShell/Attributes/ValidateSet).

## Validating [Commands](/PowerShell/Commands)

[PowerShell](/PowerShell) can do many amazing things.  One of them is allowing you to put [attributes](/PowerShell/Attributes) almost anywhere.

The first example in this showed us using ValidateScript on [variable](/PowerShell/Variables).  The second showed us using ValidateScript on a [parameter](/PowerShell/Parameters).

Both of these automatically validate a value, because they're both effectively the same thing.  A [parameter](/PowerShell/Parameters) will become a [variable](/PowerShell/Variables).

But you can have [attributes](/PowerShell/Attributes) anywhere, and you can treat them however you'd like.

ValidateScript can be used on a [function](/PowerShell/Functions) or an External Script.

When you have a validate attribute on a [command](/PowerShell/Commands), it doesn't do anything unless it's called.

Then, it could give you some idea as to if running the [command](/PowerShell/Commands) would be a bright idea.

After all, you wouldn't want to use a device an invalid way, would you?

---

title: Arithmetic

layout: default
---

Computers exist, at least partially, so we don't have to calculating by hand.

[PowerShell](/PowerShell) has a fairly standard set of these: `+`, `-`, `*`, `/`, `%`

In English, that is: Plus, Minus, Multiply, Divide, and Modulus (Remainder).

These [operators](/PowerShell/Operators) are about the same as in any [programming language](/Languages/Programming-Languages).

In case one needs a few simple examples to understand the point:

<pre><br/><span class='Output'>1</span>&nbsp;<span class='Magenta'>+</span>&nbsp;<span class='Output'>1</span>&nbsp;<span class='Success'># is two</span><br/><span class='Output'>2</span>&nbsp;<span class='Magenta'>*</span>&nbsp;<span class='Output'>2</span>&nbsp;<span class='Success'># is four</span><br/><span class='Output'>2</span>&nbsp;<span class='Magenta'>-</span>&nbsp;<span class='Output'>1</span>&nbsp;<span class='Success'># is 1</span><br/><span class='Output'>2</span>&nbsp;<span class='Magenta'>/</span>&nbsp;<span class='Output'>2</span>&nbsp;<span class='Success'># is 1</span><br/><span class='Output'>3</span>&nbsp;<span class='Magenta'>%</span>&nbsp;<span class='Output'>2</span>&nbsp;<span class='Success'># is 1</span><br/><span class='Output'>2</span>&nbsp;<span class='Magenta'>/</span>&nbsp;<span class='Output'>0</span>&nbsp;<span class='Success'># is an error!</span><br/></pre>

[PowerShell](/PowerShell) earns no major points for creativity here.

Because [PowerShell](/PowerShell) is built in of C#, all of it's infrastructure for [operators](/PowerShell/Operators) comes right along with it.

However, it's [type promiscuity](/Languages/Weakly-Typed-Languages) comes in handy.

## Adding Different [Types](/PowerShell/Types) Together

When combining things of different [types](/PowerShell/Types), [PowerShell](/PowerShell) will try to make things the [type](/PowerShell/Types) on the left side of the operation.

The right side will be coerced into the left side's [type](/PowerShell/Types).

Thus we can do:

<pre><br/><span class='Progress'>[DateTime]</span><span class='Magenta'>::</span><span class='Output'>Now</span>&nbsp;<span class='Magenta'>+</span>&nbsp;<span class='Verbose'>"00:10:00"</span>&nbsp;<span class='Success'># This will output a time ten minutes from now</span><br/></pre>

## Adding Hastables

One other thing we can add together in [PowerShell](/PowerShell) is hashtables

<pre><br/><span class='Magenta'>@{</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Output'>a</span>&nbsp;<span class='Magenta'>=</span>&nbsp;<span class='Verbose'>'a'</span><br/><span class='Magenta'>}</span>&nbsp;<span class='Magenta'>+</span>&nbsp;<span class='Magenta'>@{</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Output'>b</span>&nbsp;<span class='Magenta'>=</span>&nbsp;<span class='Verbose'>'b'</span><br/><span class='Magenta'>}</span><br/></pre>

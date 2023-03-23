---

alias: Type
title: Types

layout: default
---

Types are, well, types of objects.

That is to say, a type describes the properties, methods, and events of an object.

Types run the gamut between strongly defined and weakly defined.

## Strongly Defined Types

A strongly defined type has a very particular idea of what it is and what it can do.

This definition is written in an object oriented [programming language](/Languages/Programming-Languages).

It is often compiled into a file so that other programs and [scripts](/PowerShell/Scripts) can reference it.

Most object oriented [programming languages](/Languages/Programming-Languages) allow you to strongly define a type in a class.

[PowerShell](/PowerShell) is built atop the [.NET](/PowerShell/Concepts/PowerShell-NET-and-Everything) framework, and so, all [.NET](/PowerShell/Concepts/PowerShell-NET-and-Everything) types can be used in [PowerShell](/PowerShell).

For instance, to see the [.NET](/PowerShell/Concepts/PowerShell-NET-and-Everything) type for an integer, we just put the name in brackets:

<pre><br/><span class='Progress'>[int]</span><br/></pre>

### Strongly Defining Types in [PowerShell](/PowerShell)

You can write a class in [PowerShell](/PowerShell) fairly easily:

<pre><br/><span class='Verbose'>class</span>&nbsp;<span class='Progress'>AmIClassy</span>&nbsp;<span class='Magenta'>{</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Progress'>[string]</span>&nbsp;<span class='Warning'>$Name</span>&nbsp;<br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Progress'>[bool]</span>&nbsp;<span class='Warning'>$HaveManners</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Progress'>[bool]</span>&nbsp;<span class='Warning'>$HaveTaste</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Progress'>[int]</span>&nbsp;&nbsp;<span class='Warning'>$Age</span>&nbsp;&nbsp;&nbsp;&nbsp;<br/><span class='Magenta'>}</span><br/></pre>

To learn all about classes, we can consult the much more dry by very thorough built-in about topic by running:

<pre><br/><span class='Warning'>Get-Help</span>&nbsp;<span class='Verbose'>about_Classes</span><br/></pre>

This isn't the only way to strongly define a type in [PowerShell](/PowerShell).

There is an older, more arcane power of [PowerShell](/PowerShell).

You can dynamically compile [.NET](/PowerShell/Concepts/PowerShell-NET-and-Everything) languages with Add-Type.

## Weakly defined types

Another way to treat the idea of a type is a lot less formal and a lot more scriptable.

Instead of writing out a class, we can just have a vague idea of what properties we might need in an object and start cobbling something together.

This is a pretty common convention in [PowerShell](/PowerShell).  It's often called a property bag.

To make a property bag, we simply cast a hashtable to a `[PSCustomObject]`.

If that hashtable has a PSTypeName property, then we've given it a weakly defined type.

<pre><br/><span class='Progress'>[PSCustomObject]</span><span class='Magenta'>@{</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Output'>PSTypeName</span>&nbsp;<span class='Magenta'>=</span>&nbsp;<span class='Verbose'>'Person'</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Output'>Age</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class='Magenta'>=</span>&nbsp;<span class='Output'>41</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Output'>Name</span>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Magenta'>=</span>&nbsp;<span class='Verbose'>"James"</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Output'>City</span>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Magenta'>=</span>&nbsp;<span class='Verbose'>"Seattle"</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Output'>Start</span>&nbsp;&nbsp;&nbsp;<span class='Magenta'>=</span>&nbsp;<span class='Verbose'>"Washington"</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Output'>Country</span>&nbsp;<span class='Magenta'>=</span>&nbsp;<span class='Verbose'>"United States"</span><br/><span class='Magenta'>}</span><br/></pre>

---

alias: 
- -as
- -is
- -isnot
skipreference: 
- Type
- Types
title: Type Operators

layout: default
---

There are only a few type [operators](/PowerShell/Operators) in [PowerShell](/PowerShell), but they are pretty useful.

They are `-is`,`-isnot`, and `-as`

## -Is or -IsNot

`-is` checks to see if an object is a type.

<pre><br/><span class='Output'>1</span>&nbsp;<span class='Magenta'>-is</span>&nbsp;<span class='Progress'>[int]</span>&nbsp;<span class='Success'># returns true, because a number without decimals is an int</span><br/></pre>


`-isnot` checks to see if an object is not a type.

<pre><br/><span class='Verbose'>"1"</span>&nbsp;<span class='Magenta'>-isnot</span>&nbsp;<span class='Progress'>[int]</span>&nbsp;<span class='Success'># returns true, because a string is not an int</span><br/></pre>

## -As

Contrary to what some short creatures imbued with the force might say, there is in fact a try.

Using `-as`, we can try to convert an object to a given type

<pre><br/><span class='Verbose'>"1"</span>&nbsp;<span class='Magenta'>-as</span>&nbsp;<span class='Progress'>[int]</span>&nbsp;<span class='Success'># returns 1 as an integer</span><br/></pre>

You can see if check was successful, and write code that reads like a commandment, by using `-as` and `-is` together.

<pre><br/><span class='Verbose'>"1"</span>&nbsp;<span class='Magenta'>-as</span>&nbsp;<span class='Progress'>[int]</span>&nbsp;<span class='Magenta'>-is</span>&nbsp;<span class='Progress'>[int]</span>&nbsp;<span class='Success'># Returns true, because 1 (the string) can become an int</span><br/></pre>

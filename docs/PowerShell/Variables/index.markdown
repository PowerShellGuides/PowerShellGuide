---

alias: Variable
title: Variables

layout: default
---

## What are Variables?

Variables are part of every language (or at least every language worth it's salt).

Variables store information in bit of memory, much like you might remember where you last put your car keys.

Since a computer is less likely to forget things than you are, assigning a variable is probably than trying to remember something.

In [PowerShell](/PowerShell), variables start with `$`.  For instance, if I wanted to keep track of my car keys location, I could simply say:

<pre><br/><span class='Warning'>$CarKeysAre</span>&nbsp;<span class='Magenta'>=</span>&nbsp;<span class='Verbose'>'On The Desk'</span><br/></pre>

Just like in life, variables are bound to change.  That's why they're called variables.

You're just bound to run into variables while scripting [PowerShell](/PowerShell).

If you're not using variables, you're too constant of a person and we wouldn't like to know you.

## Variable [Types](/PowerShell/Types)

Variables in [PowerShell](/PowerShell) can be either strongly or weakly typed.

This is a somewhat fancy technical way of saying that a variable in [PowerShell](/PowerShell) can be a specific [type](/PowerShell/Types) or anything at all.

When a variable is created in [PowerShell](/PowerShell), it is given a [type](/PowerShell/Types).

By default, that will be whatever [type](/PowerShell/Types) you put into it.

So when we say:

<pre><br/><span class='Warning'>$CarKeysAre</span>&nbsp;<span class='Magenta'>=</span>&nbsp;<span class='Verbose'>'On The Desk'</span><br/></pre>

What's happenning is that we're creating a slot in memory and assigning it a string.

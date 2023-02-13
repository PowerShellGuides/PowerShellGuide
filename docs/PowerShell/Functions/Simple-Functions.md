---

title: Simple Functions

layout: default
---

In the beginning (of PowerShell), there was the Cmdlet, the [Function](/PowerShell/Functions), and the Filter.

Cmdlets are compiled by developers and could do more than the simple [functions](/PowerShell/Functions) of [PowerShell](/PowerShell) V1.

The first scripters saw this, and said it was not good.

Thus, one of [PowerShell](/PowerShell) V2s many great leaps forward was the creation of the advanced [function](/PowerShell/Functions).

Advanced [functions](/PowerShell/Functions) can do anything a Cmdlet can do, and more.

This makes simple [functions](/PowerShell/Functions) the exception, not the rule.

A [function](/PowerShell/Functions) is simple if it does not have a [CmdletBinding attribute](/PowerShell/Attributes/CmdletBinding-Attribute) or any [Parameter](/PowerShell/Parameters) [attributes](/PowerShell/Attributes).

This will not declare any automatic [parameters](/PowerShell/Parameters), and will allow any number of unnamed arguments to a [function](/PowerShell/Functions).

## A Really Simple [Function](/PowerShell/Functions)

Let's start with a really simple [function](/PowerShell/Functions) that just outputs it's arguments.

<pre><br/><span class='Verbose'>function</span>&nbsp;<span class='Verbose'>SayMyArgs</span>&nbsp;<span class='Magenta'>{</span><br/>&nbsp;&nbsp;&nbsp;<span class='Warning'>$args</span><br/><span class='Magenta'>}</span><br/><br/><span class='Warning'>SayMyArgs</span>&nbsp;<span class='Output'>1</span>&nbsp;<span class='Output'>2</span>&nbsp;<span class='Output'>3</span>&nbsp;<span class='Output'>4</span><br/></pre>

If you use [Get-Command](/PowerShell/Commands/Get-Command) to take a look at `SayMyArgs`, you'll notice that it doesn't have any [parameters](/PowerShell/Parameters).

That's how we know our [function](/PowerShell/Functions) is simple.

## Handling [Object Pipeline](/PowerShell/Concepts/The-Object-Pipeline) $input

Just because a [function](/PowerShell/Functions) isn't smart doesn't mean it's stupid (as far as [the object pipeline](/PowerShell/Concepts/The-Object-Pipeline) is concerned).

The automatic [variable](/PowerShell/Variables) `$input` contains the input provided to the [command](/PowerShell/Commands).

It's also why you can't have a [parameter](/PowerShell/Parameters) named input, in case you were wondering.

<pre><br/><span class='Verbose'>function</span>&nbsp;<span class='Verbose'>IPipedWhat</span>&nbsp;<span class='Magenta'>{</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Warning'>$input</span><br/><span class='Magenta'>}</span><br/><br/><span class='Output'>1</span><span class='Magenta'>..</span><span class='Output'>5</span>&nbsp;<span class='Magenta'>|</span>&nbsp;<span class='Warning'>IPipedWhat</span><br/></pre>

If a [function](/PowerShell/Functions) does not have any named blocks, the body of the [function](/PowerShell/Functions) will run when the [pipeline](/PowerShell/Concepts/The-Object-Pipeline) ends.

## Named Blocks Do Not Make a [Function](/PowerShell/Functions) Smart

Named blocks let even a simple [function](/PowerShell/Functions) handle the [pipeline](/PowerShell/Concepts/The-Object-Pipeline) more properly.

We can use a process block to handle objects as they come in.

If an object was piped into a [function](/PowerShell/Functions), it will be in the automatic [variable](/PowerShell/Variables) `$_`

<pre><br/><span class='Verbose'>function</span>&nbsp;<span class='Verbose'>WhatDidIPipeAgain</span>&nbsp;<span class='Magenta'>{</span>&nbsp;&nbsp;&nbsp;&nbsp;<br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Verbose'>process</span>&nbsp;<span class='Magenta'>{</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class='Warning'>$_</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Magenta'>}</span><br/><span class='Magenta'>}</span><br/><br/><span class='Output'>1</span><span class='Magenta'>..</span><span class='Output'>2</span>&nbsp;<span class='Magenta'>|</span>&nbsp;<span class='Warning'>WhatDidIPipeAgain</span><br/></pre>

---

Alias: 
- ScriptBlocks
- Script Block
- Script Blocks
- Script Blocks in PowerShell
- PowerShell Script Blocks
- PowerShell ScriptBlocks
- PowerShell ScriptBlock
title: ScriptBlock

layout: default
---

ScriptBlocks are, well, blocks of [PowerShell](/PowerShell).

Getting a little nerdy, ScriptBlocks are the [type](/PowerShell/Types) [PowerShell](/PowerShell) uses to store its code before it runs.

Let's start by defining a variable containing a ScriptBlock that says "Don't Panic!":

<pre><br/><span class='Warning'>$DontPanic</span>&nbsp;<span class='Magenta'>=</span>&nbsp;<span class='Magenta'>{</span>&nbsp;<span class='Verbose'>"Don't Panic!"</span>&nbsp;<span class='Magenta'>}</span><br/></pre>

If you ran that, you might notice it didn't output anything.

That's because declaring a ScriptBlock does not run the ScriptBlock.

You can call a ScriptBlock with either of the call operators (`&` or `.`)

<pre><br/><span class='Warning'>$DontPanic</span>&nbsp;<span class='Magenta'>=</span>&nbsp;<span class='Magenta'>{</span>&nbsp;<span class='Verbose'>"Don't Panic!"</span>&nbsp;<span class='Magenta'>}</span><br/><span class='Magenta'>&</span>&nbsp;<span class='Warning'>$DontPanic</span><br/></pre>

## ScriptBlock structure

ScriptBlocks start and end with curly braces.

Within these curly braces, we can define (in order):

* [Inline Help](/PowerShell/Help/Inline-Help)
* Attributes
* Parameters
* Dynamic Parameters (with the dynamicParam block)
* What happens when the command starts (with the begin block)
* When happens when an object comes thru the [pipeline](/PowerShell/Concepts/The-Object-Pipeline) (with the process block)
* When happens when the command ends (with the end block)

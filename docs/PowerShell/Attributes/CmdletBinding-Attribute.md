---

alias: 
- Cmdlet Binding
- CmdletBinding
- Cmdlet Binding Attribute
coursename: Working with Attributes
level: 201
title: CmdletBinding Attribute

layout: default
---

The `[CmdletBinding]` attribute helps determine how [parameters](/PowerShell/Parameters) are bound to a given [function](/PowerShell/Functions) or [ScriptBlock](/PowerShell/ScriptBlock).

It's also the formal dividing line between an advanced [function](/PowerShell/Functions) and a simple [function](/PowerShell/Functions).

We can put a `[CmdletBinding]` can be put above the `param()` block in any [ScriptBlock](/PowerShell/ScriptBlock).

<pre><br/><span class='Magenta'>{</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Magenta'>[</span><span class='Output'>CmdletBinding</span><span class='Magenta'>(</span><span class='Magenta'>)</span><span class='Magenta'>]</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Verbose'>param</span><span class='Magenta'>(</span><span class='Magenta'>)</span><br/><span class='Magenta'>}</span><br/></pre>

CmdletBinding is a very useful thing to understand.

Let's take a look at a few common things you can do with it.

## DefaultParameterSetName

[Parameter](/PowerShell/Parameters) Sets cam be powerful.  They allow your [parameters](/PowerShell/Parameters) to handle several different sets of input.

Unfortunately, [parameter](/PowerShell/Parameters) sets can also cause some confusion in [parameter](/PowerShell/Parameters) binding.  

Setting a DefaultParameterSetName may help clear up that confusion.

<pre><br/><span class='Verbose'>function</span>&nbsp;<span class='Verbose'>WinLoseOrDraw</span><br/><span class='Magenta'>{</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Magenta'>[</span><span class='Output'>CmdletBinding</span><span class='Magenta'>(</span><span class='Output'>DefaultParameterSetName</span><span class='Magenta'>=</span><span class='Verbose'>'Draw'</span><span class='Magenta'>)</span><span class='Magenta'>]</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Verbose'>param</span><span class='Magenta'>(</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Magenta'>[</span><span class='Output'>Parameter</span><span class='Magenta'>(</span><span class='Output'>ParameterSetName</span><span class='Magenta'>=</span><span class='Verbose'>'Win'</span><span class='Magenta'>)</span><span class='Magenta'>]</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Progress'>[switch]</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Warning'>$Win</span><span class='Magenta'>,</span><br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Magenta'>[</span><span class='Output'>Parameter</span><span class='Magenta'>(</span><span class='Output'>ParameterSetName</span><span class='Magenta'>=</span><span class='Verbose'>'Lose'</span><span class='Magenta'>)</span><span class='Magenta'>]</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Progress'>[switch]</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Warning'>$Lose</span><span class='Magenta'>,</span><br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Magenta'>[</span><span class='Output'>Parameter</span><span class='Magenta'>(</span><span class='Output'>ParameterSetName</span><span class='Magenta'>=</span><span class='Verbose'>'Draw'</span><span class='Magenta'>)</span><span class='Magenta'>]</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Progress'>[switch]</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Warning'>$Draw</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Magenta'>)</span><br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Warning'>$psCmdlet</span><span class='Magenta'>.</span><span class='Output'>ParameterSetName</span><br/><span class='Magenta'>}</span><br/><br/><span class='Warning'>WinLoseOrDraw</span><br/></pre>


## SupportsShouldProcess / ConfirmImpact

[PowerShell](/PowerShell) can [Prompt for Confirmation](/PowerShell/Concepts/Prompt-For-Confirmation).  To support this, we use the SupportsShouldProcess property on `[CmdletBinding]`

<pre><br/><span class='Verbose'>function</span>&nbsp;<span class='Verbose'>shouldI</span>&nbsp;<span class='Magenta'>{</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Magenta'>[</span><span class='Output'>CmdletBinding</span><span class='Magenta'>(</span><span class='Output'>SupportsShouldProcess</span><span class='Magenta'>,</span><span class='Output'>ConfirmImpact</span><span class='Magenta'>=</span><span class='Verbose'>'High'</span><span class='Magenta'>)</span><span class='Magenta'>]</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Verbose'>param</span><span class='Magenta'>(</span><span class='Warning'>$DoThis</span><span class='Magenta'>)</span><br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Verbose'>if</span>&nbsp;<span class='Magenta'>(</span><span class='Warning'>$psCmdlet</span><span class='Magenta'>.</span><span class='Output'>ShouldProcess</span><span class='Magenta'>(</span><span class='Warning'>$DoThis</span><span class='Magenta'>)</span><span class='Magenta'>)</span>&nbsp;<span class='Magenta'>{</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class='Verbose'>"You should do this $doThis"</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Magenta'>}</span>&nbsp;<span class='Verbose'>else</span>&nbsp;<span class='Magenta'>{</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class='Verbose'>"You should not do this $doThis"</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Magenta'>}</span><br/><span class='Magenta'>}</span><br/><br/><span class='Warning'>shouldI</span>&nbsp;<span class='Magenta'>-DoThis</span>&nbsp;<span class='Verbose'>"On a boat"</span><br/><span class='Warning'>shouldI</span>&nbsp;<span class='Magenta'>-DoThis</span>&nbsp;<span class='Verbose'>"In a moat"</span><br/><br/></pre>

## Turning off PositionalBinding

By default, [parameters](/PowerShell/Parameters) have a position that reflects the order they're declared.

You can turn this behavior off by using `PositionalBinding=$false` in `[CmdletBinding]`.

This is especially useful when combined with a [parameter](/PowerShell/Parameters) attribute that uses `ValueFromRemainingArguments`

<pre><br/><span class='Verbose'>function</span>&nbsp;<span class='Verbose'>FreeFormFunction</span>&nbsp;<span class='Magenta'>{</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Magenta'>[</span><span class='Output'>CmdletBinding</span><span class='Magenta'>(</span><span class='Output'>PositionalBinding</span><span class='Magenta'>=</span><span class='Warning'>$false</span><span class='Magenta'>)</span><span class='Magenta'>]</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Verbose'>param</span><span class='Magenta'>(</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Warning'>$NamedParameter</span><span class='Magenta'>,</span><br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Magenta'>[</span><span class='Output'>Parameter</span><span class='Magenta'>(</span><span class='Output'>ValueFromRemainingArguments</span><span class='Magenta'>)</span><span class='Magenta'>]</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Warning'>$RestOfParameters</span><span class='Magenta'>,</span><br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Magenta'>[</span><span class='Output'>Parameter</span><span class='Magenta'>(</span><span class='Output'>Position</span><span class='Magenta'>=</span><span class='Output'>0</span><span class='Magenta'>)</span><span class='Magenta'>]</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Warning'>$FirstParameter</span>&nbsp;&nbsp;&nbsp;&nbsp;<br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Magenta'>)</span><br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Warning'>$psBoundParameters</span><br/><span class='Magenta'>}</span><br/><br/><span class='Warning'>FreeFormFunction</span>&nbsp;<span class='Verbose'>a</span>&nbsp;<span class='Verbose'>b</span>&nbsp;<span class='Verbose'>c</span>&nbsp;<span class='Verbose'>d</span><br/><span class='Warning'>FreeFormFunction</span>&nbsp;<span class='Verbose'>a</span>&nbsp;<span class='Verbose'>b</span>&nbsp;<span class='Verbose'>c</span>&nbsp;<span class='Magenta'>-NamedParameter</span>&nbsp;<span class='Verbose'>d</span><br/></pre>

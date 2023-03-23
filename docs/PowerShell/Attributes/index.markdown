---

coursename: Working with Attributes
level: 101
title: Attributes

layout: default
---

Attributes are, well, attributes of an object.

Attributes allow us to add additional information to something in a somewhat standard way.

In [PowerShell](/PowerShell), there are several places you can provide attributes:

## Attributes on [Script Blocks](/PowerShell/ScriptBlock)

All [Script Blocks in PowerShell](/PowerShell/ScriptBlock) can have attributes.

They can be placed above the param block, though there has to actually _be_ a [parameter](/PowerShell/Parameters) block.

<pre><br/><span class='Magenta'>{</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Magenta'>[</span><span class='Output'>Reflection.AssemblyMetadata</span><span class='Magenta'>(</span><span class='Verbose'>"SomeKey"</span><span class='Magenta'>,</span><span class='Verbose'>"SomeValue"</span><span class='Magenta'>)</span><span class='Magenta'>]</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Verbose'>param</span><span class='Magenta'>(</span><span class='Magenta'>)</span><br/><span class='Magenta'>}</span><span class='Magenta'>.</span><span class='Output'>Attributes</span><br/></pre>

## Attributes on [Functions](/PowerShell/Functions)

Since [PowerShell functions](/PowerShell/Functions) are [script blocks](/PowerShell/ScriptBlock) with names, we can add an attribute to a [function](/PowerShell/Functions) in the same way.

<pre><br/><span class='Verbose'>function</span>&nbsp;<span class='Verbose'>ACommandWithAttributes</span>&nbsp;<span class='Magenta'>{</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Magenta'>[</span><span class='Output'>Reflection.AssemblyMetadata</span><span class='Magenta'>(</span><span class='Verbose'>"SomeKey"</span><span class='Magenta'>,</span><span class='Verbose'>"SomeValue"</span><span class='Magenta'>)</span><span class='Magenta'>]</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Verbose'>param</span><span class='Magenta'>(</span><span class='Magenta'>)</span><br/><span class='Magenta'>}</span><br/><br/><span class='Magenta'>(</span><span class='Warning'>Get-Command</span>&nbsp;<span class='Verbose'>ACommandWithAttributes</span><span class='Magenta'>)</span><span class='Magenta'>.</span><span class='Output'>ScriptBlock</span><span class='Magenta'>.</span><span class='Output'>Attributes</span><br/></pre>

## Attributes on [Parameters](/PowerShell/Parameters)

[PowerShell Parameters](/PowerShell/Parameters) use attributes quite a bit.

In fact, the thing that separates a simple [parameter](/PowerShell/Parameters) from a smart one is the presence of a `[Parameter]` attribute.

<pre><br/><span class='Verbose'>function</span>&nbsp;<span class='Verbose'>AFunctionWithMandatoryParameters</span>&nbsp;<span class='Magenta'>{</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Verbose'>param</span><span class='Magenta'>(</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Magenta'>[</span><span class='Output'>Parameter</span><span class='Magenta'>(</span><span class='Output'>Mandatory</span><span class='Magenta'>)</span><span class='Magenta'>]</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Warning'>$ThisParameterIsMandatory</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Magenta'>)</span><br/><span class='Magenta'>}</span><br/></pre>

---

title: Advanced Functions

layout: default
---

In [PowerShell](/PowerShell) V2, [functions](/PowerShell/Functions) got a lot more advanced.

They can do anything a Cmdlet can do.  This is why advanced [functions](/PowerShell/Functions) are sometimes called Script Cmdlets.

A [function](/PowerShell/Functions) is considered advanced if it has a [CmdletBinding attribute](/PowerShell/Attributes/CmdletBinding-Attribute) or any [Parameter](/PowerShell/Parameters) [attributes](/PowerShell/Attributes).

Hopefully, that is not too advanced of a concept.

Let's talk about a few big benefits of advanced [functions](/PowerShell/Functions).

## Mandatory [parameters](/PowerShell/Parameters)

The first little big thing you get by making a [function](/PowerShell/Functions) advanced is the ability to mark a [parameter](/PowerShell/Parameters) as `Mandatory`.

A Mandatory [parameter](/PowerShell/Parameters) must be provided in order for a [command](/PowerShell/Commands) to run.

## [Pipeline](/PowerShell/Concepts/The-Object-Pipeline) Binding

[The Object Pipeline](/PowerShell/Concepts/The-Object-Pipeline) is a major part of [PowerShell](/PowerShell).

We can use [Parameter](/PowerShell/Parameters) [attributes](/PowerShell/Attributes) to make a [parameter](/PowerShell/Parameters) bind to objects from the [pipeline](/PowerShell/Concepts/The-Object-Pipeline), and the process block to handle each object coming thru the [pipeline](/PowerShell/Concepts/The-Object-Pipeline).

<pre><br/><span class='Verbose'>function</span>&nbsp;<span class='Verbose'>WhatDayOfTheWeek</span><span class='Magenta'>(</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Magenta'>[</span><span class='Output'>Parameter</span><span class='Magenta'>(</span><span class='Output'>Mandatory</span><span class='Magenta'>,</span><span class='Output'>ValueFromPipeline</span><span class='Magenta'>)</span><span class='Magenta'>]</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Progress'>[DateTime]</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Warning'>$DateTime</span><br/><span class='Magenta'>)</span>&nbsp;<span class='Magenta'>{</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Verbose'>process</span>&nbsp;<span class='Magenta'>{</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class='Warning'>$DateTime</span><span class='Magenta'>.</span><span class='Output'>DayOfWeek</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Magenta'>}</span><br/><span class='Magenta'>}</span><br/></pre>

Because [PowerShell](/PowerShell) is [type](/PowerShell/Types) promiscuous, we can just supply a string with a date and [PowerShell](/PowerShell) will turn it into a DateTime.

<pre><br/><span class='Verbose'>"12/31/2000"</span>&nbsp;<span class='Magenta'>|</span>&nbsp;<span class='Warning'>WhatDayOfTheWeek</span><br/></pre>

We can even provide a list of dates if we want to.

<pre><br/><span class='Verbose'>"07/04/1776"</span><span class='Magenta'>,</span>&nbsp;<span class='Verbose'>"09/28/1787"</span>&nbsp;<span class='Magenta'>|</span>&nbsp;<span class='Warning'>WhatDayOfTheWeek</span><br/></pre>

## Property binding

Property binding is what it sounds like.

We can make [parameters](/PowerShell/Parameters) in [PowerShell](/PowerShell) bind to one or more properties.

We do this with the mouthful of a setting, ValueFromPipelineByPropertyName.

<pre><br/><span class='Verbose'>function</span>&nbsp;<span class='Verbose'>NameAndAge</span>&nbsp;<span class='Magenta'>{</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Verbose'>param</span><span class='Magenta'>(</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Magenta'>[</span><span class='Output'>Parameter</span><span class='Magenta'>(</span><span class='Output'>Mandatory</span><span class='Magenta'>,</span><span class='Output'>ValueFromPipelineByPropertyName</span><span class='Magenta'>)</span><span class='Magenta'>]</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Progress'>[string]</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Warning'>$Name</span><span class='Magenta'>,</span><br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Magenta'>[</span><span class='Output'>Parameter</span><span class='Magenta'>(</span><span class='Output'>Mandatory</span><span class='Magenta'>,</span><span class='Output'>ValueFromPipelineByPropertyName</span><span class='Magenta'>)</span><span class='Magenta'>]</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Progress'>[double]</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Warning'>$Age</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Magenta'>)</span><br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Verbose'>process</span>&nbsp;<span class='Magenta'>{</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class='Progress'>[PSCustomObject]</span><span class='Warning'>$PSBoundParameters</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Magenta'>}</span><br/><span class='Magenta'>}</span><br/></pre>

Any object that has both an `Age` and `Name` property can be piped into this [function](/PowerShell/Functions)

<pre><br/><span class='Progress'>[PSCustomObject]</span><span class='Magenta'>@{</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Output'>Name</span>&nbsp;<span class='Magenta'>=</span>&nbsp;<span class='Verbose'>'James'</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Output'>Age</span>&nbsp;&nbsp;<span class='Magenta'>=</span>&nbsp;<span class='Output'>41</span><br/><span class='Magenta'>}</span>&nbsp;<span class='Magenta'>|</span>&nbsp;<span class='Warning'>NameAndAge</span><br/></pre>

## [Parameter](/PowerShell/Parameters) Sets

We all know there's more than one way to skin a cat (hopefully not from direct experience).

There also can be more than one way to run a [command](/PowerShell/Commands).

ParameterSets allow for various [parameters](/PowerShell/Parameters) to be grouped together.

<pre><br/><span class='Verbose'>function</span>&nbsp;<span class='Verbose'>MoveDirection</span><span class='Magenta'>(</span>&nbsp;&nbsp;&nbsp;&nbsp;<br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Magenta'>[</span><span class='Output'>Parameter</span><span class='Magenta'>(</span><span class='Output'>Mandatory</span><span class='Magenta'>)</span><span class='Magenta'>]</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Progress'>[double]</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Warning'>$Distance</span><span class='Magenta'>,</span><br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Magenta'>[</span><span class='Output'>Parameter</span><span class='Magenta'>(</span><span class='Output'>Mandatory</span><span class='Magenta'>,</span><span class='Output'>ParameterSetName</span><span class='Magenta'>=</span><span class='Verbose'>'North'</span><span class='Magenta'>)</span><span class='Magenta'>]</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Progress'>[switch]</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Warning'>$North</span><span class='Magenta'>,</span><br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Magenta'>[</span><span class='Output'>Parameter</span><span class='Magenta'>(</span><span class='Output'>Mandatory</span><span class='Magenta'>,</span><span class='Output'>ParameterSetName</span><span class='Magenta'>=</span><span class='Verbose'>'South'</span><span class='Magenta'>)</span><span class='Magenta'>]</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Progress'>[switch]</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Warning'>$South</span><span class='Magenta'>,</span><br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Magenta'>[</span><span class='Output'>Parameter</span><span class='Magenta'>(</span><span class='Output'>Mandatory</span><span class='Magenta'>,</span><span class='Output'>ParameterSetName</span><span class='Magenta'>=</span><span class='Verbose'>'East'</span><span class='Magenta'>)</span><span class='Magenta'>]</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Progress'>[switch]</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Warning'>$East</span><span class='Magenta'>,</span><br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Magenta'>[</span><span class='Output'>Parameter</span><span class='Magenta'>(</span><span class='Output'>Mandatory</span><span class='Magenta'>,</span><span class='Output'>ParameterSetName</span><span class='Magenta'>=</span><span class='Verbose'>'West'</span><span class='Magenta'>)</span><span class='Magenta'>]</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Progress'>[switch]</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Warning'>$West</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Magenta'>)</span>&nbsp;<span class='Magenta'>{</span><br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Progress'>[PSCustomObject]</span><span class='Magenta'>@{</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class='Output'>Distance</span>&nbsp;<span class='Magenta'>=</span>&nbsp;<span class='Warning'>$distance</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class='Output'>Direction</span>&nbsp;<span class='Magenta'>=</span>&nbsp;<span class='Warning'>$psCmdlet</span><span class='Magenta'>.</span><span class='Output'>ParameterSetName</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Magenta'>}</span><br/><span class='Magenta'>}</span><br/><br/><span class='Warning'>MoveDirection</span>&nbsp;<span class='Magenta'>-Distance</span>&nbsp;<span class='Output'>1</span>&nbsp;<span class='Magenta'>-North</span><br/></pre>

---

title: Process Block

layout: default
---

The [Object Pipeline](/PowerShell/Concepts/The-Object-Pipeline) is, well, a [pipeline](/PowerShell/Concepts/The-Object-Pipeline) full of objects.
If a [ScriptBlock](/PowerShell/ScriptBlock) has a process block, each object in the [pipeline](/PowerShell/Concepts/The-Object-Pipeline) will be, well, processed.

## Faster Foreach-Object

By way of the simplest example, below is what is sometimes called a "fast Foreach-Object".

<pre><br/><span class='Output'>1</span><span class='Magenta'>,</span><span class='Output'>2</span><span class='Magenta'>,</span><span class='Output'>3</span>&nbsp;<span class='Magenta'>|</span>&nbsp;<span class='Success'># We pipe whatever we would like into a scriptblock with a process block</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Magenta'>&</span>&nbsp;<span class='Magenta'>{</span>&nbsp;<span class='Verbose'>process</span>&nbsp;<span class='Magenta'>{</span>&nbsp;<span class='Warning'>$_</span>&nbsp;<span class='Magenta'>}</span>&nbsp;<span class='Magenta'>}</span>&nbsp;<span class='Success'># (and this is several times faster that piping to Foreach-Object)</span><br/></pre>

## Process Block and [Pipeline](/PowerShell/Concepts/The-Object-Pipeline) [Parameters](/PowerShell/Parameters)

If your [ScriptBlock](/PowerShell/ScriptBlock) had pipelined [parameters](/PowerShell/Parameters), they will be mapped each time.

<pre><br/><span class='Progress'>[PSCustomObject]</span><span class='Magenta'>@{</span><span class='Output'>x</span><span class='Magenta'>=</span><span class='Output'>1</span><span class='Output'>;</span><span class='Output'>y</span><span class='Magenta'>=</span><span class='Output'>2</span><span class='Magenta'>}</span><span class='Magenta'>,</span><span class='Progress'>[PSCustomObject]</span><span class='Magenta'>@{</span><span class='Output'>x</span><span class='Magenta'>=</span><span class='Output'>2</span><span class='Output'>;</span><span class='Output'>y</span><span class='Magenta'>=</span><span class='Output'>1</span><span class='Magenta'>}</span>&nbsp;<span class='Magenta'>|</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Magenta'>&</span>&nbsp;<span class='Magenta'>{</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class='Verbose'>param</span><span class='Magenta'>(</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class='Magenta'>[</span><span class='Output'>Parameter</span><span class='Magenta'>(</span><span class='Output'>ValueFromPipelineByPropertyName</span><span class='Magenta'>)</span><span class='Magenta'>]</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class='Warning'>$X</span><span class='Magenta'>,</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class='Magenta'>[</span><span class='Output'>Parameter</span><span class='Magenta'>(</span><span class='Output'>ValueFromPipelineByPropertyName</span><span class='Magenta'>)</span><span class='Magenta'>]</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class='Warning'>$Y</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class='Magenta'>)</span><br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class='Verbose'>process</span>&nbsp;<span class='Magenta'>{</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class='Verbose'>"$X,$Y"</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class='Magenta'>}</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Magenta'>}</span><br/></pre>

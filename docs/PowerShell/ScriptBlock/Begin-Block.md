---

title: Begin Block

layout: default
---

In the beginning of a [command](/PowerShell/Commands), before [the object pipeline](/PowerShell/Concepts/The-Object-Pipeline) processes anything in it's [process block](/PowerShell/ScriptBlock/Process-Block), a begin block will run.

Begin blocks can be used to initialize [variables](/PowerShell/Variables) and prepare your script to run.

For instance, if we wanted to count how many objects were piped in,
we'd create a [variable](/PowerShell/Variables) to count objects in begin and set it to 0.

<pre><br/><span class='Output'>1</span><span class='Magenta'>..</span><span class='Output'>10</span>&nbsp;<span class='Magenta'>|</span>&nbsp;<br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Magenta'>&</span>&nbsp;<span class='Magenta'>{</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class='Verbose'>begin</span>&nbsp;<span class='Magenta'>{</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class='Warning'>$ObjectCounter</span>&nbsp;<span class='Magenta'>=</span>&nbsp;<span class='Output'>0</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class='Verbose'>"starting up"</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class='Magenta'>}</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class='Verbose'>process</span>&nbsp;<span class='Magenta'>{</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class='Warning'>$ObjectCounter</span><span class='Magenta'>++</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class='Verbose'>"processing $_"</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class='Magenta'>}</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class='Verbose'>end</span>&nbsp;<span class='Magenta'>{</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class='Verbose'>"processed $objectCounter times"</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class='Magenta'>}</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Magenta'>}</span><br/></pre>

begin blocks, process blocks, and end blocks are fairly handy once you get the hang of them, and a feature not found in many [programming languages](/Languages/Programming-Languages).

## Begin blocks and [Pipeline parameters](/PowerShell/Parameters/Pipeline-Parameters)

One quick thing to note - Any [parameters](/PowerShell/Parameters) you provide without [the object pipeline](/PowerShell/Concepts/The-Object-Pipeline) (by name or positionally) will be available as [variables](/PowerShell/Variables) in begin

Any [pipeline parameters](/PowerShell/Parameters/Pipeline-Parameters) will not be mapped in the begin block - they will be mapped in the [process block](/PowerShell/ScriptBlock/Process-Block).

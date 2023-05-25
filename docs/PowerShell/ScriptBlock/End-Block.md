---

title: End Block

layout: default
---

Continuing with our obvious but useful naming scheme established by the [begin block](/PowerShell/ScriptBlock/Begin-Block) and the [process block](/PowerShell/ScriptBlock/Process-Block), when the end block runs at the end of [the object pipeline](/PowerShell/Concepts/The-Object-Pipeline).

<pre><br/><span class='Magenta'>&</span>&nbsp;<span class='Magenta'>{</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Verbose'>begin</span>&nbsp;<span class='Magenta'>{</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class='Verbose'>"begin begins"</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Magenta'>}</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Verbose'>process</span>&nbsp;<span class='Magenta'>{</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class='Verbose'>"process processes"</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Magenta'>}</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Verbose'>end</span>&nbsp;<span class='Magenta'>{</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class='Verbose'>"end ends"</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Magenta'>}</span><br/><span class='Magenta'>}</span><br/></pre>

No matter how many times process is run, end only runs once.

## end is the default

If you do not specify any named block, a [ScriptBlock](/PowerShell/ScriptBlock) will assume it should be run at the end.

This tiny distinction is easy to forget, and makes writing code that uses [the object pipeline](/PowerShell/Concepts/The-Object-Pipeline) a little more painful than we think it should be.

Let's run a short script to demonstrate

<pre><br/><span class='Output'>1</span><span class='Magenta'>..</span><span class='Output'>1mb</span>&nbsp;<span class='Magenta'>|</span>&nbsp;<br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Magenta'>&</span>&nbsp;<span class='Magenta'>{</span><span class='Verbose'>"I just piped a million objects into this and all I got was this stupid message"</span><span class='Magenta'>}</span><br/></pre>

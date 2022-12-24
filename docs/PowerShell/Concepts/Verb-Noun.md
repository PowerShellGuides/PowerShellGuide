---

title: Verb Noun
Alias: Verb-Noun Pairing

layout: default
---

Verbs and nouns are basic parts of any language, and they're pretty fundamental to how [PowerShell](/PowerShell) is structured.

PowerShell [Commands](/PowerShell/Commands) are generally named in verb-noun pairs.

For example, we list all of the loaded [commands in PowerShell](/PowerShell/Commands) with:

<pre><br/><span class='Warning'>Get-Command</span><br/></pre>

[PowerShell](/PowerShell) has a list of standard verbs.  We can find that list with the command:

<pre><br/><span class='Warning'>Get-Verb</span><br/></pre>

(hopefully, you could see that one coming).

By having a standard set of verbs, the whole universe of [PowerShell](/PowerShell) is more likely to be discoverable and understandable.

For instance, we can use Get-Command to see all that we can Get:

<pre><br/><span class='Warning'>Get-Command</span>&nbsp;<span class='Magenta'>-Verb</span>&nbsp;<span class='Verbose'>Get</span><br/></pre>

Or to see all that we can Set:

<pre><br/><span class='Warning'>Get-Command</span>&nbsp;<span class='Magenta'>-Verb</span>&nbsp;<span class='Verbose'>Set</span><br/></pre>


If you're writing [commands in PowerShell](/PowerShell/Commands), you should give them a standard verb, and you should use similar nouns to refer to similar things.

For instance, we can get processes with:

<pre><br/><span class='Warning'>Get-Process</span><br/></pre>

And we can find all [commands](/PowerShell/Commands) with the Process noun to see what we could do to a process.

<pre><br/><span class='Warning'>Get-Command</span>&nbsp;<span class='Magenta'>-Noun</span>&nbsp;<span class='Verbose'>Process</span><br/></pre>


This verb-noun convention helps keep [PowerShell](/PowerShell) a great [high level language](/Languages/High-Level-Languages).

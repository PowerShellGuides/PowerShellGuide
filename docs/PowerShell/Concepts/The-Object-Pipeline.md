---

Alias: 
- Object Pipeline
- Pipeline
title: The Object Pipeline

layout: default
---

The Object Pipeline is one of the most useful and coolest technologies you may ever hope to see.

It is the jewel in [PowerShell](/PowerShell)'s crown.

In the real world, a pipeline will let a liquid or a gas flow through it effeciently.

In [PowerShell](/PowerShell), the object pipeline allows objects to flow thru from step to step, so we can use [PowerShell](/PowerShell) fluidly.

Pipelines are a series of expressions or commands, separted by a pipe character `|`, and you'd be positively amazed how much you can string together with one little pipeline.

For instance, let's get all commands, pick a random one, and get help:

<pre><br/><span class='Warning'>Get-Command</span>&nbsp;<span class='Magenta'>|</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Warning'>Get-Random</span>&nbsp;<span class='Magenta'>|</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Warning'>Get-Help</span><br/></pre> 

[PowerShell](/PowerShell) includes many built-in -Object commands that will help you manipulate any object, no matter what produced it.

You'll probably use two of these more than any other:  Foreach-Object (aliased to `%`) and Where-Object (aliased to `?`).

Let's find all processes using more than 100 megabytes of memory.

<pre><br/><span class='Warning'>Get-Process</span>&nbsp;<span class='Magenta'>|</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Warning'>Where-Object</span>&nbsp;<span class='Verbose'>WorkingSet</span>&nbsp;<span class='Magenta'>-gt</span>&nbsp;<span class='Output'>100mb</span><br/></pre>


This is an elegantly simple way to script.

It certainly beats the alternative.

Some languages, like Bash, include a text based pipeline.

In this sort of a pipeline, each step has to figure out how to extract useful information from the text in the previous step.

This is why dealing with a text pipeline is known as "parsing and praying".

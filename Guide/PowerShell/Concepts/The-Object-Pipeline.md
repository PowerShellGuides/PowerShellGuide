The Object Pipeline is one of the most useful and coolest technologies you may ever hope to see.

It is the jewel in PowerShell's crown.

In the real world, a pipeline will let a liquid or a gas flow through it effeciently.

In PowerShell, the object pipeline allows objects to flow thru from step to step, so we can use PowerShell fluidly.

Pipelines are a series of expressions or commands, separted by a pipe character `|`, and you'd be positively amazed how much you can string together with one little pipeline.

For instance, let's get all commands, pick a random one, and get help:

~~~PowerShell
Get-Command |
    Get-Random |
    Get-Help
~~~ 

PowerShell includes many built-in -Object commands that will help you manipulate any object, no matter what produced it.

You'll probably use two of these more than any other:  Foreach-Object (aliased to `%`) and Where-Object (aliased to `?`).

Let's find all processes using more than 100 megabytes of memory.

~~~PowerShell
Get-Process |
    Where-Object WorkingSet -gt 100mb
~~~


This is an elegantly simple way to script.

It certainly beats the alternative.

Some languages, like Bash, include a text based pipeline.

In this sort of a pipeline, each step has to figure out how to extract useful information from the text in the previous step.

This is why dealing with a text pipeline is known as "parsing and praying".
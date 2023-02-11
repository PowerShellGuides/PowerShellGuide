---

title: Functions
Alias: 
- Function
- PowerShell Functions
- Functions in PowerShell


layout: default
---

Please believe me, functions are quite fun.

[PowerShell](/PowerShell) functions are [commands](/PowerShell/Commands) written directly in [PowerShell](/PowerShell).

Most [commands](/PowerShell/Commands) you run and most [commands](/PowerShell/Commands) you build will be functions.

Functions are named [scriptblocks](/PowerShell/ScriptBlock).

Anything you can do with a [ScriptBlock](/PowerShell/ScriptBlock), you can do with a Function.

Let's start simple, by declaring a 'Hello World' function.

<pre><br/><span class='Verbose'>function</span>&nbsp;<span class='Verbose'>HelloWorld</span>&nbsp;<span class='Magenta'>{</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Verbose'>"Hello World"</span><br/><span class='Magenta'>}</span><br/></pre>

You can declare functions [parameters](/PowerShell/Parameters) inline:

<pre><br/><span class='Verbose'>function</span>&nbsp;<span class='Verbose'>Hello</span><span class='Magenta'>(</span><span class='Warning'>$Message</span>&nbsp;<span class='Magenta'>=</span>&nbsp;<span class='Verbose'>'Hello World'</span><span class='Magenta'>)</span>&nbsp;<span class='Magenta'>{</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Warning'>$Message</span><br/><span class='Magenta'>}</span><br/></pre>

You can also declare [parameters](/PowerShell/Parameters) in a `param()` block

<pre><br/><span class='Verbose'>function</span>&nbsp;<span class='Verbose'>Hello</span>&nbsp;<span class='Magenta'>{</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Verbose'>param</span><span class='Magenta'>(</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Warning'>$Message</span>&nbsp;<span class='Magenta'>=</span>&nbsp;<span class='Verbose'>'Hello World'</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Magenta'>)</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Warning'>$Message</span><br/><span class='Magenta'>}</span><br/></pre>

These are all examples of simple functions.

It's not meant to be snide, it's just that [PowerShell](/PowerShell) functions can get much more advanced.

Functions can bind to anything in [the Object Pipeline](/PowerShell/Concepts/The-Object-Pipeline), [Prompt for Confirmation](/PowerShell/Concepts/Prompt-For-Confirmation), and have rich [inline help](/PowerShell/Help/Inline-Help).

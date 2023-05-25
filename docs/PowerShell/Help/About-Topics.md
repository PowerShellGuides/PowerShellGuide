---

title: About Topics

layout: default
---

PowerShell has all sorts of wonderful little bells and whistles, but, perhaps the best one is that it comes with quite the manual.

If you want [help](/PowerShell/Help) in [PowerShell](/PowerShell), simply [Get-Help](/PowerShell/Commands/Get-Help).

Say we wanted to find out about [variables](/PowerShell/Variables).  We'd just run:

<pre><br/><span class='Warning'>Get-Help</span><br/></pre>

You can also [get help](/PowerShell/Commands/Get-Help) about a particular topic.

For example, to understand [variables](/PowerShell/Variables), we would say:

<pre><br/><span class='Warning'>Get-Help</span>&nbsp;<span class='Verbose'>about_variables</span><br/></pre>

There are _lots_ of built in about topics.

To see them all, use:

<pre><br/><span class='Warning'>Get-Help</span>&nbsp;<span class='Verbose'>about_*</span><br/></pre>

## About Topic Files

These topics are either written by Microsoft or the authors of a particular [module](/PowerShell/Modules), and are stored in a `.help.txt` file.

`.help.txt` files take the form of:

~~~
HEADER
    Content
HEADER
    Content
~~~

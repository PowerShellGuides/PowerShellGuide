Verbs and nouns are basic parts of any language, and they're pretty fundamental to how PowerShell is structured.

PowerShell Commands are generally named in verb-noun pairs.

For example, we list all of the loaded commands in PowerShell with:

~~~PowerShell
Get-Command
~~~

PowerShell has a list of standard verbs.  We can find that list with the command:

~~~PowerShell
Get-Verb
~~~

(hopefully, you could see that one coming).

By having a standard set of verbs, the whole universe of PowerShell is more likely to be discoverable and understandable.

For instance, we can use Get-Command to see all that we can Get:

~~~PowerShell
Get-Command -Verb Get
~~~

Or to see all that we can Set:

~~~PowerShell
Get-Command -Verb Set
~~~


If you're writing commands in PowerShell, you should give them a standard verb, and you should use similar nouns to refer to similar things.

For instance, we can get processes with:

~~~PowerShell
Get-Process
~~~

And we can find all commands with the Process noun to see what we could do to a process.

~~~PowerShell
Get-Command -Noun Process
~~~


This verb-noun convention helps keep PowerShell a great high level language.
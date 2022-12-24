## What are Variables?

Variables are part of every language (or at least every language worth it's salt).

Variables store information in bit of memory, much like you might remember where you last put your car keys.

Since a computer is less likely to forget things than you are, assigning a variable is probably than trying to remember something.

In PowerShell, variables start with `$`.  For instance, if I wanted to keep track of my car keys location, I could simply say:

~~~PowerShell
$CarKeysAre = 'On The Desk'
~~~

Just like in life, variables are bound to change.  That's why they're called variables.

You're just bound to run into variables while scripting PowerShell.

If you're not using variables, you're too constant of a person and we wouldn't like to know you.

## Variable Types

Variables in PowerShell can be either strongly or weakly typed.

This is a somewhat fancy technical way of saying that a variable in PowerShell can be a specific type or anything at all.

When a variable is created in PowerShell, it is given a type.

By default, that will be whatever type you put into it.

So when we say:

~~~PowerShell
$CarKeysAre = 'On The Desk'
~~~

What's happenning is that we're creating a slot in memory and assigning it a string.


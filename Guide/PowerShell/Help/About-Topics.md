PowerShell has all sorts of wonderful little bells and whistles, but, perhaps the best one is that it comes with quite the manual.

If you want help in PowerShell, simply Get-Help.

Say we wanted to find out about variables.  We'd just run:

~~~PowerShell
Get-Help
~~~

You can also get help about a particular topic.

For example, to understand variables, we would say:

~~~PowerShell
Get-Help about_variables
~~~

There are _lots_ of built in about topics.

To see them all, use:

~~~PowerShell
Get-Help about_*
~~~

## About Topic Files

These topics are either written by Microsoft or the authors of a particular module, and are stored in a `.help.txt` file.

`.help.txt` files take the form of:

~~~
HEADER
    Content
HEADER
    Content
~~~
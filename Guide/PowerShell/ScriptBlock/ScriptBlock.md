ScriptBlocks are, well, blocks of PowerShell.

Getting a little nerdy, ScriptBlocks are the type PowerShell uses to store its code before it runs.

Let's start by defining a variable containing a ScriptBlock that says "Don't Panic!":

~~~PowerShell
$DontPanic = { "Don't Panic!" }
~~~

If you ran that, you might notice it didn't output anything.

That's because declaring a ScriptBlock does not run the ScriptBlock.

You can call a ScriptBlock with either of the call operators (`&` or `.`)

~~~PowerShell
$DontPanic = { "Don't Panic!" }
& $DontPanic
~~~

## ScriptBlock structure

ScriptBlocks start and end with curly braces.

Within these curly braces, we can define (in order):

* Inline Help
* Attributes
* Parameters
* Dynamic Parameters (with the dynamicParam block)
* What happens when the command starts (with the begin block)
* When happens when an object comes thru the pipeline (with the process block)
* When happens when the command ends (with the end block)
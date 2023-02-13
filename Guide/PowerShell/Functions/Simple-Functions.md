In the beginning (of PowerShell), there was the Cmdlet, the Function, and the Filter.

Cmdlets are compiled by developers and could do more than the simple functions of PowerShell V1.

The first scripters saw this, and said it was not good.

Thus, one of PowerShell V2s many great leaps forward was the creation of the advanced function.

Advanced functions can do anything a Cmdlet can do, and more.

This makes simple functions the exception, not the rule.

A function is simple if it does not have a CmdletBinding attribute or any Parameter attributes.

This will not declare any automatic parameters, and will allow any number of unnamed arguments to a function.

## A Really Simple Function

Let's start with a really simple function that just outputs it's arguments.

~~~PowerShell
function SayMyArgs {
   $args
}

SayMyArgs 1 2 3 4
~~~

If you use Get-Command to take a look at `SayMyArgs`, you'll notice that it doesn't have any parameters.

That's how we know our function is simple.

## Handling Object Pipeline $input

Just because a function isn't smart doesn't mean it's stupid (as far as the object pipeline is concerned).

The automatic variable `$input` contains the input provided to the command.

It's also why you can't have a parameter named input, in case you were wondering.

~~~PowerShell
function IPipedWhat {
    $input
}

1..5 | IPipedWhat
~~~

If a function does not have any named blocks, the body of the function will run when the pipeline ends.

## Named Blocks Do Not Make a Function Smart

Named blocks let even a simple function handle the pipeline more properly.

We can use a process block to handle objects as they come in.

If an object was piped into a function, it will be in the automatic variable `$_`

~~~PowerShell
function WhatDidIPipeAgain {    
    process {
        $_
    }
}

1..2 | WhatDidIPipeAgain
~~~


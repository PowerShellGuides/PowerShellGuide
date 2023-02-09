Please believe me, functions are quite fun.

PowerShell functions are commands written directly in PowerShell.

Most commands you run and most commands you build will be functions.

Functions are named scriptblocks.

Anything you can do with a ScriptBlock, you can do with a Function.

Let's start simple, by declaring a 'Hello World' function.

~~~PowerShell
function HelloWorld {
    "Hello World"
}
~~~

You can declare functions parameters inline:

~~~PowerShell
function Hello($Message = 'Hello World') {
    $Message
}
~~~

You can also declare parameters in a `param()` block

~~~PowerShell
function Hello {
    param(
    $Message = 'Hello World'
    )
    $Message
}
~~~

These are all examples of simple functions.

It's not meant to be snide, it's just that PowerShell functions can get much more advanced.

Functions can bind to anything in the Object Pipeline, Prompt for Confirmation, and have rich inline help.

Arrays are found in any language worth dealing with (including PowerShell).

An array is a sequence of stuff, normally lined up in memory so that you can access it one by one.

It may be helpful to think of a row of boxes.

There are quite a few ways to create arrays in PowerShell.

There's the list operator `,`

~~~PowerShell
1,2,3,4
~~~

There's also the range operator `..`

~~~PowerShell
1..4
~~~

Last, but certainly not least, there is the Array Subexpression

~~~PowerShell
@(
    1
    2
    3
    4
)
~~~

The array subexpression can be quite useful, since it will force things to be in array.

Of course, arrays have their downside.

Let's go back to picturing them as a row of boxes.

What happens when we add a new box to the row?  What about when we hit the metaphorical wall?

We'd have to move boxes.  Maybe quite a few boxes.

That might take a while.

Sometimes, putting things all in a row isn't the best or more effecient idea.

This is why there are Lists.
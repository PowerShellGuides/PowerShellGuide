There are only a few type operators in PowerShell, but they are pretty useful.

They are `-is`,`-isnot`, and `-as`

## -Is or -IsNot

`-is` checks to see if an object is a type.

~~~PowerShell
1 -is [int] # returns true, because a number without decimals is an int
~~~


`-isnot` checks to see if an object is not a type.

~~~PowerShell
"1" -isnot [int] # returns true, because a string is not an int
~~~

## -As

Contrary to what some short creatures imbued with the force might say, there is in fact a try.

Using `-as`, we can try to convert an object to a given type

~~~PowerShell
"1" -as [int] # returns 1 as an integer
~~~

You can see if check was successful, and write code that reads like a commandment, by using `-as` and `-is` together.

~~~PowerShell
"1" -as [int] -is [int] # Returns true, because 1 (the string) can become an int
~~~
 


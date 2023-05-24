All languages have at least a few operators.

PowerShell has so many operators one looses count.  We mean this seriously.  

This topic is not a complete list of operators.  For that, we refer you to the about topic 'about_Operators', which you can see in PowerShell with `Get-Help about_Operators` or [visit here](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_operators).


## All sorts of operators

There are a lot of operators in PowerShell, and they can be grouped in somewhat logical ways.

|Operator Type|Description|
|-|-|
| Arithmetic Operators | Mainly do basic math             |
| Assignment Operators | Do math and change values        |
| Comparison Operators | Compare things                   |
| Logical Operators    | Help with boolean logic          |
| String Operators     | Help you work with strings       |
| Bitwise Operators    | Do nitty-gritty stuff with bits  |
| Type Operators       | Check or change types            |
| Unary Operators      | Increment or decrement digits    |


## Arithmetic Operators

Computers exist, at least partially, so we don't have to calculating by hand.

PowerShell has a fairly standard set of these: `+`, `-`, `*`, `/`, `%`

In English, that is: Plus, Minus, Multiply, Divide, and Modulus (Remainder).

These operators are about the same as in any programming language.

### A Quick Note on PowerShell Operator Convention

Because PowerShell is both a shell and a scripting language, it's operators avoid `>` and `<` (which look an awful lot like file redirection to shells).

So, while Arithmetic Operators and Assignment Operators are mostly the same as in other languages, most operators in PowerShell start with `-`.

So, to compare two things in PowerShell, it's:

~~~PowerShell
$a -eq $b # as opposed to == in many languages
~~~

And to see if they are not the same, it's

~~~PowerShell
$a -ne $b # as opposed to != in many languages
~~~
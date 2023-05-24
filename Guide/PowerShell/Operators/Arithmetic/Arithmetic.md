Computers exist, at least partially, so we don't have to calculating by hand.

PowerShell has a fairly standard set of these: `+`, `-`, `*`, `/`, `%`

In English, that is: Plus, Minus, Multiply, Divide, and Modulus (Remainder).

These operators are about the same as in any programming language.

In case one needs a few simple examples to understand the point:

~~~PowerShell
1 + 1 # is two
2 * 2 # is four
2 - 1 # is 1
2 / 2 # is 1
3 % 2 # is 1
2 / 0 # is an error!
~~~

PowerShell earns no major points for creativity here.

Because PowerShell is built in of C#, all of it's infrastructure for operators comes right along with it.

However, it's type promiscuity comes in handy.

## Adding Different Types Together

When combining things of different types, PowerShell will try to make things the type on the left side of the operation.

The right side will be coerced into the left side's type.

Thus we can do:

~~~PowerShell
[DateTime]::Now + "00:10:00" # This will output a time ten minutes from now
~~~

## Adding Hastables

One other thing we can add together in PowerShell is hashtables

~~~PowerShell
@{
    a = 'a'
} + @{
    b = 'b'
}
~~~
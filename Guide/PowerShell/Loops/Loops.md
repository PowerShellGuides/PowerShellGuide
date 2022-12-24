All of this has happenned before, and all of this will happen again.

Loops are a part of existence, and all programming languages.

A loop simply does things again and again.

PowerShell has four kinds of loops:

* foreach
* for
* while
* do

## foreach loops

foreach loops are the easiest type of loop to understand.

foreach basically says: "do this once on every item", for example:

~~~PowerShell
foreach ($n in 1..10) {
    if ($n % 2) {
        "$n is odd"
    } else {
        "$n is even"
    }
}
~~~

In this little example we use the range operator to give us a list of all items between one and ten.

_For each_ number, we use a little conditional to tell us if each number is odd or even.

We certainly hope you get it, or my faith in humanity has dwindled.

## for loops

_For_ loops aren't that different from foreach, they're just more finely tuned.

A _for_ loop will have up to three parts:

* Initialization
* Condition
* Advancement

Let's write our first loop in this form:

~~~PowerShell
for ($n = 1; $n -le 10; $n++) {
    if ($n % 2) {
        "$n is odd"
    } else {
        "$n is even"
    }
}
~~~

While _foreach_ loops are simple to use, a _for_ loop lets you do whatever you'd wish in each step.

For instance, if we wanted to skip even numbers, we'd simply say:

~~~PowerShell
for ($n = 1; $n -le 10; $n+=2) {
    if ($n % 2) {
        "$n is odd"
    } else {
        "$n is even"
    }
}
~~~

For loops are the most primitive form of loop.  All other loop types, including foreach, are basically a for loop under the hood.

## while loops

Sometimes, you'll want only want to loop _while_ a condition is true.

For a silly sample of an infinite loop:

~~~PowerShell
$living = $true
while ($living) {
    "Still living. Press CTRL+C to die."
}
~~~

If you run this, it will just keep printing out the message as fast as it can, until you hit CTRL+C or pound your computer into a paste (preferrably A).

While loops are wonderful, just watch out to ensure that their condition can be false someday.

## do loops

As an alternative to _while_, PowerShell has one more type of loop.

A _do_ loop.

Do loops will always run at least once.

When they get to the end of each loop, their condition will be checked and the loop might stop.

There are two types of do loops in PowerShell.

There's `do while`, which will run while the condition is true:

~~~PowerShell
do {
    $alive = $true, $true, $false | Get-Random
    if ($alive) {
        "I'm Alive!"
    } else {
        "I'm Dead!"
    }
} while ($alive)
~~~

Then there's `do until`, which will run while the condition is false:

~~~PowerShell
do {
    $dead = $false, $false, $true | Get-Random
    if ($dead) {
        "I'm Dead!"
    } else {
        "I'm Alive!"
    }
} until ($dead)
~~~



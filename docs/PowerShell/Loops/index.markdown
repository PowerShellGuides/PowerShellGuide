---

title: Loops

layout: default
---

All of this has happenned before, and all of this will happen again.

Loops are a part of existence, and all [programming languages](/Languages/Programming-Languages).

A loop simply does things again and again.

[PowerShell](/PowerShell) has four kinds of loops:

* foreach
* for
* while
* do

## foreach loops

foreach loops are the easiest [type](/PowerShell/Types) of loop to understand.

foreach basically says: "do this once on every item", for example:

<pre><br/><span class='Verbose'>foreach</span>&nbsp;<span class='Magenta'>(</span><span class='Warning'>$n</span>&nbsp;<span class='Verbose'>in</span>&nbsp;<span class='Output'>1</span><span class='Magenta'>..</span><span class='Output'>10</span><span class='Magenta'>)</span>&nbsp;<span class='Magenta'>{</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Verbose'>if</span>&nbsp;<span class='Magenta'>(</span><span class='Warning'>$n</span>&nbsp;<span class='Magenta'>%</span>&nbsp;<span class='Output'>2</span><span class='Magenta'>)</span>&nbsp;<span class='Magenta'>{</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class='Verbose'>"$n is odd"</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Magenta'>}</span>&nbsp;<span class='Verbose'>else</span>&nbsp;<span class='Magenta'>{</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class='Verbose'>"$n is even"</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Magenta'>}</span><br/><span class='Magenta'>}</span><br/></pre>

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

<pre><br/><span class='Verbose'>for</span>&nbsp;<span class='Magenta'>(</span><span class='Warning'>$n</span>&nbsp;<span class='Magenta'>=</span>&nbsp;<span class='Output'>1</span><span class='Output'>;</span>&nbsp;<span class='Warning'>$n</span>&nbsp;<span class='Magenta'>-le</span>&nbsp;<span class='Output'>10</span><span class='Output'>;</span>&nbsp;<span class='Warning'>$n</span><span class='Magenta'>++</span><span class='Magenta'>)</span>&nbsp;<span class='Magenta'>{</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Verbose'>if</span>&nbsp;<span class='Magenta'>(</span><span class='Warning'>$n</span>&nbsp;<span class='Magenta'>%</span>&nbsp;<span class='Output'>2</span><span class='Magenta'>)</span>&nbsp;<span class='Magenta'>{</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class='Verbose'>"$n is odd"</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Magenta'>}</span>&nbsp;<span class='Verbose'>else</span>&nbsp;<span class='Magenta'>{</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class='Verbose'>"$n is even"</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Magenta'>}</span><br/><span class='Magenta'>}</span><br/></pre>

While _foreach_ loops are simple to use, a _for_ loop lets you do whatever you'd wish in each step.

For instance, if we wanted to skip even numbers, we'd simply say:

<pre><br/><span class='Verbose'>for</span>&nbsp;<span class='Magenta'>(</span><span class='Warning'>$n</span>&nbsp;<span class='Magenta'>=</span>&nbsp;<span class='Output'>1</span><span class='Output'>;</span>&nbsp;<span class='Warning'>$n</span>&nbsp;<span class='Magenta'>-le</span>&nbsp;<span class='Output'>10</span><span class='Output'>;</span>&nbsp;<span class='Warning'>$n</span><span class='Magenta'>+=</span><span class='Output'>2</span><span class='Magenta'>)</span>&nbsp;<span class='Magenta'>{</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Verbose'>if</span>&nbsp;<span class='Magenta'>(</span><span class='Warning'>$n</span>&nbsp;<span class='Magenta'>%</span>&nbsp;<span class='Output'>2</span><span class='Magenta'>)</span>&nbsp;<span class='Magenta'>{</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class='Verbose'>"$n is odd"</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Magenta'>}</span>&nbsp;<span class='Verbose'>else</span>&nbsp;<span class='Magenta'>{</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class='Verbose'>"$n is even"</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Magenta'>}</span><br/><span class='Magenta'>}</span><br/></pre>

For loops are the most primitive form of loop.  All other loop [types](/PowerShell/Types), including foreach, are basically a for loop under the hood.

## while loops

Sometimes, you'll want only want to loop _while_ a condition is true.

For a silly sample of an infinite loop:

<pre><br/><span class='Warning'>$living</span>&nbsp;<span class='Magenta'>=</span>&nbsp;<span class='Warning'>$true</span><br/><span class='Verbose'>while</span>&nbsp;<span class='Magenta'>(</span><span class='Warning'>$living</span><span class='Magenta'>)</span>&nbsp;<span class='Magenta'>{</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Verbose'>"Still living. Press CTRL+C to die."</span><br/><span class='Magenta'>}</span><br/></pre>

If you run this, it will just keep printing out the message as fast as it can, until you hit CTRL+C or pound your computer into a paste (preferrably A).

While loops are wonderful, just watch out to ensure that their condition can be false someday.

## do loops

As an alternative to _while_, [PowerShell](/PowerShell) has one more [type](/PowerShell/Types) of loop.

A _do_ loop.

Do loops will always run at least once.

When they get to the end of each loop, their condition will be checked and the loop might stop.

There are two [types](/PowerShell/Types) of do loops in [PowerShell](/PowerShell).

There's `do while`, which will run while the condition is true:

<pre><br/><span class='Verbose'>do</span>&nbsp;<span class='Magenta'>{</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Warning'>$alive</span>&nbsp;<span class='Magenta'>=</span>&nbsp;<span class='Warning'>$true</span><span class='Magenta'>,</span>&nbsp;<span class='Warning'>$true</span><span class='Magenta'>,</span>&nbsp;<span class='Warning'>$false</span>&nbsp;<span class='Magenta'>|</span>&nbsp;<span class='Warning'>Get-Random</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Verbose'>if</span>&nbsp;<span class='Magenta'>(</span><span class='Warning'>$alive</span><span class='Magenta'>)</span>&nbsp;<span class='Magenta'>{</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class='Verbose'>"I'm Alive!"</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Magenta'>}</span>&nbsp;<span class='Verbose'>else</span>&nbsp;<span class='Magenta'>{</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class='Verbose'>"I'm Dead!"</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Magenta'>}</span><br/><span class='Magenta'>}</span>&nbsp;<span class='Verbose'>while</span>&nbsp;<span class='Magenta'>(</span><span class='Warning'>$alive</span><span class='Magenta'>)</span><br/></pre>

Then there's `do until`, which will run while the condition is false:

<pre><br/><span class='Verbose'>do</span>&nbsp;<span class='Magenta'>{</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Warning'>$dead</span>&nbsp;<span class='Magenta'>=</span>&nbsp;<span class='Warning'>$false</span><span class='Magenta'>,</span>&nbsp;<span class='Warning'>$false</span><span class='Magenta'>,</span>&nbsp;<span class='Warning'>$true</span>&nbsp;<span class='Magenta'>|</span>&nbsp;<span class='Warning'>Get-Random</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Verbose'>if</span>&nbsp;<span class='Magenta'>(</span><span class='Warning'>$dead</span><span class='Magenta'>)</span>&nbsp;<span class='Magenta'>{</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class='Verbose'>"I'm Dead!"</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Magenta'>}</span>&nbsp;<span class='Verbose'>else</span>&nbsp;<span class='Magenta'>{</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class='Verbose'>"I'm Alive!"</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Magenta'>}</span><br/><span class='Magenta'>}</span>&nbsp;<span class='Verbose'>until</span>&nbsp;<span class='Magenta'>(</span><span class='Warning'>$dead</span><span class='Magenta'>)</span><br/></pre>

---

title: Conditionals

layout: default
---

Nearly everything you might do has a condition.

For instance, _if_ it's cold outside, you might wear a coat.

Every language has conditionals.

In [PowerShell](/PowerShell), as in many [languages](/Languages), a conditional is represented by the keyword "if".

<pre><br/><span class='Verbose'>if</span>&nbsp;<span class='Magenta'>(</span><span class='Warning'>$ItsColdOutside</span><span class='Magenta'>)</span><br/><span class='Magenta'>{</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Verbose'>"I just can't stay"</span><br/><span class='Magenta'>}</span><br/></pre>

Coniditionals are a basic part of programming. [ As](/PowerShell/Operators/Type-Operators) in _if_ you don't learn conditionals, you'll never learn to code.

In [PowerShell](/PowerShell), If will be followed by a condition (in parenthesis), and an action (in curly braces).

## What else?

Coniditionals wouldn't be too much use if you could only handle one condition.

So, [PowerShell](/PowerShell) (and almost every language), if can be followed by an _else_ keyword.

<pre><br/><span class='Verbose'>if</span>&nbsp;<span class='Magenta'>(</span><span class='Warning'>$ItsColdOutside</span><span class='Magenta'>)</span><br/><span class='Magenta'>{</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Verbose'>"I just can't stay"</span><br/><span class='Magenta'>}</span><br/><span class='Verbose'>else</span><br/><span class='Magenta'>{</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Verbose'>"I can stay"</span><br/><span class='Magenta'>}</span><br/></pre>

## Do I Have To Choose Just One?

Coniditionals also wouldn't be much use if you could only handle two conditions, either.

In a given _if_, you can have as many _elseif_ conditions as you'd like.

<pre><br/><span class='Verbose'>if</span>&nbsp;<span class='Magenta'>(</span><span class='Warning'>$ItsColdOutside</span><span class='Magenta'>)</span><br/><span class='Magenta'>{</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Verbose'>"I just can't stay"</span><br/><span class='Magenta'>}</span><br/><span class='Verbose'>elseif</span>&nbsp;<span class='Magenta'>(</span><span class='Warning'>$My</span><span class='Magenta'>.</span><span class='Output'>Friends</span>&nbsp;<span class='Magenta'>-notcontains</span>&nbsp;<span class='Verbose'>'You'</span><span class='Magenta'>)</span><br/><span class='Magenta'>{</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Verbose'>"I won't stay"</span><br/><span class='Magenta'>}</span><br/><span class='Verbose'>elseif</span>&nbsp;<span class='Magenta'>(</span><span class='Warning'>$My</span><span class='Magenta'>.</span><span class='Output'>Friends</span>&nbsp;<span class='Magenta'>-contains</span>&nbsp;<span class='Verbose'>'You'</span><span class='Magenta'>)</span><br/><span class='Magenta'>{</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Verbose'>"I could stay"</span><br/><span class='Magenta'>}</span><br/><span class='Verbose'>else</span><br/><span class='Magenta'>{</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Verbose'>"I can stay"</span><br/><span class='Magenta'>}</span><br/></pre>

## Switching it up

If isn't the only conditional in [PowerShell](/PowerShell) (or most languages).

[PowerShell](/PowerShell) also has a _switch_ keyword.

A switch is followed by an expression.  We switch what we do based off of the output of the expression.

Let's start simple:

<pre><br/><span class='Warning'>$temperature</span>&nbsp;<span class='Magenta'>=</span>&nbsp;<span class='Output'>32</span><br/><span class='Verbose'>switch</span>&nbsp;<span class='Magenta'>(</span><span class='Warning'>$temperature</span><span class='Magenta'>)</span>&nbsp;<span class='Magenta'>{</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Output'>32</span>&nbsp;<span class='Magenta'>{</span>&nbsp;<span class='Verbose'>"It's Freezing (in Fahrenheit)"</span>&nbsp;<span class='Magenta'>}</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Output'>0</span>&nbsp;<span class='Magenta'>{</span>&nbsp;<span class='Verbose'>"It's Freezing (in Celsius)"</span>&nbsp;<span class='Magenta'>}</span>&nbsp;&nbsp;&nbsp;&nbsp;<br/><span class='Magenta'>}</span><br/></pre>

Switch statements can get a lot more complicated than that, of course.

You should keep reading your trust [PowerShell Guide](/PowerShell/Guide), or consult the [about topics](/PowerShell/Help/About-Topics).

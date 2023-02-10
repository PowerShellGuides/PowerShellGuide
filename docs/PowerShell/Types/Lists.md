---

title: Lists

layout: default
---

In the beginning the [Array](/PowerShell/Types/Arrays) was created, followed shortly by the ArrayList. 

However, many were increasingly of the opinion that they’d all made a big mistake in creating the [Array](/PowerShell/Types/Arrays) in the first place and that the ArrayList wasn’t much of an improvement.

So, the List was created…and there was much rejoicing. 

- Why is the List a better option? better memory allocation
- Do [Arrays](/PowerShell/Types/Arrays) still have a place in PowerShell? yes
- Do ArrayLists still have a place in PowerShell? no

# Why Lists
When an [Array](/PowerShell/Types/Arrays) is created it is a fixed size and all stored continuously in memory. If you want to add an additional item to an existing [array](/PowerShell/Types/Arrays), [PowerShell](/PowerShell) will rewrite the entire [Array](/PowerShell/Types/Arrays).

Image standing in line at the DMV and every time someone wants to join the line, everyone needs to move to a different location and line back up in the same order. That is what an [Array](/PowerShell/Types/Arrays) is doing every time you add something to it.

The ArrayList was created to solve this by randomly allocating memory. However, ArrayLists are not [type](/PowerShell/Types) specific. So, every item you write to them is converted into an object, then converted back when accessed. Commonly referred to as boxing and unboxing. Not only is this inefficient but it can lead to mixed data [types](/PowerShell/Types) ending up in the collection. 

The List is similar to the ArrayList in that it randomly allocates memory. But the big difference is it is [type](/PowerShell/Types) specific, so no boxing and unboxing. This makes them much more efficient. 

# Creating a list
To create a list you must declare the System.Collections.Generic.List class and provide an object [type](/PowerShell/Types). For a generic [PowerShell](/PowerShell) object it looks something like this:

<pre><br/><span class='Warning'>$list</span>&nbsp;<span class='Magenta'>=</span>&nbsp;<span class='Progress'>[Collections.Generic.List[PSObject]]</span><span class='Magenta'>::</span><span class='Output'>new</span><span class='Magenta'>(</span><span class='Magenta'>)</span><br/></pre>

If you want to save yourself some typing you can declare the System.Collections.Generic namespace at the begining of your script. Then just refer directly to the List class.

<pre><br/><span class='Verbose'>using</span>&nbsp;<span class='Verbose'>namespace</span>&nbsp;<span class='Verbose'>System.Collections.Generic</span><br/><br/><span class='Warning'>$ListA</span>&nbsp;<span class='Magenta'>=</span>&nbsp;<span class='Progress'>[List[PSObject]]</span><span class='Magenta'>::</span><span class='Output'>new</span><span class='Magenta'>(</span><span class='Magenta'>)</span><br/><span class='Warning'>$ListB</span>&nbsp;<span class='Magenta'>=</span>&nbsp;<span class='Progress'>[List[string]]</span><span class='Magenta'>::</span><span class='Output'>new</span><span class='Magenta'>(</span><span class='Magenta'>)</span><br/></pre>

# Adding data to a List

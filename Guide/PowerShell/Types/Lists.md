In the beginning the Array was created, followed shortly by the ArrayList. 

However, many were increasingly of the opinion that they’d all made a big mistake in creating the Array in the first place and that the ArrayList wasn’t much of an improvement.

So, the List was created…and there was much rejoicing. 

But why is the List the better option and do Arrays and ArrayLists still have a place in PowerShell?

The short answer, because of better memory allocation, yes, and not really.

# Why Lists
When an Array is created it is a fixed size and all stored continuously in memory. If you want to add an additional item to an existing array, PowerShell will rewrite the entire Array.

Image standing in line at the DMV and every time someone wants to join the line, everyone needs to move to a different location and line back up in the same order. That is what an Array is doing every time you add something to it.

The ArrayList was created to solve this by randomly allocating memory. However, ArrayLists are not type specific. So, every item you write to them is converted into an object, then converted back when accessed. Commonly referred to as boxing and unboxing. Not only is this inefficient but it can lead to mixed data types ending up in the collection.

The List is similar to the ArrayList in that it randomly allocates memory. But the big difference is it is type specific, so no boxing and unboxing. This makes them much more efficient. 

# Creating a list
To create a list you must declare the System.Collections.Generic.List class and provide an object type. For a generic PowerShell object it looks something like this:

~~~PowerShell
$list = [System.Collections.Generic.List[PSObject]]::new()
~~~

If you want to save yourself some typing you can declare the System.Collections.Generic namespace at the begining of your script. Then just refer directly to the List class.

~~~PowerShell
using namespace System.Collections.Generic

$ListA = [List[PSObject]]::new()
$ListB = [List[string]]::new()
~~~

# Adding data to a List

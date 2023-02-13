In the beginning the Array was created, followed shortly by the ArrayList. 

However, many were increasingly of the opinion that they’d all made a big mistake in creating the Array in the first place and that the ArrayList wasn’t much of an improvement.

So, the List was created…and there was much rejoicing. 

- Why is the List a better option? better memory allocation
- Do Arrays still have a place in PowerShell? yes
- Do ArrayLists still have a place in PowerShell? no

# Why Lists
When an Array is created it is a fixed size and all stored continuously in memory. If you want to add an additional item to an existing array, PowerShell will rewrite the entire Array.

Image standing in line at the DMV and every time someone wants to join the line, everyone needs to move to a different location and line back up in the same order. That is what an Array is doing every time you add something to it.

The ArrayList was created to solve this by randomly allocating memory. However, ArrayLists are not type specific. So, every item you write to them is converted into an object, then converted back when accessed. Commonly referred to as boxing and unboxing (not that type of boxing, nobody is getting hit in the face). 

Not only is this boxing and unboxing inefficient but it can lead to mixed data types ending up in the collection. And as well all know (at least those of us alive in the 80s) you never want to cross streams.

The List is similar to the ArrayList in that it randomly allocates memory. But the big difference is it is type specific, so no boxing and unboxing. This makes them much more efficient. 

# Creating a list
To create a list you must declare the System.Collections.Generic.List class and provide an object type. For a generic PowerShell object it looks something like this:

~~~PowerShell
$list = [Collections.Generic.List[PSObject]]::new()
~~~

If you want to save yourself some typing you can declare the System.Collections.Generic namespace at the beginning of your script. Then just refer directly to the List class.

~~~PowerShell
using namespace System.Collections.Generic

$ListA = [List[PSObject]]::new()
$ListB = [List[string]]::new()
~~~

# Adding data to a List
When adding data to a List there are two methods you can use, Add() and AddRange(). 

- Add() is used to a single entry to the list
- AddRange() is used to merge an existing list into this list

Add works great when you have control over the data being added to the list.
~~~PowerShell
$list = [Collections.Generic.List[PSObject]]::new()
$list.Add('Jake')
$list.Add('Elwood')
$list
~~~

But you need to be careful with Add(). Just like the famous in the Blue Brothers scene when Jake tells Elwood to get out of the parking lot so he drive into a mall (I know another 80s movie reference). The Add() will do exactly what you tell it to. So, if the object you add to a list is another collection object like a list or array, the Add() method will add that collection as a single entry in the list.

Think of it like bringing in your groceries. You could take the bags straight from your car and put them in the pantry. It will make finding what you want difficult, but hey the groceries got put away. This is what Add() does.

AddRange() is a way have your groceries automatically unpacked for and put in the pantry. 

You can see this for yourself if you run the following script block. The lists $BagOne and $BagTwo are added to the $Pantry list using the AddRange(). So, the list items are broken out and added to the $Pantry list. This gives you a total of six entries (three for $BagOne and three for $BagTwo). However, $BagThree is added using the Add() method. So the entire list is written to one entry.

~~~PowerShell
# Sample lists
[Collections.Generic.List[PSObject]]$BagOne = 'spaghetti','bread','Fruit Loops'
[Collections.Generic.List[PSObject]]$BagTwo = 'apples','chips','Swiss Cake Rolls'
[Collections.Generic.List[PSObject]]$BagThree = 'soup','cookies','EL Fudge'

# Declare new list
$Pantry = [Collections.Generic.List[PSObject]]::new()

# Use add range to unpack and add entries bags 1 and 2
$Pantry.AddRange($BagOne)
$Pantry.AddRange($BagTwo)

# Output should show one item per list item
for($i = 0; $i -lt $Pantry.Count; $i++){
    "$i - $($Pantry[$i])"
}

# Use add to add entries for bag 3
$Pantry.Add($BagThree)

# Bags 1 and 2 will be one per entry but bag 3 is a single item for all values
for($i = 0; $i -lt $Pantry.Count; $i++){
    "$i - $($Pantry[$i])"
}
~~~

While the AddRange() method is powerful, it does have its draw backs. The object you are adding must be a list. If you try to add an array or even a simple object like a string, it will throw an error. 
This leaves you with two options. You can attempt to convert the other objects into lists and add them using AddRange() or you can parse through the elements individually and use Add().

Back to our pantry, and now let’s say that that you are a wizard Harry. AddRange() is a spell that takes items from a paper bag and adds them to your pantry. This works great as long as you have paper bags. But when you have plastic bags you need to perform another spell that transforms them into paper bags so the AddRange() spell will work. 

But now what are you going to do when you have a reusable bag or just individual items. You now need a whole host of spells to identify the type then transform it paper bags. This is where you can end up with a massive mix of different if/else conditions, just trying to account for every data type. 

To prevent this, why don’t we just throw the contents of the bags into a bin and let them get added to the pantry one at a time using the Add() spell. It’s not as fast as having all paper bags, but when you don’t have control over the bag types it is faster and safer than trying to convert an unknown number of different types.

To help with this PowerShell comes with the great spell combination of the pipeline and Foreach-Object.

By piping an object to a Foreach-Object, PowerShell will process each entry individually. It doesn’t matter if it is a list, array. Arraylist, string, int, or any other object type. It just takes them one at a time and adds them to the list.

~~~PowerShell
# Create an array, arraylist, and list
[Collections.Generic.List[PSObject]]$BagList = 'spaghetti','bread','Fruit Loops'
[Collections.ArrayList]$BagArrayList = 'soup','cookies','EL Fudge'
[Array]$BagArray = 'apples','chips','Swiss Cake Rolls'

# Declare a new list
$Pantry = [Collections.Generic.List[PSObject]]::new()

# Add the array, arraylist, and list to the new list via piping to Foreach-Object
$BagList | Foreach-Object{ $Pantry.Add($_) }
$BagArrayList | Foreach-Object{ $Pantry.Add($_) }
$BagArray | Foreach-Object{ $Pantry.Add($_) }

# Show the list entries
for($i = 0; $i -lt $Pantry.Count; $i++){
    "$i - $($Pantry[$i])"
}
~~~
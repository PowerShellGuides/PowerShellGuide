It is a mistake to think you can solve all your problems just with PowerShell. But when you consider that PowerShell is built on .NET and you can reference .NET directly from a PowerShell script, you can safely say you can solve a large majority of them.

With our powers combined, we become Captain ~Planet~ PowerShell!!! With the ability to solve any problem in a single ~bound~ script.

There are some concepts you need to be aware of, which I've covered briefly below. You can also click on each one for a more in-depth explanation.
- Assemblies - The files that contain the .NET namespaces (dll).
- Namespaces - A collection of different classes and other .NET objects. Think Modules in PowerShell terms.
- Classes - Same as in PowerShell. It is a predefined set of properties and methods
- Methods - Similar to a function, they let you perform predefined actions

# Using .NET in PowerShell
You may not even realize it, but chances are you have already called .NET in your PowerShell scripts. If you’ve ever typed something like the code snippet below, you’ve called a .NET class.

~~~PowerShell
[string]$MyString = 'Mostly Harmless'
~~~

When square brackets are included at the front of a variable, you are telling PowerShell to ensure that it uses that particular class. In this case the System.String class. The reason this works is because the String class has inhert functionality to convert the input object to a String. 

But be warned, like the value of the string above, using this method is Mostly Harmless. However, once you start working with more complex classes this can cause unexpected consequences. For example, if you run the snippet below to convert a hashtable to a string, it will run with no errors. But if you look at the output it will just say, "System.Collections.Hashtable". That's because PowerShell had no idea what to do with it, so it just guessed. And it guessed really wrong.

~~~PowerShell
$HashTable = @{Book = 'The Restaurant at the End of the Universe'}
[string]$MyString = $HashTable
$MyString
~~~

A way to avoid this is by using the new() method. A .NET class knows how to populate the data inside it based on constructors. These constructors define the data types that a class can use to build itself. For instance the String class has constructors to support other strings, char, SByte, and many other data types. But it does not have one for hashtables.

By using the new() method you are building an automatic ejection seat for your script. If a matching constructor is not found it will throw an error. You can see this in the snippet below. $StringA will work because it is receving a string value, but $StringB will throw an error because it doesn't know what to do with a hashtable.

~~~PowerShell
$StringA = [string]::new('And Another Thing... ')
$StringA
$HashTable = @{Book = 'The Restaurant at the End of the Universe'}
$StringB = [string]::new($HashTable)
$StringB
~~~

You can also create instances of a class using the New-Object cmdlet. 

~~~PowerShell
$MyString = New-Object -TypeName String -ArgumentList 'So Long, and Thanks for All the Fish'
~~~

The New-Object provides you the same functionality as using the new() method, but with the added benefit of making you type more. 

So why use the New-Object cmdlet? The unoffical answer is, preference. The official answer is backwards capabilty. Prior to PowerShell 5 you had to use New-Object. However, the most effective way of dealing with anyone still running PowerShell 4 or older is to run away...terribly fast.

# Load Assemblies
The reason all the previous example worked is because the assembly and namespace containing the String class are loaded automatically by PowerShell. However, this is not the case for all classes. For instance, try running the code snippet below:
~~~PowerShell
$HAL = [Speech.Synthesis.SpeechSynthesizer]::new()
$HAL.Speak("Hello Dave")
~~~

If this snippet ran for you, good job! That means you are using PowerShell 7. However, if you are using Windows PowerShell you would have seen the error message, “Unable to find type [Speech.Synthesis.SpeechSynthesizer].” That because the assembly containing the SpeechSynthesizer class is not loaded by default in older versions of PowerShell.

In cases where the assemblies are not automatically loaded, you need to load them using the Add-Type cmdlet. In this case:
~~~PowerShell
Add-Type -AssemblyName System.Speech
$HAL = [Speech.Synthesis.SpeechSynthesizer]::new()
$HAL.Speak("Just what do you think you're doing, Dave?")
~~~
 
But wait, there is more!

The above command only works because the System.Speech is loaded in the GAC. That’s GAC as in Global Assembly Cache not GAK, as in the toy slime from Nickelodeon that made "rude" noises. However, they are similar in the fact that they have both been discontinued. The purpose of the GAC is to share assemblies across applications on your machine but this only exists in Windows. Therefore to maintain cross-platform compatibility .NET core and by extension PowerShell no longer uses the GAC.

In order to load an assembly in PowerShell 7 you must use the full path. Which on it's own can make thing more difficult to account for cross-platform running, but that's where PowerShell Modules come in. You can package the DLLs in the module and import them at runtime. More on this in the module sections.

# Using .NET classes without objects
As you saw earlier you can create an instance of the new() method. However, this is not always needed or even possible.

For example, if you want to round a number to a specific decimal, you can use the System.Math class. Expect the System.Math class doesn’t have any constructors so you can’t use the new() method. But that doesn’t mean you can’t use all the other methods available.

You can call a class method the same way you call the new() method. Two colons after the class name in square brackets. [class]::MethodABC() or [class]::MethodABC('parameters').You will see these used all the time in PowerShell.
~~~PowerShell
[math]::Round(3.14159265359, 5)
[regex]::Replace('It can only be attributable to human error.','human','computer')
[Web.HttpUtility]::UrlEncode($SomeUrl)
~~~

# Using using
I don't know about you, but I hate typing out System.Collections.Generic.List everytime I want to make a list. As you know now, I can left the System off, but I'm still to lazy to type Collections.Generic.List. So, I can buy a macro keyboard and program a key to type if for me. Or I can use PowerShell to shorten it for me by using, using.

The using statement allows you to declare which namespaces you are using in the script. Thus allowing you to only use the class name. So instead of System.Collections.Generic.List all I need to type is List.

~~~PowerShell
using namespace System.Collections.Generic
$MyList = [List[PSCustomObject]]::new()
$AnotherList = [List[PSCustomObject]]::new()
~~~

The big thing to remember is using statements must come before any other code in your script and cannot contain variables. 

## Not everything is a class
While classes are the most common object you'll work with like this they are not the only ones.

Another common object type you wil use is the structure or Struct but for the most part you'll never notice (or really care) is an object is a Struct or a class. To give you an idea, I bet you didn't know DateTime is a Struct. And unless you are getting into lower-level programming languages you don't need to worry about. Just throw them on the heap and let the garbage be collected.

Much like Eeyore, enumerations (enum) are often overlooked, but can be your best friend. Enumerations can be looks at like predefined lists. 

For eaxmple, the enumeration DateTimeKind is used to specify if a date is local time, UTC, or not specified. By using an enum you can ensure that the right value is provided.

And just for some added fun, there is a class named enum that can be used to show all of the values of an enum.

~~~PowerShell
[Enum]::GetNames([DateTimeKind])
~~~

Once you know the values you can set them using the double semi-colon.

~~~PowerShell
[DateTimeKind]::UTC
~~~
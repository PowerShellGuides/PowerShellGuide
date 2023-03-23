---

alias: 
- .Net
- NET
title: PowerShell NET and Everything

layout: default
---

It is a mistake to think you can solve all your problems just with [PowerShell](/PowerShell). But when you consider that [PowerShell](/PowerShell) is built on .NET and you can reference .NET directly from a [PowerShell](/PowerShell) script, you can safely say you can solve a large majority of them.

With our powers combined, we become Captain ~Planet~ PowerShell!!! With the ability to solve any problem in a single ~bound~ script.

There are some concepts you need to be aware of, which I've covered briefly below. You can also click on each one for a more in-depth explanation.
- [Assemblies](/Languages/Assemblies) - The files that contain the .NET [namespaces](/Languages/Namespace) (dll).
- [Namespaces](/Languages/Namespace) - A collection of different classes and other .NET objects. Think [Modules](/PowerShell/Modules) in [PowerShell](/PowerShell) terms.
- Classes - Same as in [PowerShell](/PowerShell). It is a predefined set of properties and methods
- Methods - Similar to a [function](/PowerShell/Functions), they let you perform predefined actions

# Using .NET in [PowerShell](/PowerShell)
You may not even realize it, but chances are you have already called .NET in your [PowerShell scripts](/PowerShell/Scripts). If you’ve ever typed something like the code snippet below, you’ve called a .NET class.

<pre><br/><span class='Progress'>[string]</span><span class='Warning'>$MyString</span>&nbsp;<span class='Magenta'>=</span>&nbsp;<span class='Verbose'>'Mostly Harmless'</span><br/></pre>

When square brackets are included at the front of a [variable](/PowerShell/Variables), you are telling [PowerShell](/PowerShell) to ensure that it uses that particular class. In this case the System.String class. The reason this works is because the String class has inhert functionality to convert the input object to a String. 

But be warned, like the value of the string above, using this method is Mostly Harmless. However, once you start working with more complex classes this can cause unexpected consequences. For example, if you run the snippet below to convert a hashtable to a string, it will run with no errors. But if you look at the output it will just say, "System.Collections.Hashtable". That's because [PowerShell](/PowerShell) had no idea what to do with it, so it just guessed. And it guessed really wrong.

<pre><br/><span class='Warning'>$HashTable</span>&nbsp;<span class='Magenta'>=</span>&nbsp;<span class='Magenta'>@{</span><span class='Output'>Book</span>&nbsp;<span class='Magenta'>=</span>&nbsp;<span class='Verbose'>'The Restaurant at the End of the Universe'</span><span class='Magenta'>}</span><br/><span class='Progress'>[string]</span><span class='Warning'>$MyString</span>&nbsp;<span class='Magenta'>=</span>&nbsp;<span class='Warning'>$HashTable</span><br/><span class='Warning'>$MyString</span><br/></pre>

A way to avoid this is by using the new() method. A .NET class knows how to populate the data inside it based on constructors. These constructors define the data [types](/PowerShell/Types) that a class can use to build itself. For instance the String class has constructors to support other strings, char, SByte, and many other data [types](/PowerShell/Types). But it does not have one for hashtables.

By using the new() method you are building an automatic ejection seat for your script. If a matching constructor is not found it will throw an error. You can see this in the snippet below. $StringA will work because it is receving a string value, but $StringB will throw an error because it doesn't know what to do with a hashtable.

<pre><br/><span class='Warning'>$StringA</span>&nbsp;<span class='Magenta'>=</span>&nbsp;<span class='Progress'>[string]</span><span class='Magenta'>::</span><span class='Output'>new</span><span class='Magenta'>(</span><span class='Verbose'>'And Another Thing... '</span><span class='Magenta'>)</span><br/><span class='Warning'>$StringA</span><br/><span class='Warning'>$HashTable</span>&nbsp;<span class='Magenta'>=</span>&nbsp;<span class='Magenta'>@{</span><span class='Output'>Book</span>&nbsp;<span class='Magenta'>=</span>&nbsp;<span class='Verbose'>'The Restaurant at the End of the Universe'</span><span class='Magenta'>}</span><br/><span class='Warning'>$StringB</span>&nbsp;<span class='Magenta'>=</span>&nbsp;<span class='Progress'>[string]</span><span class='Magenta'>::</span><span class='Output'>new</span><span class='Magenta'>(</span><span class='Warning'>$HashTable</span><span class='Magenta'>)</span><br/><span class='Warning'>$StringB</span><br/></pre>

You can also create instances of a class using the New-Object cmdlet. 

<pre><br/><span class='Warning'>$MyString</span>&nbsp;<span class='Magenta'>=</span>&nbsp;<span class='Warning'>New-Object</span>&nbsp;<span class='Magenta'>-TypeName</span>&nbsp;<span class='Verbose'>String</span>&nbsp;<span class='Magenta'>-ArgumentList</span>&nbsp;<span class='Verbose'>'So Long, and Thanks for All the Fish'</span><br/></pre>

The New-Object provides you the same functionality as using the new() method, but with the added benefit of making you [type](/PowerShell/Types) more. 

So why use the New-Object cmdlet? The unoffical answer is, preference. The official answer is backwards capabilty. Prior to [PowerShell](/PowerShell) 4 you had to use New-Object. However, the most effective way of dealing with anyone still running [PowerShell](/PowerShell) 3 or older is to run away...terribly fast.

# Load [Assemblies](/Languages/Assemblies)
The reason all the previous example worked is because the [assembly](/Languages/Assemblies) and [namespace](/Languages/Namespace) containing the String class are loaded automatically by [PowerShell](/PowerShell). However, this is not the case for all classes. For instance, try running the code snippet below:
<pre><br/><span class='Warning'>$HAL</span>&nbsp;<span class='Magenta'>=</span>&nbsp;<span class='Progress'>[Speech.Synthesis.SpeechSynthesizer]</span><span class='Magenta'>::</span><span class='Output'>new</span><span class='Magenta'>(</span><span class='Magenta'>)</span><br/><span class='Warning'>$HAL</span><span class='Magenta'>.</span><span class='Output'>Speak</span><span class='Magenta'>(</span><span class='Verbose'>"Hello Dave"</span><span class='Magenta'>)</span><br/></pre>

If this snippet ran for you, good job! That means you are using [PowerShell](/PowerShell) 7. However, if you are using Windows [PowerShell](/PowerShell) you would have seen the error message, “Unable to find [type](/PowerShell/Types) [Speech.Synthesis.SpeechSynthesizer].” That because the [assembly](/Languages/Assemblies) containing the SpeechSynthesizer class is not loaded by default in older versions of [PowerShell](/PowerShell).

In cases where the [assemblies](/Languages/Assemblies) are not automatically loaded, you need to load them using the Add-Type cmdlet. In this case:
<pre><br/><span class='Warning'>Add-Type</span>&nbsp;<span class='Magenta'>-AssemblyName</span>&nbsp;<span class='Verbose'>System.Speech</span><br/><span class='Warning'>$HAL</span>&nbsp;<span class='Magenta'>=</span>&nbsp;<span class='Progress'>[Speech.Synthesis.SpeechSynthesizer]</span><span class='Magenta'>::</span><span class='Output'>new</span><span class='Magenta'>(</span><span class='Magenta'>)</span><br/><span class='Warning'>$HAL</span><span class='Magenta'>.</span><span class='Output'>Speak</span><span class='Magenta'>(</span><span class='Verbose'>"Just what do you think you're doing, Dave?"</span><span class='Magenta'>)</span><br/></pre>
 
But wait, there is more!

The above [command](/PowerShell/Commands) only works because the System.Speech is loaded in the GAC. That’s GAC as in Global [Assembly](/Languages/Assemblies) Cache not GAK, as in the toy slime from Nickelodeon that made "rude" noises. However, they are similar in the fact that they have both been discontinued. The purpose of the GAC is to share [assemblies](/Languages/Assemblies) across applications on your machine but this only exists in Windows. Therefore to maintain cross-platform compatibility .NET core and by extension [PowerShell](/PowerShell) no longer uses the GAC.

In order to load an [assembly](/Languages/Assemblies) in [PowerShell](/PowerShell) 7 you must use the full path. Which on it's own can make thing more difficult to account for cross-platform running, but that's where [PowerShell Modules](/PowerShell/Modules) come in. You can package the DLLs in the [module](/PowerShell/Modules) and import them at runtime. More on this in the [module](/PowerShell/Modules) sections.

# Using .NET classes without objects
As you saw earlier you can create an instance of the new() method. However, this is not always needed or even possible.

For example, if you want to round a number to a specific decimal, you can use the System.Math class. Expect the System.Math class doesn’t have any constructors so you can’t use the new() method. But that doesn’t mean you can’t use all the other methods available.

You can call a class method the same way you call the new() method. Two colons after the class name in square brackets. [class]::MethodABC() or [class]::MethodABC('[parameters](/PowerShell/Parameters)').You will see these used all the time in [PowerShell](/PowerShell).
<pre><br/><span class='Progress'>[math]</span><span class='Magenta'>::</span><span class='Output'>Round</span><span class='Magenta'>(</span><span class='Output'>3.14159265359</span><span class='Magenta'>,</span>&nbsp;<span class='Output'>5</span><span class='Magenta'>)</span><br/><span class='Progress'>[regex]</span><span class='Magenta'>::</span><span class='Output'>Replace</span><span class='Magenta'>(</span><span class='Verbose'>'It can only be attributable to human error.'</span><span class='Magenta'>,</span><span class='Verbose'>'human'</span><span class='Magenta'>,</span><span class='Verbose'>'computer'</span><span class='Magenta'>)</span><br/><span class='Progress'>[Web.HttpUtility]</span><span class='Magenta'>::</span><span class='Output'>UrlEncode</span><span class='Magenta'>(</span><span class='Warning'>$SomeUrl</span><span class='Magenta'>)</span><br/></pre>

# Using using
I don't know about you, but I hate typing out System.Collections.Generic.List everytime I want to make a list. As you know now, I can left the System off, but I'm still to lazy to [type](/PowerShell/Types) Collections.Generic.List. So, I can buy a macro keyboard and program a key to [type](/PowerShell/Types) if for me. Or I can use [PowerShell](/PowerShell) to shorten it for me by using, using.

The using statement allows you to declare which [namespaces](/Languages/Namespace) you are using in the script. Thus allowing you to only use the class name. So instead of System.Collections.Generic.List all I need to [type](/PowerShell/Types) is List.

<pre><br/><span class='Verbose'>using</span>&nbsp;<span class='Verbose'>namespace</span>&nbsp;<span class='Verbose'>System.Collections.Generic</span><br/><span class='Warning'>$MyList</span>&nbsp;<span class='Magenta'>=</span>&nbsp;<span class='Progress'>[List[PSCustomObject]]</span><span class='Magenta'>::</span><span class='Output'>new</span><span class='Magenta'>(</span><span class='Magenta'>)</span><br/><span class='Warning'>$AnotherList</span>&nbsp;<span class='Magenta'>=</span>&nbsp;<span class='Progress'>[List[PSCustomObject]]</span><span class='Magenta'>::</span><span class='Output'>new</span><span class='Magenta'>(</span><span class='Magenta'>)</span><br/></pre>

The big thing to remember is using statements must come before any other code in your script and cannot contain [variables](/PowerShell/Variables). 

## Not everything is a class
While classes are the most common object you'll work with like this they are not the only ones.

Another common object [type](/PowerShell/Types) you wil use is the structure or Struct but for the most part you'll never notice (or really care) is an object is a Struct or a class. To give you an idea, I bet you didn't know DateTime is a Struct. And unless you are getting into lower-level [programming languages](/Languages/Programming-Languages) you don't need to worry about. Just throw them on the heap and let the garbage be collected.

Much like Eeyore, enumerations (enum) are often overlooked, but can be your best friend. Enumerations can be looks at like predefined [lists](/PowerShell/Types/Lists). 

For eaxmple, the enumeration DateTimeKind is used to specify if a date is local time, UTC, or not specified. By using an enum you can ensure that the right value is provided.

And just for some added fun, there is a class named enum that can be used to show all of the values of an enum.

<pre><br/><span class='Progress'>[Enum]</span><span class='Magenta'>::</span><span class='Output'>GetNames</span><span class='Magenta'>(</span><span class='Progress'>[DateTimeKind]</span><span class='Magenta'>)</span><br/></pre>

Once you know the values you can set them using the double semi-colon.

<pre><br/><span class='Progress'>[DateTimeKind]</span><span class='Magenta'>::</span><span class='Output'>UTC</span><br/></pre>

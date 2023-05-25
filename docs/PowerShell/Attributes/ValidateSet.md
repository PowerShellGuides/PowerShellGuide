---

alias: Validate Set
coursename: Working with Attributes
level: 101
title: ValidateSet

layout: default
---

The ValidateSet attribute serves two very equal yet different purposes. 
1. It prevents unexpected values from being passed to your code.
1. It prevents you from having to [type](/PowerShell/Types) as much.

Much like a multiple choice test a ValidateSet set gives the user a defined set of answers to choose from, and they can only choose from those answers. 

# Adding ValidateSet to [Parameter](/PowerShell/Parameters)

To create a ValidateSet you can simply add the attribute to a [parameter](/PowerShell/Parameters), and provide a list of acceptable values.

<pre>&nbsp;&nbsp;<span class='Verbose'>Function</span>&nbsp;<span class='Verbose'>New-SuperAwesomeFile</span><span class='Magenta'>{</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class='Verbose'>param</span><span class='Magenta'>(</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class='Magenta'>[</span><span class='Output'>ValidateSet</span><span class='Magenta'>(</span><span class='Verbose'>'json'</span><span class='Magenta'>,</span><span class='Verbose'>'csv'</span><span class='Magenta'>,</span><span class='Verbose'>'txt'</span><span class='Magenta'>)</span><span class='Magenta'>]</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class='Warning'>$FileType</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class='Magenta'>)</span>&nbsp;&nbsp;<span class='Magenta'>}</span>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Warning'>New-SuperAwesomeFile</span>&nbsp;<span class='Magenta'>-FileType</span>&nbsp;<span class='Verbose'>csv</span>&nbsp;&nbsp;</pre>

Not only does the ValidateSet prevent unexpected values from being passed, but in most terminals, you will get a nice dropdown of the values for you to choose from.

The biggest limitation of the ValidateSet is that it is a defined list. So, it works well in situations where you have a finite list of options. 

For creating more complex validations you can use ValidatePattern, ValidateRange, or [ValidateScript](/PowerShell/Attributes/ValidateScript).

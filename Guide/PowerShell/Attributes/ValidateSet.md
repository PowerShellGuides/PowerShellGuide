The ValidateSet attribute serves two very equal yet different purposes. 

1. It prevents unexpected values from being passed to your code.
2. It prevents you from having to type as much.

Much like a multiple choice test a ValidateSet set gives the user a defined set of answers to choose from, and they can only choose from those answers. 

# Adding ValidateSet to Parameter

To create a ValidateSet you can simply add the attribute to a parameter, and provide a list of acceptable values.

~~~PowerShell
function New-SuperAwesomeFile {
    param([ValidateSet('json','csv','txt')]$FileType)
}
New-SuperAwesomeFile -FileType csv
~~~

Not only does the ValidateSet prevent unexpected values from being passed, but in most terminals, you will get a nice dropdown of the values for you to choose from.

The biggest limitation of the ValidateSet is that it is a defined list. So, it works well in situations where you have a finite list of options. 

For creating more complex validations you can use ValidatePattern, ValidateRange, or ValidateScript.


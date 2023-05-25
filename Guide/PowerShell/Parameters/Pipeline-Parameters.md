The Object Pipeline is a wonderful thing.

It lets us pass a pipeline of objects to our commands, which can be handled one-by-one in the process block.

If we want to make a Pipeline Parameter, we need to add the Parameter Attribute with one of two settings.

## ValueFromPipeline parameters

If you declare a parameter as `ValueFromPipeline`, any object that can become that parameter's type will pipe in cleanly.

~~~PowerShell
# Make a quick function to get the day of the week
function Get-DayOfWeek
{
    param(
    [Parameter(ValueFromPipeline)]
    [DateTime]
    $Date
    )

    process {
        $Date.DayOfWeek
    }
}

# Now we can pipe what will become dates into the pipeline
# and see that the turn of the century was on a weekend.
"12/31/1999","1/1/2000" | Get-DayOfWeek
~~~

ValueFromPipeline parameters can be very useful, with a few gotchas.

The first gotcha to beware of is that, while PowerShell is promisucous, it can sometimes be a little too promiscuous.

If, for instance, you have a ValueFromPipeline parameter that takes a string, it will _always_ be mapped.

The second, much less obvious gotcha, is that PowerShell objects are not always "live".

When you Import-Clixml or use PowerShell remoting, objects will come back deserialized, and will not bind to a ValueFromPipeline parameter.

Don't get too despondent.  There's a better way you can deal with the pipeline.

### ValueFromPipelineByPropertyName

We know, it's a mouthful.

A ValueFromPipelineByPropertyName parameter gets it's value from a property of an object in the pipeline.

This means we can use it to pick off one or more properties _from any type of object_.

Let's write something almost entirely useless to demonstrate the point.

~~~PowerShell
function Get-ID
{    
    param(
    [Parameter(ValueFromPipelineByPropertyName)]
    [int]
    $ID
    )

    process {
        $ID
    }
}

Get-Process | Get-ID # This will output all of the IDs of all of the running processes.
~~~

ValueFromPipelineByPropertyName doesn't _just_ work on one property though.

If you add an Alias to the parameter, it will look for each aliased property.

This makes PowerShell uniquely suited to building bridges between technologies,
since you can make one PowerShell command that can work with many inputs.








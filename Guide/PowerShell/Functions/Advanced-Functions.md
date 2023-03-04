In PowerShell V2, functions got a lot more advanced.

They can do anything a Cmdlet can do.  This is why advanced functions are sometimes called Script Cmdlets.

A function is considered advanced if it has a CmdletBinding attribute or any Parameter attributes.

Hopefully, that is not too advanced of a concept.

Let's talk about a few big benefits of advanced functions.

## Mandatory parameters

The first little big thing you get by making a function advanced is the ability to mark a parameter as `Mandatory`.

A Mandatory parameter must be provided in order for a command to run.

## Pipeline Binding

The Object Pipeline is a major part of PowerShell.

We can use Parameter attributes to make a parameter bind to objects from the pipeline, and the process block to handle each object coming thru the pipeline.

~~~PowerShell
function WhatDayOfTheWeek(
    [Parameter(Mandatory,ValueFromPipeline)]
    [DateTime]
    $DateTime
) {
    process {
        $DateTime.DayOfWeek
    }
}
~~~

Because PowerShell is type promiscuous, we can just supply a string with a date and PowerShell will turn it into a DateTime.

~~~PowerShell
"12/31/2000" | WhatDayOfTheWeek
~~~

We can even provide a list of dates if we want to.

~~~PowerShell
"07/04/1776", "09/28/1787" | WhatDayOfTheWeek
~~~

## Property binding

Property binding is what it sounds like.

We can make parameters in PowerShell bind to one or more properties.

We do this with the mouthful of a setting, ValueFromPipelineByPropertyName.

~~~PowerShell
function NameAndAge {
    param(
    [Parameter(Mandatory,ValueFromPipelineByPropertyName)]
    [string]
    $Name,

    [Parameter(Mandatory,ValueFromPipelineByPropertyName)]
    [double]
    $Age
    )

    process {
        [PSCustomObject]$PSBoundParameters
    }
}
~~~

Any object that has both an `Age` and `Name` property can be piped into this function

~~~PowerShell
[PSCustomObject]@{
    Name = 'James'
    Age  = 41
} | NameAndAge
~~~

## Parameter Sets

We all know there's more than one way to skin a cat (hopefully not from direct experience).

There also can be more than one way to run a command.

ParameterSets allow for various parameters to be grouped together.

~~~PowerShell
function MoveDirection(    
    [Parameter(Mandatory)]
    [double]
    $Distance,

    [Parameter(Mandatory,ParameterSetName='North')]
    [switch]
    $North,

    [Parameter(Mandatory,ParameterSetName='South')]
    [switch]
    $South,

    [Parameter(Mandatory,ParameterSetName='East')]
    [switch]
    $East,

    [Parameter(Mandatory,ParameterSetName='West')]
    [switch]
    $West
    ) {

    [PSCustomObject]@{
        Distance = $distance
        Direction = $psCmdlet.ParameterSetName
    }
}

MoveDirection -Distance 1 -North
~~~
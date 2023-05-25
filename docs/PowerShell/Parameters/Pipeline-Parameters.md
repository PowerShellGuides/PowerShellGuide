---

title: Pipeline Parameters

layout: default
---

The [Object Pipeline](/PowerShell/Concepts/The-Object-Pipeline) is a wonderful thing.

It lets us pass a [pipeline](/PowerShell/Concepts/The-Object-Pipeline) of objects to our [commands](/PowerShell/Commands), which can be handled one-by-one in the [process block](/PowerShell/ScriptBlock/Process-Block).

If we want to make a [Pipeline](/PowerShell/Concepts/The-Object-Pipeline) [Parameter](/PowerShell/Parameters), we need to add the [Parameter](/PowerShell/Parameters) Attribute with one of two settings.

## ValueFromPipeline [parameters](/PowerShell/Parameters)

If you declare a [parameter](/PowerShell/Parameters) as `ValueFromPipeline`, any object that can become that [parameter](/PowerShell/Parameters)'s [type](/PowerShell/Types) will pipe in cleanly.

<pre><br/><span class='Success'># Make a quick function to get the day of the week</span><br/><span class='Verbose'>function</span>&nbsp;<span class='Verbose'>Get-DayOfWeek</span><br/><span class='Magenta'>{</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Verbose'>param</span><span class='Magenta'>(</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Magenta'>[</span><span class='Output'>Parameter</span><span class='Magenta'>(</span><span class='Output'>ValueFromPipeline</span><span class='Magenta'>)</span><span class='Magenta'>]</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Progress'>[DateTime]</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Warning'>$Date</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Magenta'>)</span><br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Verbose'>process</span>&nbsp;<span class='Magenta'>{</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class='Warning'>$Date</span><span class='Magenta'>.</span><span class='Output'>DayOfWeek</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Magenta'>}</span><br/><span class='Magenta'>}</span><br/><br/><span class='Success'># Now we can pipe what will become dates into the pipeline</span><br/><span class='Success'># and see that the turn of the century was on a weekend.</span><br/><span class='Verbose'>"12/31/1999"</span><span class='Magenta'>,</span><span class='Verbose'>"1/1/2000"</span>&nbsp;<span class='Magenta'>|</span>&nbsp;<span class='Warning'>Get-DayOfWeek</span><br/></pre>

ValueFromPipeline [parameters](/PowerShell/Parameters) can be very useful, with a few gotchas.

The first gotcha to beware of is that, while [PowerShell](/PowerShell) is promisucous, it can sometimes be a little too promiscuous.

If, for instance, you have a ValueFromPipeline [parameter](/PowerShell/Parameters) that takes a string, it will _always_ be mapped.

The second, much less obvious gotcha, is that [PowerShell](/PowerShell) objects are not always "live".

When you Import-Clixml or use [PowerShell](/PowerShell) remoting, objects will come back deserialized, and will not bind to a ValueFromPipeline [parameter](/PowerShell/Parameters).

Don't get too despondent.  There's a better way you can deal with the [pipeline](/PowerShell/Concepts/The-Object-Pipeline).

### ValueFromPipelineByPropertyName

We know, it's a mouthful.

A ValueFromPipelineByPropertyName [parameter](/PowerShell/Parameters) gets it's value from a property of an object in the [pipeline](/PowerShell/Concepts/The-Object-Pipeline).

This means we can use it to pick off one or more properties _from any [type](/PowerShell/Types) of object_.

Let's write something almost entirely useless to demonstrate the point.

<pre><br/><span class='Verbose'>function</span>&nbsp;<span class='Verbose'>Get-ID</span><br/><span class='Magenta'>{</span>&nbsp;&nbsp;&nbsp;&nbsp;<br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Verbose'>param</span><span class='Magenta'>(</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Magenta'>[</span><span class='Output'>Parameter</span><span class='Magenta'>(</span><span class='Output'>ValueFromPipelineByPropertyName</span><span class='Magenta'>)</span><span class='Magenta'>]</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Progress'>[int]</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Warning'>$ID</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Magenta'>)</span><br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Verbose'>process</span>&nbsp;<span class='Magenta'>{</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class='Warning'>$ID</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Magenta'>}</span><br/><span class='Magenta'>}</span><br/><br/><span class='Warning'>Get-Process</span>&nbsp;<span class='Magenta'>|</span>&nbsp;<span class='Warning'>Get-ID</span>&nbsp;<span class='Success'># This will output all of the IDs of all of the running processes.</span><br/></pre>

ValueFromPipelineByPropertyName doesn't _just_ work on one property though.

If you add an Alias to the [parameter](/PowerShell/Parameters), it will look for each aliased property.

This makes [PowerShell](/PowerShell) uniquely suited to building bridges between technologies,
since you can make one [PowerShell command](/PowerShell/Commands) that can work with many inputs.

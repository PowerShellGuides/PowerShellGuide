The Object Pipeline is, well, a pipeline full of objects.
If a ScriptBlock has a process block, each object in the pipeline will be, well, processed.

## Faster Foreach-Object

By way of the simplest example, below is what is sometimes called a "fast Foreach-Object".

~~~PowerShell
1,2,3 | # We pipe whatever we would like into a scriptblock with a process block
    & { process { $_ } } # (and this is several times faster that piping to Foreach-Object)
~~~

## Process Block and Pipeline Parameters

If your ScriptBlock had pipelined parameters, they will be mapped each time.

~~~PowerShell
[PSCustomObject]@{x=1;y=2},[PSCustomObject]@{x=2;y=1} |
    & {
        param(
        [Parameter(ValueFromPipelineByPropertyName)]
        $X,
        [Parameter(ValueFromPipelineByPropertyName)]
        $Y
        )

        process {
            "$X,$Y"
        }
    }
~~~



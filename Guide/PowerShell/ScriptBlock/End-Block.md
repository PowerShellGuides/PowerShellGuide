Continuing with our obvious but useful naming scheme established by the begin block and the process block, when the end block runs at the end of the object pipeline.

~~~Powershell
& {
    begin {
        "begin begins"
    }
    process {
        "process processes"
    }
    end {
        "end ends"
    }
}
~~~

No matter how many times process is run, end only runs once.

## end is the default

If you do not specify any named block, a ScriptBlock will assume it should be run at the end.

This tiny distinction is easy to forget, and makes writing code that uses the object pipeline a little more painful than we think it should be.

Let's run a short script to demonstrate

~~~PowerShell
1..1mb | 
    & {"I just piped a million objects into this and all I got was this stupid message"}
~~~





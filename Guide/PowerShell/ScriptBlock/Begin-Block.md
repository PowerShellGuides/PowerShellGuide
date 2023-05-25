In the beginning of a command, before the object pipeline processes anything in it's process block, a begin block will run.

Begin blocks can be used to initialize variables and prepare your script to run.

For instance, if we wanted to count how many objects were piped in,
we'd create a variable to count objects in begin and set it to 0.

~~~PowerShell
1..10 | 
    & {
        begin {
            $ObjectCounter = 0
            "starting up"
        }
        process {
            $ObjectCounter++
            "processing $_"
        }
        end {
            "processed $objectCounter times"
        }
    }
~~~

begin blocks, process blocks, and end blocks are fairly handy once you get the hang of them, and a feature not found in many programming languages.

## Begin blocks and Pipeline parameters

One quick thing to note - Any parameters you provide without the object pipeline (by name or positionally) will be available as variables in begin

Any pipeline parameters will not be mapped in the begin block - they will be mapped in the process block.

# To Err is Human

One of the most dangerous phrases in technology is "I Made a Huge Mistake".

For anyone so unfortunate to utter this phrase, they are likely to hear something along the lines of "You're Fired."

Since PowerShell is perfect for programming at scale, any mistake you make can also happen at scale.

This is to say: programming can be a loaded gun, and you may shoot yourself in the foot.

Automation is a loaded minigun, and you may shoot your foot off.

Luckily, PowerShell has a built in way to prompt for confirmation.

This is to say: PowerShell has a safety.

Any command in PowerShell can prompt for confirmation, by saying it SupportsShouldProcess in the CmdletBinding Attribute.

This enables two parameters, `-Confirm` and `-WhatIf`.

That is to say: When designing dangerous commands, be sure to add the safety.

## -Confirm

Plenty of built-in PowerShell commands support should process.

Let's see how this works with the command New-Item:

~~~PowerShell
New-Item -ItemType File -Path .\test.file -Confirm
~~~

When we pass the -Confirm parameter, we're making PowerShell ask us for confirmation.

We can tell it not to confirm with `-Confirm:$false`

~~~PowerShell
New-Item -ItemType File -Path .\test.file -Confirm:$false
~~~

### ConfirmImpact

You might be asking yourself: why don't I always get prompted when a file is created?

That's because creating a file has a confirmation impact level of 'Low'.

A command's `[ConfirmImpact]` should reflect how dangerous it would be to make a mistake.

Confirm Impacts can be low, medium, and high.

### $ConfirmPreference

`$confirmPreference` is a preference variable that determines when you want to be prompted.

It's default is 'High'.  If you're a more nervous sort, you're welcome to modify that.  Just prepare to be prompted.

## -WhatIf

Last but not least, we have to talk about -WhatIf.

Anything that can prompt for confirmation can also be passed the -WhatIf parameter.

By default, -WhatIf will write the message that would have be used to confirm to the host.

~~~PowerShell
New-Item -ItemType File -Path .\test.file.2 -WhatIf
~~~

-WhatIf's default behavior isn't the most ideal PowerShell.

Because it directly prints to the screen, you cannot capture -WhatIf, 
unless whoever wrote the command you're using reads the next few paragraphs.

## $whatIfPreference

$whatIfPreference is another preference variable.

Like many preference variables, it is set whenever you pass -WhatIf

Thus, if we are writing a function, and want to make a useful -WhatIf, we say:

~~~PowerShell
if ($whatIfPreference) {
    <# Output something about what you would do. #> 
} elseif ($psCmdlet.ShouldProcess("Prompt for Confirmation")) {
    <# Do Something that might be dangerous. #>
}
~~~

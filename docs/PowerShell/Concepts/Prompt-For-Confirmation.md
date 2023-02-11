---

title: Prompt For Confirmation

layout: default
---

# To Err is Human

One of the most dangerous phrases in technology is "I Made a Huge Mistake".

For anyone so unfortunate to utter this phrase, they are likely to hear something along the lines of "You're Fired."

Since [PowerShell](/PowerShell) is perfect for programming at scale, any mistake you make can also happen at scale.

This is to say: programming can be a loaded gun, and you may shoot yourself in the foot.

Automation is a loaded minigun, and you may shoot your foot off.

Luckily, [PowerShell](/PowerShell) has a built in way to prompt for confirmation.

This is to say: [PowerShell](/PowerShell) has a safety.

Any [command](/PowerShell/Commands) in [PowerShell](/PowerShell) can prompt for confirmation, by saying it SupportsShouldProcess.

## -Confirm

Let's see how this works with the [command](/PowerShell/Commands) New-Item:

<pre><br/><span class='Warning'>New-Item</span>&nbsp;<span class='Magenta'>-ItemType</span>&nbsp;<span class='Verbose'>File</span>&nbsp;<span class='Magenta'>-Path</span>&nbsp;<span class='Verbose'>.\test.file</span>&nbsp;<span class='Magenta'>-Confirm</span><br/></pre>

When we pass the -Confirm [parameter](/PowerShell/Parameters), we're making [PowerShell](/PowerShell) ask us for confirmation.

We can tell it not to confirm with `-Confirm:$false`

<pre><br/><span class='Warning'>New-Item</span>&nbsp;<span class='Magenta'>-ItemType</span>&nbsp;<span class='Verbose'>File</span>&nbsp;<span class='Magenta'>-Path</span>&nbsp;<span class='Verbose'>.\test.file</span>&nbsp;<span class='Magenta'>-Confirm:</span><span class='Warning'>$false</span><br/></pre>

### ConfirmImpact

You might be asking yourself: why don't I always get prompted when a file is created?

That's because creating a file has a confirmation impact level of 'Low'.

A [command](/PowerShell/Commands)'s `[ConfirmImpact]` should reflect how dangerous it would be to make a mistake.

Confirm Impacts can be low, medium, and high.

### $ConfirmPreference

`$confirmPreference` is a preference [variable](/PowerShell/Variables) that determines when you want to be prompted.

It's default is 'High'.  If you're a more nervous sort, you're welcome to modify that.  Just prepare to be prompted.

## -WhatIf

Last but not least, we have to talk about -WhatIf.

Anything that can prompt for confirmation can also be passed the -WhatIf [parameter](/PowerShell/Parameters).

By default, -WhatIf will write the message that would have be used to confirm to the host.

<pre><br/><span class='Warning'>New-Item</span>&nbsp;<span class='Magenta'>-ItemType</span>&nbsp;<span class='Verbose'>File</span>&nbsp;<span class='Magenta'>-Path</span>&nbsp;<span class='Verbose'>.\test.file.2</span>&nbsp;<span class='Magenta'>-WhatIf</span><br/></pre>

-WhatIf's default behavior isn't the most ideal [PowerShell](/PowerShell).

Because it directly prints to the screen, you cannot capture -WhatIf, 
unless whoever wrote the [command](/PowerShell/Commands) you're using reads the next few paragraphs.

## $whatIfPreference

$whatIfPreference is another preference [variable](/PowerShell/Variables).

Like many preference [variables](/PowerShell/Variables), it is set whenever you pass -WhatIf

Thus, if we are writing a [function](/PowerShell/Functions), and want to make a useful -WhatIf, we say:

<pre><br/><span class='Verbose'>if</span>&nbsp;<span class='Magenta'>(</span><span class='Warning'>$whatIfPreference</span><span class='Magenta'>)</span>&nbsp;<span class='Magenta'>{</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Success'><# Output something about what you would do. #></span>&nbsp;<br/><span class='Magenta'>}</span>&nbsp;<span class='Verbose'>elseif</span>&nbsp;<span class='Magenta'>(</span><span class='Warning'>$psCmdlet</span><span class='Magenta'>.</span><span class='Output'>ShouldProcess</span><span class='Magenta'>(</span><span class='Verbose'>"Prompt for Confirmation"</span><span class='Magenta'>)</span><span class='Magenta'>)</span>&nbsp;<span class='Magenta'>{</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span class='Success'><# Do Something that might be dangerous. #></span><br/><span class='Magenta'>}</span><br/></pre>

#

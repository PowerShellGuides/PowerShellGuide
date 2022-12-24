Commands are a concept that far predates PowerShell, and a concept PowerShell embraces wholeheartedly and does wonderful things with.

Commands, put simply, are what you use to tell a computer to do something.

## Commands in PowerShell

When you're talking about something like an operating system, a command is often called an Executable or an Application.

One way you can think of PowerShell is like an operating system on top of the operating system.

Every executable or file in an operating system is a command to PowerShell,
and PowerShell has a lot more commands you can use on top of that.

PowerShell has a few types of commands:

|Command Type|Description|
|-|-|
|Alias|Another name for a command|
|Function|A PowerShell function|
|Cmdlet|A Compiled PowerShell Command|
|ExternalScript|A PowerShell Script File|
|Application|A operating system application or file|

Sometimes you'll hear people refer to Applications as Native Commands and the other command types as PowerShell commands.

In addition to having more command types than your operating system does, PowerShell's commands are a bit more capable.

* Every command that runs can produce one or more objects, which can flow into the object pipeline.
* Commands have rich command metadata.
* PowerShell Commands have rich parameters and parameter metadata.
* Commands in PowerShell can be stopped (often without summarilly executing the process).
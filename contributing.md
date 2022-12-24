Contributions are _very_ welcome.

The PowerShell Guide should be written by the PowerShell community at large.

Please help us make the guide the best it can be.

## How To Contribute

### Ideal Tone

The PowerShell Guide aims to be informative and entertaining, in that order!

Individual topics should be brief enough to be read in a brief sitting (if you get my drift).

Digressions are welcome, as long as they're informative.

Be funny if you can be.  If you cannot be funny, delgate that to someone in the humor department.

### Inspiration

Two works inspire a lot of the PowerShell Guide, and may inspire you.

As the name and Don't Panic! might hint, the first is Douglas Adams "Hitchhiker's Guide to the Galaxy" (and subsequent books in the series).

Hitchhiker's Guide does a great job of having an irreverant tone that explains it's universe's dynamics while entertaining the reader. 

Another huge inspiration, personally and professionally, has been Bruce Payette.

Bruce Payette helped create PowerShell, and has released a number of editions of "PowerShell in Action", a wonderously huge tome that entertains the reader while expanding their minds about the possibilities of PowerShell.

I would highly recommend checking out either of these inspirations as you consider contributing.

### What is Welcome

If you know something, share something.

Feel free to write any topic you'd like, as long as it's loosely related to PowerShell.

If a topic doesn't cover what you want it do, file an issue and/or open a pull request to contribute.

### File Structure

Content for the PowerShell Guide can be found in the subdirectory `'Guide'`.

Content files are markdown.

Content files can have metadata, in a file named `Topic.md.psd1`.

With a few exceptions, the metadata will become front matter for a static site.

Those exceptions are:

|Property|Description|
|-|-|
|Alias/Aliases|Defines one or more ways to refer to this topic.|

Underscores in topic file names will be treated as spaces.

### Editing existing topics

Did you find a typo or something that you think could be phrased a bit better?

Editing an existing topic is as simple as editing the topic markdown file.


### Topic Demos

A topic can have one or more demo files associated with it.  See [ShowDemo](https://github.com/StartAutomating/ShowDemo).

If there is only one demo, the file can be named `Topic.demo.ps1`.

Otherwise, the file should be named `Topic.NameOfDemo.demo.ps1`.


## Contribution Compensation

The PowerShell Guide hopes to be able to provide long term benefits to each of it's authors.

As such, 70% of any income the PowerShell Guide receives will be redistributed amongst it's authors, by contribution volume (excluding bots).
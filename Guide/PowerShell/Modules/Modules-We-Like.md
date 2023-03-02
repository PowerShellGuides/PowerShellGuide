Well, this is hard.  There are so many modules to choose from, and we don't want to be unfair to the many modules that exist.

## dbatools

Are you or do you deal with a database administrator?  If so, we feel sorry for your extended exposure to SQL.  If you'd like to make SQL work together with PowerShell though, there's a vibrant community of DBAs that do amazing things with PowerShell.

A great place to get started with that is [dba tools](https://dbatools.io/)

Check out their wonderful website @ [https://dbatools.io/](https://dbatools.io/)

Install dbatools from from gallery:

~~~PowerShell
Install-Module dbatools -Scope CurrentUser -Force
~~~

## ImportExcel

It's a well know fact of life in business that managers like graphs.  It's equally known that excel is adored by accountants and other lovers of data (and dirty file formats).  Amongst programmers, Excel development is a special circle of hell known as Excel Hell, where one can spend eons figuring out how to do simple things like populate a spreadsheet.

[ImportExcel](https://github.com/dfinke/ImportExcel) is one of the indispensible modules for anyone in business.

Install ImportExcel from from gallery:

~~~PowerShell
Install-Module ImportExcel -Scope CurrentUser -Force
~~~


## Mailozaurr

OK, boomers, we know you love your emails, and scripters know they can be a serious pain to deal with.  In the early days of email and PowerShell, there was Send-MailMessage.  It remains as a mocking husk of what could be easy.  To escape this pain and send mail in a more modern way, we've found that [Mailozaurr](https://github.com/EvotecIT/Mailozaurr) can be a useful way to deal with this ancient form of communication.

Install Mailozaurr from from gallery:

~~~PowerShell
Install-Module Mailozaurr -Scope CurrentUser -Force
~~~

---


If you feel you've been slighted, and we might like your module, please, let us know.
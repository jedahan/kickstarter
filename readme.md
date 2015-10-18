# ksr - A mini kickstarter platform for the commandline

ksr is a mini kickstarter platform for the commandline. After cloning, you will probably want to `alias ksr=$PWD/bin/ksr` to add the ksr command to your path. If you are even lazier and don't mind polluting your path, `export PATH="$PWD/bin:$PATH"` will add the commands `back`,`backer`,`project`,`list`, and `ksr`.

You can use `ksr help` for a quick reference of all the commands, or `ksr help [command]` for more details about a particular command.

## Commands

### project
`ksr project [Project_Name] [Target_Dollars]`, for example `ksr project Awesome_Sauce 500`

To create a new project, just pick a project name and dollar amount for it to be successfull. Your project name must be unique, and cannot be changed.

